---
paths: "daily/**/*.md, roadmap/**/*.md, reports/**/*.md"
---

# PM Workflow Rules

These conventions apply to daily standups, OKRs, and sprint processes.

## OKR Cadence

### Quarterly
- Set 2-4 objectives with 2-3 key results each
- Key results must be measurable (number, percentage, binary)
- Store in `roadmap/objectives.md`

### Weekly (Sprint Retro)
- Update key result progress
- Log snapshot in `roadmap/key-results.md`
- Run `/weekly` for structured retro

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

## xMarket
### Shipped
- Auth flow
### In Progress
- Notifications
### Blocked
- [[blockers/xmarket/2026-01-15-api-rate-limit|API rate limit]]

## PlayStat
### Shipped
- Dashboard v2
```

## Blocker Escalation

| Severity | Due Within | Action |
|----------|-----------|--------|
| high | 2 days | Flag in standup, escalate |
| high | overdue | Immediate escalation |
| medium | 5 days | Monitor |
| low | — | Track in next retro |

## Sprint Retro Process

Three phases, 30 minutes total:

1. **Collect** (10 min) — Aggregate shipped, carried, blockers
2. **Reflect** (10 min) — OKR progress, patterns, what worked
3. **Plan** (10 min) — ONE Big Thing, sprint goals, decisions needed

## Decision Discipline

- Every decision gets a note, always
- Document alternatives even for "obvious" choices
- ADRs for architecture/technical decisions
- Regular decisions in `decisions/{project}/`
- Revisit decisions flagged in retros
