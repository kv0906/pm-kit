---
description: Generate a comprehensive Product Requirements Document
allowed-tools: Write
argument-hint: <feature or product to document>
---

# PRD Generation

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
