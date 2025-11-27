---
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git add:*), Bash(git commit:*)
description: Create a conventional commit with context
argument-hint: [type] [scope]
---

## Task

First, run these commands to understand the current changes:
1. `git status --short` - to see changed files
2. `git diff --staged` - to see staged changes (if any)
3. `git diff` - to see unstaged changes

Create a commit message following conventional commits format:
- Use type: feat, fix, docs, refactor, test, chore
- Format: `type(scope): description`
- Keep first line under 72 characters
- Add body if changes need explanation

$ARGUMENTS

After creating the message, run `git commit -m "message"` (and `-m "body"` if needed).
