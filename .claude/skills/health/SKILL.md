---
name: health
description: Run vault health check — broken links, orphans, missing sections, statistics. Generates report at index/_graph-health.md. Use for "/health".
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /health — Vault Health Check

Generate comprehensive health report for the vault.

## Context

Config: @_core/config.yaml

## Session Task Progress

```
TaskCreate: "Scan vault files"
  activeForm: "Scanning vault files..."

TaskCreate: "Check links and orphans"
  activeForm: "Validating links..."

TaskCreate: "Generate health report"
  activeForm: "Generating health report..."
```

## Processing Steps

1. **Scan Vault**
   - Glob all `.md` files
   - Exclude: `_core/`, `_templates/`, `_archive/`

2. **Check Broken Links**
   - Extract all `[[wikilinks]]` from each file
   - Verify each target exists
   - Report: source → broken target

3. **Find Orphan Notes**
   - Notes with no inbound links
   - Exclude: index files, standalone: true

4. **Check Missing Sections**
   - Typed notes (doc, decision, blocker, meeting, adr) should have `## Links`
   - Report missing required sections

5. **Calculate Statistics**
   - Notes by type
   - Notes by project
   - Link density (links per note)

6. **Generate Report**
   - Write to `index/_graph-health.md`

## Output Format

```markdown
# Graph Health Report

> Generated: {datetime}

## Broken Links
| Source | Broken Target |
|--------|---------------|
| {path} | [[{target}]]  |

## Orphan Notes
- {path} — no inbound links

## Missing ## Links Sections
- {path} — type: {type}

## Statistics

### By Type
| Type | Count |
|------|-------|
| daily | {n} |
| doc | {n} |
| adr | {n} |

### By Project
| Project | Count |
|---------|-------|
| {proj} | {n} |

### Link Density
- Total links: {n}
- Average per note: {avg}

## Actions
1. [ ] Fix broken link: {source} → {target}
2. [ ] Add links to: {orphan}
```
