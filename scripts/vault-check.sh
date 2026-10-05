#!/usr/bin/env bash
# vault-check.sh — verify every .md file (except _layouts) is indexed in VAULT.md
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VAULT="$ROOT/VAULT.md"
ERRORS=0

while IFS= read -r -d '' file; do
  rel="${file#$ROOT/}"
  # skip _layouts, assets, node_modules, hidden dirs
  case "$rel" in
    _layouts/*|assets/*|node_modules/*|.*)  continue ;;
  esac
  if ! grep -qF "$rel" "$VAULT"; then
    echo "MISSING from VAULT.md: $rel"
    ERRORS=$((ERRORS + 1))
  fi
done < <(find "$ROOT" -name "*.md" -not -path "*/.git/*" -print0)

if [ "$ERRORS" -gt 0 ]; then
  echo "vault-check: $ERRORS file(s) not indexed in VAULT.md. Fix before pushing."
  exit 1
else
  echo "OK — all .md files indexed in VAULT.md"
fi
