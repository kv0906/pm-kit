---
name: show-me
description: "Explains a topic visually with a focused diagram, decision tree, or sketch. Use for /show-me or when the user asks to see or visualize an explanation."
---

# /show-me — Visual Understanding

Show the smallest visual that answers the user's question. Adapted from the personal `show-me` skill.

## Input

`/show-me [topic or current discussion]`

Read referenced material first. Apply `_core/knowledge.md`; do not invent relationships, states, or measured values.

## Choose the Form

- Relationships or ownership: a component tree or box diagram.
- Sequence or handoffs: a flow with actors, conditions, and returns.
- Decisions: a decision tree or pseudocode with explicit branches.
- Before and after: matched views that expose the meaningful change.
- Product behavior: a user flow with entry, success, failure, and recovery states.

Use the host's supported plain-text diagram format by default. Use square-corner boxes and readable labels.
Use Mermaid only when explicitly requested; follow `.claude/skills/mermaid-visualizer/SKILL.md`.
For an explicitly requested editable Excalidraw file, follow `.claude/skills/excalidraw/SKILL.md`.
Do not make HTML, a presentation, or a new UI merely to explain a small flow.

## Output Checks

Answer one visual question at a time. Label conditions and approval boundaries when they affect the flow.
Mark hypothetical flows as proposed; distinguish them from verified behavior.
Place a short explanation and source references beside the visual. Do not repeat every arrow in prose.
Check that the diagram and explanation agree and no important failure path is hidden.
Keep output in chat unless the user asks to save it; use `/doc` conventions when saving a note.
