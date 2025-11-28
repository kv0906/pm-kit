---
description: Generate daily work suggestions based on priorities
allowed-tools: Write
argument-hint: "[optional: context about current work]"
---

# Daily Planning

Plan today's work: **$ARGUMENTS**

## Agent

Use the **Daily Planner Agent** (`@agents/daily-planner.md`) to execute this task.

Includes: Top priorities, quick wins, blockers, energy mapping

## Output

Save to: `./docs/today-[date].md`

## Next Steps

| Command | When to Use |
|---------|-------------|
| `/decompose` | Break down top task |
| `/decide` | Resolve blockers |
| `/prioritize` | Too many competing items |
| `/retro` | End of day reflection |
