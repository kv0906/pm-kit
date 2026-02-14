# PM-Kit

Turn your AI coding tool into a PM workspace, knowledge hub, and execution engine.

## Disclaimer

This is not gospel. This is not the holy grail.

PM-Kit is one system that works. It is a guideline and mindset shift, not a rigid rulebook.

The principles in `_core/MANIFESTO.md` may resonate with you, or they may not. That is fine.
Take what works. Ignore what does not. Make it yours.

You will get better results through repetition. The framework should adapt to your workflow, not the other way around.

## Quick Start

```bash
# 1. Use this template on GitHub (or clone)
git clone <your-repo-url>
cd pm-kit

# 2. Open the folder in Obsidian

# 3. Run Claude Code
claude
/onboard
```

`/onboard` sets up your project, learns your preferences, and loads context. Full walkthrough: **[START_HERE.md](START_HERE.md)**

## Daily Routine

```
/daily my-project: shipped X, wip Y, blocked on Z
/push
```

## Weekly Routine

```
/weekly
/push
```

## All Commands

| Command | Purpose |
|---------|---------|
| `/daily` | Multi-project standup logging |
| `/progress` | Cross-project status synthesis |
| `/block` | Structured blocker capture |
| `/decide` | Decision records with alternatives |
| `/doc` | PRD/spec drafting |
| `/meet` | Meeting extraction into actions/decisions |
| `/inbox` | Fast capture for later processing |
| `/ask` | Vault Q&A (QMD-powered when available) |
| `/health` | Link + vault integrity checks |
| `/adr` | Architecture Decision Records |
| `/weekly` | Sprint retro and planning loop |
| `/push` | Commit and sync |
| `/onboard` | Interactive setup + context loading |

## Smarter /ask with QMD (Optional)

Install [QMD](https://github.com/tobi/qmd) for hybrid search (BM25 + vector + rerank) that dramatically improves `/ask` accuracy. **Requires [bun](https://bun.sh) and technical comfort with CLI tools.** Without QMD, `/ask` still works using vault grep.

```bash
# 1. Install bun (if not installed)
curl -fsSL https://bun.sh/install | bash

# 2. Install QMD and set up your vault
bun install -g github:tobi/qmd
qmd collection add . --name pm-kit

# 3. Build the search index
qmd embed
```

After setup, `/ask` automatically uses QMD when available. No command changes needed.

Having trouble? See [docs/QMD_INTEGRATION.md](docs/QMD_INTEGRATION.md) or [open an issue](https://github.com/kv0906/pm-kit/issues).

## Who Uses PM-Kit

| Role | How They Use It |
|------|------------------|
| Product Managers / Product Owners | Run dailies, write PRDs, track blockers, align cross-functional work |
| Engineering Leads | Capture decisions, maintain ADRs, drive sprint and roadmap clarity |
| Engineers (Junior -> Senior) | Document context, ship specs, keep decisions traceable |
| Founders / Solo Builders | Turn scattered thoughts into an execution system |
| Analysts / Operators | Log research, synthesize findings, build durable knowledge |

## Works With

| Tool | Status |
|------|--------|
| Claude Code | Native (reads `CLAUDE.md`, commands, skills) |
| Other AI tools that read markdown context | Partial (manual prompt + file workflow) |

## Documentation

| Doc | What It Covers |
|-----|----------------|
| [START_HERE.md](START_HERE.md) | 10-step beginner guide |
| [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) | How PM-Kit works, project structure, principles |
| [docs/QMD_INTEGRATION.md](docs/QMD_INTEGRATION.md) | QMD setup, troubleshooting, architecture |
| [docs/SETUP_GUIDE.md](docs/SETUP_GUIDE.md) | Installation and first run |
| [docs/CUSTOMIZATION.md](docs/CUSTOMIZATION.md) | Projects, templates, and overrides |
| [docs/WORKFLOW_EXAMPLES.md](docs/WORKFLOW_EXAMPLES.md) | Example operating flows |
| [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) | Common issues and fixes |
| [docs/maintainer-workflow.md](docs/maintainer-workflow.md) | PR, changelog, and maintainer workflow |

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
