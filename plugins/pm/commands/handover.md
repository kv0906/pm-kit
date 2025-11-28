---
description: Generate vacation or transition handover documentation
allowed-tools: Write
argument-hint: <transition context or notes>
---

# Handover Documentation

Create handover for: **$ARGUMENTS**

## Agent

Use the **Handover Generator Agent** (`@agents/handover-generator.md`) to execute this task.

Includes: Active projects, pending decisions, stakeholder contacts, escalation paths, risks

## Output

Save to: `./docs/handover-[name]-[date].md`

## Next Steps

| Command | When to Use |
|---------|-------------|
| `/consensus` | Align backup on priorities |
| `/prd` | Document project further |
| `/decide` | Structure pending decisions |
| `/today` | Help backup plan daily work |
