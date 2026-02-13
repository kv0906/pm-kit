---
name: okr-tracking
description: OKR progress calculation, roadmap alignment, and quarterly tracking. Auto-invoked during /weekly and /progress. Reads objectives.md and key-results.md.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# OKR Tracking Skill

Calculates OKR progress, checks alignment between daily work and objectives, and maintains the roadmap.

## Data Sources

- `roadmap/objectives.md` — Current quarter's OKRs
- `roadmap/key-results.md` — Weekly progress snapshots
- `daily/*.md` — Daily standups (shipped items map to key results)
- `reports/*-sprint-retro.md` — Sprint retro data

## OKR Structure

```
Objective (qualitative goal)
├── Key Result 1 (measurable outcome, 0-100%)
├── Key Result 2
└── Key Result 3

Objective progress = average of key result percentages
```

## Calculations

### Key Result Progress
- Read current percentages from `roadmap/objectives.md`
- Compare against targets
- Calculate delta from last week (via `roadmap/key-results.md`)

### Objective Progress
- Average of all key results under that objective
- Color coding: 0-30% (behind), 30-70% (on track), 70-100% (ahead)

### Alignment Check
- Scan past 7 days of dailies for shipped items
- Map shipped items to key results (by keyword/project)
- Identify key results with no activity (stalled)
- Flag objectives at risk

## When Auto-Invoked

### During `/weekly`
- Calculate all OKR progress
- Generate delta from previous week
- Identify stalled key results
- Suggest focus areas for next sprint

### During `/progress`
- Show relevant OKR context for project
- Map project activity to key results

## Update Flow

1. Read current `roadmap/objectives.md`
2. Calculate new percentages based on evidence
3. Update progress columns in objectives table
4. Append weekly snapshot to `roadmap/key-results.md`

## Output Format (when summarizing)

```markdown
## OKR Status — Q{quarter}

| Objective | Progress | Trend | Status |
|-----------|----------|-------|--------|
| {obj1} | {pct}% | {up/down/flat} | {on-track/at-risk/behind} |

### Stalled Key Results
- {kr}: No activity in {n} days

### Recommended Focus
- {suggestion based on lagging KRs}
```
