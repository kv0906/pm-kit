---
name: notion
description: Bridge PM-Kit vault with Notion workspace — search, sync, publish, and link vault notes to Notion pages. Use when the user says "/notion", "notion sync", "publish to notion", "notion search", "sync from notion", "push to notion", "notion setup", mentions Notion in any project management context, wants to share vault content with stakeholders via Notion, or needs to pull Notion content into their vault. Also triggers when user needs to set up or connect Notion MCP.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet, mcp__claude_ai_Notion__search, mcp__claude_ai_Notion__fetch, mcp__claude_ai_Notion__notion-create-pages, mcp__claude_ai_Notion__notion-update-page, mcp__claude_ai_Notion__notion-create-database, mcp__claude_ai_Notion__notion-create-comment, mcp__claude_ai_Notion__notion-duplicate-page, mcp__claude_ai_Notion__notion-get-comments, mcp__claude_ai_Notion__notion-get-teams, mcp__claude_ai_Notion__notion-get-users, mcp__claude_ai_Notion__notion-move-pages, mcp__claude_ai_Notion__notion-update-data-source
user-invocable: true
---

# /notion — Notion Integration

Bridge your PM-Kit vault with Notion. Search, publish, sync, and link vault notes to Notion pages so you can share with stakeholders who live in Notion.

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
| `search` or a question | Search | Find Notion pages/databases |
| `publish` | Publish | Push vault note(s) to Notion |
| `pull` | Pull | Import Notion page into vault |
| `sync` | Sync | Two-way sync between vault note and Notion page |
| `link` | Link | Connect vault note <-> Notion page |
| `db` | Database | Query or create Notion databases |
| *(empty)* | Status | Show connection status + workspace overview |

## Step 0: Connection Check

Before any sub-command (except `setup`), verify Notion MCP is available:

1. Try calling `mcp__claude_ai_Notion__search` with a simple query
2. If the tool call fails or Notion tools are not available:

```
Notion MCP is not connected yet.

Run `/notion setup` to connect — it takes about 30 seconds.
```

Then stop. Don't attempt other operations without a working connection.

---

## setup — Connect Notion MCP

Guide the user through connecting Notion's remote MCP server to Claude Code.

### Steps to present to user:

```
## Notion MCP Setup

Notion's MCP server is hosted by Notion — no local install needed.

### Step 1: Add the server
Run this in your terminal:

  claude mcp add --transport http notion https://mcp.notion.com/mcp

### Step 2: Authenticate
In a Claude Code session, run:

  /mcp

Then follow the OAuth flow — it'll open your browser to authorize Notion access.

### Step 3: Verify
Once authenticated, try:

  /notion

You should see your Notion workspace overview.
```

**Optional enrichment**: Mention the [Notion plugin for Claude Code](https://github.com/makenotion/claude-code-notion-plugin) which bundles pre-built skills for common Notion workflows.

After presenting, ask if the user wants help running these commands now.

If the user confirms, run the `claude mcp add` command via Bash, then inform them they need to run `/mcp` themselves (it requires interactive browser auth that can't be automated).

### Scope options

Explain scope if the user asks:
- `--scope local` (default): Available only in the current project
- `--scope project`: Shared with team via `.mcp.json` file (already configured in this vault)
- `--scope user`: Available across all projects

---

## search — Search Notion

Find pages, databases, or content across the user's Notion workspace.

### Processing

1. **Parse query** from `$ARGUMENTS` (everything after "search")
2. **Search via Notion MCP** — Use `mcp__claude_ai_Notion__search` with the query
3. **Present results** in a scannable format:

```
## Notion Search: "{query}"

Found {count} results:

| Title | Type | Last Edited | URL |
|-------|------|-------------|-----|
| {title} | {page/database} | {date} | {url} |
```

4. **Offer actions**: "Want to `/notion pull` any of these into the vault, or `/notion link` one to an existing note?"

### Flags

- `--type page|database` — Filter by content type
- `--team {name}` — Filter by teamspace
- `--since YYYY-MM-DD` — Filter by creation date

---

## publish — Push Vault Note to Notion

Convert a vault note to a Notion page so stakeholders can read it in Notion.

### Input

Expects: `/notion publish {vault-note-path-or-wikilink}` with optional `--parent {notion-page-url}`

### Processing

1. **Resolve vault note** — Find the note by path, wikilink, or fuzzy search
2. **Read the note** and extract:
   - Title from H1 or frontmatter
   - Body content (convert `[[wikilinks]]` to plain text or Notion links if targets are also published)
   - Frontmatter metadata for Notion page properties
3. **Convert markdown to Notion format**:
   - Vault `[[wikilinks]]` → plain text (or Notion page links if linked pages exist)
   - Preserve headings, lists, tables, code blocks
   - Convert frontmatter to a metadata callout at the top
4. **Determine parent**:
   - If `--parent` provided, use that Notion page/database
   - If note has `notion:` in frontmatter, update existing page instead
   - Otherwise, create as workspace-level page and ask user where to move it
5. **Confirm with user** before creating:

```
Publishing to Notion:
  Source: {vault-path}
  Title: {title}
  Parent: {parent-page or "workspace root"}

Proceed? (y/n)
```

6. **Create/update the Notion page** via `mcp__claude_ai_Notion__notion-create-pages` or `mcp__claude_ai_Notion__notion-update-page`
7. **Link back** — Add the Notion URL to the vault note's frontmatter:
   ```yaml
   notion: {notion-page-url}
   ```
   And add to `## Links > ### Related`:
   ```markdown
   - [Notion: {title}]({url}) — Published to Notion
   ```

### Batch publish

If the user provides a glob pattern or folder (e.g., `/notion publish docs/my-project/`), iterate over matching files and publish each one. Show progress via session tasks.

---

## pull — Import Notion Page into Vault

Bring a Notion page's content into the vault as a properly formatted note.

### Input

Expects: `/notion pull {notion-url-or-page-id}` with optional `--type {doc|decision|blocker|meeting|inbox}` and `--project {project-id}`

### Processing

1. **Fetch the Notion page** via `mcp__claude_ai_Notion__fetch`
2. **Determine note type** — from `--type` flag, or infer from content/properties:
   - Has "Decision" or "ADR" → decision
   - Has task/blocker properties → blocker
   - Has meeting date/attendees → meeting
   - Default → doc
3. **Determine project** — from `--project` flag, or infer from Notion page location/tags, or ask
4. **Convert to vault format**:
   - Generate proper frontmatter (`type`, `project`, `status`, `date`, `tags`)
   - Add `notion: {page-url}` to frontmatter for linking back
   - Convert Notion-specific elements to standard markdown
   - Add `## Links` section with project backlink
5. **Generate filename** following naming conventions:
   - Docs: `docs/{project}/{slug}.md`
   - Decisions: `decisions/{project}/{date}-{slug}.md`
   - Blockers: `blockers/{project}/{date}-{slug}.md`
   - Meetings: `meetings/{project}/{date}-{slug}.md`
   - Inbox: `00-inbox/{date}-{slug}.md`
6. **Write the note** using the appropriate template from `_templates/`
7. **Confirm**: Show the created file path and a summary

---

## sync — Two-way Sync

Keep a vault note and its linked Notion page in sync.

### Processing

1. **Resolve the vault note** and check for `notion:` in frontmatter
2. If no Notion link exists, ask: "This note isn't linked to Notion yet. Want to `/notion publish` it first?"
3. **Fetch both versions**:
   - Read vault note
   - Fetch Notion page via `mcp__claude_ai_Notion__fetch`
4. **Compare** and show differences:

```
## Sync: {note-title}

Vault version: last modified {vault-date}
Notion version: last edited {notion-date}

### Differences found:
- Section "Requirements" differs
- Notion has additional section "Stakeholder Feedback"
- Vault has updated "Timeline" section

### Recommended action:
{newer-source} is more recent. Sync {direction}?
```

5. **Apply sync** based on user choice:
   - **Vault → Notion**: Update the Notion page with vault content
   - **Notion → Vault**: Update the vault note with Notion content
   - **Manual merge**: Show both versions side-by-side and let user choose per section

---

## link — Connect Vault Note <-> Notion Page

Create a bidirectional reference between a vault note and a Notion page without syncing content.

### Input

Expects: `/notion link {vault-note} {notion-url-or-page-id}`

Either argument can be omitted — prompt for missing info.

### Processing

1. **Resolve vault note** — Find by path, wikilink, or fuzzy search
2. **Resolve Notion page** — By URL, page ID, or search
3. **Update vault note**:
   - Add `notion: {page-url}` to frontmatter
   - Add `[Notion: {page-title}]({url})` to `## Links > ### Related`
4. **Comment on Notion page** (optional, ask user):
   - Post a comment: "Linked to vault note: {note-title}"
5. **Confirm**:

```
Linked:
  Vault: {note-path}
  Notion: {page-title} ({url})
```

---

## db — Database Operations

Query or interact with Notion databases.

### Sub-commands

| Input | Action |
|---|---|
| `db list` | List databases the user has access to |
| `db query {name-or-url}` | Query a database and display results |
| `db create {name}` | Create a new database in Notion |
| `db export {name-or-url}` | Export database rows as vault notes |

### db query

1. Fetch the database via `mcp__claude_ai_Notion__fetch` to get its schema
2. Use `mcp__claude_ai_Notion__search` with `data_source_url` to query
3. Present results as a formatted table
4. Offer: "Want to pull any of these into the vault?"

### db export

Export each row of a Notion database as individual vault notes. Useful for importing a project tracker, meeting log, or decision register from Notion into the vault.

1. Fetch the database and all rows
2. For each row, create a vault note using the appropriate template
3. Link each note back to its Notion source
4. Show summary of created files

---

## (empty) — Status Overview

When called with no arguments, show a quick status:

1. Verify Notion MCP connection
2. Show workspace info (teams, user)
3. Show count of vault notes linked to Notion:
   ```bash
   grep -rl "^notion:" --include="*.md" | wc -l
   ```

```
## Notion Status

Connected as: {user-name}
Workspace: {workspace-name}
Vault links: {linked-count} notes linked to Notion

### Recently Linked
- {note-path} → {notion-page-title}
  ...
```

## Available Notion MCP Tools

Use the right tool for each operation. The tool name prefix is `mcp__claude_ai_Notion__`.

| Tool | When to Use |
|------|-------------|
| `search` | Find pages, databases, or content across workspace + connected sources (Slack, Drive, Jira, Linear). Supports date/creator/teamspace filters. Rate limited to 30 req/min. |
| `fetch` | Get full content of a page, database schema, or data source by URL/ID. Use `collection://` URLs for data sources. Returns enhanced Markdown + templates. Always fetch before updating. |
| `notion-create-pages` | Create one or more pages. Parent can be page, database, or data source. Supports templates via `template_id`. Omit parent for workspace-level private page. |
| `notion-update-page` | Update properties (`update_properties`), patch content (`update_content` with old_str/new_str), replace content (`replace_content`), apply templates (`apply_template`), or verify pages (`update_verification`). Always fetch first to get current content. |
| `notion-create-database` | Create a new database with custom properties/schema. |
| `notion-update-data-source` | Add/modify properties on an existing data source (add columns, change field types). |
| `notion-move-pages` | Move pages or databases to a new parent. |
| `notion-duplicate-page` | Duplicate a page (async — content appears shortly after). |
| `notion-create-comment` | Comment on a page, specific block, or reply to existing discussion. |
| `notion-get-comments` | List all comments/discussions on a page, including resolved threads. |
| `notion-get-teams` | List teamspaces — useful for filtering searches by team. |
| `notion-get-users` | List workspace users — useful for looking up assignees/owners. |

### Key patterns

- **Always fetch before update**: Call `fetch` to get current page content/schema before using `notion-update-page`. The `update_content` command needs exact `old_str` matches.
- **Database workflow**: Fetch database → get data source URLs (`collection://...`) → use data source ID for creating pages or querying.
- **Templates**: Fetch a database to see available templates in `<templates>` section. Pass `template_id` when creating pages — don't include `content` when using a template.
- **Date properties**: Split into `date:{prop}:start`, `date:{prop}:end`, `date:{prop}:is_datetime`.
- **Checkbox properties**: Use `__YES__` / `__NO__`, not true/false.
- **Rate limits**: 180 requests/min general, 30/min for search. Avoid parallel searches.

## Output

All sub-commands output to terminal. Only `publish`, `pull`, `sync`, and `link` modify vault files.

When modifying vault files, follow all vault conventions:
- Use `[[wikilinks]]` for internal references
- Maintain `## Links` sections per linking rules
- Respect frontmatter format per markdown standards
- Always use templates from `_templates/` when creating new notes
