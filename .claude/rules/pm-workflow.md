---
paths: "daily/**/*.md, reports/**/*.md"
---

# PM Workflow Rules

These conventions apply to daily standups and weekly review processes.

## Weekly Cadence

### Weekly (Review)
- Review shipped items, blockers, decisions from past 7 days
- Separate delivered work, learning, and measured outcomes; mark missing impact data as unmeasured
- Reflect on what worked and what slowed progress using linked evidence
- Propose up to 3 priorities with rationale; leave unknown owners or dates explicit
- Run `/weekly` for structured review

### Daily (Standup)
- Log shipped/WIP/blocked per project
- Keyword detection auto-creates blockers
- One file per day, H2 per project

## Standup Conventions

### Format
```
/daily {project}: shipped X, wip Y, blocked on Z
```

### Multi-Project Updates
Run `/daily` once per project. All updates go in same `daily/YYYY-MM-DD.md`:
```markdown
# 2026-01-15

## Project A
### Shipped
- Auth flow
### In Progress
- Notifications
### Blocked
- [[blockers/project-a/2026-01-15-api-rate-limit|API rate limit]]

## Project B
### Shipped
- Dashboard v2
```

## Blocker Escalation

| Severity | Due Within | Action |
|----------|-----------|--------|
| high | 2 days | Flag in standup, escalate |
| high | overdue | Immediate escalation |
| medium | 5 days | Monitor |
| low | — | Track in next review |

## Weekly Review Process

Three phases; scale the depth to the evidence and decision:

1. **Collect** — Aggregate shipped, carried, blockers, and product evidence
2. **Reflect** — Separate delivery, learning, and outcomes; revisit unsupported assumptions
3. **Plan** — Proposed priorities, next validation, risk watchlist, decisions needed

Keep lessons proposed until approved. Ask before changing shared priorities or publishing a review.

## Decision Discipline

- Every decision gets a note, always
- Document alternatives even for "obvious" choices
- Regular decisions in `decisions/{project}/`
- Revisit decisions flagged in reviews
