---
paths: "**/*.md"
---

# Session Task Tracking Conventions

These conventions govern the use of Claude Code's session task tools (`TaskCreate`, `TaskUpdate`, `TaskList`) for providing progress visibility during multi-step operations.

## Key Distinction

**Session tasks ≠ Your actual tasks**

- **Session tasks**: Temporary progress indicators that exist only during a Claude session
- **Your tasks**: Action items in daily notes, sprint goals in retros

Session tasks show *what Claude is doing*. Markdown content tracks *what you need to do*.

## When to Use Session Tasks

Use session tasks for operations with 3+ distinct steps:

### Good Use Cases
- Daily standup processing (parse → detect → create)
- Sprint retro phases (collect → reflect → plan)
- Batch inbox processing (multiple items)
- Health check (scan → validate → report)
- Meeting note extraction (parse → extract → create linked notes)

### Skip Session Tasks For
- Single file reads/writes
- Quick lookups (`/ask`)
- Simple edits
- 1-2 step operations

## Task Naming

### Subject (Imperative)
```
Parse standup input
Create daily note
Process inbox items
Generate health report
```

### activeForm (Present Continuous)
```
Parsing standup input...
Creating daily note...
Processing inbox items...
Generating health report...
```

## Task Dependencies

Use dependencies when order matters:
```
Task 1: Collect (no dependencies)
Task 2: Reflect (blockedBy: Task 1)
Task 3: Plan (blockedBy: Task 2)
```

## Status Transitions

```
pending → in_progress → completed
```

- Set `in_progress` when starting a task
- Set `completed` only when fully done
- Never mark incomplete work as completed
