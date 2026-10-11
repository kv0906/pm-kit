---
name: journey
description: "Maps a user journey with steps, touchpoints, friction, evidence, and opportunities. Use for /journey, user journey maps, or visualizing an end-to-end user experience."
---

# /journey — User Journey Map

Expose where a user struggles to make progress, with sources and visible gaps.

## Input and Context

`/journey [project, actor, and scenario]`

Read `_core/knowledge.md` and `_core/judgment.md`; use relevant research, feedback, and product context.
Define one actor or segment, their job, the trigger, and the end condition. Use `/discover` if these are unclear.
Choose current-state or proposed future-state; never present the proposed experience as an observation.
Map only the stages needed for the question. Separate materially different actors or paths rather than inventing an average persona.

## Build the Map

Use a compact table with stage, user action/goal, touchpoint, friction, evidence, and opportunity.
Include emotions only when observed or reported; otherwise label them as inferred or unknown.
Mark each unsupported step as a hypothesis. Cite source notes or research beside observed claims.
Show relevant branches, abandonment, failure, recovery, and human or offline handoffs.
Do not assume the journey begins at signup or ends at purchase if the user's job extends beyond those boundaries.

Add a small plain-text flow when sequence or branching is important; follow `/show-me` for the host's diagram format.
Use Mermaid only when requested and Excalidraw only for an explicitly requested editable file.
Keep visual structure and table consistent; avoid decoration that hides uncertainty.

## Output and Next Step

Return the scope, map, most consequential evidenced friction, and unanswered questions.
Keep proposed opportunities separate from confirmed needs. Use `/prioritize` only when choosing between competing interventions.
Suggest the smallest research or validation step for an important gap; do not invent metrics to rank pain points.
Keep output in chat unless asked to save it. For a saved map, use `/doc` conventions and retain evidence links.
Do not create a UI prototype, roadmap, or external tickets unless requested.
