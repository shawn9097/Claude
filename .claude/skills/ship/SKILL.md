---
name: ship
description: Finish and ship the current work — review, commit, push, and open a PR.
disable-model-invocation: true
---

Ship the current branch's work. Steps, in order:

1. **Preflight**: `git status` and `git diff` — confirm what's being shipped. If on `main`, stop and create a feature branch (`claude/<topic>` or `feat/<topic>`) first.
2. **Quality gate**: run the affected project's lint and full test suite. Fix failures before proceeding.
3. **Review**: run the `code-reviewer` subagent on the diff. Fix any Blockers it finds; use judgment on Warnings.
4. **Commit**: stage related changes and commit with a Conventional Commit message (`feat:`/`fix:`/`chore:`/...). Split unrelated changes into separate commits.
5. **Push**: `git push -u origin <branch>`.
6. **PR**: open a PR into `main` with a summary of what changed and why, plus a test plan. If a PR already exists for the branch, update it instead.
7. Report the PR URL and any follow-ups that were deliberately left out of scope.

Never force-push, never push to `main` directly, and never skip the test suite "just this once."
