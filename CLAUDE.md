# MindLoom — AI-Augmented Knowledge Vault

## Overview

Knowledge vault for Technical PMs and Engineering Leads. Run `/guide` for all commands.

**Always scan `_core/` first:** `config.yaml` (projects, paths, note types), `PROCESSING.md` (I-P-O flows), `MANIFESTO.md` (philosophy).

## Structure

| Folder | Purpose |
|--------|---------|
| `_core/` | config.yaml, MANIFESTO.md, PROCESSING.md |
| `_templates/` | Note templates (ALWAYS USE) |
| `inbox/` | Raw captures (`00-inbox/` also supported) |
| `index/` | Project MOCs (`01-index/` also supported) |
| `daily/` | `YYYY-MM-DD.md` — one file per day, H2 per project |
| `docs/{project}/` | PRDs, specs, documents |
| `decisions/{project}/` | Decision records |
| `blockers/{project}/` | Active blockers |
| `meetings/` | Meeting notes |
| `adrs/` | Architecture Decision Records |
| `roadmap/` | OKR objectives + key results |
| `research/` | Exploration notes |
| `reports/` | Generated reports |
| `_archive/` | Auto-archived by `YYYY-MM/` |

## Skills

Skills are invoked with `/skill-name` or automatically by Claude when relevant.

| Skill | Invocation | Purpose |
|-------|------------|---------|
| `daily` | `/daily` | Multi-project standup with keyword detection |
| `progress` | `/progress` | Cross-project status synthesis |
| `block` | `/block` | Create blocker with severity/owner/due |
| `decide` | `/decide` | Log decision with alternatives |
| `doc` | `/doc` | Draft PRD/spec/doc |
| `meet` | `/meet` | Process meeting notes |
| `inbox` | `/inbox` | Quick capture + batch processing |
| `ask` | `/ask` | Fast vault Q&A |
| `health` | `/health` | Vault health check |
| `adr` | `/adr` | Architecture Decision Record |
| `weekly` | `/weekly` | Sprint retro (Collect/Reflect/Plan) |
| `push` | `/push` | Git commit and sync |
| `onboard` | `/onboard` | Load _core/ + CLAUDE.md context |
| `vault-ops` | (auto) | Core file read/write/link operations |
| `okr-tracking` | (auto) | OKR progress calculation |

### Progress Visibility

Skills use session task tools to show progress during multi-step operations:
```
[Spinner] Collecting standup data...
[Done] Daily note created (3/3 projects)
```

## Agents

| Agent | Purpose |
|-------|---------|
| `scribe` | Note creation — knows all templates and naming conventions |
| `analyst` | Deep synthesis, trend analysis, sprint metrics, decision audits |
| `maintainer` | Index regen, link validation, auto-archiving |
| `processor` | GTD-style routing: inbox items to proper folders |

## Conventions

- **Files**: `YYYY-MM-DD-{slug}.md` (daily: `YYYY-MM-DD.md`, docs: `{slug}.md`)
- **Frontmatter**: `type`, `project`, `status`, `date`, `tags`; Blocker: `severity`/`owner`/`due`; ADR: `deciders`
- **Links**: `[[wikilinks]]` with `[[path|Title]]`; `## Links` required on typed notes
- **Naming-as-API**: Strict filename patterns enable glob queries without database

## Processing

- Detect: blockers ("blocked", "stuck") | decisions ("decided", "chose") | shipped ("deployed", "merged")
- Auto-archive on status change: resolved/shipped/superseded → `_archive/YYYY-MM/`
- Critical blockers: due < 2 days → escalate

## Output Style

**PM Coach** — Challenges scope creep, pushes for user value, holds accountable to OKRs.

## Customization

For personal overrides, copy `CLAUDE.local.md.template` to `CLAUDE.local.md`.

---

*See `.claude/rules/` for detailed conventions*
