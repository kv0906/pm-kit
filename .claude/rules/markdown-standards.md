---
paths: "**/*.md"
---

# Markdown Standards for PM-Kit Vault

These conventions apply to all markdown files in the vault.

## File Naming

- **Daily notes:** `YYYY-MM-DD.md` (e.g., `2026-01-15.md`)
- **Typed notes:** `YYYY-MM-DD-{slug}.md` (e.g., `2026-01-15-api-rate-limit.md`)
- **Docs:** `{slug}.md` (e.g., `checkout-flow.md`)
- **Slugs:** lowercase, hyphens, no special characters

## Heading Structure

- H1 (`#`) for note title only — one per file
- H2 (`##`) for major sections (Project names in dailies)
- H3 (`###`) for subsections (Shipped, WIP, Blocked in dailies)
- Never skip heading levels

## Links

### Internal Links (Wiki-style)
```markdown
[[Note Name]]                    # Link to note
[[Note Name|Display Text]]       # Link with alias
[[Note Name#Section]]            # Link to heading
[[folder/Note Name]]             # Link with path
```

## Tags

### In YAML frontmatter
```yaml
tags: [tag1, tag2]
```

### Inline
At end of relevant line or in frontmatter only.

## YAML Frontmatter

All notes require frontmatter:
```yaml
---
type: [daily|doc|decision|blocker|meeting|inbox|index]
project: {project-id}
status: {per config.yaml note_types}
date: YYYY-MM-DD
tags: []
---
```

### Required `## Links` Section

All typed notes (doc, decision, blocker, meeting) must end with:
```markdown
## Links

### Project
- [[index/{project}|{project_name}]]

### Related
%% AI determines appropriate links %%
```

## Text Formatting

- **Bold** for emphasis and key terms
- *Italic* for subtle emphasis
- `Code` for commands, paths, technical terms
- > Blockquotes for important callouts

## Lists

- Use `-` for unordered lists
- Use `1.` for ordered lists
- Indent with 2 spaces for nested items
