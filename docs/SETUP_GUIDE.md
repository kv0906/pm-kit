# PM-Kit Setup Guide

## Prerequisites

- [Git](https://git-scm.com/) — version control for your vault
- [Claude Code](https://claude.ai/code) — AI coding assistant (CLI)
- [Obsidian](https://obsidian.md/) — markdown editor (optional but recommended)

## Quick Start

### Automated Setup

```bash
git clone https://github.com/your-repo/pm-kit.git
cd pm-kit
./scripts/setup.sh
```

The wizard will:
1. Check prerequisites
2. Create your vault directory
3. Copy the vault structure
4. Configure your projects
5. Initialize Git

### Manual Setup

1. Clone or download this repository
2. Copy these to your vault location:
   - `CLAUDE.md`, `CLAUDE.local.md.template`
   - `_core/`, `_templates/`
   - `.claude/`, `.claude-plugin/`
   - `roadmap/`
3. Create empty directories: `inbox/`, `index/`, `daily/`, `docs/`, `decisions/`, `blockers/`, `meetings/`, `adrs/`, `research/`, `reports/`, `_archive/`
4. Edit `_core/config.yaml` with your projects
5. Run `git init` and make initial commit

## First Session

```
cd /path/to/your/vault
claude
/onboard           # Load vault context
/daily myproject: shipped auth, wip payments    # First standup
/push               # Save changes
```

## Configuration

### Projects

Edit `_core/config.yaml`:

```yaml
projects:
  - id: xmarket        # Used in folder paths
    name: xMarket       # Display name
    description: Prediction market platform
    active: true
```

### Personal Overrides

Copy `CLAUDE.local.md.template` to `CLAUDE.local.md` for personal settings that won't be committed to Git.

### Auto-Commit

Auto-commit is enabled by default. To disable:
- Set `GIT_AUTO_COMMIT` to `"false"` in `.claude/settings.json`

## QMD Setup (Optional — Smarter /ask)

QMD adds hybrid search (BM25 + vector + rerank) to `/ask`. This is a technical setup that requires comfort with CLI tools.

**Requirements**: macOS recommended. Needs [bun](https://bun.sh) (JavaScript runtime).

### Install

```bash
# Install bun (if not installed)
curl -fsSL https://bun.sh/install | bash

# Install QMD
bun install -g github:tobi/qmd
```

### Create collection

```bash
cd /path/to/your/vault
qmd collection add . --name pm-kit
```

### Add context

```bash
qmd context add qmd://pm-kit "PM-Kit vault notes, docs, blockers, decisions, meetings"
```

### Build embeddings

```bash
qmd embed
```

First run downloads a small model (~100MB). Subsequent runs are fast.

### Verify

```bash
qmd status
```

You should see your collection with embedded document count > 0.

### MCP connection

The `.mcp.json` file in your vault already configures QMD as an MCP server. Claude Code will connect automatically on next session.

### Without QMD

`/ask` still works using vault grep. You'll see `Search Mode: Fallback (vault grep)` in results. QMD just makes results more accurate.

For troubleshooting, see [QMD_INTEGRATION.md](QMD_INTEGRATION.md).

## Obsidian Setup

1. Open Obsidian
2. "Open folder as vault" → select your vault directory
3. Recommended plugins:
   - **Calendar** — navigate daily notes
   - **Dataview** — query your notes
   - **Templater** — template shortcuts

## Folder Structure

After setup, your vault looks like:

```
vault/
├── CLAUDE.md           # Vault context for Claude
├── _core/              # config.yaml, MANIFESTO.md, PROCESSING.md
├── _templates/         # Note templates
├── .claude/            # Skills, agents, hooks, rules
├── inbox/              # Quick captures
├── index/              # Project MOCs
├── daily/              # Standup notes
├── docs/               # PRDs, specs
├── decisions/          # Decision records
├── blockers/           # Active blockers
├── meetings/           # Meeting notes
├── adrs/               # Architecture Decision Records
├── roadmap/            # OKRs
├── research/           # Exploration
├── reports/            # Generated reports
└── _archive/           # Archived notes
```
