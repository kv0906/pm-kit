---
name: ask
description: Fast vault Q&A — quick lookups, decision history, blocker status, doc search. Uses QMD hybrid search when available, falls back to vault grep. Use for "/ask what did we decide about auth?" or "/ask who's blocked?".
allowed-tools: Read, Glob, Grep
user-invocable: true
---

# /ask — Question Answering

Fast answers from your vault. Uses QMD hybrid search (BM25 + vector + rerank) when available, with automatic fallback to vault grep.

## Context

Config: @_core/config.yaml

## Input

User input: $ARGUMENTS

## Processing Steps

### Step 1: Detect Search Backend

Check if QMD MCP tools are available in the current session:

1. **Try `qmd_status`** (MCP tool) to check QMD availability and index state.
2. **Evaluate result:**
   - QMD available AND has embedded docs → use **QMD mode**
   - QMD available but 0 embedded docs → use **Fallback mode** + hint
   - QMD not available (tool missing/error) → use **Fallback mode**

### Step 2: Parse Question

- Detect project if mentioned
- Identify question type:
  - "what did we decide about X" → decisions
  - "who's blocked" → blockers
  - "find doc for X" → docs
  - "status of X" → index
  - "what ADRs" → adrs
  - "OKR/objective" → roadmap

### Step 3A: QMD Mode (preferred)

When QMD is available and indexed:

1. **Deep search**: Call `qmd_deep_search` with the user's question.
   - Use collection filter from config: `_core/config.yaml → qmd.collection_name` (default: `pm-kit`)
   - Cap results: use `qmd.max_results` from config (default: 8)
2. **Retrieve top docs**: Call `qmd_get` or `qmd_multi_get` for the top-scored results.
   - Apply minimum score threshold from config: `qmd.min_score` (default: 0.35)
3. **Synthesize answer**: Read the retrieved content and produce a grounded answer with source citations.

### Step 3B: Fallback Mode (vault grep)

When QMD is not available or not indexed:

1. **Search Strategy**

   | Question Type | Search Path |
   |--------------|-------------|
   | Decisions | `decisions/{project}/*.md` |
   | Blockers | `blockers/{project}/*.md` |
   | Docs | `docs/{project}/*.md` |
   | Status | `index/{project}.md` |
   | ADRs | `adrs/*.md` |
   | OKRs | `roadmap/objectives.md` |
   | General | All folders |

2. **Search Methods**
   - Filename match first (fastest — naming-as-API)
   - Frontmatter field match
   - Content grep (slower)

### Step 4: Return Answer

## Output Format

### With results

```markdown
## Answer

{Direct answer — 1-3 sentences, grounded in source content}

### Sources
- `{file-path}` — {brief context why this source is relevant}
- `{file-path}` — {brief context}

### Search Mode
{QMD (deep) | Fallback (vault grep)}
```

### No results

```markdown
## No Results Found

Searched: {folders or QMD collection}
Query: "{query}"

**Suggestions**:
- Try broader terms
- Check spelling
- Run `qmd embed` if QMD is installed but not indexed

### Search Mode
{QMD (deep) | Fallback (vault grep)}
```

### Fallback mode hint

When running in Fallback mode, append after the answer:

> **Tip**: Install [QMD](https://github.com/tobi/qmd) for smarter search with semantic understanding. See [docs/QMD_INTEGRATION.md](docs/QMD_INTEGRATION.md) for setup.
