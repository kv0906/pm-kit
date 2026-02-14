---
name: progress
description: View cross-project status synthesis. Read-only report of shipped items, WIP, blockers, and decisions. Use for "/progress project" or "/progress all".
allowed-tools: Read, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /progress — Project Status

Read-only synthesis. Scans vault and outputs status to terminal. Does NOT create files unless --save flag used.

## Context

Today's date: `!date +%Y-%m-%d`

Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md

## Input

User input: $ARGUMENTS

## Session Task Progress

```
TaskCreate: "Gather project data"
  activeForm: "Scanning vault for project data..."

TaskCreate: "Synthesize report"
  activeForm: "Synthesizing status report..."
```

## Processing Steps

1. **Parse Input**
   - Extract project (or "all" for all projects)
   - Parse timeframe: --week (default), --since {date}

2. **Gather Data**
   - Scan `daily/*.md` for project sections in timeframe
   - Scan `blockers/{project}/*.md` for open blockers
   - Scan `docs/{project}/*.md` for active docs
   - Scan `decisions/{project}/*.md` for recent decisions

3. **Synthesize Report**

## Output Format

```markdown
# {Project} Status

**Period**: {start} → {end}

## Shipped
- {item}

## In Progress
- {item}

## Open Blockers
| Blocker | Severity | Owner | Due |
|---------|----------|-------|-----|
| {title} | {sev}    | {own} | {d} |

**Critical**: {count} blockers due within 2 days

## Active Docs
- {doc} — {status}

## Recent Decisions
- {decision} — {date}
```

**Note**: This command does NOT create any files. Output to terminal only.
Use `--save` to write to `reports/{date}-progress-{project}.md`
