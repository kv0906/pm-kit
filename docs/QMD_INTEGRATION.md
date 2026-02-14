# QMD Integration

QMD powers smarter `/ask` with hybrid search: BM25 (keyword) + vector (semantic) + rerank. This is an optional enhancement — `/ask` works without it using vault grep.

**Technical requirement**: This setup requires comfort with terminal/CLI tools. If you run into issues, [open an issue](https://github.com/kv0906/pm-kit/issues).

## Prerequisites

| Tool | Required | Install |
|------|----------|---------|
| macOS | Recommended | Linux works but setup is less tested |
| [bun](https://bun.sh) | Yes | `curl -fsSL https://bun.sh/install \| bash` |
| [QMD](https://github.com/tobi/qmd) | Yes | `bun install -g github:tobi/qmd` |

## Quick Setup

```bash
# Install
curl -fsSL https://bun.sh/install | bash
bun install -g github:tobi/qmd

# Configure
cd /path/to/your/vault
qmd collection add . --name pm-kit
qmd context add qmd://pm-kit "PM-Kit vault notes, docs, blockers, decisions, meetings"

# Index
qmd embed

# Verify
qmd status
```

## Architecture

```
/ask "what did we decide about auth?"
  │
  ├─ QMD available + indexed?
  │   ├── Yes → qmd_deep_search → qmd_get → grounded answer
  │   │         (BM25 + vector + rerank)
  │   │
  │   └── No  → Glob/Grep fallback → naming-as-API search
  │
  └─ Output includes:
      ├── ## Answer
      ├── ### Sources (file paths)
      └── ### Search Mode (QMD deep | Fallback vault grep)
```

### MCP Integration

QMD connects to Claude Code via MCP (Model Context Protocol) stdio mode.

**Config file**: `.mcp.json` in vault root:

```json
{
  "mcpServers": {
    "qmd": {
      "command": "qmd",
      "args": ["mcp"]
    }
  }
}
```

Claude Code reads this file at session start and connects to QMD automatically.

### MCP Tools Used by /ask

| Tool | Purpose |
|------|---------|
| `qmd_status` | Check if QMD is available and has indexed docs |
| `qmd_deep_search` | Run hybrid search query (BM25 + vector + rerank) |
| `qmd_get` / `qmd_multi_get` | Retrieve full document content for top results |

## Configuration

Optional tuning in `_core/config.yaml`:

```yaml
qmd:
  enabled: true           # Set false to force fallback mode
  collection_name: pm-kit  # QMD collection name
  collection_path: "."     # Path to vault root
  min_score: 0.35          # Minimum relevance score (0-1)
  max_results: 8           # Max documents to retrieve
```

Defaults apply if the `qmd` section is missing.

## Fallback Behavior

`/ask` **never hard-fails** because of QMD. The fallback chain:

1. **QMD missing** (not installed, MCP not connected): Falls back to vault grep. Appends install hint.
2. **QMD installed, no embeddings** (0 indexed docs): Falls back to vault grep. Suggests `qmd embed`.
3. **QMD error/timeout** (MCP tool fails mid-query): Catches error, falls back to vault grep in same response.
4. **QMD disabled** (`qmd.enabled: false` in config): Skips QMD entirely, uses vault grep.

## Maintenance

### Re-index after vault changes

```bash
qmd embed
```

Run after bulk changes (imports, restructuring). For normal daily use, `/ask` is accurate enough without constant re-indexing — re-embed weekly or when search quality drops.

### Update QMD

```bash
bun install -g github:tobi/qmd
```

### Check status

```bash
qmd status
```

Shows collection name, document count, embedding status.

## Troubleshooting

### `qmd: command not found`

Bun global bin may not be in your PATH.

```bash
# Check bun's bin directory
bun pm bin -g

# Add to PATH (add to ~/.zshrc or ~/.bashrc)
export PATH="$HOME/.bun/bin:$PATH"
```

### Slow first query

First run downloads an embedding model (~100MB). This is a one-time download. Pre-warm with `qmd embed`.

### No results from QMD

```bash
# Check collection exists
qmd collection list

# Check document count
qmd status

# Re-embed if count is 0
qmd embed
```

### MCP connection issues

```bash
# Test QMD MCP server manually
qmd mcp
# Should start without errors. Ctrl+C to stop.

# Verify .mcp.json exists
cat .mcp.json

# Restart Claude Code session
# MCP servers connect at session start
```

### Wrong collection

If you have multiple collections, ensure `_core/config.yaml` points to the right one:

```yaml
qmd:
  collection_name: pm-kit  # Must match: qmd collection list
```
