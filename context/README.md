# context/ — Shawn's brain, mirrored from Google Drive

## What this is

Three files that tell Claude who Shawn is, how he writes, and how he wants to be worked with:

| File | What's in it |
|---|---|
| `who-i-am.md` | Background, what he's working on, current priority, tools |
| `how-i-talk.md` | Voice, tone, what to avoid, writing contexts |
| `how-you-work.md` | Startup protocol, communication style, ADHD support, the four hard rules |

The root `CLAUDE.md` imports all three with `@context/...`, so **they load automatically at the start of every session**, in every surface — cloud, terminal, desktop, mobile. No one has to remember to paste them in.

## Where they came from

Google Drive → `Shawn-Cowork/Context/`. Drive is still the human-readable copy — easy to open and edit from a phone. This repo is the machine-readable copy Claude actually reads.

The Underdog City docs in `projects/underdog-city/` are mirrored the same way, from the `Underdog City` Drive folder.

## Keeping them in sync

These files are **copies**, so they can drift. Run `/sync-context` and Claude will:

1. Pull the current versions from Drive
2. Show a diff of anything that changed
3. Ask which direction to sync (Drive → repo, or repo → Drive)

Do this after editing the docs in Drive, or before starting a big stretch of work.

Rule of thumb: **edit in Drive, sync to repo.** Drive is where Shawn writes; the repo is where Claude reads.

## Why these files are never auto-formatted

`.prettierignore` excludes `context/` and the mirrored Underdog City docs. If the formatter rewrote them, every file would look "changed" against Drive and `/sync-context` couldn't tell real edits from cosmetic ones. Keeping them byte-identical means a diff always means something.
