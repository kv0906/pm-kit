# PM-Kit - Product Management Framework for Claude Code

A comprehensive, AI-enhanced product management plugin implementing Long Chain-of-Thought methodology for systematic problem-solving, strategic planning, and product development.

## Quick Start

### Install as Claude Code Plugin

```bash
# Start Claude Code
claude

# Add the marketplace
/plugin marketplace add vanlumberworks/pm-kit

# Install the plugin
/plugin install pm-kit@pm-tools

# Restart Claude Code, then start using PM commands
/pm   # Get help choosing the right command
/prd  # Create your first PRD
```

### Alternative: Direct Installation

```bash
/plugin install vanlumberworks/pm-kit
```

---

## How It Works: The Simple Mental Model

PM-Kit gives you two things:

| Type | Purpose | When to Use |
|------|---------|-------------|
| **Commands** | Produce deliverables | "I need to do something" |
| **Skills** | Learn concepts | "I need to understand something" |

That's it. Everything else (agents) happens automatically under the hood.

---

## Commands by Activity Phase

### Discovery - Understanding the Problem

| Command | What It Does | Example |
|---------|--------------|---------|
| `/decompose` | Break down complex problems into root causes | `/decompose "Why are users abandoning checkout?"` |
| `/research` | Gather and synthesize research from multiple sources | `/research "Should we build a mobile app?"` |

### Definition - Specifying the Solution

| Command | What It Does | Example |
|---------|--------------|---------|
| `/prd` | Generate comprehensive Product Requirements Document | `/prd "Shopping cart transparency feature"` |
| `/flow` | Create user flow diagrams (Mermaid) | `/flow "Password reset journey"` |
| `/mockup` | Generate ASCII wireframes | `/mockup "User profile page"` |
| `/diagram` | Generate ASCII diagrams (flows, architecture, timelines) | `/diagram "checkout process flow"` |
| `/design-spec` | Create design handoff specifications | `/design-spec "Checkout redesign"` |

### Decision - Making Choices

| Command | What It Does | Example |
|---------|--------------|---------|
| `/prioritize` | Apply RICE, ICE, Kano frameworks to features | `/prioritize "Q1 feature backlog"` |
| `/decide` | Quick decision framework with structured analysis | `/decide "Build vs buy payment processing?"` |
| `/matrix` | Generate comparison matrices | `/matrix "CRM vendor comparison"` |
| `/consensus` | Build stakeholder alignment | `/consensus "API pricing strategy"` |

### Communication - Sharing with Others

| Command | What It Does | Example |
|---------|--------------|---------|
| `/strategy` | Create comprehensive strategic planning documents | `/strategy "AI-powered recommendations"` |
| `/architecture` | Generate PM-friendly architecture documentation | `/architecture "Payment system"` |
| `/explain-code` | Translate code concepts for non-technical PMs | `/explain-code "What does this API do?"` |
| `/tech-impact` | Assess technical feasibility of features | `/tech-impact "Real-time notifications"` |

---

## Quick Reference: "I need to..."

| I need to... | Use this command |
|--------------|------------------|
| Understand why something is broken | `/decompose` |
| Research a question or decision | `/research` |
| Write product requirements | `/prd` |
| Prioritize my backlog | `/prioritize` |
| Make a quick decision | `/decide` |
| Compare options side-by-side | `/matrix` |
| Get stakeholder buy-in | `/consensus` |
| Plan a strategic initiative | `/strategy` |
| Create an ASCII diagram | `/diagram` |
| Create a wireframe sketch | `/mockup` |
| Map out a user journey | `/flow` |
| Understand technical concepts | `/explain-code` |
| Assess if something is feasible | `/tech-impact` |

---

## Skills (For Learning)

Skills are educational modules for non-technical PMs. They're automatically available when the plugin is installed.

| Skill | What You'll Learn |
|-------|-------------------|
| `api-basics` | How APIs work, HTTP methods, status codes |
| `json-fundamentals` | Reading and understanding JSON data |
| `debug-without-code` | Debugging strategies without writing code |
| `frontend-prompts` | Specifying frontend design requirements |
| `ascii-diagrams` | Creating ASCII diagrams and wireframes |

---

## Typical Workflows

### New Feature Development
```
/decompose "user problem"     # Understand the problem
       |
/research "solution approaches"   # Research options
       |
/prd "feature name"           # Write requirements
       |
/prioritize "feature list"    # Score and prioritize
       |
/consensus "stakeholders"     # Get alignment
```

### Strategic Planning
```
/research "market opportunity"    # Gather insights
       |
/strategy "initiative"            # Create strategy doc
       |
/prioritize "initiatives"         # Prioritize efforts
       |
/consensus "leadership"           # Align stakeholders
```

### Quick Decision
```
/decide "the decision"        # Frame the decision
       |
/matrix "options"             # Compare options
       |
/consensus "approvers"        # Get buy-in
```

---

## Key Features

- **Long Chain-of-Thought Reasoning**: Every command runs 15+ systematic steps with validation checkpoints
- **Multi-Layer Validation**: Internal consistency, stakeholder alignment, and strategic fit checks
- **Backtracking Support**: Commands can revisit earlier phases when issues are found
- **Practical Templates**: Ready-to-use output formats

---

## Plugin Structure

PM-Kit follows Claude Code plugin conventions:

```
pm-kit/
├── .claude-plugin/
│   ├── plugin.json       # Plugin manifest
│   └── marketplace.json  # Marketplace definition
├── commands/             # 16 slash commands
├── agents/               # 11 specialized agents
├── skills/               # 5 educational modules
├── templates/            # Output document formats
└── archived-workflows/   # Legacy reference
```

**How it works:**
1. PM invokes a command (e.g., `/prd`)
2. Command delegates to an agent with embedded workflow
3. Agent executes 15+ step methodology with verification checkpoints
4. Output uses templates for consistent formatting

---

## Documentation

- [Contributing Guide](CONTRIBUTING.md) - How to contribute to the project
- [Changelog](CHANGELOG.md) - Version history and changes
- [Development Roadmap](PLAN.md) - Project roadmap and knowledge base
- [Code of Conduct](CODE_OF_CONDUCT.md) - Community standards

---

## Output Locations

When using PM-Kit, your outputs will be saved to:

```
your-project/
├── prds/                     # PRD documents
├── research/                 # Research outputs
├── decisions/                # Decision logs
├── roadmaps/                 # Strategic roadmaps
└── metrics/                  # KPIs and analytics
```

---

## Updating the Plugin

```bash
# Check for updates
/plugin update pm-kit

# Or reinstall
/plugin uninstall pm-kit
/plugin install pm-kit@pm-tools
```

---

**Version:** 0.4.0
**Created:** 2024-11-21
**Last Updated:** 2025-11-24

---

**Keywords:** claude-code, plugin, product-management, pm, prd, research, prioritization, decision-matrix, stakeholder-alignment
