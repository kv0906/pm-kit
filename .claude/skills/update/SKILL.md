---
name: update
description: Check for and apply PM-Kit framework updates from GitHub releases. Reads local VERSION, queries latest release, shows changelog, and runs update script.
allowed-tools: Bash, Read, Glob
user-invocable: true
---

# /update — Framework Updates

Check for new PM-Kit releases and safely apply framework updates without touching your notes or config.

## Usage

```
/update           # Check + apply if available
/update --check   # Check only, no download
/update --dry-run # Preview what would change without applying
```

## What This Skill Does

### 1. Check Current Version

Read the local `VERSION` file to determine the installed version.

```bash
cat VERSION
```

If `VERSION` doesn't exist, tell the user to run `./scripts/setup.sh` first.

### 2. Check Latest Release

Query the GitHub API for the latest release:

```bash
# Detect repo from git remote, fallback to kv0906/pm-kit
REPO_SLUG="kv0906/pm-kit"
REMOTE_URL="$(git remote get-url origin 2>/dev/null || true)"
if [ -n "$REMOTE_URL" ]; then
  REPO_SLUG="$(echo "$REMOTE_URL" | sed -E 's#.*[:/]([^/]+/[^/.]+)(\.git)?$#\1#')"
fi

curl -sS "https://api.github.com/repos/${REPO_SLUG}/releases/latest"
```

### 3. Compare Versions

- If local version matches latest: report "You're on the latest version (vX.Y.Z)"
- If update available: show the version diff and changelog excerpt

### 4. Apply Update (if user confirms)

Run the update script, passing through any flags the user provided:

```bash
# If user ran /update --check:
./scripts/update.sh --check

# If user ran /update --dry-run:
./scripts/update.sh --dry-run

# If user ran /update (no flags):
./scripts/update.sh
```

The script will:
- Back up current framework files to `_archive/_updates/{date}/`
- Download and extract the latest release
- Overwrite framework files (skills, templates, scripts, docs)
- Skip hybrid files (`_core/config.yaml`, `.gitignore`) — shows diff instead
- Never touch user content (notes, meetings, etc.)
- Update the `VERSION` file

### 5. Post-Update Summary

After the script completes, summarize:
- Files updated and files skipped
- Backup location
- Any hybrid files that need manual merge
- Remind user to run `/push` to commit changes

## What Gets Updated vs Preserved

| Category | Examples | Action |
|----------|----------|--------|
| **Framework** | `CLAUDE.md`, `_templates/*`, `.claude/**`, `scripts/*`, `handbook/*` | Overwrite (backed up first) |
| **Hybrid** | `_core/config.yaml`, `.gitignore` | Diff shown, user merges |
| **User content** | `00-inbox/`, `daily/`, `decisions/`, `blockers/`, `meetings/` | Never touched |
