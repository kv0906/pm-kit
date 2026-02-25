---
name: doc
description: Draft or edit a document — PRD, spec, design doc, technical brief. Use for "/doc project title" to create a new doc or edit existing.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /doc — Document Drafting

Create or edit documents (specs, PRDs, design docs, etc.).

## Context

Today's date: `!date +%Y-%m-%d`
Existing docs: `!ls docs/*/*.md 2>/dev/null | tail -10`

Reference template: @_templates/doc.md
Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md

## Input

User input: $ARGUMENTS

## Processing Steps

1. **Parse Input**
   - Extract project
   - Extract title/feature name

2. **Check Existing**
   - Search `docs/{project}/*.md` for similar titles (or `docs/general/*.md` if no project)
   - If found: Offer to edit or create new

3. **Gather Context**
   - Search for related decisions/blockers

4. **Interactive Drafting**
   - Prompt for each major section:
     - Problem statement
     - Goals / Non-goals
     - Requirements (P0/P1/P2)
     - Technical approach
   - Or accept full content at once

5. **Create Doc Note**
   - If no project specified: write to `docs/general/{slug}.md`
   - If project specified: write to `docs/{project}/{slug}.md`
   - Apply template with gathered data
   - Status: draft
   - Add `## Links` section

6. **Update References**
   - Add to project index if exists

## Output

```
Created: docs/{project}/{slug}.md
Status: draft
Sections: {filled}/{total}
```

## Export (Optional)

Supports `--docx`, `--pdf` flags. See `.claude/rules/export-formats.md` for layout specs and workflow. Complete normal processing first, then generate the formatted file.
