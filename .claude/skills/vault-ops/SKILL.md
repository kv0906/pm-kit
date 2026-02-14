---
name: vault-ops
description: Core vault file operations — read/write notes, manage wiki-links, process templates with Handlebars syntax, enforce naming conventions. Auto-invoked for all file operations.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# Vault Operations Skill

Core operations for reading, writing, and managing files in a PM-Kit vault.

## Vault Structure

```
pm-kit/
├── CLAUDE.md           # Vault context (read first)
├── _core/              # config.yaml, MANIFESTO.md, PROCESSING.md
├── _templates/         # Note templates (ALWAYS USE)
├── inbox/              # Unprocessed captures
├── index/              # Project MOCs
├── daily/              # YYYY-MM-DD.md (multi-project)
├── docs/{project}/     # PRDs, specs
├── decisions/{project}/ # Decision records
├── blockers/{project}/  # Active blockers
├── meetings/           # Meeting notes
├── adrs/               # Architecture Decision Records
├── roadmap/            # OKR objectives + key results
├── research/           # Exploration notes
├── reports/            # Generated reports
└── _archive/           # Archived by YYYY-MM/
```

## Naming Conventions (Naming-as-API)

Strict filename patterns enable glob queries without a database:

| Type | Pattern | Example |
|------|---------|---------|
| Daily | `daily/YYYY-MM-DD.md` | `daily/2026-01-15.md` |
| Doc | `docs/{project}/{slug}.md` | `docs/xmarket/checkout-flow.md` |
| Decision | `decisions/{project}/YYYY-MM-DD-{slug}.md` | `decisions/xmarket/2026-01-15-auth-approach.md` |
| Blocker | `blockers/{project}/YYYY-MM-DD-{slug}.md` | `blockers/xmarket/2026-01-15-api-rate-limit.md` |
| Meeting | `meetings/YYYY-MM-DD-{type}-{slug}.md` | `meetings/2026-01-15-sync-sprint-review.md` |
| ADR | `adrs/YYYY-MM-DD-{slug}.md` | `adrs/2026-01-15-database-choice.md` |
| Inbox | `inbox/YYYY-MM-DD-{slug}.md` | `inbox/2026-01-15-quick-thought.md` |
| Index | `index/{project}.md` | `index/xmarket.md` |

## File Operations

### Creating Notes
1. Check if note already exists (naming-as-API enables fast lookup)
2. Load appropriate template from `_templates/`
3. Replace template variables (Handlebars syntax)
4. Add YAML frontmatter with type, project, status, date, tags
5. Insert wiki-links to related notes
6. Write to correct folder per naming convention

### Editing Notes
- Preserve YAML frontmatter structure
- Maintain existing wiki-links
- Use consistent heading hierarchy
- Apply standard tag format

### Wiki-Link Format
```markdown
[[Note Name]]                    # Simple link
[[Note Name|Display Text]]       # Link with alias
[[Note Name#Section]]            # Link to heading
[[folder/Note Name]]             # Link with path
```

## Template Variables

When processing templates, replace Handlebars syntax:
- `{{date}}` → Today's date (YYYY-MM-DD)
- `{{project}}` → Project ID
- `{{project_name}}` → Project display name
- `{{title}}` → Note title
- `{{slug}}` → URL-safe slug

## YAML Frontmatter

All notes require frontmatter:
```yaml
---
type: [daily|doc|decision|blocker|meeting|adr|inbox|index]
project: {project-id}
status: {per note_types in config.yaml}
date: YYYY-MM-DD
tags: []
---
```

## Auto-Linking Rules

| From | Links To |
|------|----------|
| Daily (blocked item) | `blockers/{project}/` |
| Meeting | `decisions/{project}/`, `blockers/{project}/` |
| Decision | `docs/{project}/` |
| Doc | decisions, blockers |
| ADR | decisions, docs |

## Archive Rules

Move to `_archive/YYYY-MM/` when:
- Blocker status → resolved
- Doc status → shipped
- Decision status → superseded
- ADR status → deprecated or superseded
