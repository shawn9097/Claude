# Claude Code Repo Setup Questionnaire

> **Status: answered.** These questions were answered interactively in-session (July 2026) and the setup was built from them. The resulting decisions — including defaults applied where no answer was given — are recorded in [`SETUP_DECISIONS.md`](SETUP_DECISIONS.md). This file is kept as a reference for future re-evaluation.

This questionnaire was distilled from the full Claude Code documentation (code.claude.com/docs). Your answers drive how this repo gets scaffolded: `CLAUDE.md`, `.claude/settings.json` (permissions + hooks), skills, subagents, `.mcp.json`, `.gitignore`, CI workflows, and cloud environment guidance.

**How to answer:** fill in the `> Answer:` lines (or reply in the PR/session). The ★ starred questions (15) are the load-bearing decisions — answer at least those and documented best-practice defaults will be applied everywhere else, with every assumption noted.

**Key fact:** cloud/web sessions only see **committed** config. Personal `~/.claude` settings never transfer, so this repo's checked-in setup is where the leverage is.

---

## A. Project fundamentals (1–10)

Everything else keys off these.

1. ★ What will this repo actually contain — a web app, an API, a library, scripts/automation, experiments, or a general workspace for you + Claude?
   > Answer:
2. ★ Primary language(s) and framework(s)? (TypeScript/Node, Python, Next.js, etc. — determines the LSP plugin, hooks, and CLAUDE.md)
   > Answer:
3. ★ Package manager? (npm / pnpm / yarn / bun / pip / poetry / uv …)
   > Answer:
4. Single project, or a monorepo with multiple packages/apps planned?
   > Answer:
5. Test framework, and should Claude prefer running single test files over the full suite?
   > Answer:
6. Linter and formatter of choice? (ESLint + Prettier, Biome, ruff …)
   > Answer:
7. Static type checking? (TS strict mode, pyright/mypy)
   > Answer:
8. Where will this deploy? (Vercel and Supabase connectors are available in your Claude session — are those your stack?)
   > Answer:
9. ★ Is this just you, or will teammates use it? (drives shared `.claude/settings.json` vs personal `settings.local.json`)
   > Answer:
10. ★ Which surfaces will you use — web/cloud sessions, terminal, desktop app, mobile?
    > Answer:

## B. CLAUDE.md & conventions (11–18)

Docs guidance: keep CLAUDE.md under 200 lines, only include what Claude can't infer from code, and put *enforcement* in hooks — CLAUDE.md is advisory.

11. ★ What standing instructions should Claude always follow here (coding style, "always do X", "never do Y")?
    > Answer:
12. What commands should be documented once they exist — build, test, lint, dev server, deploy?
    > Answer:
13. Any conventions that differ from language defaults (named exports only, import ordering, tabs vs spaces)?
    > Answer:
14. Branch naming and commit message conventions? (e.g., Conventional Commits — `feat:`, `fix:`)
    > Answer:
15. Architectural decisions or gotchas worth recording so Claude never re-litigates them?
    > Answer:
16. Topic-scoped rule files (`.claude/rules/testing.md`, `security.md`) that only load when Claude touches matching paths — or one CLAUDE.md?
    > Answer:
17. Auto memory is on by default — OK for Claude to accumulate learnings about the repo across sessions automatically?
    > Answer:
18. Preemptively gitignore the personal files (`CLAUDE.local.md`, `.claude/settings.local.json`, `.claude/worktrees/`)? (Docs recommend yes)
    > Answer:

## C. Permissions & security (19–30)

19. ★ Default permission posture: ask before every change (default), auto-accept file edits, always start in plan mode, or auto mode? (Note: a repo cannot grant itself auto mode — that's a user setting.)
    > Answer:
20. ★ Which commands should run without asking? (test, lint, build, `git status/diff/log`…)
    > Answer:
21. Should `git push` always require your approval?
    > Answer:
22. Deny reading secrets — `.env`, `.env.*`, `secrets/**`, `*.pem`, key files? (Docs' canonical deny set)
    > Answer:
23. Any files Claude should never edit — lockfiles, generated code, migrations?
    > Answer:
24. Block raw `curl`/`wget` and route web access through WebFetch with a domain allowlist? (Docs recommend this — argument patterns on curl are trivially bypassed)
    > Answer:
25. Which documentation domains should be pre-allowed for fetching?
    > Answer:
26. Enable the OS-level sandbox (filesystem + network isolation for shell commands)?
    > Answer:
27. Is anything in this repo sensitive enough to warrant hardened project-specific permissions?
    > Answer:
28. Audit-log settings changes mid-session (a `ConfigChange` hook)?
    > Answer:
29. Ship a `.devcontainer` for running Claude fully autonomously in isolation?
    > Answer:
30. Any actions that should force a human checkpoint even in permissive modes (deleting files, installing packages)?
    > Answer:

## D. Hooks & automation (31–40)

Hooks are deterministic — they run every time, unlike CLAUDE.md instructions.

31. ★ Auto-format every file right after Claude edits it?
    > Answer:
32. Run the linter after each edit — and should failures block Claude (it must fix them) or just inform it?
    > Answer:
33. A "Stop gate": block Claude from declaring itself done until tests pass?
    > Answer:
34. Hard-block edits to protected paths (`.env`, lockfiles) at the tool level?
    > Answer:
35. Block dangerous shell commands outright (`rm -rf`, `git push --force`, piping curl to sh)?
    > Answer:
36. Desktop/system notification when Claude is waiting on your input?
    > Answer:
37. A SessionStart hook that installs dependencies automatically — cloud sessions only, or everywhere?
    > Answer:
38. Log every Bash command Claude runs to an audit file?
    > Answer:
39. Any session-end cleanup (scratch files, background processes)?
    > Answer:
40. Anything else that should happen "every single time without asking"?
    > Answer:

## E. Skills (41–47)

Reusable playbooks invoked as `/name` or auto-triggered; near-zero cost until used.

41. ★ Which repeatable workflows deserve skills — `/new-feature` scaffold, `/write-tests`, `/deploy`, `/release`, `/fix-issue`?
    > Answer:
42. Reference-style skills: architecture map, API conventions, domain glossary Claude pulls in on demand?
    > Answer:
43. Should side-effect skills (deploy, release) be manual-only so Claude can't trigger them itself? (Docs recommend yes)
    > Answer:
44. Once the app runs, use the bundled `/run-skill-generator` to record the real install/launch recipe so `/run` and `/verify` work?
    > Answer:
45. Should any skill pre-approve its own tools (e.g., the test skill can always run the test command)?
    > Answer:
46. Should heavyweight skills run in a forked subagent to keep the main context clean?
    > Answer:
47. Any skills that should use a cheaper model or lower effort?
    > Answer:

## F. Subagents & parallelism (48–56)

48. ★ Which specialist subagents — code-reviewer (read-only), debugger, test-runner, docs-writer, security-reviewer?
    > Answer:
49. Per agent: read-only or allowed to edit?
    > Answer:
50. Cheaper models for simple agents (Haiku for search/exploration — a documented cost win)?
    > Answer:
51. Should any agent keep persistent project memory that's committed and shared (`.claude/agent-memory/`)?
    > Answer:
52. Should any run in an isolated git worktree so parallel work can't collide?
    > Answer:
53. Will you run parallel sessions via worktrees? If so, which gitignored files (like `.env`) must be copied into each worktree (`.worktreeinclude`)?
    > Answer:
54. Enable the experimental agent-teams feature (multiple coordinating Claude instances — ~7x token usage)?
    > Answer:
55. Enable dynamic workflows (script-orchestrated subagent swarms for audits/migrations), and with what size guideline?
    > Answer:
56. Cap subagent concurrency for cost control, or leave defaults (20 concurrent)?
    > Answer:

## G. MCP servers & plugins (57–66)

57. ★ Which MCP servers should be committed to a shared `.mcp.json` — GitHub? Supabase? Vercel? A database?
    > Answer:
58. Which integrations must stay personal because they carry your credentials?
    > Answer:
59. For servers needing API keys: where will the env vars live? (Cloud environments have no secrets store)
    > Answer:
60. Auto-approve all servers in the committed `.mcp.json`, or enumerate them explicitly?
    > Answer:
61. ★ Install the code-intelligence (LSP) plugin for your language (`typescript-lsp`, `pyright-lsp`, …)? Docs strongly recommend it — Claude sees type errors immediately after edits and navigates by symbol instead of grep.
    > Answer:
62. Install `security-guidance` (Claude reviews its own changes for vulnerabilities in-session)?
    > Answer:
63. Install `commit-commands` and/or `pr-review-toolkit` from the official marketplace?
    > Answer:
64. Keep MCP tool search on (default — defers tool schemas, saves context) or load everything upfront?
    > Answer:
65. Any claude.ai connectors you'd rather disable in this repo to reduce noise?
    > Answer:
66. Later: package your setup as a plugin for reuse across repos, or keep everything repo-local?
    > Answer:

## H. Git/GitHub workflow & CI (67–76)

67. Branch strategy — feature branches + PRs to `main`? Protect `main`?
    > Answer:
68. Add a PR template? Should Claude always open PRs as drafts?
    > Answer:
69. ★ Install the Claude GitHub App so `@claude` mentions in issues/PRs trigger Claude via GitHub Actions?
    > Answer:
70. Add a CI workflow that runs tests/lint on every push/PR?
    > Answer:
71. Automated code review on PRs: the managed Code Review service (~$15–25/review, Team/Enterprise), a GitHub Actions workflow, or local `/code-review` before pushing?
    > Answer:
72. If automated review: add a `REVIEW.md` defining what counts as important vs nit for this repo?
    > Answer:
73. Enable Auto-fix (Claude automatically fixes CI failures and review comments on PRs)?
    > Answer:
74. For any CI-run Claude: which model and turn limit?
    > Answer:
75. Keep the `Co-Authored-By: Claude` commit trailer and session-link attribution, or suppress?
    > Answer:
76. Should sessions/PRs follow a naming convention so `--from-pr` and session lookup stay useful?
    > Answer:

## I. Cloud/web environment (77–84)

Configured at claude.ai for this repo's cloud sessions.

77. ★ Network access level for cloud sessions: Trusted (default allowlist), Custom, or Full?
    > Answer:
78. Any custom domains to allowlist (internal APIs, private registries)?
    > Answer:
79. Environment variables cloud sessions need?
    > Answer:
80. What should the environment setup script install beyond the preinstalled toolchains? (Node, Python, Go, Rust, Docker, Postgres, Redis are preinstalled; `gh` CLI is not)
    > Answer:
81. Should services (Postgres/Redis/docker compose) auto-start each session?
    > Answer:
82. Default session sharing: private, or shareable links?
    > Answer:
83. Set this environment as your default for CLI-launched cloud sessions (`/remote-env`)?
    > Answer:
84. Will you use `--teleport` to pull cloud sessions into a terminal later?
    > Answer:

## J. Scheduled automation (85–90)

85. Any recurring jobs worth a cloud Routine — nightly review of open PRs, weekly dependency audit, docs-drift check?
    > Answer:
86. If yes: cadence, and which model per routine?
    > Answer:
87. Any GitHub-event triggers (run on every release, or on PRs matching a filter)?
    > Answer:
88. Keep the default guard that routines can only push to `claude/`-prefixed branches?
    > Answer:
89. Routines run fully autonomously with all your connectors by default — trim which connectors each one gets?
    > Answer:
90. Prefer cloud Routines (run while your machine is off) or Desktop scheduled tasks (local file access)?
    > Answer:

## K. Performance, cost & context (91–100)

91. ★ Default model for this repo — Sonnet (docs: handles most coding, best cost), Opus, or leave per-session? And what plan are you on?
    > Answer:
92. Default effort level (high is standard; xhigh for harder reasoning at more cost)?
    > Answer:
93. Pin subagents to Haiku globally for cheap exploration?
    > Answer:
94. Long context: allow 1M-token mode or cap at 200K for cost control?
    > Answer:
95. Longer Bash timeouts or output truncation for slow builds/verbose tests?
    > Answer:
96. Auto-compact earlier than default to keep sessions snappy?
    > Answer:
97. Usage telemetry/dashboards, or skip (typical for solo use)?
    > Answer:
98. Session transcript retention — default 30 days OK?
    > Answer:
99. A custom status line (context %, cost, git branch, model) — committed for the repo or left personal?
    > Answer:
100. Anything you *don't* want: disable bundled skills, workflows, hooks, or specific tools entirely?
     > Answer:

---

## What gets built from your answers

| Answers in section | Files generated |
|---|---|
| A, B | `CLAUDE.md` (<200 lines), optional `.claude/rules/*.md` |
| C | `permissions` block in `.claude/settings.json` |
| D | `hooks` block + `.claude/hooks/*.sh` scripts |
| E | `.claude/skills/<name>/SKILL.md` |
| F | `.claude/agents/*.md`, `.worktreeinclude` |
| G | `.mcp.json`, `enabledPlugins` in settings |
| H | `.github/workflows/*.yml`, `REVIEW.md`, PR template |
| I | Cloud environment settings guidance + SessionStart hook |
| J | Routine definitions (set up at claude.ai) |
| K | `env` block in settings, model config |
