---
description: Create visual diagrams using Mermaid syntax
argument-hint: <diagram type and subject>
---

# Mermaid Diagram Generator

Generate Mermaid diagrams (flows, architecture, timelines, ERD).

Create Mermaid diagram for: **$ARGUMENTS**

## Agent

Use the **Rapid Prototyper Agent** (`@agents/rapid-prototyper.md`) with `mermaid-diagrams` skill.

Types: Flowchart | Sequence | State | User Journey | C4 Architecture | Gantt | ERD

## Output

Save to: `./prototypes/diagrams/[diagram-name]-[date].md`

## Next Steps

| Command | When to Use |
|---------|-------------|
| `/ascii` | Text-based diagrams for Slack/email |
| `/wireframe` | UI wireframes for screens |
| `/excalidraw` | Hand-drawn style diagrams |
| `/prd` | Document requirements |
