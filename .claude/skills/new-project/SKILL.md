---
name: new-project
description: Scaffold a new project in this workspace — a TypeScript/Next.js app in apps/ or a Python script/tool in scripts/ — with the workspace's standard tooling wired up.
---

Scaffold a new project. If the user didn't specify, ask for: project name, and whether it's an app (`apps/<name>/`, TypeScript + Next.js) or a script/tool (`scripts/<name>/`, Python + uv).

## TypeScript app (`apps/<name>/`)

1. `npx create-next-app@latest apps/<name> --typescript --eslint --app --src-dir --use-npm` (accept defaults for anything unspecified).
2. Ensure `tsconfig.json` has `"strict": true`.
3. Add Prettier: `npm install -D prettier eslint-config-prettier`, create a minimal `.prettierrc` (`{}` is fine), and extend `eslint-config-prettier` in the ESLint config.
4. Add Vitest: `npm install -D vitest @vitejs/plugin-react jsdom @testing-library/react`, set `"test": "vitest run"` in package.json scripts, and create one smoke test so the test gate has something to run.
5. If the app needs environment variables, create `.env.example` documenting them (never a real `.env`).

## Python project (`scripts/<name>/`)

1. `uv init scripts/<name>` then `cd scripts/<name>`.
2. `uv add --dev pytest ruff`.
3. Create `tests/test_smoke.py` with a trivial passing test.
4. Add ruff config to `pyproject.toml` (defaults are fine; just ensure the section exists so tooling is explicit).

## Both

- Create `<project>/CLAUDE.md` documenting: what the project is (one line), the exact dev/test/lint commands, and any deviations from workspace defaults.
- Verify: run the project's test command and lint command; both must pass.
- Commit on a feature branch with a `feat:` Conventional Commit.
