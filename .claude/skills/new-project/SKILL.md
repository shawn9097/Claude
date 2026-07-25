---
name: new-project
description: Scaffold a new project of any kind in this workspace — a content/brand/client project in projects/, a TypeScript/Next.js app in apps/, or a Python tool in scripts/.
---

Scaffold a new project. Ask for the name and what kind it is — one question, not a form:

| Kind                                            | Goes in            | Example                            |
| ----------------------------------------------- | ------------------ | ---------------------------------- |
| Content, brand, music, strategy, or client work | `projects/<name>/` | underdog-city, a client engagement |
| Deployable web app                              | `apps/<name>/`     | a Next.js site                     |
| Automation or tooling                           | `scripts/<name>/`  | a Python script                    |

Most new things are the **first kind**. Don't default to code. If it's client work or a creative project, `projects/` is right even if code shows up later — it can grow an `apps/` sibling then.

## Any project (`projects/<name>/`)

Create `projects/<name>/CLAUDE.md`. That file is the whole scaffold — it loads automatically whenever Claude works in that folder, so it has to carry everything a cold session needs:

- **What this is**, in two sentences. Include Shawn's relationship to it (his own thing / client / partner / experiment) — this matters more than anything else and is the thing most often left ambiguous.
- **The goal**, and how success is measured.
- **Voice**, if it differs from `context/how-i-talk.md`. If someone else's brand voice applies, say whose voice wins when they conflict.
- **Key facts** Claude must not invent — names, dates, prices, URLs, channels.
- **What's blocked or undecided**, so `/next` can reason about it.
- **Open questions for Shawn**, as a list. Better to record an unknown than to guess.

Add subfolders only when there's something to put in them (`shot-lists/`, `drafts/`, `research/`). Don't scaffold empty structure.

If the project has docs in Google Drive, mirror them in (see `/sync-context`), decode with `base64 -d` in bash rather than the Write tool, and add their paths to `.prettierignore` so they stay byte-identical.

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

## Code projects, additionally

- Create `<project>/CLAUDE.md` documenting what it is, the exact dev/test/lint commands, and any deviations from workspace defaults.
- Verify: run the test command and the lint command; both must pass.

## Finally

Commit on a feature branch with a `feat:` Conventional Commit. Then tell Shawn the one next action for the new project — not a list of everything it still needs.
