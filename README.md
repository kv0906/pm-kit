# ClaudeKit PM - Product Management Framework

A comprehensive, AI-enhanced product management system implementing Long Chain-of-Thought methodology for systematic problem-solving, strategic planning, and product development.

## Quick Start (5 minutes)

```bash
# Install the CLI
npm install -g pm-kit-cli

# Initialize in your project
cd your-project
pm-kit init

# Start using PM workflows
claude
/pm   # Get help choosing the right command
/prd  # Create your first PRD
```

**One-Line Install:**
```bash
curl -fsSL https://raw.githubusercontent.com/vanlumberworks/pm-kit-cli/main/install.sh | bash
```

---

## How It Works: The Simple Mental Model

ClaudeKit PM gives you two things:

| Type | Purpose | When to Use |
|------|---------|-------------|
| **Commands** | Produce deliverables | "I need to do something" |
| **Skills** | Learn concepts | "I need to understand something" |

That's it. Everything else (agents, workflows) happens automatically under the hood.

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

Skills are educational modules for non-technical PMs. Read them when you need to understand a concept.

| Skill | What You'll Learn |
|-------|-------------------|
| `api-basics.md` | How APIs work, HTTP methods, status codes |
| `json-fundamentals.md` | Reading and understanding JSON data |
| `debug-without-code.md` | Debugging strategies without writing code |
| `frontend-prompts.md` | Specifying frontend design requirements |

**Location:** `.claude/skills/`

> **Note:** ASCII diagrams are now a command! Use `/diagram` to generate them on demand.

---

## Typical Workflows

### New Feature Development
```
/decompose "user problem"     # Understand the problem
       ↓
/research "solution approaches"   # Research options
       ↓
/prd "feature name"           # Write requirements
       ↓
/prioritize "feature list"    # Score and prioritize
       ↓
/consensus "stakeholders"     # Get alignment
```

### Strategic Planning
```
/research "market opportunity"    # Gather insights
       ↓
/strategy "initiative"            # Create strategy doc
       ↓
/prioritize "initiatives"         # Prioritize efforts
       ↓
/consensus "leadership"           # Align stakeholders
```

### Quick Decision
```
/decide "the decision"        # Frame the decision
       ↓
/matrix "options"             # Compare options
       ↓
/consensus "approvers"        # Get buy-in
```

---

## Key Features

- **Long Chain-of-Thought Reasoning**: Every command runs 15+ systematic steps with validation checkpoints
- **Multi-Layer Validation**: Internal consistency, stakeholder alignment, and strategic fit checks
- **Backtracking Support**: Commands can revisit earlier phases when issues are found
- **Practical Templates**: Ready-to-use output formats

---

## Under the Hood (For Contributors)

ClaudeKit PM uses a **File System As Context** architecture aligned with Claude Code patterns:

```
.claude/
├── commands/           # Entry points (what PMs invoke)
├── agents/             # Complete agents with embedded workflows
├── templates/          # Output document formats
├── skills/             # Educational content
└── archived-workflows/ # Legacy workflows (for reference)
```

**How it works (v0.3.0):**
1. PM invokes a command (e.g., `/prd`)
2. Command delegates to an agent with embedded workflow
3. Agent executes 15+ step methodology with verification checkpoints
4. Output uses templates for consistent formatting

**Claude Code Patterns:**
- Commands use `$ARGUMENTS` placeholder for user input
- Agents have YAML frontmatter: `name`, `description`, `tools`, `model`
- Workflows are embedded directly in agent files (not separate)

For contribution guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md).

---

## Documentation

- [Contributing Guide](CONTRIBUTING.md) - How to contribute to the project
- [Changelog](CHANGELOG.md) - Version history and changes
- [Development Roadmap](PLAN.md) - Project roadmap and knowledge base
- [Code of Conduct](CODE_OF_CONDUCT.md) - Community standards

---

## Project Structure (After Installation)

```
your-project/
├── .claude/                  # Framework files (installed by pm-kit)
├── prds/                     # Your PRD documents
├── research/                 # Research outputs
├── decisions/                # Decision logs
├── roadmaps/                 # Strategic roadmaps
└── metrics/                  # KPIs and analytics
```

---

**Version:** 0.3.0
**Created:** 2024-11-21
**Last Updated:** 2025-11-24

---

**Keywords:** claude, product-management, pm, prd, cli, ai, assistant, user-stories, requirements, documentation, research, competitive-analysis
