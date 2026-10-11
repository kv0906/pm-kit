---
name: weekly
description: Weekly review — 3-phase process (Collect/Reflect/Plan). Reviews shipped items, blockers, decisions, and plans next week. Use on Fridays or Mondays.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /weekly — Weekly Review

Facilitates your weekly review by collecting the past week's data, reflecting on progress, and planning the next week.

## Context

Today's date: `!date +%Y-%m-%d`

Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md
Product judgment: @_core/judgment.md
Knowledge and evidence: @_core/knowledge.md

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

## Phase 1: Collect

1. Read all daily notes from the past 7 days
2. For each active project, aggregate:
   - Shipped items
   - Items carried over (WIP)
   - Blockers resolved
   - Blockers still open
3. Read recent decisions and relevant linked product docs, customer feedback, and metric observations
4. Load relevant approved judgment examples and personal preferences; keep proposed lessons separate
5. Separate delivered work, learning, and measured outcomes; cite original sources, dates, and scope
6. Identify patterns in standup data without treating repeated mentions of one source as independent evidence

## Phase 2: Reflect

1. Identify what went well / didn't go well
2. Surface recurring patterns (e.g., same blocker type)
3. Compare expected outcomes with observed results; include metric definition, period, segment, baseline, and source when available
4. Check: which blockers slowed progress most?
5. Mark missing outcome data as unmeasured; distinguish correlation from causal evidence and surface conflicting signals
6. Note decisions or assumptions that need revisiting and the evidence behind each proposed change
7. Propose scoped lessons with sources and exceptions; do not silently update personal judgment rules

## Phase 3: Plan

1. Propose up to 3 priorities with rationale, owner, and due date; mark missing ownership or dates as unknown
2. Use `/prioritize` only when competing work requires a structured comparison; avoid scoring a simple next step
3. Identify decisions that need to be made and evidence needed to resolve them
4. Anticipate blockers (risk watchlist) and note carry-over items
5. Identify the next outcome check or discovery step. Ask approval before changing shared priorities, publishing, or updating personal rules

## Output

Create weekly review note using template:
- Filename: `reports/{date}-sprint-retro.md`
- Keep the template's `type: retro` and `status: active`; the note status does not approve its proposed priorities
- Include separate Delivered, Learning, and Outcomes sections; use "No new evidence" or "Unmeasured" rather than invented conclusions
- Reuse an existing review for the same date when appropriate; preserve human edits

## Export (Optional)

Supports `--xlsx`, `--pdf`, `--pptx` flags. See `.claude/rules/export-formats.md` for layout specs and workflow. Complete normal processing first, then generate the formatted file.

## Integration

Works with:
- `/daily` - Reviews daily notes from the week
- `/push` - Commit after completing review
- `/onboard` - Load context for informed review
- `/progress` - Detailed project status during review
