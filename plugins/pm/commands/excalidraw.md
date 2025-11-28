---
description: Generate hand-drawn style diagrams in Excalidraw JSON format
allowed-tools: Write
argument-hint: <what to visualize>
---

# Excalidraw Diagram Generator

Create Excalidraw diagram for: **$ARGUMENTS**

## Agent

Use the **Rapid Prototyper Agent** (`@agents/rapid-prototyper.md`) with `excalidraw-skill`.

Types: Flowchart | Mind Map | Architecture | Timeline | Wireframe

## Output

Save to: `./prototypes/excalidraw/[diagram-name]-[date].excalidraw`

Import at: [excalidraw.com](https://excalidraw.com) or Obsidian/VS Code

## Next Steps

| Command | When to Use |
|---------|-------------|
| `/ascii` | Text-based version |
| `/mermaid` | Technical diagrams |
| `/wireframe` | UI screen mockups |
