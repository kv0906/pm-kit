---
paths: "docs/**/*.md, decisions/**/*.md, blockers/**/*.md, meetings/**/*.md, daily/**/*.md, 00-inbox/**/*.md"
---

# Naming Conventions (Naming-as-API)

Strict filename patterns are the API. They enable glob queries without a database. **Never deviate from these patterns.**

## File Path Patterns

| Type | Pattern | Example |
|------|---------|---------|
| Daily | `daily/YYYY-MM-DD.md` | `daily/2026-01-15.md` |
| Doc | `docs/{project}/{slug}.md` | `docs/project-a/checkout-flow.md` |
| Decision | `decisions/{project}/YYYY-MM-DD-{slug}.md` | `decisions/project-a/2026-01-15-auth-approach.md` |
| Blocker | `blockers/{project}/YYYY-MM-DD-{slug}.md` | `blockers/project-a/2026-01-15-api-rate-limit.md` |
| Meeting | `meetings/YYYY-MM-DD-{type}-{slug}.md` | `meetings/2026-01-15-sync-sprint-review.md` |
| Inbox | `00-inbox/YYYY-MM-DD-{slug}.md` | `00-inbox/2026-01-15-quick-thought.md` |
| Index | `01-index/{project}.md` | `01-index/project-a.md` |

## Slug Rules

- Lowercase only
- Hyphens for spaces: `api rate limit` → `api-rate-limit`
- No special characters: remove `'`, `"`, `(`, `)`, etc.
- Max 50 characters
- Descriptive but concise

## Project IDs

- Defined in `_core/config.yaml`
- Lowercase, hyphens allowed: `project-a`, `project-b`
- Used in folder paths and frontmatter
- Must match exactly — no aliases

## Meeting Types

| Type | Use For |
|------|---------|
| `sync` | Standup, daily, weekly, sprint, regular sync |
| `milestone` | Planning, kickoff, retro, milestone review |
| `external` | Client, stakeholder, vendor, partner |

## Query Patterns Enabled

These naming conventions enable fast queries:

```bash
# All open blockers for a project
blockers/project-a/*.md

# Recent decisions
decisions/*/*.md (sort by date prefix)

# All sprint retros
reports/*-sprint-retro.md

# Today's daily
daily/2026-01-15.md

# All meetings this month
meetings/2026-01-*.md
```

## Archive Naming

When archived, files move to:
```
_archive/YYYY-MM/{original-path}
```

Example: `blockers/project-a/2026-01-15-api-rate-limit.md` → `_archive/2026-01/blockers/project-a/2026-01-15-api-rate-limit.md`
