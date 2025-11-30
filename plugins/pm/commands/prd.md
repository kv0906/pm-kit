---
description: Generate comprehensive Product Requirements Documents
argument-hint: <feature or product name>
---

# PRD Generation

Generate a comprehensive Product Requirements Document.

Create a PRD for: **$ARGUMENTS**

## Agent

Use the **PRD Writer Agent** (`@agents/prd-writer.md`) to execute this task.

## Output

Save to: `./prds/active/[feature-name]-[date].md`

## Next Steps

| Command | When to Use |
|---------|-------------|
| `/prioritize` | Score features by RICE/ICE/Kano |
| `/design-spec` | Prepare specs for design team |
| `/tech-impact` | Validate engineering effort |
| `/consensus` | Build stakeholder alignment |
