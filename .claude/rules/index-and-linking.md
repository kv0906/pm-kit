---
paths: "**/*.md"
---

# Index, MOC & Linking Rules

Every project has a Map of Content (MOC) at `01-index/{project}.md`. This is the hub of the project's knowledge graph. All linking rules exist to keep the graph navigable — in Obsidian's graph view, the index should be the brightest node with the most connections.

## Rule 1: Every Project Gets an Index

When a project is created (via `/onboard`, `setup.sh`, or manually), it **must** have an index file:

```
01-index/{project-id}.md
```

Use the `_templates/index.md` template. The index contains auto-updated sections (blockers, docs, dailies, decisions) and a `## Manual Notes` section the user owns.

## Rule 2: Every Typed Note Links Back to Its Index

All typed notes (doc, decision, blocker, meeting) **must** include a `## Links` section with a backlink to the project index:

```markdown
## Links

### Project
- [[01-index/{project}|{Project Name}]]

### Related
%% AI determines appropriate links %%
```

This is non-negotiable. Without the backlink, the note is an orphan in the graph.

**When creating notes**: Always add the `## Links` section. Use the project's display name from `_core/config.yaml` as the alias.

**When editing notes**: If `## Links` is missing, add it. Never remove an existing project backlink.

## Rule 3: Cross-References Go Through Related Links

When a note references another note (a decision mentions a doc, a blocker references a meeting), add it under `### Related`:

```markdown
### Related
- [[docs/my-project/checkout-flow|Checkout Flow PRD]]
- [[decisions/my-project/2026-01-15-auth-approach|Auth Decision]]
```

Prefer explicit links over inline mentions. A `[[wikilink]]` in the body is good; a `[[wikilink]]` in both the body and `## Links` is better — the Links section is the canonical list for graph traversal.

## Rule 4: Daily Notes Link Implicitly

Daily notes (`daily/YYYY-MM-DD.md`) do **not** require a `## Links` section — they link implicitly through project headings (`## {Project Name}`). However, when a daily mentions a specific blocker or decision, inline-link it:

```markdown
### Blocked
- API rate limit still unresolved — see [[blockers/my-project/2026-01-15-api-rate-limit|API Rate Limit]]
```

## Rule 5: Inbox Notes Are Temporary

Inbox items (`00-inbox/*.md`) do not need links. They are transient captures that get routed to typed notes via `/inbox` processing. Once processed, the typed note gets proper links.

## Rule 6: Index Sections Are Auto-Updated

The maintainer agent regenerates these index sections:

| Section | Source | Window |
|---------|--------|--------|
| Open Blockers | `blockers/{project}/*.md` where status=open | All open |
| Active Docs | `docs/{project}/*.md` where status!=shipped | All active |
| Recent Dailies | `daily/*.md` mentioning project | Last 7 days |
| Recent Decisions | `decisions/{project}/*.md` | Last 30 days |

The `## Manual Notes` section (marked `%% preserved %%`) is never overwritten. Users add permanent links, context, or navigation aids there.

## Rule 7: Health Check Enforces Linking

`/health` flags:

- **Orphan notes**: Typed notes with zero inbound links (not linked from any other note)
- **Missing `## Links`**: Typed notes without the required section
- **Broken links**: `[[wikilinks]]` pointing to non-existent files
- **Stale indexes**: Index sections that haven't been regenerated in 7+ days

Fix orphans by adding them to the relevant index or linking from a related note.

## Obsidian Graph Tips

For users browsing the vault in Obsidian:

### Global Graph
- **Star `01-index/`** — index files should be the largest nodes. If they're not, linking rules aren't being followed.
- **Filter by path** — use `path:01-index` to see only MOCs and their connections.
- **Color by folder** — assign distinct colors to `01-index/`, `blockers/`, `docs/`, `decisions/` for visual clarity.

### Local Graph (most useful)
- Open any `01-index/{project}.md` and toggle **Local Graph** (right sidebar or `Ctrl/Cmd+Shift+G`).
- This shows the project's entire knowledge neighborhood: all docs, blockers, decisions, and dailies connected to this index.
- Depth 1 = direct links. Depth 2 = notes linked from those notes. Depth 2 is usually the sweet spot.

### Backlinks Panel
- Open any note and check the **Backlinks** panel to see what links to it.
- A well-linked note should have at least its index + one other note linking to it.
- If a note has zero backlinks, it's effectively invisible in the graph.

### Search by Links
- `[[01-index/my-project]]` in Obsidian search finds every note that links to the project index.
- Use this to audit project coverage: are all docs, decisions, and blockers properly linked?
