# Shawn's Workspace

This repo is the operating system for **all** of Shawn's work — content, music, apps, client work, experiments. Underdog City is the biggest thing in here right now, but it is one tenant, not the point of the repo. Anything new gets a folder and joins the same system.

Used from cloud sessions, terminal, desktop, and mobile. Everything is committed so it works everywhere.

## Read these first — every session, every task

@context/who-i-am.md
@context/how-i-talk.md
@context/how-you-work.md

Those three files are Shawn's actual voice, working style, and rules. They are mirrored from Google Drive (`Shawn-Cowork/Context/`) — see `context/README.md`. They are not optional background: follow them.

## Hard rules — never break these

1. **Never delete any file** without explicit approval.
2. **Never send or post anything to anyone** (emails, social posts, DMs, comments) without explicit approval.
3. **Never publish or ship anything live or public** without explicit approval.
4. **Never spend money or take any paid action** without explicit approval.

These are also enforced at the tool level in `.claude/settings.json` — publishing, posting, deploying, and purchasing tools all prompt. If a tool _would_ do one of these four things and isn't listed there yet, still stop and ask.

## Layout

- `context/` — who Shawn is, how he talks, how he wants to be worked with. Mirrored from Drive. Loaded every session (above).
- `projects/<name>/` — **everything Shawn works on**, one folder each: music/content projects, client work, products, experiments. Each has its own `CLAUDE.md` (project memory, loads automatically when working in that folder).
- `apps/<name>/` — deployable web apps (TypeScript + Next.js → Vercel, data in Supabase).
- `scripts/<name>/` — automation and tooling (Python, managed with `uv`).

A project only moves to `apps/` or `scripts/` when it's actually code that builds and deploys. Content, brand, strategy, and client work stay in `projects/`. Use `/new-project` to scaffold either kind.

## Projects

All three have both halves: `projects/<name>/` for strategy, brand, and context; `apps/<name>/` for the code. **Read the app's own `CLAUDE.md` before touching it** — each one documents what's actually deployed, which is not the same as what's in git.

| Project         | What it is                                          | Live at                    | Deploy status                                                                         |
| --------------- | --------------------------------------------------- | -------------------------- | ------------------------------------------------------------------------------------- |
| `underdog-city` | Dark-fantasy transmedia site (album **07.31.2026**) | theunderdogcity.com        | Vercel `underdog-city-v5`, CLI-deployed — **not yet git-connected; frozen until 8/1** |
| `warmside`      | Contractor estimate-follow-up SaaS                  | warmside.app (stale build) | Vercel `warmside` mis-wired to old `SBB` repo — repoint pending                       |
| `luke-mcbroom`  | Static personal-training site                       | lukemcbroom.com            | Cloudflare Pages, still deploys from the **old** repo — edits here don't go live      |

The code was consolidated from separate repos (`Warmside`, `SBB`, `luke-mcbroom-personal-training`) in July 2026; the old repos are being archived, not deleted. Dashboard steps to finish the move live in `CLEANUP_CHECKLIST.md`.

## Working style (short version — the full rules are in `context/how-you-work.md`)

- **Restate the goal** in Shawn's own words before starting anything substantial.
- **One thing at a time.** He context-switches a lot and his stated biggest constraint is _knowing what to do next_. End with one clear next action, not a menu of six.
- **Give reasoning and options**, organized and skimmable — but don't strip out the substance to make it short.
- **Say when he's wrong.** Honestly, kindly, never condescending. Treat him as smart.
- If he's asking the wrong question, say so before answering it.
- Summarize where things stand when picking a thread back up.

## Writing rules (full version in `context/how-i-talk.md`)

Casual, conversational, warm — like talking to a friend. Never corporate. Never walls of text.

**Never** write anything that reads as AI-generated: no "it's not just X, it's Y" constructions, no over-explaining, no hollow filler, no em-dash-heavy hype cadence. Underdog City's in-world voice is separate and darker — see `projects/underdog-city/brand-identity.md` for when to use which.

## Skills

- `/next` — what to work on right now, across everything. Use when stuck or overwhelmed.
- `/post` — draft social/content in the right voice for a project.
- `/shot-list` — turn a song or scene into a Flow/Veo shot list with ready-to-paste prompts.
- `/sync-context` — re-sync `context/` and project docs with Google Drive.
- `/new-project` — scaffold a new project of any type.
- `/ship` — pre-PR checklist for code (manual only).
- `/write-tests` — add tests for code.

## Code conventions (only relevant inside `apps/` and `scripts/`)

- TypeScript: strict mode, npm, ESLint + Prettier, Vitest. Python: uv, ruff, pytest.
- Commits: Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`).
- Branches: `claude/*` or `feat/*`; PRs into `main`. Never push to `main` without explicit approval.
- Review before opening a PR; fix confirmed findings. Use the `code-reviewer` subagent (what `/ship` runs) or the built-in `/review`. There is no `/code-review` skill in this repo.
- Prefer a single test file while iterating; full suite before finishing.

## Gotchas

- Files are auto-formatted after every edit — don't hand-format. Files under `context/` and `projects/underdog-city/` are excluded (see `.prettierignore`) so they stay byte-identical to their Drive originals.
- Secret files (`.env*`, keys, `secrets/`) are blocked at the tool level. Document required vars in `.env.example`.
- Cloud sessions only see **committed** config. Nothing useful may live only in `~/.claude`.
- Delegate exploration/research to the `cheap-explorer` subagent to keep this context lean.
- Setup decisions and their reasoning are recorded in `SETUP_DECISIONS.md`.
