---
name: gws
description: This skill should be used when the user asks to "set up gws", "install Google Workspace CLI", "connect Gmail to Claude", "manage Google Drive from terminal", "send email from CLI", "check my calendar", "create a Google Doc", "use gws", "Google Workspace agent", or mentions gws CLI, Google Workspace automation, or wants to interact with Gmail, Drive, Calendar, Sheets, Docs, Slides, Chat, Tasks, Meet, or Forms from the command line.
---

# Google Workspace CLI (gws)

A CLI tool built in Rust that wraps every Google Workspace API into composable commands with structured JSON output. It dynamically builds its command structure from Google's Discovery Service, so it always supports the latest APIs without updates.

## Prerequisites

- **gcloud CLI**: Required for authentication. Install via `brew install --cask google-cloud-sdk` on macOS.
- **Node.js/npm**: Required to install gws.

## Installation & Setup

```bash
# 1. Install the CLI
npm install -g @googleworkspace/cli

# 2. Set up auth (interactive walkthrough for GCP project + OAuth)
gws auth setup

# 3. Login to Google Workspace account
gws auth login
```

The `gws auth setup` command walks through:
1. GCP project creation or selection (all via CLI)
2. Enabling required Google Workspace APIs
3. OAuth client configuration

Multiple accounts (work, personal) can be added. For agent-dedicated accounts, grant Full Access (all OAuth scopes). For personal/work accounts, start with Limited Access.

## Core Usage Patterns

### Command Structure

```bash
# Standard API call
gws <service> <resource> <method> --params '{"key": "value"}' --json '{"body": "data"}'

# Helper shortcut (handles encoding/formatting)
gws <service> +<helper> --flag value
```

### Key Services & Helpers

| Service | Common Helpers | Purpose |
|---------|---------------|---------|
| gmail | `+send`, `+triage` | Email management |
| calendar | `+agenda`, `+insert` | Schedule management |
| drive | `+upload` | File management |
| sheets | `+read`, `+append` | Spreadsheet operations |
| docs | `+write` | Document operations |
| chat | `+send` | Team messaging |

All responses return structured JSON for reliable agent parsing.

### Gmail

```bash
# Search inbox
gws gmail users messages list --params '{"userId": "me", "q": "is:unread"}'

# Read a message
gws gmail users messages get --params '{"userId": "me", "id": "MSG_ID"}'

# Send email (helper handles RFC 2822 encoding)
gws gmail +send --to alice@company.com --subject 'Report Ready' \
  --body 'The Q2 report is ready for review.'

# Triage unread
gws gmail +triage --max 5 --query 'from:boss'
```

### Calendar

```bash
# Today's agenda
gws calendar +agenda

# Create event
gws calendar +insert --summary 'Standup' \
  --start '2026-03-10T09:00:00-07:00' \
  --end '2026-03-10T09:30:00-07:00'

# Create recurring event with attendees
gws calendar events insert \
  --params '{"calendarId": "primary"}' \
  --json '{
    "summary": "Weekly Standup",
    "start": {"dateTime": "2026-03-10T09:00:00", "timeZone": "America/Vancouver"},
    "end": {"dateTime": "2026-03-10T09:30:00", "timeZone": "America/Vancouver"},
    "recurrence": ["RRULE:FREQ=WEEKLY;BYDAY=MO"],
    "attendees": [{"email": "team@company.com"}]
  }'
```

### Drive

```bash
# List recent files
gws drive files list --params '{"pageSize": 10}'

# Upload file
gws drive +upload --file ./report.pdf --parent FOLDER_ID

# Create folder
gws drive files create --json '{"name": "Q2 Project", "mimeType": "application/vnd.google-apps.folder"}'

# Download / Export
gws drive files get --params '{"fileId": "FILE_ID", "alt": "media"}' -o report.pdf
gws drive files export --params '{"fileId": "FILE_ID", "mimeType": "application/pdf"}' -o doc.pdf

# Share with someone
gws drive permissions create --params '{"fileId": "FOLDER_ID"}' \
  --json '{"role": "writer", "type": "user", "emailAddress": "colleague@company.com"}'
```

### Sheets

```bash
# Read range
gws sheets +read --spreadsheet-id SHEET_ID --range 'Contacts!A2:C'

# Append row
gws sheets +append --spreadsheet-id SHEET_ID --range 'Sheet1' \
  --values '["2026-03-05", "Marketing", "Ad spend", "1500"]'
```

### Docs, Chat, Meet, Forms

```bash
# Create document
gws docs documents create --json '{"title": "Meeting Notes"}'

# Write to doc
gws docs +write --document-id DOC_ID \
  --text '## Project: Q2 Launch\n\n### Objective\nLaunch by end of Q2.'

# Send chat message
gws chat +send --space spaces/TEAM_SPACE --text 'Check updated policy.'

# Create Meet room
gws meet spaces create --json '{"config": {"accessType": "OPEN"}}'

# Create form
gws forms forms create --json '{"info": {"title": "Feedback", "documentTitle": "Feedback Form"}}'
```

## MCP Server Integration

For deeper Claude Code integration, gws provides a built-in MCP server:

```bash
# Start MCP server with specific services
gws mcp -s drive,gmail,calendar
```

Configure in `.mcp.json` or Claude Desktop settings:

```json
{
  "mcpServers": {
    "gws": {
      "command": "gws",
      "args": ["mcp", "-s", "drive,gmail,calendar"]
    }
  }
}
```

Each service adds ~10-80 tools. Keep the service list focused to stay under tool limits.

## Agent Skills from the Repo

The gws repo ships 100+ SKILL.md files (service skills, persona bundles, helpers, recipes). See `references/services.md` for the full catalog and persona details.

```bash
# Clone and symlink all skills
git clone https://github.com/googleworkspace/cli.git
ln -s $(pwd)/cli/skills/gws-* ~/.claude/skills/

# Or copy specific ones
cp -r cli/skills/gws-drive cli/skills/gws-gmail ~/.claude/skills/
```

## Model Armor (Safety)

Sanitize API responses to prevent prompt injection from email/doc content:

```bash
gws gmail users messages get --params '...' \
  --sanitize "projects/P/locations/L/templates/T"
```

Modes: `warn` (flags suspicious content) or `block` (strips it out).

## Additional Resources

### Reference Files

- **`references/services.md`** - Complete service list with all helpers and API patterns
- **`references/setup-troubleshooting.md`** - Common setup issues and OAuth configuration details

### Scripts

- **`scripts/check-gws.sh`** - Verify gws installation and auth status
