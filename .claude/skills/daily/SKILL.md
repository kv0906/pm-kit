---
name: daily
description: Log standup update with keyword detection. Multi-project daily notes with auto-blocker/decision detection. Use for "/daily project: shipped X, wip Y, blocked on Z".
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /daily — Daily Standup Capture

You are processing a daily standup update. This is an ATOMIC operation: capture → create note → done.

## Context

Today's date: `!date +%Y-%m-%d`
Check existing daily: `!ls daily/*.md 2>/dev/null | tail -5`

Reference template: @_templates/daily.md
Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md

## Input

User input: $ARGUMENTS

## Session Task Progress

Create tasks upfront for visibility:

```
TaskCreate: "Parse standup input"
  activeForm: "Parsing standup input..."

TaskCreate: "Create/update daily note"
  activeForm: "Updating daily note..."

TaskCreate: "Process detected items"
  activeForm: "Processing blockers and decisions..."
```

## Processing Steps

1. **Parse Input**
   - Extract project name (before colon or first word)
   - If project not provided or invalid, ask user to specify from config.yaml projects
   - Segment content by keywords:
     - **Shipped**: shipped, done, completed, finished, merged, deployed, released
     - **WIP**: wip, working on, in progress, continuing, started, ongoing
     - **Blocked**: blocked, stuck, waiting on, waiting for, need from, dependency
     - **Decided**: decided, going with, chose, selected, agreed

2. **Check Existing**
   - If daily note for today exists, update the project's section
   - If not, create new daily with project sections

3. **Handle Blockers (AUTO-PROMPT)**
   - For each blocked item detected:
     - Search `blockers/{project}/*.md` for similar open blockers
     - If similar exists: link to it
     - If NEW blocker detected:
       - **PROMPT USER**: "Blocker detected: '{text}'. Create blocker note? (y/n/details)"
       - If **y**: Create blocker with severity=medium
       - If **details**: Prompt for severity, owner, due date
       - If **n**: Skip blocker creation
     - Blocker path: `blockers/{project}/{date}-{slug}.md`

4. **Handle Decisions (AUTO-DETECT)**
   - For each decision keyword detected:
     - Suggest creating a decision note
     - Link to daily if user confirms

5. **Create/Update Daily Note**
   - Filename: `daily/{date}.md` — ONE file per day for ALL projects
   - If file exists: Update the `## {project}` section only
   - If new: Create from template

6. **Update Project Index**
   - Add entry to `index/{project}.md` if index exists

## Output

```
Updated: daily/{date}.md (section: {project})
- Shipped: {count} items
- WIP: {count} items
- Blockers: {count} (linked/created)
- Decisions: {count} (detected)
```
