# PM-Kit

**Product Management Framework for Claude Code**

A comprehensive AI-powered toolkit that brings systematic product management methodologies directly into Claude Code. Write PRDs, conduct research, prioritize features, and build stakeholder consensus - all through simple slash commands.

---

## Why PM-Kit?

| Traditional PM Work | With PM-Kit |
|---------------------|-------------|
| Hours writing PRDs from scratch | `/prd` generates comprehensive docs in minutes |
| Scattered research across tools | `/research` synthesizes insights automatically |
| Gut-feel prioritization | `/prioritize` applies RICE, ICE, Kano frameworks |
| Endless stakeholder debates | `/consensus` structures alignment systematically |

**Built on Long Chain-of-Thought methodology** - every command executes 15+ systematic reasoning steps with validation checkpoints.

---

## Installation

### Quick Install

```bash
# In Claude Code
/plugin install kv0906/pm-kit
```

### Via Marketplace

```bash
# Add the marketplace
/plugin marketplace add kv0906/pm-kit

# Install the plugin
/plugin install pm-kit@pm-kit

# Restart Claude Code to activate
```

---

## Commands

### Discovery - Understanding Problems

| Command | Description | Example |
|---------|-------------|---------|
| `/decompose` | Break down complex problems into root causes using first principles | `/decompose "Why are users abandoning checkout?"` |
| `/research` | Multi-source research synthesis with confidence scoring | `/research "Should we build a mobile app?"` |

### Definition - Specifying Solutions

| Command | Description | Example |
|---------|-------------|---------|
| `/prd` | Generate comprehensive Product Requirements Documents | `/prd "Shopping cart transparency feature"` |
| `/flow` | Create user flow diagrams with Mermaid syntax | `/flow "Password reset journey"` |
| `/mockup` | Generate ASCII wireframes for quick visualization | `/mockup "User profile settings page"` |
| `/diagram` | Create ASCII diagrams (flows, architecture, timelines) | `/diagram "Microservices architecture"` |
| `/design-spec` | Produce design handoff specifications | `/design-spec "Checkout redesign"` |
| `/northstar` | Transform raw ideas into North Star framework | `/northstar "AI-powered search for e-commerce"` |

### Decision - Making Choices

| Command | Description | Example |
|---------|-------------|---------|
| `/prioritize` | Apply RICE, ICE, or Kano frameworks to feature lists | `/prioritize "Q1 feature backlog"` |
| `/decide` | Quick decision framework with structured analysis | `/decide "Build vs buy payment processing?"` |
| `/matrix` | Generate comparison matrices for options | `/matrix "CRM vendor comparison"` |
| `/consensus` | Build stakeholder alignment with structured approach | `/consensus "API pricing strategy"` |

### Communication - Sharing with Others

| Command | Description | Example |
|---------|-------------|---------|
| `/strategy` | Create strategic planning documents | `/strategy "AI-powered recommendations roadmap"` |
| `/architecture` | Generate PM-friendly architecture documentation | `/architecture "Payment system overview"` |
| `/explain-code` | Translate technical code into PM-friendly explanations | `/explain-code "What does this API endpoint do?"` |
| `/tech-impact` | Assess technical feasibility of proposed features | `/tech-impact "Real-time notifications feature"` |

### Daily Operations - Managing Your Work

| Command | Description | Example |
|---------|-------------|---------|
| `/retro` | Transform meeting notes into structured retrospectives | `/retro "Sprint 23 notes: discussed velocity..."` |
| `/today` | Get personalized daily work suggestions | `/today "Open: checkout PRD, pricing decision"` |
| `/handover` | Generate vacation/transition handover docs | `/handover "Dec 20 - Jan 3, backup: Sarah"` |

### Help

| Command | Description |
|---------|-------------|
| `/pm` | Interactive guide to help you choose the right command |

---

## Quick Reference

| I need to... | Use |
|--------------|-----|
| Understand why something is broken | `/decompose` |
| Research a question or decision | `/research` |
| Write product requirements | `/prd` |
| Define a new product vision | `/northstar` |
| Prioritize my backlog | `/prioritize` |
| Make a quick decision | `/decide` |
| Compare options side-by-side | `/matrix` |
| Get stakeholder buy-in | `/consensus` |
| Plan a strategic initiative | `/strategy` |
| Create a diagram | `/diagram` |
| Sketch a wireframe | `/mockup` |
| Map a user journey | `/flow` |
| Understand technical concepts | `/explain-code` |
| Assess feasibility | `/tech-impact` |
| Structure my day | `/today` |
| Run a retrospective | `/retro` |
| Prepare for time off | `/handover` |

---

## Example Workflows

### New Feature Development

```
/decompose "user problem"        # Understand the root cause
        ↓
/research "solution approaches"  # Research possible solutions
        ↓
/prd "feature name"              # Write requirements
        ↓
/prioritize "feature list"       # Score against other work
        ↓
/consensus "stakeholders"        # Align the team
```

### Strategic Planning

```
/research "market opportunity"   # Gather market insights
        ↓
/strategy "initiative name"      # Create strategy document
        ↓
/prioritize "initiatives"        # Prioritize efforts
        ↓
/consensus "leadership"          # Get executive alignment
```

### Quick Decision

```
/decide "the decision"           # Frame the decision
        ↓
/matrix "options"                # Compare alternatives
        ↓
/consensus "approvers"           # Get sign-off
```

---

## Skills (Learning Modules)

PM-Kit includes educational modules for PMs who want to understand technical concepts:

| Skill | What You'll Learn |
|-------|-------------------|
| **api-basics** | HTTP methods, status codes, REST concepts |
| **json-fundamentals** | Reading and understanding JSON data structures |
| **debug-without-code** | Debugging strategies without writing code |
| **frontend-prompts** | How to specify frontend design requirements |
| **ascii-diagrams** | Creating effective ASCII diagrams and wireframes |
| **gemini-grounded-search** | Real-time web search and code execution via Gemini API |

---

## Output Locations

When you use PM-Kit commands, outputs are saved to organized directories:

```
your-project/
├── prds/           # Product Requirements Documents
├── research/       # Research reports and syntheses
├── decisions/      # Decision logs and matrices
├── roadmaps/       # Strategic roadmaps
└── metrics/        # KPIs and analytics reports
```

---

## How It Works

PM-Kit uses a **Command → Agent** architecture:

1. **You invoke a command** (e.g., `/prd "feature name"`)
2. **Command delegates to a specialized agent** with embedded workflow
3. **Agent executes 15+ systematic steps** with verification checkpoints
4. **Output is generated** using professional templates

Each agent implements Long Chain-of-Thought methodology:
- Multi-phase reasoning process
- Verification checkpoints at each phase
- Backtracking when issues are found
- Quality checklists before completion

---

## Plugin Structure

```
pm-kit/
├── .claude-plugin/
│   ├── plugin.json       # Plugin manifest
│   └── marketplace.json  # Marketplace definition
├── commands/             # 20 slash commands
├── agents/               # 15 specialized agents
├── skills/               # 6 educational modules
└── templates/            # Output templates
```

---

## Updating

```bash
# Check for updates
/plugin update pm-kit

# Or reinstall latest version
/plugin uninstall pm-kit
/plugin install kv0906/pm-kit
```

---

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Ways to Contribute

- Report bugs or suggest features via [Issues](https://github.com/kv0906/pm-kit/issues)
- Submit pull requests for improvements
- Share your workflows and use cases
- Help improve documentation

---

## Documentation

- [Contributing Guide](CONTRIBUTING.md) - How to contribute
- [Changelog](CHANGELOG.md) - Version history
- [Development Roadmap](PLAN.md) - Project roadmap
- [Code of Conduct](CODE_OF_CONDUCT.md) - Community standards

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

## Acknowledgments

Built for the Product Management community using Claude Code's plugin system.

---

**Version:** 0.5.0 | **Author:** [Will Tran](https://github.com/kv0906) | [Twitter](https://twitter.com/will_tran33) | [Website](https://vanthk.com)
