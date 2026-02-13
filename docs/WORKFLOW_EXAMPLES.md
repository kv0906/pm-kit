# MindLoom Workflow Examples

## Daily PM Workflow

### Morning (5 min)

```
/onboard                # Load vault context
/daily xmarket: shipped auth flow, wip notifications, blocked on API rate limits
/daily playstat: shipped dashboard v2, wip analytics, decided to use websockets
```

Claude will:
- Create/update `daily/2026-01-15.md` with sections for each project
- Detect "blocked on API rate limits" → prompt to create blocker
- Detect "decided to use websockets" → prompt to create decision

### Throughout the Day

```
/block xmarket: waiting on legal review for compliance --severity high --due friday
/decide xmarket: chose PostgreSQL over MongoDB for transaction data
/doc xmarket checkout-flow
/inbox competitor launched similar feature — analyze later
/ask what did we decide about the auth approach?
```

### After Meetings

```
/meet xmarket sync sprint-review
[paste meeting notes]
```

Claude extracts decisions, blockers, and action items into separate notes.

### End of Day

```
/push "End of day — shipped auth, 2 blocker updates"
```

## Weekly Sprint Retro

Run on Friday or Monday:

```
/weekly
```

Claude runs 3 phases:
1. **Collect** — Reads all dailies from the past week, aggregates shipped/WIP/blocked
2. **Reflect** — Checks OKR progress, finds patterns, calculates metrics
3. **Plan** — Helps set next sprint goals, identifies ONE Big Thing

Output: `reports/2026-01-15-sprint-retro.md`

## Architecture Decisions (for Engineering Leads)

```
/adr xmarket: chose event sourcing over CRUD for order processing
```

Claude prompts for:
- Context and decision drivers
- Options considered (with pros/cons)
- Consequences and risks

Output: `adrs/2026-01-15-event-sourcing-orders.md`

## Vault Health

```
/health
```

Scans vault for:
- Broken wiki-links
- Orphan notes (no inbound links)
- Missing `## Links` sections
- Statistics by type and project

Output: `index/_graph-health.md`

## Cross-Project Status

```
/progress all
/progress xmarket --since 2026-01-01
```

Synthesizes shipped items, blockers, decisions, and OKR alignment across projects.

## Inbox Processing

Capture fast, process later:

```
# Throughout the day
/inbox need to review competitor pricing
/inbox idea: use webhooks for real-time updates
/inbox meeting with legal team about compliance

# End of day — batch process
/inbox
```

Claude classifies each item and routes to the correct folder.

## Multi-Project Daily Example

A typical `daily/2026-01-15.md`:

```markdown
---
type: daily
status: active
date: 2026-01-15
tags: []
---

# 2026-01-15

## xMarket

### Shipped
- Auth flow complete and deployed
- Login page redesign merged

### In Progress
- Notification system (60%)
- Payment integration planning

### Blocked
- [[blockers/xmarket/2026-01-15-api-rate-limit|API rate limit from provider]]

### Notes
Meeting with legal at 2pm about compliance requirements.

---

## PlayStat

### Shipped
- Dashboard v2 deployed

### In Progress
- Analytics pipeline

### Blocked
*None*

---

## Tomorrow
- Follow up on legal meeting outcomes
- Start payment integration spec
```
