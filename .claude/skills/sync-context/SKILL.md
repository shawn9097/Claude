---
name: sync-context
description: Re-sync the mirrored context and project docs between Google Drive and this repo. Use when Shawn has edited docs in Drive, when repo docs look stale, or before starting a big stretch of work.
---

# /sync-context — Drive ↔ repo

## What's mirrored

| Repo path                                                                             | Drive location          |
| ------------------------------------------------------------------------------------- | ----------------------- |
| `context/who-i-am.md`, `how-i-talk.md`, `how-you-work.md`                             | `Shawn-Cowork/Context/` |
| `projects/underdog-city/*.md` (the six mirrored docs — see that folder's `CLAUDE.md`) | `Underdog City/`        |

`context/README.md` and every `CLAUDE.md` are repo-native. They are **not** mirrored and must never be pushed to Drive.

## Drive query syntax — get this right the first time

`mcp__Google_Drive__search_files` accepts only these query terms: `title`, `fullText`, `mimeType`, `modifiedTime`, `viewedByMeTime`, `createdTime`, `parentId`, `owner`, `sharedWithMe`. Operators: `contains`, `=`, `!=`, `<`, `>`, joined with `and` / `or` / `not`.

Anything else errors with "Unsupported query field". So:

- ✅ `title contains 'who-i-am'`
- ✅ `parentId = '<folder-id>'`
- ❌ `name contains '...'` — `name` is not a field

Find the folder first, then list its children by `parentId`. `download_file_content` returns **base64**.

## The sync

1. **Pull from Drive.** For each mirrored file, download and decode into a scratch directory — never straight over the repo copy.

   Decode with bash, not the Write tool:

   ```bash
   base64 -d "$SCRATCH/who-i-am.b64" > "$SCRATCH/who-i-am.md"
   ```

   The `Edit|Write` formatter hook would rewrite the file and manufacture a fake diff. Bash bypasses it.

2. **Diff each pair.** `diff -u repo/path scratch/path`. Report only files that actually differ, with the diff shown — Shawn should see what changed, not a status table.

3. **Ask which direction, per file that differs.** Don't assume, and don't batch-decide for him. The default assumption is **Drive → repo** ("edit in Drive, sync to repo"), but he sometimes edits in the repo mid-session.

4. **Apply.**
   - Drive → repo: `cp` from scratch over the repo copy. Then verify byte sizes match.
   - Repo → Drive: this **writes to his Drive**, so it prompts for approval — that's intentional. Never do it silently.

5. **Report** which files changed, which direction each went, and which were already identical. One short block.

## Rules

- Never delete a file on either side. If something exists in Drive but not the repo, add it and say so; if it exists in the repo but not Drive, flag it and ask.
- Never format mirrored files. `.prettierignore` covers them; keep any new mirrored file listed there too.
- If a new doc shows up in a Drive folder that's mirrored, mention it and ask whether to pull it in.
