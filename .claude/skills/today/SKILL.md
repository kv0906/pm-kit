---
name: today
description: Guided daily workflow orchestrator. Multi-phase process (standup, team sync, review, focus, wrap-up). Use when user says "today", "start my day", or "daily workflow".
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /today — Daily Workflow Orchestrator

Guides PMs through a structured daily routine: standup → team sync → review → focus → wrap-up. Reuses existing skill logic (`/daily`, `/meet`, `/progress`) — does NOT duplicate it.

## Context

Today's date: `!date +%Y-%m-%d`
Existing daily: `!ls daily/*.md 2>/dev/null | tail -5`

Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md
Daily template: @_templates/daily.md

Reference skills (for reuse patterns):
- @.claude/skills/daily/SKILL.md — keyword detection, blocker/decision logic
- @.claude/skills/meet/SKILL.md — meeting note parsing
- @.claude/skills/progress/SKILL.md — dashboard aggregation

## Input

User input: $ARGUMENTS

### Argument Handling

- **No args**: Start from Phase 1, or resume current phase (detect via TaskList)
- **`status`**: Show which phase is currently active
- **`skip`**: Skip current phase, advance to next
- **`wrap`**: Jump directly to Phase 5 (wrap-up)

## Session Task Progress

Create all phase tasks upfront with dependencies:

```
TaskCreate: "Phase 1: Daily Standup"
  description: "Capture updates for all active projects"
  activeForm: "Running daily standup..."

TaskCreate: "Phase 2: Team Sync"
  description: "Process external context (Slack, meetings, Linear)"
  activeForm: "Processing team sync..."

TaskCreate: "Phase 3: Review"
  description: "Display cross-project health dashboard"
  activeForm: "Generating review dashboard..."

TaskCreate: "Phase 4: Focus"
  description: "Display priorities and pause for deep work"
  activeForm: "Setting focus priorities..."

TaskCreate: "Phase 5: Wrap-Up"
  description: "Summarize the day"
  activeForm: "Wrapping up the day..."
```

Set dependencies:
```
TaskUpdate: Phase 2, addBlockedBy: [phase-1-id]
TaskUpdate: Phase 3, addBlockedBy: [phase-2-id]
TaskUpdate: Phase 4, addBlockedBy: [phase-3-id]
TaskUpdate: Phase 5, addBlockedBy: [phase-4-id]
```

## Resume Logic (Same Session Only)

Before creating tasks, check `TaskList` for existing `/today` phase tasks:

- If tasks exist with `in_progress` status → resume from that phase
- If Phase 4 was completed → start Phase 5 (wrap-up)
- If all phases completed or no tasks exist → start fresh from Phase 1

**No persistent state files.** The file system is the state — daily notes exist or they don't.

---

## Phase 1: DAILY STANDUP (Interactive)

**Purpose**: Capture updates for all active projects.

### Steps

1. Read `_core/config.yaml` → get active projects list
2. For each active project, prompt the user:

   ```
   {project_name}: What's your update? (shipped/wip/blocked)
   ```

3. Parse each response using keyword detection (from `/daily` skill):
   - **Shipped**: shipped, done, completed, finished, merged, deployed, released
   - **WIP**: wip, working on, in progress, continuing, started, ongoing
   - **Blocked**: blocked, stuck, waiting on, waiting for, need from, dependency
   - **Decided**: decided, going with, chose, selected, agreed

4. Create or update `daily/{date}.md`:
   - If file exists: update each project's `## {Project Name}` section
   - If new: create from template with all project sections

5. **Auto-detect blockers** (per `/daily` logic):
   - For each blocked item: search `blockers/{project}/*.md` for similar open blockers
   - If similar exists: link to it
   - If NEW: prompt user — `"Blocker detected: '{text}'. Create blocker note? (y/n/details)"`
     - **y**: Create with severity=medium at `blockers/{project}/{date}-{slug}.md`
     - **details**: Prompt for severity, owner, due date
     - **n**: Skip

6. **Auto-detect decisions**:
   - For each decision keyword: suggest creating a decision note
   - Link to daily if user confirms

### Output

```
✓ Updated daily/{date}.md ({count} projects)
  - Shipped: {count} items
  - WIP: {count} items
  - Blockers: {count} (linked/created)
  - Decisions: {count} (detected)
```

---

## Phase 2: TEAM SYNC (Interactive)

**Purpose**: Process external context (Slack threads, Linear updates, meeting notes).

### Steps

1. Prompt the user:

   ```
   Any team updates, Slack threads, or meeting notes to process? (paste or 'skip')
   ```

2. If **skip** → mark phase complete, advance to Phase 3

3. If content provided:
   - Classify content type using keyword detection:
     - Meeting signals → route as meeting note (use `/meet` patterns)
     - Blocker signals → route as blocker
     - Decision signals → route as decision
     - General → route to inbox
   - Create appropriate notes with links
   - After processing, ask: `"More to process? (paste or 'done')"`
   - Loop until user says 'done' or 'skip'

### Output

```
✓ Team sync complete
  - Meeting notes: {count}
  - Blockers: {count}
  - Items routed: {count}
```

---

## Phase 3: REVIEW (Auto-generated, Read-only)

**Purpose**: Display a cross-project health dashboard. **No files created.**

### Steps

1. Scan vault and aggregate:
   - **Open blockers**: Glob `blockers/{project}/*.md` for each active project, read frontmatter for severity/due
   - **Critical items**: Blockers with due date < 2 days from today (per `defaults.blocker_critical_days`)
   - **Active docs**: Glob `docs/{project}/*.md`, filter status != shipped
   - **Recent decisions**: Glob `decisions/{project}/*.md` from last 3 days

2. Display formatted dashboard to terminal:

```
┌─────────────────────────────────────┐
│  TODAY'S DASHBOARD — {date}         │
└─────────────────────────────────────┘

BLOCKERS (by severity)
  🔴 High ({count})
    • [{project}] {title} — due {date}

  🟡 Medium ({count})
    • [{project}] {title}

  🟢 Low ({count})
    • [{project}] {title}

  (None) — if no blockers exist

ACTIVE DOCS
  • [{project}] {title} — {status}

  (None) — if no active docs

RECENT DECISIONS (last 3 days)
  • [{project}] {title} — {date}

  (None) — if no recent decisions
```

### Output

Dashboard displayed to terminal. **No files created.**

---

## Phase 4: FOCUS (Display & Pause)

**Purpose**: Show priorities and let the user do deep work.

### Steps

1. Extract priorities from today's daily note:
   - Top 3 WIP items across all projects
   - Critical blockers to address (from Phase 3 data)
   - Pending decisions (if any detected)

2. Display priority list:

```
TODAY'S PRIORITIES
━━━━━━━━━━━━━━━━━━━━━━━━

1. [{project}] {wip item}
2. [{project}] {wip item}
3. [{project}] {wip item}

⚠ NEEDS ATTENTION
  • {critical blocker or pending decision}

━━━━━━━━━━━━━━━━━━━━━━━━
Focus time — run /today again when ready to wrap up
```

3. Mark Phase 4 as complete. **Exit workflow.** User returns when ready.

---

## Phase 5: WRAP-UP (Auto-generated, Read-only)

**Purpose**: Summarize the day. **No files created.**

### Steps

1. Re-read today's daily note (`daily/{date}.md`)
2. Scan for blockers created/resolved today
3. Scan for decisions made today

4. Display summary:

```
TODAY'S SUMMARY — {date}
━━━━━━━━━━━━━━━━━━━━━━━━

SHIPPED ({count})
  • [{project}] {item}

IN PROGRESS ({count})
  • [{project}] {item}

BLOCKERS
  Created: {count}
  Resolved: {count}

DECISIONS MADE ({count})
  • [{project}] {title}

━━━━━━━━━━━━━━━━━━━━━━━━
Run /push to commit today's updates
```

---

## Edge Cases

- **No projects configured**: Display error — `"No active projects in config.yaml. Run /onboard to set up your first project."`
- **Empty vault (no daily note)**: Create fresh daily note in Phase 1
- **No blockers/decisions/docs**: Display "(None)" in dashboard sections
- **User exits mid-phase**: Session tasks preserve progress for same-session resume
- **`/today wrap` with no daily note**: Display message — `"No daily note for today. Run /today to start your day first."`

## Graceful Degradation

- **Linear MCP not connected**: Skip auto-fetch, continue with paste-only in Team Sync
- **QMD not available**: Not needed (direct file scans only)
- **Obsidian not running**: No impact (terminal-only output)

## Integration

Works with:
- `/daily` — Reuses keyword detection and blocker/decision logic
- `/meet` — Routes meeting content in Team Sync phase
- `/progress` — Similar dashboard pattern in Review phase
- `/push` — Suggested at wrap-up for committing changes
- `/block` — Blocker creation follows same patterns
- `/decide` — Decision creation follows same patterns
