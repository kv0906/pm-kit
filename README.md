# PM-Kit

Turn your AI coding tool into a PM workspace, knowledge hub, and execution engine.

## Disclaimer

This is not gospel. This is not the holy grail.

PM-Kit is one system that works. It is a guideline and mindset shift, not a rigid rulebook.

The principles in `_core/MANIFESTO.md` may resonate with you, or they may not. That is fine.
Take what works. Ignore what does not. Make it yours.

You will get better results through repetition. The framework should adapt to your workflow, not the other way around.

## Who Uses PM-Kit

| Role | How They Use It |
|------|------------------|
| Product Managers / Product Owners | Run dailies, write PRDs, track blockers, align cross-functional work |
| Engineering Leads | Capture decisions, maintain ADRs, drive sprint and roadmap clarity |
| Engineers (Junior -> Senior) | Document context, ship specs, keep decisions traceable |
| Founders / Solo Builders | Turn scattered thoughts into an execution system |
| Analysts / Operators | Log research, synthesize findings, build durable knowledge |

PM-Kit is optimized for Claude Code and markdown-native workflows.

## The Problem

Most teams using AI for product and execution hit the same wall:

- Scattered workspace: notes and specs across random files
- Fragmented context: no continuity between sessions
- Weak traceability: decisions, blockers, and docs disconnected
- Planning drift: jumping to outputs before framing the problem
- Shipping friction: too much context switching, not enough closure

AI is powerful. Without structure, it turns into noise.

## The Solution

PM-Kit gives you a system where AI helps maintain order while you focus on decisions and delivery.

What changes:

- Workspace stays organized with strict naming conventions
- Context persists through linked notes and project indexes
- Daily operations become repeatable (`/daily`, `/progress`, `/weekly`)
- Decision quality improves with explicit artifacts (`/decide`, `/adr`, `/block`)
- You move from raw thought to shipped outcomes faster

## Works With

| Tool | Status |
|------|--------|
| Claude Code | ✓ Native (reads `CLAUDE.md`, commands, skills) |
| Other AI tools that read markdown context | ✓ Partial (manual prompt + file workflow) |

## Quick Start (2 minutes)

```bash
git clone git@github.com:kv0906/pm-kit.git
cd pm-kit
./scripts/setup.sh
```

Then open your AI coding tool and start with:

```text
/onboard
```

Or jump straight into operations:

```text
/daily project-alpha: shipped login, blocked checkout API
/progress project-alpha
/push
```

## How It Works

1. You capture intent
- "Log today's product standup"
- "Draft a PRD for checkout improvements"
- "Record this architecture decision"

2. PM-Kit routes to the right workflow

| Workflow Type | Typical Commands | Output |
|---------------|------------------|--------|
| Daily Operations | `/daily`, `/progress`, `/weekly` | Status, risks, momentum |
| Documentation | `/doc`, `/meet`, `/ask` | PRDs, notes, synthesis |
| Decision Control | `/decide`, `/adr`, `/block` | Decision logs, ADRs, blocker tracking |
| Capture & Maintenance | `/inbox`, `/push`, `/health` | Intake, cleanup, repository health |

3. AI keeps the system coherent
- Applies naming conventions
- Links related notes
- Preserves traceability across docs, decisions, blockers, and roadmap

## Project Structure

```text
pm-kit/
├── CLAUDE.md               # Workspace context for Claude
├── _core/                  # config.yaml, MANIFESTO.md, PROCESSING.md
├── _templates/             # Note templates
├── .claude/                # Skills, agents, hooks, rules
├── inbox/                  # Unprocessed captures
├── index/                  # Project MOCs
├── daily/                  # YYYY-MM-DD.md
├── docs/{project}/         # PRDs, specs, docs
├── decisions/{project}/    # Decision records
├── blockers/{project}/     # Active blockers
├── meetings/               # Meeting notes
├── adrs/                   # Architecture Decision Records
├── roadmap/                # OKR objectives + key results
├── research/               # Exploration notes
├── reports/                # Generated reports
└── _archive/               # Archived notes by YYYY-MM/
```

## Core Commands

| Command | Purpose |
|---------|---------|
| `/daily` | Multi-project standup logging |
| `/progress` | Cross-project status synthesis |
| `/block` | Structured blocker capture |
| `/decide` | Decision records with alternatives |
| `/doc` | PRD/spec drafting |
| `/meet` | Meeting extraction into actions/decisions |
| `/inbox` | Fast capture for later processing |
| `/ask` | Vault Q&A |
| `/health` | Link + vault integrity checks |
| `/adr` | Architecture Decision Records |
| `/weekly` | Sprint retro and planning loop |
| `/push` | Commit and sync |
| `/onboard` | Load full workspace context |

## Core Principles

From `_core/MANIFESTO.md`:

- System over chaos: keep a consistent workspace contract
- Naming as API: file patterns make retrieval reliable
- Links over silos: discover context through connections
- Capture fast, process deliberately
- Ship and iterate: clarity compounds when artifacts stay current

## Documentation

| Doc | What It Covers |
|-----|----------------|
| `docs/SETUP_GUIDE.md` | Installation and first run |
| `docs/CUSTOMIZATION.md` | Projects, templates, and overrides |
| `docs/WORKFLOW_EXAMPLES.md` | Example operating flows |
| `docs/TROUBLESHOOTING.md` | Common issues and fixes |
| `docs/maintainer-workflow.md` | PR, changelog, and maintainer workflow |

## Contributing

Contributions are welcome.

- Read `CONTRIBUTING.md`
- Use the PR template
- Include a `## Changelog Entry` in each PR

Every merged PR to `main` is automatically recorded in `CHANGELOG.md`.

## License

MIT

## Star History

[![Star History Chart](docs/star-history.png)](https://star-history.com/#kv0906/pm-kit&Date)

Think clearly. Build simply. Let systems carry the weight.
