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
  - id: project-a
    name: Project A
    description: Main product platform
    linear_project: PA
    active: true

  - id: project-b
    name: Project B
    description: Internal tools platform
    linear_project: PB
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
/progress project-a
/progress project-b

# During standup
/daily project-a: shipped auth flow, wip notifications, blocked on API rate limits

# After meetings
/meet project-a sprint review
[paste notes]

# Throughout day
/inbox competitor pattern to analyze later
/decide project-a: using websocket over polling
/block project-b: waiting on legal review --severity high --due friday

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
