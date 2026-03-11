---
name: linear
description: Interact with Linear for issue tracking — search, create, sync, and link issues to vault notes. Use when the user says "/linear", "linear issues", "sync linear", "create issue", "link to linear", "check linear", "what's assigned to me", "my linear tasks", mentions Linear in any project management context, or wants to bridge their vault notes with Linear issue tracking. Also triggers when user needs to set up or connect Linear MCP.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet, mcp__linear-server__*
user-invocable: true
---

# /linear — Linear Integration

Bridge your PM-Kit vault with Linear issue tracking. Search, create, sync issues and link them to vault notes.

## Context

Today's date: `!date +%Y-%m-%d`
Config: @_core/config.yaml
Active projects: `!ls 01-index/*.md 2>/dev/null | sed 's|01-index/||;s|\.md||'`

## Input

User input: $ARGUMENTS

## Sub-commands

Parse the first word of `$ARGUMENTS` to determine the sub-command:

| Input starts with | Sub-command | Purpose |
|---|---|---|
| `setup` | Setup | Guide MCP connection + auth |
| `sync` | Sync | Pull recent updates into vault |
| `create` | Create | Create Linear issue from vault context |
| `search` or a question | Search | Find Linear issues |
| `link` | Link | Connect vault note ↔ Linear issue |
| *(empty)* | Status | Show connection status + recent activity |

## Step 0: Connection Check

Before any sub-command (except `setup`), verify Linear MCP is available:

1. Try calling any Linear MCP tool (e.g., list viewer's issues with a small limit)
2. If the tool call fails or `mcp__linear-server__*` tools are not available:

```
Linear MCP is not connected yet.

Run `/linear setup` to connect — it takes about 30 seconds.
```

Then stop. Don't attempt other operations without a working connection.

---

## setup — Connect Linear MCP

Guide the user through connecting Linear's remote MCP server to Claude Code.

### Steps to present to user:

```
## Linear MCP Setup

Linear's MCP server is hosted by Linear — no local install needed.

### Step 1: Add the server
Run this in your terminal:

  claude mcp add --transport http linear-server https://mcp.linear.app/mcp

### Step 2: Authenticate
In a Claude Code session, run:

  /mcp

Then follow the OAuth flow — it'll open your browser to authorize Linear access.

### Step 3: Verify
Once authenticated, try:

  /linear

You should see your recent Linear activity.
```

After presenting, ask if the user wants help running these commands now.

If the user confirms, run the `claude mcp add` command via Bash, then inform them they need to run `/mcp` themselves (it requires interactive browser auth that can't be automated).

---

## sync — Pull Linear Updates

Fetch recent Linear activity and optionally write it into today's daily note.

### Processing

1. **Fetch assigned issues** — Get issues assigned to the current user, sorted by updated date
   - Filter to recently updated (last 7 days by default, or user-specified window)
   - Group by status: In Progress, Todo, Done

2. **Fetch recent comments** — Get comments on the user's assigned issues from the last few days

3. **Summarize** — Present a clean summary:

```
## Linear Sync — {date}

### In Progress ({count})
- [{identifier}] {title} — {team} ({priority})
  ...

### Recently Updated ({count})
- [{identifier}] {title} — moved to {state} ({date})
  ...

### Recent Comments ({count})
- [{identifier}] {commenter}: "{snippet}..."
  ...
```

4. **Daily note integration** (if `--save` flag or user confirms)
   - Check if today's daily note exists (`daily/{date}.md`)
   - Append a `### Linear` subsection under the relevant project heading
   - Use `[[wikilinks]]` for any vault notes already linked to Linear issues

### Flags

- `--save` — Auto-append to daily note without asking
- `--days N` — Look back N days (default: 7)
- `--project {name}` — Filter to issues matching a specific project/team

---

## create — Create Linear Issue from Vault

Create a Linear issue using context from a vault note (blocker, doc, decision, or freeform text).

### Processing

1. **Determine source** — Check if user provided:
   - A vault file path or wikilink → Read that note for context
   - Freeform text → Use directly
   - Nothing → Ask what to create

2. **Extract issue fields** from source:
   - **Title**: From note's H1 or frontmatter title, or user-provided
   - **Description**: From note body (convert wikilinks to plain text for Linear)
   - **Team**: Match from `project` frontmatter → Linear team (ask user if ambiguous)
   - **Priority**: Map from blocker severity (high→urgent, medium→high, low→medium) or ask
   - **Labels**: Infer from note type (blocker→bug, doc→feature, decision→discussion) or ask

3. **Confirm with user** before creating:

```
Creating Linear issue:
  Title: {title}
  Team: {team}
  Priority: {priority}
  Labels: {labels}

Proceed? (y/n)
```

4. **Create the issue** via Linear MCP tools

5. **Link back** — Add the Linear issue URL to the source note's frontmatter:
   ```yaml
   linear: {issue-url}
   ```
   And add to `## Links > ### Related`:
   ```markdown
   - [LIN-{number}]({url}) — Linear issue
   ```

---

## search — Search Linear Issues

Find issues using natural language or filters.

### Processing

1. **Parse query** from `$ARGUMENTS` (everything after "search")
2. **Search via Linear MCP** — Use the search/filter tools available
3. **Present results** in a scannable format:

```
## Linear Search: "{query}"

Found {count} issues:

| ID | Title | Status | Assignee | Priority | Updated |
|----|-------|--------|----------|----------|---------|
| {id} | {title} | {state} | {name} | {pri} | {date} |
```

4. **Offer actions**: "Want to `/linear link` any of these to a vault note?"

---

## link — Connect Vault Note ↔ Linear Issue

Create a bidirectional link between a vault note and a Linear issue.

### Input

Expects: `/linear link {vault-note} {linear-issue-id}`

Either argument can be omitted — prompt for missing info.

### Processing

1. **Resolve vault note** — Find the note by path, wikilink, or fuzzy search
2. **Resolve Linear issue** — By ID (e.g., `ENG-123`) or search
3. **Update vault note**:
   - Add `linear: {issue-url}` to frontmatter
   - Add `[{issue-id}]({url})` to `## Links > ### Related`
4. **Comment on Linear issue** (optional, ask user):
   - Post a comment like: "Linked to vault note: {note-title}"
5. **Confirm**:

```
Linked:
  Vault: {note-path}
  Linear: {issue-id} — {issue-title}
```

---

## (empty) — Status Overview

When called with no arguments, show a quick status:

1. Verify Linear MCP connection
2. Fetch a summary of the user's current work:
   - Issues in progress
   - Issues assigned but not started
   - Recently completed
3. Show count of vault notes linked to Linear issues:
   ```bash
   grep -rl "^linear:" --include="*.md" | wc -l
   ```

```
## Linear Status

Connected as: {user-name}
Active issues: {in-progress-count} in progress, {todo-count} todo
Vault links: {linked-count} notes linked to Linear

### In Progress
- [{id}] {title} ({team})
  ...
```

## Output

All sub-commands output to terminal. Only `sync --save` and `create`/`link` modify vault files.

When modifying vault files, follow all vault conventions:
- Use `[[wikilinks]]` for internal references
- Maintain `## Links` sections per linking rules
- Respect frontmatter format per markdown standards
