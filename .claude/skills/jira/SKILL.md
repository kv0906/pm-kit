---
name: jira
description: "Jira integration via acli CLI. Use when user says '/jira', 'check Jira board', 'create Jira ticket', 'move ticket to done', 'search Jira', 'sync blockers from Jira', 'what's in the sprint', 'Jira status', 'assign ticket', 'view backlog', or wants to interact with Jira issues, sprints, or boards from the terminal."
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /jira — Jira Integration

Bridge your PM-Kit vault with Jira issue tracking via the `acli` (Atlassian CLI) command-line tool. View boards, create/edit/transition issues, search via JQL, and sync Jira state with vault notes.

## Prerequisites

- **acli** (Atlassian CLI): `brew install acli` or download from https://bobswift.atlassian.net/wiki/spaces/ACLI
- **Jira Cloud or Server instance** with API access
- **Authentication** configured via `acli jira auth login`

## Context

Today's date: `!date +%Y-%m-%d`
Config: @_core/config.yaml
Processing rules: @_core/PROCESSING.md
Active projects: `!ls 01-index/*.md 2>/dev/null | sed 's|01-index/||;s|\.md||'`

## Input

User input: $ARGUMENTS

## Sub-commands

Parse the first word of `$ARGUMENTS` to determine the sub-command:

| Input starts with | Sub-command | Purpose | Read/Write |
|---|---|---|---|
| `setup` | Setup | Guide installation + auth configuration | Config write |
| `board` | Board | Show board columns with issue counts | Read-only |
| `create` | Create | Create a Jira issue | Jira write + optional vault note |
| `status` | Status | Show details for a specific issue | Read-only |
| `move` | Move | Transition an issue to a new status | Jira write + vault note update |
| `edit` | Edit | Update issue fields | Jira write |
| `assign` | Assign | Assign an issue to someone | Jira write |
| `backlog` | Backlog | Show backlog items | Read-only |
| `search` | Search | Find issues via JQL or natural language | Read-only |
| `sprint` | Sprint | Show active sprint details | Read-only |
| `sync` | Sync | Pull Jira state into vault notes | Vault write (additive only) |
| *(empty)* | Help | Show help + quick status summary | Read-only |

## Step 0: Connection Check

Before any sub-command (except `setup`), verify acli is installed and authenticated:

```bash
# 1. Check acli is installed
command -v acli &>/dev/null

# 2. Check auth works with a simple query
acli jira --action getServerInfo 2>/dev/null
```

If either fails:

```
Jira CLI (acli) is not connected yet.

Run `/jira setup` to install and configure — it takes about 2 minutes.
```

Then stop. Don't attempt other operations without a working connection.

### Project Resolution

Many sub-commands accept an optional `[PROJECT]` argument. Resolve it:

1. If user provides a Jira project key directly (e.g., `TEAM`), use it
2. If user provides a vault project ID (e.g., `project-a`), look up `integrations.jira.project_mapping` in `_core/config.yaml`
3. If no project specified, check for a single active project or use `integrations.jira.default_board`
4. If ambiguous, ask the user

---

## setup — Install & Configure

Guide the user through installing acli and connecting to their Jira instance.

### Steps to present:

```
## Jira CLI Setup

### Step 1: Install acli
  brew install acli

Or download from: https://bobswift.atlassian.net/wiki/spaces/ACLI

### Step 2: Authenticate
  acli jira --server https://YOUR-ORG.atlassian.net --user your@email.com --token YOUR_API_TOKEN --action getServerInfo

Generate an API token at: https://id.atlassian.com/manage-profile/security/api-tokens

### Step 3: Save credentials
Create ~/.acli/credentials with:

  jira.server = https://YOUR-ORG.atlassian.net
  jira.user = your@email.com
  jira.token = YOUR_API_TOKEN

### Step 4: Verify
  /jira

You should see your Jira instance info and recent activity.
```

After presenting, ask the user for their Jira site URL and email to help configure.

Then update `_core/config.yaml` integrations block:

```yaml
integrations:
  jira:
    enabled: true
    site: "your-org.atlassian.net"
    email: "your@email.com"
    project_mapping:
      project-a: TEAM        # vault project ID: JIRA PROJECT KEY
    default_board: ""
    status_mapping:
      "To Do": wip
      "In Progress": wip
      "Done": shipped
      "Blocked": blocked
```

Confirm each value with the user before writing.

---

## board — View Board

Show the current board state with issues grouped by column.

### Processing

1. Resolve project (see Project Resolution above)
2. Fetch board data:

```bash
acli jira --action getIssueList --project "PROJECT" --outputType json
```

3. Group issues by status and present:

```
## Jira Board — {PROJECT}

### To Do ({count})
- [{KEY}] {summary} — {assignee} ({priority})

### In Progress ({count})
- [{KEY}] {summary} — {assignee} ({priority})

### Done ({count} recent)
- [{KEY}] {summary} — completed {date}
```

4. Highlight any issues matching vault blockers (cross-reference by `jira_key` in frontmatter)

---

## create — Create Issue

Create a Jira issue, optionally from vault note context.

### Processing

1. **Determine source** — Check if user provided:
   - A vault file path or wikilink → Read that note for context
   - `--type`, `--summary`, `--description` flags → Use directly
   - Freeform text → Parse into fields
   - Nothing → Ask what to create

2. **Extract issue fields**:
   - **Project**: From vault project mapping or ask
   - **Type**: Task (default), Bug, Story, Epic — from `--type` or inferred from note type (blocker→Bug)
   - **Summary**: From `--summary`, note H1, or frontmatter title
   - **Description**: From note body or `--description` (convert wikilinks to plain text)
   - **Priority**: Map from blocker severity (high→Highest, medium→High, low→Medium) or ask
   - **Assignee**: From `--assignee` or ask (optional)

3. **Confirm with user** before creating:

```
Creating Jira issue:
  Project: {PROJECT}
  Type: {type}
  Summary: {summary}
  Priority: {priority}
  Assignee: {assignee}

Proceed? (y/n)
```

4. **Create the issue**:

```bash
acli jira --action createIssue --project "PROJECT" --type "Task" --summary "summary" --description "description" --priority "Medium"
```

5. **Link back** — If created from a vault note, update the note:
   - Add `jira_key: KEY-123` to frontmatter
   - Add to `## Links > ### Related`:
   ```markdown
   - [KEY-123](https://site.atlassian.net/browse/KEY-123) — Jira issue
   ```

6. Report the created issue key and URL.

---

## status — Issue Details

Show detailed information for a specific issue.

### Processing

1. Parse issue key from `$ARGUMENTS` (e.g., `TEAM-42`)
2. Fetch issue details:

```bash
acli jira --action getIssue --issue "KEY-123" --outputType json
```

3. Present formatted output:

```
## TEAM-42: {summary}

**Status**: {status} | **Priority**: {priority} | **Type**: {type}
**Assignee**: {assignee} | **Reporter**: {reporter}
**Sprint**: {sprint} | **Created**: {date}

### Description
{description}

### Comments ({count})
- {author} ({date}): {comment snippet}...

### Vault Links
- [[blockers/project-a/2026-03-01-api-rate-limit|API Rate Limit]] (jira_key: TEAM-42)
```

4. Check vault for any notes with `jira_key: KEY-123` in frontmatter and show cross-references.

---

## move — Transition Issue

Move an issue to a new status (e.g., "In Progress" → "Done").

### Processing

1. Parse issue key and target status from `$ARGUMENTS`
   - e.g., `/jira move TEAM-42 "Done"` or `/jira move TEAM-42 done`
2. Fetch available transitions:

```bash
acli jira --action getTransitionList --issue "KEY-123"
```

3. Match target status (case-insensitive, fuzzy match)
4. **Confirm before executing**:

```
Moving TEAM-42: "API Rate Limit Fix"
  From: In Progress
  To: Done

Proceed? (y/n)
```

5. Execute transition:

```bash
acli jira --action transitionIssue --issue "KEY-123" --transition "Done"
```

6. **Update vault** — If a vault note has `jira_key: KEY-123`:
   - If moved to a "shipped" status (per `status_mapping`): Update note `status: resolved` or `status: shipped`
   - If moved to a "blocked" status: Flag in daily note
   - Check if `archive_on_status_change` applies

---

## edit — Update Issue Fields

Update fields on an existing Jira issue.

### Processing

1. Parse issue key and fields from `$ARGUMENTS`
   - `--summary "new title"`, `--description "new desc"`, `--priority High`, `--labels "label1,label2"`
2. **Confirm before executing**:

```
Updating TEAM-42:
  summary: "New Title"
  priority: High

Proceed? (y/n)
```

3. Execute update:

```bash
acli jira --action updateIssue --issue "KEY-123" --summary "New Title" --priority "High"
```

---

## assign — Assign Issue

Assign an issue to a team member.

### Processing

1. Parse issue key and assignee from `$ARGUMENTS`
   - `/jira assign TEAM-42 "john.doe"` or `/jira assign TEAM-42 me`
2. If `me`, resolve current user from config
3. **Confirm before executing**:

```
Assigning TEAM-42 to john.doe

Proceed? (y/n)
```

4. Execute:

```bash
acli jira --action updateIssue --issue "KEY-123" --assignee "john.doe"
```

---

## backlog — View Backlog

Show backlog items not in the active sprint.

### Processing

1. Resolve project
2. Fetch backlog issues:

```bash
acli jira --action getIssueList --project "PROJECT" --filter "sprint not in openSprints()" --outputType json
```

3. Present sorted by priority:

```
## Backlog — {PROJECT} ({count} items)

### High Priority
- [{KEY}] {summary} — {type} ({assignee})

### Medium Priority
- [{KEY}] {summary} — {type} ({assignee})

### Low / Unset
- [{KEY}] {summary} — {type}
```

---

## search — Search Issues

Find issues using JQL or natural language queries.

### Processing

1. Parse query from `$ARGUMENTS` (everything after "search")
2. Determine if it's JQL or natural language:
   - Contains JQL operators (`=`, `in`, `AND`, `ORDER BY`, field names like `assignee`, `status`) → Use as JQL
   - Otherwise → Convert natural language to JQL

3. **Natural language → JQL conversion examples**:
   - "my open bugs" → `assignee = currentUser() AND type = Bug AND status != Done`
   - "high priority in TEAM" → `project = TEAM AND priority in (Highest, High)`
   - "created this week" → `created >= startOfWeek()`
   - "blocked items" → `status = Blocked OR labels = blocked`

   When unsure, refer to `references/jql-cheatsheet.md` for patterns.

4. Execute search:

```bash
acli jira --action getIssueList --jql "YOUR_JQL" --outputType json
```

5. Present results:

```
## Jira Search: "{query}"

Found {count} issues:

| Key | Summary | Status | Assignee | Priority | Updated |
|-----|---------|--------|----------|----------|---------|
| {key} | {summary} | {status} | {assignee} | {priority} | {date} |
```

6. Offer follow-up actions: "Want to `/jira status KEY` for details or `/jira move KEY status` to transition?"

---

## sprint — Active Sprint

Show the active sprint with progress metrics.

### Processing

1. Resolve project
2. Fetch active sprint data:

```bash
acli jira --action getIssueList --project "PROJECT" --filter "sprint in openSprints()" --outputType json
```

3. Present with metrics:

```
## Active Sprint — {sprint name}

**Dates**: {start} → {end} ({days remaining} days left)
**Progress**: {done}/{total} issues ({percent}%)

### Done ({count})
- [{KEY}] {summary}

### In Progress ({count})
- [{KEY}] {summary} — {assignee}

### To Do ({count})
- [{KEY}] {summary} — {assignee}

### Blocked ({count})
- [{KEY}] {summary} — ⚠ {blocker reason}
```

---

## sync — Pull Jira State Into Vault

Sync Jira issue state with vault notes. **Additive only** — creates/updates vault notes, never deletes.

### Processing

1. Create a session task for progress tracking
2. Resolve project (or sync all mapped projects)
3. Read `integrations.jira.status_mapping` and `integrations.jira.project_mapping` from config
4. Fetch recent issues (updated in last 7 days, or `--days N`):

```bash
acli jira --action getIssueList --project "PROJECT" --jql "updated >= -7d" --outputType json
```

5. For each issue, determine vault action based on `status_mapping`:

   **Blocked issues → Create/update blocker notes**:
   - Check if a blocker note with `jira_key: KEY` already exists
   - If not, create one using `_templates/blocker.md`:
     - `jira_key: KEY-123` in frontmatter
     - `tags: [KEY-123]`
     - `severity` mapped from Jira priority
     - `## Links` includes `[KEY-123](https://site/browse/KEY-123)`
   - If exists and still blocked, skip (no-op)
   - If exists but now resolved in Jira, update `status: resolved`

   **Shipped issues → Update daily note**:
   - Check today's daily note exists
   - Append shipped items under the relevant project's `### Shipped` section
   - Format: `- [{KEY}] {summary} ✓`

   **Resolved blockers → Archive**:
   - Find vault blockers with matching `jira_key` where Jira status maps to "shipped"
   - Update `status: resolved` (auto-archive rules will handle the rest)

6. **Bulk safety**: If sync would create 5+ new notes, show summary and confirm:

```
Sync will create:
  - 3 new blocker notes
  - 7 shipped items added to daily note
  - 2 blockers resolved

Proceed? (y/n)
```

7. Report what was synced:

```
## Jira Sync Complete — {date}

Created: 3 blocker notes
Updated: 2 blockers → resolved
Daily: 7 shipped items added
Skipped: 12 issues (no vault action needed)
```

### Flags

- `--days N` — Look back N days (default: 7)
- `--dry-run` — Show what would change without writing
- `--project {name}` — Sync only one project

---

## (empty) — Help & Quick Status

When called with no arguments, show help and a quick status summary.

### Processing

1. Check acli connection status
2. Read Jira config from `_core/config.yaml`
3. Count vault notes linked to Jira issues:

```bash
grep -rl "^jira_key:" --include="*.md" | wc -l
```

4. Present:

```
## Jira Integration

**Status**: Connected to {site}
**Mapped projects**: {project-a} → TEAM, ...
**Vault links**: {count} notes linked to Jira issues

### Commands

| Command | Example | Purpose |
|---------|---------|---------|
| board | `/jira board TEAM` | View board columns |
| create | `/jira create TEAM --summary "..."` | Create issue |
| status | `/jira status TEAM-42` | Issue details |
| move | `/jira move TEAM-42 Done` | Transition issue |
| edit | `/jira edit TEAM-42 --summary "..."` | Update fields |
| assign | `/jira assign TEAM-42 john` | Assign issue |
| backlog | `/jira backlog TEAM` | View backlog |
| search | `/jira search "my open bugs"` | Search via JQL |
| sprint | `/jira sprint TEAM` | Active sprint |
| sync | `/jira sync` | Pull state into vault |
| setup | `/jira setup` | Configure connection |
```

## Vault Integration Patterns

### Frontmatter Tagging

When a vault note is linked to a Jira issue, add to frontmatter:

```yaml
jira_key: TEAM-42
tags: [TEAM-42]
```

### Cross-Reference Format

In note body and `## Links` sections, use:

```markdown
[TEAM-42](https://your-org.atlassian.net/browse/TEAM-42)
```

### Status Mapping

Map Jira statuses to PM-Kit categories via `integrations.jira.status_mapping` in config:

| Jira Status | PM-Kit Category |
|-------------|-----------------|
| To Do | wip |
| In Progress | wip |
| Done | shipped |
| Blocked | blocked |

Users can customize this mapping for their Jira workflow (e.g., add "In Review" → wip).

## Safety Rules

1. **Read-only commands execute without confirmation**: board, status, search, sprint, backlog
2. **Mutating commands require confirmation**: create, move, edit, assign
3. **Sync is additive only** — creates/updates vault notes, never deletes vault content
4. **Bulk operations (5+ changes) show summary** before proceeding
5. **API tokens are handled by acli** — never log, display, or store tokens in vault files
6. **Never auto-transition** Jira issues based on vault changes — Jira writes only happen via explicit commands

## Error Handling

| Error | Response |
|-------|----------|
| acli not installed | Show install instructions, suggest `/jira setup` |
| Not authenticated | Show auth steps, link to API token page |
| Invalid project key | Show available projects from config mapping |
| Issue not found | Suggest search, check key format |
| Transition not available | Show available transitions for the issue |
| No project mapping | Ask user to configure in `_core/config.yaml` or run `/jira setup` |

## Additional Resources

### Reference Files

- **`references/jql-cheatsheet.md`** — Common JQL patterns for PMs

### Scripts

- **`scripts/check-jira.sh`** — Verify acli installation and auth status
