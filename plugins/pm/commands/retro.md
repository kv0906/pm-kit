---
description: Transform meeting notes into structured retrospective
allowed-tools: Write
argument-hint: <meeting notes or feedback>
---

# Retrospective

Generate retro from: **$ARGUMENTS**

## Agent

Use the **Retro Facilitator Agent** (`@agents/retro-facilitator.md`) to execute this task.

Includes: WWW, WDGW, themes, action items with owners

## Output

Save to: `./docs/retro-[topic]-[date].md`

## Next Steps

| Command | When to Use |
|---------|-------------|
| `/today` | Act on action items |
| `/consensus` | Align on changes |
| `/prioritize` | Rank action items |
| `/decompose` | Analyze complex issues |
