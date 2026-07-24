#!/usr/bin/env bash
# Install dependencies at session start in cloud sessions only.
# Local machines are assumed to manage their own dependency state.
set -u

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

# LSP plugin binaries (typescript-lsp / pyright-lsp need these on PATH)
command -v typescript-language-server >/dev/null 2>&1 || npm install -g typescript typescript-language-server >/dev/null 2>&1 || true
command -v pyright-langserver >/dev/null 2>&1 || npm install -g pyright >/dev/null 2>&1 || true

# Per-project dependencies for any top-level project that has them
for dir in . apps/* scripts/*; do
  [ -d "$dir" ] || continue
  if [ -f "$dir/package.json" ] && [ ! -d "$dir/node_modules" ]; then
    (cd "$dir" && npm install --no-audit --no-fund >/dev/null 2>&1) || true
  fi
  if [ -f "$dir/pyproject.toml" ] && command -v uv >/dev/null 2>&1; then
    (cd "$dir" && uv sync >/dev/null 2>&1) || true
  elif [ -f "$dir/requirements.txt" ]; then
    (cd "$dir" && pip install -q -r requirements.txt >/dev/null 2>&1) || true
  fi
done

exit 0
