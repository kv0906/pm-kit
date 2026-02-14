---
paths: "daily/**/*.md, reports/**/*.md"
---

# PM Workflow Rules

These conventions apply to daily standups and weekly review processes.

## Weekly Cadence

### Weekly (Review)
- Review shipped items, blockers, decisions from past 7 days
- Reflect on what worked and what slowed progress
- Set top 3 priorities for next week with owners
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

Three phases, 30 minutes total:

1. **Collect** (10 min) — Aggregate shipped, carried, blockers
2. **Reflect** (10 min) — Patterns, what worked, what slowed progress
3. **Plan** (10 min) — Top 3 priorities, risk watchlist, decisions needed

## Decision Discipline

- Every decision gets a note, always
- Document alternatives even for "obvious" choices
- Regular decisions in `decisions/{project}/`
- Revisit decisions flagged in reviews
