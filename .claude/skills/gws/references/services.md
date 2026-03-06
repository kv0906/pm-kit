# GWS Service Reference

## Complete Service List

### Core Productivity

| Service | Resource | Key Methods | Helpers |
|---------|----------|-------------|---------|
| `gmail` | users.messages, users.labels, users.drafts | list, get, send, modify, trash | `+send`, `+triage` |
| `calendar` | events, calendarList | list, insert, patch, delete | `+agenda`, `+insert` |
| `drive` | files, permissions, comments | list, get, create, update, delete, export | `+upload` |
| `sheets` | spreadsheets, spreadsheets.values | get, update, append, batchUpdate | `+read`, `+append` |
| `docs` | documents | create, get, batchUpdate | `+write` |
| `slides` | presentations, presentations.pages | create, get, batchUpdate | |

### Communication & Collaboration

| Service | Resource | Key Methods | Helpers |
|---------|----------|-------------|---------|
| `chat` | spaces, spaces.messages | list, create, get, delete | `+send` |
| `meet` | spaces, conferenceRecords | create, get, list | |
| `people` | people, contactGroups | list, get, createContact, updateContact | |

### Administration

| Service | Resource | Key Methods |
|---------|----------|-------------|
| `admin` | users, groups, orgunits, devices | list, get, insert, update, delete |
| `vault` | matters, holds, exports | list, create, get |
| `licensing` | licenseAssignments | list, get, insert |
| `groupssettings` | groups | get, update |

### Other Services

| Service | Purpose |
|---------|---------|
| `tasks` | Task lists and tasks management |
| `forms` | Google Forms creation and management |
| `keep` | Google Keep notes |
| `classroom` | Classes, rosters, coursework |
| `apps-script` | Apps Script project management |
| `cloudidentity` | Cloud Identity management |
| `alertcenter` | Alert Center for security alerts |
| `modelarmor` | Safety filtering for agent responses |

## Persona Skills (Pre-Built Agent Roles)

| Persona | Bundled Services | Use Case |
|---------|-----------------|----------|
| Executive Assistant | gmail, calendar, drive, docs | Schedule, inbox, communications |
| Project Manager | calendar, tasks, sheets, chat | Coordination, tracking, meetings |
| HR Coordinator | gmail, drive, calendar, admin | Onboarding, announcements |
| Sales Ops | gmail, sheets, calendar, drive | Deal tracking, sales workflows |
| IT Admin | admin, vault, cloudidentity | User management, security |
| Content Creator | docs, slides, drive, gmail | Content creation and distribution |
| Customer Support | gmail, sheets, chat | Ticket management, escalation |
| Event Coordinator | calendar, gmail, forms, drive | Event planning, invitations |
| Team Lead | chat, calendar, tasks, sheets | Standups, task coordination |
| Researcher | drive, docs, sheets, gmail | Research organization, collaboration |

## Common Patterns

### Listing with Pagination

```bash
# First page
gws drive files list --params '{"pageSize": 100}'

# Next page (use nextPageToken from response)
gws drive files list --params '{"pageSize": 100, "pageToken": "TOKEN"}'
```

### Filtering and Searching

```bash
# Gmail search operators
gws gmail users messages list --params '{"userId": "me", "q": "from:boss subject:urgent after:2026/03/01"}'

# Drive search
gws drive files list --params '{"q": "name contains '\''report'\'' and mimeType='\''application/pdf'\''"}'

# Calendar time range
gws calendar events list --params '{"calendarId": "primary", "timeMin": "2026-03-01T00:00:00Z", "timeMax": "2026-03-31T23:59:59Z"}'
```

### Batch Operations

```bash
# Sheets batch update
gws sheets spreadsheets batchUpdate --params '{"spreadsheetId": "ID"}' \
  --json '{"requests": [{"updateCells": {...}}, {"addSheet": {...}}]}'

# Docs batch update
gws docs documents batchUpdate --params '{"documentId": "ID"}' \
  --json '{"requests": [{"insertText": {"location": {"index": 1}, "text": "Hello"}}]}'
```

### Error Handling

Common error codes:
- `401`: Auth expired - run `gws auth login` again
- `403`: Insufficient permissions - check OAuth scopes in `gws auth setup`
- `404`: Resource not found - verify ID
- `429`: Rate limited - wait and retry

### Output Formatting

```bash
# Default: JSON output
gws drive files list --params '{"pageSize": 5}'

# Pipe to jq for processing
gws drive files list --params '{"pageSize": 5}' | jq '.files[].name'

# Save output to file
gws drive files list --params '{"pageSize": 5}' -o files.json
```
