# Claude Workspace

Personal multi-project workspace for Shawn (solo). Apps, APIs, scripts, and experiments all live here, each in its own top-level directory. Used from cloud sessions, terminal, desktop, and mobile — all config in this repo is committed so it works everywhere.

## Layout

- `apps/<name>/` — deployable apps (default stack: TypeScript + Next.js, deployed to Vercel, data in Supabase)
- `scripts/<name>/` — automation and one-off tooling (default stack: Python, managed with `uv`)
- New project → its own directory with its own `CLAUDE.md` documenting that project's commands. Use `/new-project` to scaffold.

## Stack defaults

- TypeScript: strict mode, npm, ESLint + Prettier, Vitest for tests
- Python: uv, ruff (format + lint), pytest
- Prefer these unless a project's own CLAUDE.md says otherwise

## Conventions

- Commits: Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`)
- Branches: work on feature branches (`claude/*` or `feat/*`); PRs into `main`. Never push directly to `main` without explicit approval.
- Before opening a PR, run `/code-review` on the branch and fix confirmed findings.
- Prefer running a single test file while iterating; full suite before finishing.
- Delegate codebase exploration/research to the `cheap-explorer` subagent to keep this context lean.

## Guardrails (enforced by hooks/permissions, listed here for awareness)

- Files are auto-formatted and linted after every edit — don't hand-format.
- Secret files (`.env*`, keys, `secrets/`) are blocked at the tool level. Use `.env.example` for documenting required variables.
- `rm`, hard resets, and force pushes always prompt.
- The Stop gate runs the test suite before you can declare a task done (skips when a project has no tests yet).

## Gotchas

- This repo is used heavily from cloud sessions: anything that must be available there (skills, agents, hooks, settings) must be committed, never left in `~/.claude`.
- Environment/cloud setup decisions are recorded in `SETUP_DECISIONS.md`.
