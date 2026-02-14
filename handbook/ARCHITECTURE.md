# Architecture

How PM-Kit works under the hood.

## The Problem

Most teams using AI for product and execution hit the same wall:

- Scattered workspace: notes and specs across random files
- Fragmented context: no continuity between sessions
- Weak traceability: decisions, blockers, and docs disconnected
- Planning drift: jumping to outputs before framing the problem
- Shipping friction: too much context switching, not enough closure

AI is powerful. Without structure, it turns into noise.

## The Solution

PM-Kit gives you a system where AI helps maintain order while you focus on decisions and delivery.

What changes:

- Workspace stays organized with strict naming conventions
- Context persists through linked notes and project indexes
- Daily operations become repeatable (`/daily`, `/progress`, `/weekly`)
- Decision quality improves with explicit artifacts (`/decide`, `/block`)
- You move from raw thought to shipped outcomes faster

## How It Works

1. You capture intent
- "Log today's product standup"
- "Draft a PRD for checkout improvements"

2. PM-Kit routes to the right workflow

| Workflow Type | Typical Commands | Output |
|---------------|------------------|--------|
| Daily Operations | `/daily`, `/progress`, `/weekly` | Status, risks, momentum |
| Documentation | `/doc`, `/meet`, `/ask` | PRDs, notes, synthesis |
| Decision Control | `/decide`, `/block` | Decision logs, blocker tracking |
| Capture & Maintenance | `/inbox`, `/push`, `/health` | Intake, cleanup, repository health |

3. AI keeps the system coherent
- Applies naming conventions
- Links related notes
- Preserves traceability across docs, decisions, and blockers

## Project Structure

```text
pm-kit/
├── CLAUDE.md               # Workspace context for Claude
├── _core/                  # config.yaml, MANIFESTO.md, PROCESSING.md
├── _templates/             # Note templates
├── .claude/                # Skills, agents, hooks, rules
├── inbox/                  # Unprocessed captures
├── index/                  # Project MOCs
├── daily/                  # YYYY-MM-DD.md
├── docs/{project}/         # PRDs, specs, docs
├── decisions/{project}/    # Decision records
├── blockers/{project}/     # Active blockers
├── meetings/               # Meeting notes

├── reports/                # Generated reports
└── _archive/               # Archived notes by YYYY-MM/
```

## Core Principles

From `_core/MANIFESTO.md`:

- System over chaos: keep a consistent workspace contract
- Naming as API: file patterns make retrieval reliable
- Links over silos: discover context through connections
- Capture fast, process deliberately
- Ship and iterate: clarity compounds when artifacts stay current

## Processing Pipeline

PM-Kit detects keywords in your input and routes them automatically:

- **Blocker signals**: "blocked", "waiting on", "stuck", "can't proceed"
- **Decision signals**: "decided", "going with", "chose", "selected"
- **Shipped signals**: "shipped", "completed", "done", "merged", "deployed"

Lifecycle rules:
- Critical blockers (due < 2 days) get escalated
- Resolved/shipped/superseded items auto-archive to `_archive/YYYY-MM/`
- All typed notes require `## Links` section for traceability
