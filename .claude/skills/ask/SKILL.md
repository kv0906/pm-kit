---
name: ask
description: Fast vault Q&A — quick lookups, decision history, blocker status, doc search. Replaces Scout+Graph agents. Use for "/ask what did we decide about auth?" or "/ask who's blocked?".
allowed-tools: Read, Glob, Grep
user-invocable: true
---

# /ask — Question Answering

Fast answers from your vault. Optimized for speed over depth.

## Context

Config: @_core/config.yaml

## Input

User input: $ARGUMENTS

## Processing Steps

1. **Parse Question**
   - Detect project if mentioned
   - Identify question type:
     - "what did we decide about X" → decisions
     - "who's blocked" → blockers
     - "find doc for X" → docs
     - "status of X" → index
     - "what ADRs" → adrs

2. **Search Strategy**

   | Question Type | Search Path |
   |--------------|-------------|
   | Decisions | `decisions/{project}/*.md` |
   | Blockers | `blockers/{project}/*.md` |
   | Docs | `docs/{project}/*.md` |
   | Status | `index/{project}.md` |
   | ADRs | `adrs/*.md` |
   | OKRs | `roadmap/objectives.md` |
   | General | All folders |

3. **Search Methods**
   - Filename match first (fastest — naming-as-API)
   - Frontmatter field match
   - Content grep (slower)

4. **Return Answer**

## Output Format

```markdown
## Answer

{Direct answer - 1-3 sentences}

### Source
- [[{note-link}]] — {brief context}
```

If no results:
```markdown
## No Results Found

Searched: {folders}
Query: "{query}"

**Suggestions**:
- Try broader terms
- Check spelling
```
