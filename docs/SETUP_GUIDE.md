# MindLoom Setup Guide

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
