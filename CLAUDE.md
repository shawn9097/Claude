# Claude Workspace

Personal multi-project workspace for Shawn (solo). Apps, APIs, scripts, and experiments all live here, each in its own top-level directory. Used from cloud sessions, terminal, desktop, and mobile — all config in this repo is committed so it works everywhere.

## Layout

- `apps/<name>/` — deployable apps (default stack: TypeScript + Next.js, deployed to Vercel, data in Supabase)
- `scripts/<name>/` — automation and one-off tooling (default stack: Python, managed with `uv`)
- New project → its own directory with its own `CLAUDE.md` documenting that project's commands. Use `/new-project` to scaffold.

## Projects

Each app's own `CLAUDE.md` has status, commands, and gotchas — **read it before
touching that app.**

| App                  | What it is                                          | Live at                    | Deploy status                                                                         |
| -------------------- | --------------------------------------------------- | -------------------------- | ------------------------------------------------------------------------------------- |
| `apps/underdog-city` | Dark-fantasy transmedia site (album **07.31.2026**) | theunderdogcity.com        | Vercel `underdog-city-v5`, CLI-deployed — **not yet git-connected; frozen until 8/1** |
| `apps/warmside`      | Contractor estimate-follow-up SaaS                  | warmside.app (stale build) | Vercel `warmside` mis-wired to old `SBB` repo — repoint pending                       |
| `apps/luke-mcbroom`  | Static personal-training site                       | lukemcbroom.com            | Cloudflare Pages, still deploys from the **old** repo — edits here don't go live      |

These were consolidated from separate repos (`Warmside`, `SBB`,
`luke-mcbroom-personal-training`) in July 2026; the old repos are being
archived, not deleted. Dashboard steps to finish the move live in
`CLEANUP_CHECKLIST.md`.

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
