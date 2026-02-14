---
name: inbox
description: Quick capture mode (with content) or batch processing mode (no content). GTD-style routing of inbox items to proper folders. Use "/inbox thought to capture" or "/inbox" to process.
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /inbox — Quick Capture & Process

Dual-mode command for fast capture and later processing.

## Context

Today's date: `!date +%Y-%m-%d`
Inbox contents: `!ls inbox/*.md 2>/dev/null`

Reference template: @_templates/inbox.md
Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md

## Input

User input: $ARGUMENTS

## Mode Detection

- **Capture mode**: If $ARGUMENTS has content
- **Process mode**: If $ARGUMENTS is empty

---

## Capture Mode (with content)

1. **Auto-detect**
   - Project: Look for project names from config
   - Type: daily, decision, blocker, meeting, doc

2. **Create Inbox Note**
   - Filename: `inbox/{date}-{slug}.md`
   - Tag with detected project/type
   - Status: unprocessed

3. **Output**
   ```
   Captured to: inbox/{filename}
   Detected: {project} / {type}
   Process later with: /inbox
   ```

---

## Process Mode (no content)

Use session tasks for batch visibility:

```
TaskCreate: "Scan and classify inbox items"
  activeForm: "Scanning inbox..."

TaskCreate: "Route items to destinations"
  activeForm: "Routing inbox items..."
```

1. **Scan Inbox**
   - List all `.md` files in `inbox/`
   - Read and classify each

2. **Present Plan**
   ```
   ## Processing Plan

   | # | Content Preview | Type | Project | Action |
   |---|-----------------|------|---------|--------|
   | 1 | "Shipped login..." | daily | project-a | Update daily |
   | 2 | "Blocked on API..." | blocker | project-a | Create blocker |

   Proceed? (y/n/edit)
   ```

3. **Route Items**
   - For each confirmed item:
     - Route to appropriate handler (/daily, /block, /decide, etc.)
   - Mark processed inbox files

4. **Output**
   ```
   Processed: {count} items
   - Daily updates: {count}
   - Blockers: {count}
   - Decisions: {count}
   ```
