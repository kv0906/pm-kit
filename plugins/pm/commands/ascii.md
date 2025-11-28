---
description: Generate ASCII diagrams for universal text compatibility
allowed-tools: Write
argument-hint: <what to diagram>
---

# ASCII Diagram Generator

Create ASCII diagram for: **$ARGUMENTS**

## Agent

Use the **Rapid Prototyper Agent** (`@agents/rapid-prototyper.md`) with `ascii-diagrams` skill.

Types: User Flow | Architecture | Decision Tree | State Machine | Sequence | Comparison Table | Timeline

## Output

Save to: `./prototypes/diagrams/[diagram-name]-[date].txt`

## Next Steps

| Command | When to Use |
|---------|-------------|
| `/mermaid` | Visual diagrams for GitHub/Notion |
| `/wireframe` | UI screen mockups |
| `/excalidraw` | Hand-drawn style |
