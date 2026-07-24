#!/usr/bin/env bash
# PreToolUse guard: any `git push` that targets the default branch (main/master)
# requires explicit user approval. Feature-branch pushes flow through untouched.
set -u

input=$(cat)
cmd=$(printf '%s' "$input" | jq -r '.tool_input.command // empty' 2>/dev/null)

case "$cmd" in
  *"git push"*) ;;
  *) exit 0 ;;
esac

needs_ask=""

# Explicit main/master anywhere in the push command (covers refspecs like main, origin main, HEAD:main)
if printf '%s' "$cmd" | grep -Eq '(^|[[:space:]:])(main|master)([[:space:]]|$)'; then
  needs_ask=1
else
  # No explicit target: a bare `git push` pushes the current branch
  branch=$(git -C "${CLAUDE_PROJECT_DIR:-.}" rev-parse --abbrev-ref HEAD 2>/dev/null || true)
  if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
    needs_ask=1
  fi
fi

if [ -n "$needs_ask" ]; then
  cat <<'JSON'
{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"This push targets the default branch (main). Per repo policy, pushes to main always require explicit approval."}}
JSON
fi

exit 0
