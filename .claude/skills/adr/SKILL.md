---
name: adr
description: Create Architecture Decision Record with context, options, decision, and consequences. For engineering leads tracking technical decisions. Use for "/adr project: chose PostgreSQL over MongoDB".
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /adr — Architecture Decision Record

Create structured ADRs for tracking technical decisions with full context, alternatives, and consequences.

## Context

Today's date: `!date +%Y-%m-%d`
Existing ADRs: `!ls adrs/*.md 2>/dev/null | tail -10`

Reference template: @_templates/adr.md
Config: @_core/config.yaml

## Input

User input: $ARGUMENTS

## Session Task Progress

```
TaskCreate: "Parse ADR context"
  activeForm: "Parsing ADR context..."

TaskCreate: "Create ADR document"
  activeForm: "Creating ADR document..."
```

## Processing Steps

1. **Parse Input**
   - Extract project (before colon, optional — ADRs can be cross-project)
   - Extract decision title
   - Look for alternatives: "over", "vs", "instead of", "considered"
   - Look for context/drivers

2. **Number Assignment**
   - Scan existing ADRs in `adrs/`
   - Assign next sequential number: `ADR-{NNN}`

3. **Interactive Drafting**
   - If minimal input, prompt for:
     - Context: What is the issue we're deciding?
     - Decision drivers: What forces are at play?
     - Options considered (at least 2): name, description, pros, cons
     - Decision: Which option and why?
     - Consequences: positive, negative, risks
   - If detailed input provided, extract and structure

4. **Create ADR Note**
   - Filename: `adrs/{date}-{slug}.md`
   - Apply template with gathered data
   - Status: proposed (→ accepted → deprecated → superseded)
   - Add `## Links` section with related decisions and docs

5. **Cross-Reference**
   - Search for related decisions in `decisions/`
   - Search for related docs in `docs/`
   - Link to relevant project index

## ADR Status Lifecycle

| Status | Meaning |
|--------|---------|
| proposed | Under discussion |
| accepted | Agreed and in effect |
| deprecated | No longer relevant |
| superseded | Replaced by newer ADR |

## Output

```
Created: adrs/{date}-{slug}.md
ADR-{NNN}: {title}
Status: proposed
Options: {count} considered
```
