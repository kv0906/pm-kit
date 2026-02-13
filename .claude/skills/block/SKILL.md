---
name: block
description: Flag a blocker with severity, owner, and due date. Checks for duplicates before creating. Use for "/block project: description --severity high --due friday".
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /block — Flag Blocker

Create or update blocker notes with severity, owner, and due date.

## Context

Today's date: `!date +%Y-%m-%d`
Existing blockers: `!ls blockers/*/*.md 2>/dev/null | tail -10`

Reference template: @_templates/blocker.md
Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md

## Input

User input: $ARGUMENTS

## Processing Steps

1. **Parse Input**
   - Extract project (before colon)
   - Extract description
   - Parse flags: --severity, --owner, --due
   - Default severity: medium

2. **Severity Mapping**
   - critical/urgent/p0/p1 → high
   - medium/normal/p2 → medium
   - low/minor/p3 → low

3. **Duplicate Check**
   - Search `blockers/{project}/*.md` for similar open blockers
   - If similar found: Prompt user to update existing or create new

4. **Create Blocker Note**
   - Filename: `blockers/{project}/{date}-{slug}.md`
   - Apply template with extracted data
   - Add `## Links` section

5. **Update References**
   - Add to project index if exists
   - If critical (high severity + due < 2 days): Flag for escalation

## Output

```
Created: blockers/{project}/{date}-{slug}.md
Severity: {severity} | Owner: {owner} | Due: {due}
```
