#!/usr/bin/env bash
# PostToolUse (Edit|Write): auto-format the edited file, then lint it.
# Lint findings are fed back to Claude (exit 2 + stderr) so they get fixed in the same turn.
set -u

input=$(cat)
file=$(printf '%s' "$input" | jq -r '.tool_input.file_path // empty' 2>/dev/null)

[ -n "$file" ] && [ -f "$file" ] || exit 0

lint_output=""
lint_failed=0

case "$file" in
  *.ts|*.tsx|*.js|*.jsx|*.mjs|*.cjs|*.json|*.css|*.md|*.yml|*.yaml|*.html)
    if command -v npx >/dev/null 2>&1; then
      npx --yes prettier --write "$file" >/dev/null 2>&1 || true
    fi
    case "$file" in
      *.ts|*.tsx|*.js|*.jsx|*.mjs|*.cjs)
        # Lint only when an ESLint config exists somewhere above the file
        dir=$(dirname "$file")
        while [ "$dir" != "/" ] && [ "$dir" != "." ]; do
          if ls "$dir"/eslint.config.* "$dir"/.eslintrc* >/dev/null 2>&1; then
            if ! lint_output=$(cd "$dir" && npx --no-install eslint "$file" 2>&1); then
              lint_failed=1
            fi
            break
          fi
          dir=$(dirname "$dir")
        done
        ;;
    esac
    ;;
  *.py)
    if command -v ruff >/dev/null 2>&1; then
      ruff format "$file" >/dev/null 2>&1 || true
      if ! lint_output=$(ruff check "$file" 2>&1); then
        lint_failed=1
      fi
    fi
    ;;
  *)
    exit 0
    ;;
esac

if [ "$lint_failed" -eq 1 ] && [ -n "$lint_output" ]; then
  printf 'Lint issues in %s — fix them now:\n%s\n' "$file" "$(printf '%s' "$lint_output" | head -n 40)" >&2
  exit 2
fi

exit 0
