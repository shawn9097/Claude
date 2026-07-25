#!/usr/bin/env bash
# Stop gate: before Claude declares a task done, run tests for any project that has them.
# Exits cleanly when no tests exist yet (empty workspace, fresh projects).
set -u

input=$(cat)
# Prevent infinite block loops: if we already blocked once this turn, let it through.
if [ "$(printf '%s' "$input" | jq -r '.stop_hook_active // false' 2>/dev/null)" = "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

failures=""

run_node_tests() {
  local dir="$1"
  # Only run when a real test script is defined (skip npm's placeholder)
  if jq -e '.scripts.test' "$dir/package.json" >/dev/null 2>&1 &&
     ! jq -r '.scripts.test' "$dir/package.json" | grep -qi 'no test specified'; then
    local out
    if ! out=$(cd "$dir" && npm test --silent 2>&1); then
      failures="${failures}
--- npm test failed in ${dir} ---
$(printf '%s' "$out" | tail -n 30)"
    fi
  fi
}

run_python_tests() {
  local dir="$1"
  if [ -d "$dir/tests" ] && command -v pytest >/dev/null 2>&1; then
    local out
    if ! out=$(cd "$dir" && pytest -q 2>&1); then
      failures="${failures}
--- pytest failed in ${dir} ---
$(printf '%s' "$out" | tail -n 30)"
    fi
  fi
}

for dir in . apps/* scripts/* projects/*; do
  [ -d "$dir" ] || continue
  [ -f "$dir/package.json" ] && run_node_tests "$dir"
  { [ -f "$dir/pyproject.toml" ] || [ -f "$dir/pytest.ini" ]; } && run_python_tests "$dir"
done

if [ -n "$failures" ]; then
  printf 'Test gate: the suite is failing. Fix these before finishing:%s\n' "$failures" >&2
  exit 2
fi

exit 0
