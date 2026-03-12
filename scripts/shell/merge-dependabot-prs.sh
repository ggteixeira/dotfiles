#!/usr/bin/env bash
# Merges all open Dependabot PRs across all your repos (ggteixeira + divertimentos)
# Usage: ./merge-dependabot-prs.sh [--dry-run]

DRY_RUN=false
[[ "$1" == "--dry-run" ]] && DRY_RUN=true

MERGED=0
FAILED=0
SKIPPED=0
REBASED=0
FAILED_URLS=()
REBASE_URLS=()

echo "Fetching all repos..."
REPOS=$(
  gh repo list ggteixeira --limit 200 --json nameWithOwner -q '.[].nameWithOwner'
  gh repo list divertimentos --limit 200 --json nameWithOwner -q '.[].nameWithOwner'
)
mapfile -t REPO_ARRAY <<<"$REPOS"
TOTAL=${#REPO_ARRAY[@]}
echo "Found $TOTAL repos. Scanning for open Dependabot PRs..."
IDX=0

_progress() {
  local filled=$((IDX * 20 / TOTAL))
  local remainder=$((20 - filled))
  printf -v BAR "%-${filled}s" ""
  BAR="${BAR// /█}"
  printf -v EMPTY "%-${remainder}s" ""
  EMPTY="${EMPTY// /░}"
  printf "\r  [%s%s] %3d%% (%d/%d)" "$BAR" "$EMPTY" "$((IDX * 100 / TOTAL))" "$IDX" "$TOTAL"
}

for repo in "${REPO_ARRAY[@]}"; do
  ((IDX++))
  _progress
  PRS=$(gh pr list \
    --repo "$repo" \
    --author "app/dependabot" \
    --state open \
    --json number,title \
    --jq '.[] | "\(.number) \(.title)"' 2>/dev/null)

  [[ -z "$PRS" ]] && continue
  printf "\r%-60s\r\n" ""

  while IFS= read -r pr_line; do
    pr_number=$(echo "$pr_line" | awk '{print $1}')
    pr_title=$(echo "$pr_line" | cut -d' ' -f2-)

    echo "[$repo] #$pr_number — $pr_title"

    if $DRY_RUN; then
      echo "  → [dry-run] would merge"
      ((SKIPPED++))
      continue
    fi

    if OUTPUT=$(gh pr merge "$pr_number" --repo "$repo" --squash --delete-branch 2>&1); then
      echo "  ✓ merged"
      ((MERGED++))
    elif OUTPUT=$(gh pr merge "$pr_number" --repo "$repo" --squash --delete-branch --auto 2>&1); then
      echo "  ◷ queued for auto-merge"
      ((MERGED++))
    else
      MERGEABLE=$(gh pr view "$pr_number" --repo "$repo" --json mergeable -q '.mergeable' 2>/dev/null)
      if [[ "$MERGEABLE" == "CONFLICTING" ]]; then
        echo "  ↺ conflicting — requesting rebase"
        if gh pr comment "$pr_number" --repo "$repo" --body "@dependabot rebase" &>/dev/null; then
          REBASE_URLS+=("https://github.com/$repo/pull/$pr_number")
          ((REBASED++))
        else
          echo "  ✗ failed to comment: $OUTPUT"
          FAILED_URLS+=("https://github.com/$repo/pull/$pr_number")
          ((FAILED++))
        fi
      else
        echo "  ✗ failed: $OUTPUT"
        FAILED_URLS+=("https://github.com/$repo/pull/$pr_number")
        ((FAILED++))
      fi
    fi

  done <<<"$PRS"
done
printf "\r%-60s\r\n" ""

if ((MERGED + REBASED + FAILED + SKIPPED == 0)); then
  echo "No open Dependabot PRs found."
  exit 0
fi

echo ""
echo "Done. Merged: $MERGED | Rebase requested: $REBASED | Failed: $FAILED | Dry-run skipped: $SKIPPED"

if [[ ${#FAILED_URLS[@]} -gt 0 ]]; then
  echo ""
  echo "PRs that need manual attention:"
  for url in "${FAILED_URLS[@]}"; do
    echo "  $url"
  done
fi

if [[ ${#REBASE_URLS[@]} -gt 0 ]]; then
  echo ""
  echo "PRs queued for rebase (re-run script after Dependabot pushes updated branches):"
  for url in "${REBASE_URLS[@]}"; do
    echo "  $url"
  done
fi
