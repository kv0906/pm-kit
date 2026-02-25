---
name: meet
description: Process meeting notes into structured notes with extracted decisions, blockers, and action items. Use for "/meet project type title" then paste notes.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /meet — Meeting Processing

Process raw meeting notes into structured notes with extracted decisions, blockers, and action items.

## Context

Today's date: `!date +%Y-%m-%d`
Recent meetings: `!ls meetings/*.md 2>/dev/null | tail -5`

Reference template: @_templates/meeting.md
Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md

## Input

User input: $ARGUMENTS

Then user will paste raw notes.

## Session Task Progress

```
TaskCreate: "Parse meeting metadata"
  activeForm: "Parsing meeting metadata..."

TaskCreate: "Extract decisions, blockers, actions"
  activeForm: "Extracting items from notes..."

TaskCreate: "Create linked notes"
  activeForm: "Creating linked notes..."
```

## Processing Steps

1. **Parse Input**
   - Extract project
   - Extract type: sync, milestone, external
   - Generate slug from title

2. **Request Notes**
   - If notes not provided, prompt: "Paste your meeting notes:"

3. **Extract from Notes**
   - **Decisions**: Look for "decided", "agreed", "going with"
   - **Blockers**: Look for "blocked", "stuck", "waiting on"
   - **Action Items**: Look for "will do", "action:", "TODO", "@name"
   - **Attendees**: Look for @mentions or name lists

4. **Create Meeting Note**
   - Filename: `meetings/{date}-{type}-{slug}.md`
   - Apply template with extracted data
   - Add `## Links` section

5. **Create Linked Notes**
   - For each decision: Create `decisions/{project}/{date}-{slug}.md`
   - For each blocker: Create `blockers/{project}/{date}-{slug}.md`
   - Link back to meeting note

6. **Update References**
   - Add to project index if exists

## Output

```
Created: meetings/{date}-{type}-{slug}.md
Extracted:
- Decisions: {count} (notes created)
- Blockers: {count} (notes created)
- Action items: {count}
```

## Export (Optional)

Supports `--docx`, `--pdf` flags. See `.claude/rules/export-formats.md` for layout specs and workflow. Complete normal processing first, then generate the formatted file.
