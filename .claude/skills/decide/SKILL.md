---
name: decide
description: Log a decision with context, alternatives considered, and rationale. Use for "/decide project: using websocket over polling" or "/decide project: chose React for frontend".
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /decide — Decision Logging

Record decisions with context and alternatives.

## Context

Today's date: `!date +%Y-%m-%d`
Recent decisions: `!ls decisions/*/*.md 2>/dev/null | tail -10`

Reference template: @_templates/decision.md
Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md

## Input

User input: $ARGUMENTS

## Processing Steps

1. **Parse Input**
   - Extract project (before colon)
   - Extract decision statement
   - Look for alternatives: "over", "instead of", "vs", "considered"
   - Extract context if provided

2. **Create Decision Note**
   - Filename: `decisions/{project}/{date}-{slug}.md`
   - Apply template with:
     - Decision statement
     - Alternatives considered
     - Context/rationale
   - Add `## Links` section

3. **Auto-Link**
   - Search for related docs in `docs/{project}/`
   - Add backlinks to relevant docs

4. **Update References**
   - Add to project index if exists

## Output

```
Created: decisions/{project}/{date}-{slug}.md
Decision: {decision}
Alternatives: {count} considered
```
