---
name: weekly
description: Sprint retro and weekly review — 3-phase process (Collect/Reflect/Plan). Reviews shipped items, blockers, OKR progress, and plans next sprint. Use on Fridays or Mondays.
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /weekly — Sprint Retro & Weekly Review

Facilitates your sprint retro / weekly review by collecting the past week's data, reflecting on OKR progress, and planning the next sprint.

## Context

Today's date: `!date +%Y-%m-%d`

Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md
OKRs: @roadmap/objectives.md

Reference template: @_templates/sprint-retro.md

## Session Task Progress

Create tasks at skill start with dependencies:

```
TaskCreate: "Phase 1: Collect"
  description: "Gather daily notes, shipped items, blockers from past week"
  activeForm: "Collecting sprint data..."

TaskCreate: "Phase 2: Reflect"
  description: "Analyze OKR progress, patterns, what worked/didn't"
  activeForm: "Reflecting on sprint performance..."

TaskCreate: "Phase 3: Plan"
  description: "Set next sprint goals, identify ONE Big Thing"
  activeForm: "Planning next sprint..."
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
3. Read recent decisions and ADRs
4. Identify patterns in standup data

## Phase 2: Reflect (10 minutes)

1. Read `roadmap/objectives.md` for current OKRs
2. Calculate progress delta for each key result
3. Check OKR-action alignment:
   - Which shipped items advanced which key results?
   - Which key results had no activity?
4. Identify what went well / didn't go well
5. Surface recurring patterns (e.g., same blocker type)

## Phase 3: Plan (10 minutes)

1. Identify the ONE Big Thing for next sprint
2. Set sprint goals aligned to lagging key results
3. Identify decisions that need to be made
4. Anticipate blockers
5. Update OKR progress in `roadmap/objectives.md`
6. Add weekly entry to `roadmap/key-results.md`

## Output

Create sprint retro note using template:
- Filename: `reports/{date}-sprint-retro.md`

## Integration

Works with:
- `/daily` - Reviews daily notes from the week
- `/push` - Commit after completing review
- `/onboard` - Load context for informed review
- `/progress` - Detailed project status during review
