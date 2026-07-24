# Setup Decisions

Decisions made during the initial Claude Code setup of this repo (July 2026), based on the answers to `SETUP_QUESTIONNAIRE.md`. When changing the setup later, update this file so future sessions know what was intentional.

## Decisions from your answers

| Area | Decision | Where it lives |
|---|---|---|
| Purpose | All-purpose solo workspace: apps, APIs, scripts, experiments | `CLAUDE.md` |
| Stacks | TypeScript + Next.js (npm) for apps; Python (uv) for scripts | `CLAUDE.md` |
| Surfaces | All (cloud, terminal, desktop, mobile) — cloud is priority, so **everything is committed**, nothing lives only in `~/.claude` | whole repo |
| Permission mode | `acceptEdits` — file edits auto-approved, commands still gated by rules | `.claude/settings.json` |
| Push to main | Always requires approval (hook-enforced, not just prose) | `.claude/hooks/git-push-guard.sh` |
| Deletions | `rm`, `git clean`, hard resets, force pushes always prompt | `.claude/settings.json` `ask` rules |
| Secrets | `.env*`, keys, `secrets/` unreadable and uneditable by Claude; `.env.example` stays readable | `.claude/settings.json` `deny` rules |
| Quality hooks | All four: session-start dep install (cloud only), format+lint after every edit, main-push guard, Stop-gate test run | `.claude/hooks/` |
| Subagents | code-reviewer (read-only), cheap-explorer (Haiku, read-only, proactive), debugger (can edit), docs-writer | `.claude/agents/` |
| Plugins | typescript-lsp, pyright-lsp, security-guidance only | `.claude/settings.json` |
| MCP | No committed `.mcp.json` — rely on claude.ai connectors (Supabase, Vercel, GitHub already connected) | — |
| GitHub | GitHub App only; no @claude Actions workflows | — |
| Reviews | Local `/code-review` + code-reviewer subagent before PRs | `CLAUDE.md`, `.claude/skills/ship/` |
| CI | Free GitHub Actions: lint + test per project, auto-discovers projects, skips gracefully while repo is empty | `.github/workflows/ci.yml` |
| Cost posture | Balanced: 200K context cap (`CLAUDE_CODE_DISABLE_1M_CONTEXT=1`), prefer single-file test runs while iterating, delegate exploration to Haiku subagent | `.claude/settings.json`, `CLAUDE.md` |
| Cloud network | Trusted network access (set in claude.ai environment settings — not repo-configurable) | manual step |
| Commits | Conventional Commits; Claude attribution kept | `CLAUDE.md` |
| Worktrees | Supported: `.worktreeinclude` copies `.env*` into parallel-session worktrees | `.worktreeinclude` |

## Defaults I chose for you (you answered "don't know" or weren't asked)

- **Starter skills**: `/new-project`, `/write-tests`, `/ship` — the three workflows a solo multi-project repo uses most. `/ship` is manual-only (`disable-model-invocation`) so Claude never ships on its own.
- **Skipped plugins**: commit-commands, pr-review-toolkit — overlapping with the skills/subagents above; add later if wanted.
- **Auto memory**: left on (default). **Session retention**: default 30 days. **Telemetry**: off (nothing configured).
- **No committed statusline or output style** — personal-preference items; set in `~/.claude` if wanted locally.
- **No scheduled routines yet** — add when there's something worth automating (e.g. nightly dependency check).
- **Tool search**: left on (default) — keeps unused MCP tool schemas out of context.
- **No agent teams / orchestration config** — overkill for a solo workspace at this stage.

## Manual steps (only you can do these)

1. **Install the Claude GitHub App** on `shawn9097/Claude` (claude.ai → Settings → GitHub) if not already — required for cloud sessions to push/PR.
2. **Set the cloud environment network policy to "Trusted"** at claude.ai → Code → your environment → network settings.
3. Optional: connect any additional claude.ai connectors you want available in sessions (already connected ones keep working).
