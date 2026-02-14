# Product Owner Domain Example

This example shows how to configure PM-Kit for Product Owner workflows.

## Note Types

| Type | Folder | Purpose |
|------|--------|---------|
| `prd` | `docs/{project}/` | Product Requirements Documents |
| `decision` | `decisions/{project}/` | Decision records |
| `blocker` | `blockers/{project}/` | Active blockers |
| `meeting` | `meetings/` | Meeting notes |
| `daily` | `daily/` | Daily standups |

## Sample Config

```yaml
# _core/config.yaml changes for PO domain

projects:
  - id: xmarket
    name: xMarket
    description: Prediction market platform
    linear_project: XMKT
    active: true

  - id: playstat
    name: PlayStat
    description: Gaming statistics platform
    linear_project: PS
    active: true

note_types:
  doc:
    # Rename to PRD for PO context
    status_values: [draft, review, approved, in-progress, shipped]
    requires_links: true
    folder: "prd/{project}"
    filename_pattern: "{feature-slug}.md"
    archive_on: shipped
    fields:
      - name: priority
        type: enum
        values: [P0, P1, P2]
      - name: feature
        type: string

tags:
  domain:
    - payments
    - auth
    - trading
    - notifications
    - analytics
  area:
    - api
    - frontend
    - backend
    - database
    - infrastructure
  risk:
    - security
    - compliance
    - performance

integrations:
  linear:
    enabled: true
    auto_sync: false
  notion:
    enabled: true
```

## Sample Commands

```bash
# Morning review
/progress xmarket
/progress playstat

# During standup
/daily xmarket: shipped auth flow, wip notifications, blocked on API rate limits

# After meetings
/meet xmarket sprint review
[paste notes]

# Throughout day
/inbox competitor pattern to analyze later
/decide xmarket: using websocket over polling
/block playstat: waiting on legal review --severity high --due friday

# End of day
/inbox
```

## PRD Template

The PO domain uses an enhanced PRD template with:
- Problem Statement
- Goals / Non-Goals
- User Stories
- Requirements (P0/P1/P2)
- Technical Approach
- Success Metrics
- Open Questions

See your original `_templates/prd.md` for the full template.

## Integrations

### Linear
- Sync PRD requirements as tickets
- Create issues from blockers
- Link back to vault notes

### Notion
- Push PRDs to Notion database
- Sync meeting notes

---

*To use: Copy this configuration to your `_core/config.yaml` and adjust for your projects.*
