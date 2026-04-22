#!/usr/bin/env bash
# wk-drift-check.sh — compare tmux prefix keybindings against which-key menu entries
# Run automatically on config reload, or manually: bash ~/.dotfiles/tmux/wk-drift-check.sh
# Compatible with macOS bash 3.2

set -euo pipefail
export LC_ALL=C

TMUX_CMD="${TMUX_PROGRAM:-tmux}"
[ -n "${TMUX_SOCKET:-}" ] && TMUX_CMD="$TMUX_CMD -S $TMUX_SOCKET"

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

# Bindings that intentionally don't need which-key entries:
# - number keys (window select), prefix relay, suspend, rotate
# - arrow keys (duplicated by hjkl in menus)
# - M-1..M-7 (covered by layout submenu)
# - M-arrows (covered by resize submenu)
# - tmux stock bindings (copy-mode, paste, command-prompt, etc.)
# - backslash-escaped variants of keys already in menus
# Stock tmux bindings that duplicate which-key menu entries or are low-value:
#   splits: " % _ |  (menus have / and -)
#   swap:   { }       (menus have < >)
#   copy:   [         (menu has c)
#   paste:  ]         (menu has p)
#   client: ( )       (in client menu)
#   other:  : ; ' $ & (command-prompt, last-pane, select-window, rename-session, kill-window)
#   nav:    arrows, M-arrows, M-1..7, PPage, Enter, C-arrows, C-r/C-s (resurrect)
SKIP_PATTERN='^([0-9]|C-[abz]|C-o|DC|S-(Up|Down|Left|Right)|Up|Down|Left|Right|M-[1-7]|M-(Up|Down|Left|Right)|M-[nop]|M-u|PPage|Enter|C-(Up|Down|Left|Right)|C-r|C-s|"|%|_|\||;|'"'"'|\$|&|\{|\}|\[|\]|\(|\)|:)$'

# 1. Extract prefix keybindings
$TMUX_CMD list-keys -T prefix 2>/dev/null | while IFS= read -r line; do
  stripped=$(echo "$line" | sed 's/^bind-key[[:space:]]*-r[[:space:]]*/bind-key /; s/^bind-key[[:space:]]*-T prefix[[:space:]]*//')
  key=$(echo "$stripped" | sed 's/^[[:space:]]*//' | cut -d' ' -f1)
  [ -z "$key" ] && continue
  # Normalize: strip leading backslash from escaped keys like \# \~ \"
  clean_key=$(echo "$key" | sed 's/^\\//')
  echo "$clean_key"
done | sort -u > "$tmpdir/bindings.txt"

# 2. Extract menu shortcut keys from each @wk_menu_*
: > "$tmpdir/menu_keys.txt"
for menu in root windows panes resize layout copy buffers sessions client plugins; do
  val=$($TMUX_CMD show-options -gv "@wk_menu_$menu" 2>/dev/null) || continue
  [ -z "$val" ] && continue
  echo "$val" | perl -e '
    use strict;
    my $input = do { local $/; <STDIN> };
    $input =~ s/\s+/ /g; $input =~ s/^\s+//;
    my @tokens;
    while ($input =~ /\G\s*(?:"((?:[^"\\]|\\.)*)"|(\S+))/gc) {
      push @tokens, defined($1) ? $1 : $2;
    }
    my $i = 0;
    while ($i < scalar @tokens) {
      if ($tokens[$i] eq "") { $i++; next; }
      if ($i + 2 < scalar @tokens) { print $tokens[$i+1] . "\n"; $i += 3; }
      else { last; }
    }
  ' >> "$tmpdir/menu_keys.txt"
done
sort -u -o "$tmpdir/menu_keys.txt" "$tmpdir/menu_keys.txt"

# 3. Find missing bindings
missing=""
missing_count=0
while IFS= read -r key; do
  [ -z "$key" ] && continue
  # Skip keys in the exclusion list
  if echo "$key" | grep -qE "$SKIP_PATTERN"; then
    continue
  fi
  # Case-insensitive match covers both "h" and "H" style aliases in menus
  if grep -iqxF -- "$key" "$tmpdir/menu_keys.txt" 2>/dev/null; then
    continue
  fi
  if [ -n "$missing" ]; then
    missing="$missing, $key"
  else
    missing="$key"
  fi
  missing_count=$((missing_count + 1))
done < "$tmpdir/bindings.txt"

# 4. Report
if [ "$missing_count" -eq 0 ]; then
  $TMUX_CMD display-message "which-key: all bindings covered"
else
  hint=$(echo "$missing" | cut -c1-150)
  $TMUX_CMD display-message "which-key: $missing_count binding(s) not in menu: $hint"
fi
