# PM-Kit: Product Operating System (PO-OS)

[![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-blue?style=flat-square)](https://github.com/kv0906/cc-pmkt)
[![Version](https://img.shields.io/badge/version-0.9.0-green?style=flat-square)](https://github.com/kv0906/cc-pmkt/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square)](CONTRIBUTING.md)

**You are not a Product Manager with AI tools.**
**You are a CEO with engineering superpowers.**

PM-Kit is a complete operating system that transforms how you work. Stop writing documents. Start commanding systems.

---

## The Transformation

| Your Old World | Your PO-OS World |
|----------------|------------------|
| Hours writing PRDs from scratch | `/prd` → Complete specifications with technical depth |
| Scattered research across tools | `/research` → Multi-source synthesis with confidence scoring |
| Gut-feel prioritization | `/prioritize` → RICE/ICE/Kano frameworks applied systematically |
| Endless stakeholder debates | `/consensus` → Structured alignment orchestration |
| Manual diagram creation | `/mermaid` → Visual architecture generated on command |
| Administrative busywork | **Strategic thinking at scale** |

**Built on Long Chain-of-Thought methodology** - every command executes 15+ systematic reasoning steps with validation checkpoints.

**See [MANIFESTO.md](MANIFESTO.md) for complete PO-OS philosophy.**

---

## Why PM-Kit?

Because **product work should be strategic, not administrative**.

You don't need another tool. You need an operating system that:
- ✅ **Eliminates repetitive work** - Workflows run automatically
- ✅ **Enforces evidence-based decisions** - Confidence scoring on every insight
- ✅ **Scales your expertise** - Expert-level frameworks at every step
- ✅ **Builds technical literacy** - Learn engineering concepts while working
- ✅ **Keeps you in flow** - One command, complete execution

---

## Installation

### Via Marketplace (Recommended)

```bash
# Add the marketplace
/plugin marketplace add kv0906/cc-pmkt

# Install the plugin (plugin-name@marketplace-name)
/plugin install pm@cc-pmkt

# Restart Claude Code to activate
```

### Zero-Install Testing

To test PM-Kit without installation, clone and work directly:

```bash
# Clone the repository
git clone https://github.com/kv0906/cc-pmkt.git
cd cc-pmkt

# Open in Claude Code - commands work immediately
# No installation required for local testing
```

**Verification Checklist:**
- [ ] Commands appear in `/pm` help
- [ ] `/template` shows template catalog
- [ ] `/skill` shows skill browser
- [ ] Agents execute with proper workflows
- [ ] Output files save to correct directories

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
| `/mermaid` | Create visual diagrams (flows, architecture, Gantt, ERD) that render in modern tools | `/mermaid "Password reset journey"` |
| `/ascii` | Generate text-based diagrams for universal compatibility | `/ascii "Microservices architecture"` |
| `/wireframe` | Create ASCII wireframes for quick UI visualization | `/wireframe "User profile settings page"` |
| `/excalidraw` | Generate hand-drawn style diagrams for presentations | `/excalidraw "System architecture brainstorm"` |
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

### Marketing - Campaign Planning & Content Generation (NEW)

PM-Kit now includes **marketing workflow plugins** with compounding intelligence.

#### CM: Compounding Marketing

| Command | Description | Example |
|---------|-------------|---------|
| `/cm:plan` | Create campaign briefs that learn from past campaigns | `/cm:plan "Q1 Product Launch" --budget 50000 --duration "6 weeks"` |

#### CF: Content Factory

| Command | Description | Example |
|---------|-------------|---------|
| `/cf:generate` | Batch content creation across blog, email, social, video | `/cf:generate "Q1 Launch" --formats "blog,email,social" --quantity "3 blogs, 5 emails, 20 social"` |
| `/cf:repurpose` | Transform one piece into many formats | `/cf:repurpose blog/post.md --into "social" --platforms "linkedin,twitter"` |
| `/cf:schedule` | Create and organize content calendars | `/cf:schedule --period "March 2025" --frequency "2 blogs/week, 5 social/day"` |

**Marketing Agents** (6 specialized reviewers):
- `@brand-voice-guardian` - Brand consistency validation
- `@conversion-optimizer` - Conversion rate optimization
- `@seo-specialist` - SEO optimization
- `@startup-sam-reviewer` - Founder persona feedback
- `@manager-maria-reviewer` - Manager persona feedback
- `@solo-steve-reviewer` - Solopreneur persona feedback

**Compounding Effect**: Each campaign makes the next one faster (Campaign 1: 40hrs → Campaign 10: 10hrs)

**Practice Workspace**: `exercises/markit/` - Marketing agency working for client Planerio

**Quick Start**: Type `/start-mkt` for interactive marketing course or `/help-mkt` for command reference.

### Help & Discovery

| Command | Description |
|---------|-------------|
| `/pm` | Interactive guide to help you choose the right command |
| `/template` | Browse and apply PM-Kit templates |
| `/skill` | Interactive skill browser - learn technical concepts |
| `/start-mkt` | Start marketing workflow course |
| `/help-mkt` | Marketing commands reference |

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
| Create visual diagrams (Mermaid) | `/mermaid` |
| Create text diagrams (ASCII) | `/ascii` |
| Sketch a wireframe | `/wireframe` |
| Create presentation diagrams | `/excalidraw` |
| Understand technical concepts | `/explain-code` |
| Assess feasibility | `/tech-impact` |
| Structure my day | `/today` |
| Run a retrospective | `/retro` |
| Prepare for time off | `/handover` |
| Browse available templates | `/template` |
| Learn a technical concept | `/skill` |

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
| **mermaid-diagrams** | Mermaid syntax, optimization rules, rendering best practices for 7 diagram types |
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
cc-pmkt/
├── .claude-plugin/
│   ├── plugin.json       # Plugin manifest
│   └── marketplace.json  # Marketplace definition
├── commands/             # 21 slash commands
├── agents/               # 14 specialized agents
├── skills/               # 6 educational modules
└── templates/            # Output templates
```

---

## Updating

```bash
# Check for updates
/plugin update pm

# Or reinstall latest version
/plugin uninstall pm
/plugin install pm@cc-pmkt
```

---

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Ways to Contribute

- Report bugs or suggest features via [Issues](https://github.com/kv0906/cc-pmkt/issues)
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

**Version:** 0.9.0 | **Author:** [Will Tran](https://github.com/kv0906) | [Twitter](https://twitter.com/will_tran33) | [Website](https://vanthk.com)
