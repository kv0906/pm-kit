---
name: onboard
description: Load _core/ context files first, then CLAUDE.md, then project indexes for comprehensive vault understanding. Use at start of session or when Claude needs full context.
allowed-tools: Read, Glob, Grep
user-invocable: true
---

# /onboard — Context Loading

Loads all critical context files in the correct order for comprehensive vault understanding.

## Usage

```
/onboard
```

## Loading Order

MindLoom has a specific loading order that matters:

### 1. Core Config (Always First)
```
_core/config.yaml      → Projects, paths, note types, keywords
_core/PROCESSING.md    → I-P-O flows for all skills
_core/MANIFESTO.md     → Philosophy and principles
```

### 2. Vault Context
```
CLAUDE.md              → Vault overview, skills, agents, conventions
CLAUDE.local.md        → Personal overrides (if exists)
```

### 3. Project Indexes
```
index/{project}.md     → MOC for each active project
01-index/{project}.md  → Alternative index location
```

### 4. Current State
```
daily/{today}.md       → Today's standup (if exists)
daily/{yesterday}.md   → Yesterday's context
roadmap/objectives.md  → Current OKR status
```

### 5. Active Blockers
```
blockers/**/status: open  → All open blockers across projects
```

## Smart Loading

- Only loads indexes for projects marked `active: true` in config.yaml
- Checks both `index/` and `01-index/` for backwards compatibility
- Reads today's and yesterday's dailies for current context
- Scans open blockers to understand current obstacles

## Output

After loading, summarize:
```
MindLoom context loaded:
- Config: {n} active projects
- Indexes: {n} project MOCs
- Today: {summary of today's daily if exists}
- Blockers: {n} open across projects
- OKRs: Q{quarter} objectives loaded

Ready. What would you like to work on?
```

## Integration

Works with all other skills — provides the context they need for informed operation.
