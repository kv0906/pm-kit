---
name: push
description: Commit and push vault changes to Git with smart commit messages. Auto-stages files, creates meaningful commits, and syncs with remote. Use after making vault changes or at end of day.
allowed-tools: Bash, Read, Glob
user-invocable: true
---

# /push — Git Push

Automates Git workflow to save your notes with meaningful commit messages and push to remote repository.

## Usage

Invoke with `/push` or ask Claude to save/commit your changes.

### Basic Usage
```
/push
```

### With Custom Message
```
/push "Completed sprint planning"
```

## What This Skill Does

1. **Stages All Changes**
   - Adds all modified files
   - Includes new files
   - Removes deleted files

2. **Creates Smart Commit Message**
   - Uses provided message, or
   - Auto-generates from changes:
     - Counts files by folder type (daily, docs, blockers, etc.)
     - Summarizes key modifications
   - Includes date/time stamp

3. **Syncs with Remote**
   - Pulls latest changes (rebase)
   - Pushes to remote repository
   - Handles merge conflicts gracefully

## Commit Message Format

### Automatic Messages
Based on your changes:
```
[2026-01-15] Daily note + 2 blocker updates + 1 decision
```

### With Custom Message
```
[2026-01-15] Completed sprint planning
```

## Git Operations

### Standard Flow
1. `git add .` - Stage all changes
2. `git commit -m "message"` - Create commit
3. `git pull --rebase` - Get remote changes
4. `git push` - Push to remote

### Safety Checks
- Verify Git repository exists
- Check for uncommitted changes
- Ensure remote is configured
- Never force push without explicit request

## Security Considerations

### Never Commit
- `.env` files or credentials
- API keys or tokens
- Personal identification

### Use .gitignore for
```
.obsidian/workspace*
.obsidian/cache
.trash/
.DS_Store
CLAUDE.local.md
```
