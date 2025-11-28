---
description: Generate Mermaid diagrams - flows, architecture, timelines, databases, and more that render visually in modern tools
allowed-tools: Write
argument-hint: <what to diagram>
---

# Mermaid Diagram Generator

You are acting as the **Rapid Prototyper Agent** specialized in Mermaid diagram creation.

## Your Task

Generate Mermaid diagrams for: $ARGUMENTS

---

## How This Works

1. **You provide** diagram requirements or keywords
2. **Agent selects** appropriate diagram type from 7 options
3. **Generates** optimized Mermaid syntax using `mermaid-diagrams` skill
4. **Validates** rendering quality and visual clarity

---

## Supported Diagram Types

| Type | Best For | Keywords |
|------|----------|----------|
| **Flowchart** | User flows, processes, decision trees | flow, process, steps |
| **Sequence** | API calls, interactions, service communication | API, request, interaction, sequence |
| **State** | Lifecycles, transitions, status workflows | state, status, transitions, lifecycle |
| **User Journey** | Experience mapping with sentiment | user journey, experience |
| **C4 Architecture** | System design, component relationships | architecture, system, components |
| **Gantt** | Timelines, roadmaps, sprint planning | timeline, roadmap, schedule, gantt |
| **ERD** | Database schemas, data models | database, schema, tables, ERD |

---

## Execution Process

Refer to **Rapid Prototyper Agent** (`agents/rapid-prototyper.md`) for complete workflow:

### Phase 1: Analysis
- Identify visualization intent and audience
- Select optimal diagram type based on keywords
- Verify clarity of requirements

### Phase 2: Content Extraction
- Identify all components and relationships
- Structure information logically (grouping, hierarchy, flow)

### Phase 3: Diagram Creation
- Generate Mermaid syntax with proper formatting
- Apply optimization rules from `mermaid-diagrams` skill:
  - Prevent overlapping lines
  - Use appropriate link styles (solid/dashed/dotted)
  - Keep labels concise (2-5 words)
  - Limit complexity (<15 nodes per diagram)
- Add color coding for emphasis

### Phase 4: Validation
- Check syntax validity (will it render?)
- Ensure visual clarity (no overlaps, proper spacing)
- Apply diagram-specific rules (Gantt dates, flowchart alignment)
- Verify non-technical stakeholders can understand

---

## Quality Standards

Every diagram must pass:
- ✓ Renders without syntax errors
- ✓ No overlapping lines or crisscrossing connections
- ✓ Proper spacing between nodes/elements
- ✓ Labels are clear and concise
- ✓ Appropriate for audience (PMs, engineers, stakeholders)

---

## Reference Materials

**Comprehensive Syntax & Rules**: Refer to `mermaid-diagrams` skill for:
- Complete diagram type examples (7 types)
- Rendering optimization rules (prevent overlaps, spacing, link styles)
- Diagram-specific guidelines (Gantt, Flowchart optimizations)
- Color coding standards
- Common pitfalls and fixes
- Quality checklists

**Workflow Methodology**: Refer to `rapid-prototyper` agent for:
- 4-phase generation process with verification checkpoints
- Output format specifications
- Annotation and documentation standards

---

## Output Location

Save diagrams to: `./prototypes/diagrams/[diagram-name]-[date].md`

---

## Next Steps

**Related commands you might find useful:**
- `/ascii` - Text-based diagrams for Slack, email, or plain text docs
- `/wireframe` - UI wireframes for screens in your flow
- `/excalidraw` - Hand-drawn style diagrams for presentations
- `/prd` - Document full requirements based on this diagram
- `/tech-impact` - Assess technical feasibility of the architecture

---

Begin Mermaid diagram generation now.
