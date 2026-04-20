#!/usr/bin/env bash
# wk-drift-check.sh — compare tmux prefix keybindings against which-key menu entries
# Run automatically on config reload, or manually: bash ~/.dotfiles/tmux/wk-drift-check.sh

set -euo pipefail

TMUX_CMD="${TMUX_PROGRAM:-tmux}"
[ -n "${TMUX_SOCKET:-}" ] && TMUX_CMD="$TMUX_CMD -S $TMUX_SOCKET"

# 1. Collect all prefix-table bindings as "KEY|COMMAND" pairs
# Skip: number keys (window select), C-a/C-b (prefix relay), C-z (suspend),
#        DC (refresh), S-arrows (scroll), C-o (rotate)
declare -A binding_map
while IFS= read -r line; do
  # Fields: bind-key [-r] -T prefix KEY COMMAND...
  # With -r flag, key is field 5; without, field 4
  if echo "$line" | grep -q '^ *bind-key  *-r'; then
    key=$(echo "$line" | sed 's/^.*-T prefix  *//' | cut -d' ' -f1)
    cmd=$(echo "$line" | sed 's/^.*-T prefix  *//' | cut -d' ' -f2-)
  else
    key=$(echo "$line" | sed 's/^.*-T prefix  *//' | cut -d' ' -f1)
    cmd=$(echo "$line" | sed 's/^.*-T prefix  *//' | cut -d' ' -f2-)
  fi
  [ -z "$key" ] && continue
  # Skip uninteresting bindings
  case "$key" in
    [0-9]) continue ;;
    C-a|C-b|C-z|C-o|DC) continue ;;
    S-Up|S-Down|S-Left|S-Right) continue ;;
  esac
  case "$cmd" in
    *send-prefix*|*select-window*) continue ;;
  esac
  binding_map["$key"]="$cmd"
done < <($TMUX_CMD list-keys -T prefix 2>/dev/null)

# 2. Extract all keys referenced in @wk_menu_* option values
# Menu format uses quoted triplets: "Label" "shortcut" "command"
# We extract the shortcut (2nd element) from each triplet
menu_blob=$($TMUX_CMD show-options -g 2>/dev/null | grep '@wk_menu' | sed 's/^@wk_menu_[^ ]* //' | tr -d '\n')

declare -A menu_keys
# Extract all double-quoted strings into an array, then pick every 3rd (index 1,4,7,...)
all_quoted=()
while [[ "$menu_blob" =~ \"([^\"]*)\" ]]; do
  all_quoted+=("${BASH_REMATCH[1]}")
  menu_blob="${menu_blob#*"${BASH_REMATCH[0]}"}"
done

# In display-menu format, entries are: label key command (3 args each)
# Empty strings ("") are separators. Walk through and extract shortcut keys.
i=0
while [ "$i" -lt "${#all_quoted[@]}" ]; do
  val="${all_quoted[$i]}"
  # Skip separator entries (empty strings)
  if [ -z "$val" ]; then
    ((i++)) || true
    continue
  fi
  # This is a label; next is the key, then the command
  if [ $((i + 2)) -lt "${#all_quoted[@]}" ]; then
    shortcut="${all_quoted[$((i + 1))]}"
    [ -n "$shortcut" ] && menu_keys["$shortcut"]=1
    ((i += 3)) || true
  else
    break
  fi
done

# 3. Compare: find prefix bindings not in any menu
missing=()
for key in "${!binding_map[@]}"; do
  if [ -z "${menu_keys[$key]:-}" ]; then
    # Also check lowercase variant
    lower_key=$(echo "$key" | tr '[:upper:]' '[:lower:]')
    if [ -z "${menu_keys[$lower_key]:-}" ]; then
      missing+=("$key")
    fi
  fi
done

# 4. Report
if [ ${#missing[@]} -eq 0 ]; then
  $TMUX_CMD display-message "which-key: all bindings covered"
else
  count=${#missing[@]}
  # Sort and show first 5 as hints
  hint=$(printf '%s\n' "${missing[@]}" | sort | head -5 | while read -r k; do
    echo "$k → ${binding_map[$k]:0:30}"
  done | tr '\n' ', ' | sed 's/,$//')
  $TMUX_CMD display-message "which-key: $count binding(s) not in menu — $hint"
fi
