---
name: weekly
description: Weekly review — 3-phase process (Collect/Reflect/Plan). Reviews shipped items, blockers, decisions, and plans next week. Use on Fridays or Mondays.
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /weekly — Weekly Review

Facilitates your weekly review by collecting the past week's data, reflecting on progress, and planning the next week.

## Context

Today's date: `!date +%Y-%m-%d`

Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md

Reference template: @_templates/sprint-retro.md

## Session Task Progress

Create tasks at skill start with dependencies:

```
TaskCreate: "Phase 1: Collect"
  description: "Gather daily notes, shipped items, blockers from past week"
  activeForm: "Collecting weekly data..."

TaskCreate: "Phase 2: Reflect"
  description: "Analyze patterns, what worked/didn't"
  activeForm: "Reflecting on weekly performance..."

TaskCreate: "Phase 3: Plan"
  description: "Set next week priorities, identify top risks"
  activeForm: "Planning next week..."
```

Set dependencies:
```
TaskUpdate: "Phase 2", addBlockedBy: [phase-1-id]
TaskUpdate: "Phase 3", addBlockedBy: [phase-2-id]
```

## Phase 1: Collect (10 minutes)

1. Read all daily notes from the past 7 days
2. For each active project, aggregate:
   - Shipped items
   - Items carried over (WIP)
   - Blockers resolved
   - Blockers still open
3. Read recent decisions
4. Identify patterns in standup data

## Phase 2: Reflect (10 minutes)

1. Identify what went well / didn't go well
2. Surface recurring patterns (e.g., same blocker type)
3. Check: which shipped items had the most impact?
4. Check: which blockers slowed progress most?
5. Note any decisions that need revisiting

## Phase 3: Plan (10 minutes)

1. Set top 3 priorities for next week with owner + due
2. Identify decisions that need to be made
3. Anticipate blockers (risk watchlist)
4. Note any carry-over items

## Output

Create weekly review note using template:
- Filename: `reports/{date}-sprint-retro.md`

## Integration

Works with:
- `/daily` - Reviews daily notes from the week
- `/push` - Commit after completing review
- `/onboard` - Load context for informed review
- `/progress` - Detailed project status during review
