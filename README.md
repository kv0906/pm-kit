# ClaudeKit PM - Product Management Framework

A comprehensive, AI-enhanced product management system implementing Long Chain-of-Thought methodology for systematic problem-solving, strategic planning, and product development.

## 🚀 Quick Start (5 minutes)

```bash
# Install the CLI
npm install -g pm-kit-cli

# Initialize in your project
cd your-project
pm-kit init

# Start using PM workflows
claude
/prd  # Create your first PRD
```

**New to ClaudeKit PM?** → Read the [Getting Started Guide](docs/guides/GETTING_STARTED.md) for a complete walkthrough.

**One-Line Install:**
```bash
curl -fsSL https://raw.githubusercontent.com/vanlumberworks/pm-kit-cli/main/install.sh | bash
```

## 📚 Documentation

- [Getting Started](docs/guides/GETTING_STARTED.md) - Complete setup guide with examples
- [Installation Guide](docs/guides/INSTALLATION.md) - Detailed installation instructions
- [Commands Reference](docs/reference/COMMANDS.md) - All CLI commands explained
- [Contributing](docs/development/CONTRIBUTING.md) - How to contribute to the project

## Overview

ClaudeKit PM is a **File System As Context** framework that enables Product Managers to leverage AI for complex reasoning chains, systematic validation, and data-driven decision-making. It provides structured workflows, specialized agents, and comprehensive templates for all aspects of product management.

### Key Features

- **Long Chain-of-Thought Reasoning**: Extended reasoning chains with 15+ systematic steps and validation checkpoints
- **Multi-Agent Orchestration**: Specialized agents for problem decomposition, PRD writing, research synthesis, prioritization, and analytics
- **Systematic Validation**: Multi-layer verification at each phase with backtracking capabilities
- **Comprehensive Templates**: Ready-to-use templates for PRDs, decisions, personas, and more
- **File System As Context**: Organized structure that enables efficient AI-enhanced workflows

## System Architecture

```
claude-kit-pm/
├── CLAUDE.md                 # Entry point - guides Claude's behavior
├── .claude/
│   ├── workflows/            # Detailed workflow implementations
│   ├── agents/               # Specialized agent definitions
│   ├── commands/             # Slash commands for quick invocation
│   ├── templates/            # Reusable document templates
│   └── skills/               # Technical literacy modules
├── prds/                     # Product Requirements Documents
│   ├── templates/
│   ├── active/
│   └── archive/
├── specs/                    # Technical specifications
│   ├── technical/
│   └── functional/
├── research/                 # User research and insights
│   ├── user-interviews/
│   ├── surveys/
│   ├── insights/
│   └── personas/
├── roadmaps/                 # Strategic roadmaps
│   ├── quarterly/
│   ├── annual/
│   └── strategic/
├── metrics/                  # KPIs and analytics
│   ├── dashboards/
│   ├── reports/
│   └── analyses/
├── decisions/                # Decision logs and rationale
│   ├── logs/
│   ├── templates/
│   └── reviews/
└── frameworks/               # Reusable PM frameworks
    ├── prioritization/
    ├── analysis/
    └── templates/
```

## Core Workflows

### 1. Problem Decomposition
**Command:** `/decompose [problem statement]`

Systematically breaks down complex product problems using:
- Jobs-to-be-Done analysis
- Problem tree construction
- Root cause investigation
- Stakeholder impact mapping
- Dependency and risk analysis

**Workflow:** `.claude/workflows/problem-decomposition.md`
**Agent:** `.claude/agents/problem-decomposer.md`

### 2. PRD Framework
**Command:** `/prd [feature name]`

Creates comprehensive Product Requirements Documents with:
- Multi-layer validation
- User story generation
- Acceptance criteria
- Technical requirements
- Implementation phasing
- Risk mitigation

**Workflow:** `.claude/workflows/prd-framework.md`
**Agent:** `.claude/agents/prd-writer.md`

### 3. User Research Synthesis
**Command:** `/synthesize [research data]`

Transforms research data into actionable insights through:
- Thematic analysis
- Affinity mapping
- Sentiment analysis
- Pattern recognition
- Persona development
- Opportunity mapping

**Workflow:** `.claude/workflows/user-research-synthesis.md`
**Agent:** `.claude/agents/user-researcher.md`

### 4. Feature Prioritization
**Command:** `/prioritize [feature list]`

Applies multiple prioritization frameworks:
- RICE scoring (Reach × Impact × Confidence / Effort)
- ICE framework (Impact × Confidence × Ease)
- Value vs. Effort matrix
- Kano model analysis
- MoSCoW method
- Weighted scoring

**Workflow:** `.claude/workflows/feature-prioritization.md`
**Agent:** `.claude/agents/prioritization-engine.md`

### 5. Strategic Planning
**Command:** `/strategy [initiative/goal]`

Creates comprehensive strategic plans with:
- Vision and mission alignment
- OKR development
- Roadmap visualization
- Resource allocation
- Risk assessment
- Multi-stakeholder validation

**Workflow:** `.claude/workflows/strategic-planning.md`

### 6. Quick Decisions
**Command:** `/decide [decision]`

Facilitates structured decision-making:
- Decision framing
- Option generation
- Pros/cons analysis
- Risk assessment
- Decision documentation
- Validation planning

## Specialized Agents

| Agent | Description | Location |
|-------|-------------|----------|
| **Problem Decomposer** | Breaks down complex problems using first principles thinking | `.claude/agents/problem-decomposer.md` |
| **PRD Writer** | Creates comprehensive PRDs with multi-layer validation | `.claude/agents/prd-writer.md` |
| **User Researcher** | Synthesizes research data into actionable insights | `.claude/agents/user-researcher.md` |
| **Prioritization Engine** | Applies multiple frameworks with transparent rationale | `.claude/agents/prioritization-engine.md` |
| **Analytics Synthesizer** | Transforms data into insights and predictive analytics | `.claude/agents/analytics-synthesizer.md` |
| **Research Synthesizer** | Multi-source research with confidence scoring | `.claude/agents/research-synthesizer.md` |
| **Consensus Builder** | Stakeholder alignment and consensus protocols | `.claude/agents/consensus-builder.md` |
| **Matrix Generator** | Decision matrices and comparison frameworks | `.claude/agents/matrix-generator.md` |
| **Technical Translator** | Code and architecture translation for PMs | `.claude/agents/technical-translator.md` |
| **Rapid Prototyper** | ASCII wireframes and Mermaid diagrams | `.claude/agents/rapid-prototyper.md` |

## Available Commands

| Command | Description | Agent |
|---------|-------------|-------|
| `/decompose` | Systematic problem decomposition | Problem Decomposer |
| `/prd` | Generate comprehensive PRD | PRD Writer |
| `/synthesize` | Synthesize research into insights | User Researcher |
| `/prioritize` | Apply prioritization frameworks | Prioritization Engine |
| `/strategy` | Create strategic plans | Multi-agent orchestration |
| `/decide` | Quick decision framework | Decision facilitation |
| `/research` | Multi-source research synthesis | Research Synthesizer |
| `/consensus` | Build stakeholder alignment | Consensus Builder |
| `/matrix` | Generate comparison matrices | Matrix Generator |
| `/evidence` | Evidence quality assessment | Evidence-based decision |
| `/architecture` | PM-friendly architecture docs | Technical Translator |
| `/explain-code` | Translate code for PMs | Technical Translator |
| `/tech-impact` | Technical feasibility assessment | Technical Translator |
| `/mockup` | ASCII wireframes | Rapid Prototyper |
| `/flow` | User flow diagrams (Mermaid) | Rapid Prototyper |
| `/design-spec` | Design handoff specifications | Rapid Prototyper |

## Long Chain-of-Thought Methodology

Every workflow implements extended reasoning chains with:

- **Extended Reasoning**: 15+ systematic steps with clear progression
- **Verification Checkpoints**: Multi-layer validation at each major phase
- **Backtracking Mechanisms**: Clear triggers for returning to previous phases
- **Error Correction**: Specific protocols for detecting and fixing common mistakes
- **Multi-Layer Validation**: Internal consistency, stakeholder alignment, strategic fit
- **Practical Templates**: Ready-to-use formats and structures
- **Measurement Systems**: Clear metrics and success criteria

## How to Use

### Getting Started
1. **Review CLAUDE.md**: Understand the system's role and capabilities
2. **Choose a Workflow**: Select based on your current task
3. **Use Commands**: Invoke agents with slash commands
4. **Follow the Process**: Each workflow has detailed phase-by-phase guidance
5. **Validate Outputs**: Use built-in verification checkpoints
6. **Iterate**: Leverage backtracking for continuous refinement

### Example Usage

**Problem Decomposition:**
```
/decompose Users are abandoning the checkout process
```

**Create PRD:**
```
/prd Shopping cart transparency feature
```

**Prioritize Features:**
```
/prioritize Q1 feature backlog
```

**Strategic Planning:**
```
/strategy AI-powered product recommendations
```

**Make Decision:**
```
/decide Should we build vs. buy payment processing?
```

## Workflow Integration

The system is designed for seamless integration:

```
Problem Decomposition → PRD Framework → Prioritization → Strategic Planning
         ↓                    ↓               ↓                ↓
    Research Synthesis → Analytics → Cross-functional → Risk Assessment
```

Each workflow produces outputs that feed into others, creating a cohesive product management system.

## Quick Reference

### When to Use What

| Situation | Command |
|-----------|---------|
| New feature idea | `/decompose` |
| Validated problem | `/prd` |
| Feature backlog | `/prioritize` |
| User feedback | `/synthesize` |
| Strategic initiative | `/strategy` |
| Important decision | `/decide` |
| Technical feasibility | `/tech-impact` |
| Quick mockup | `/mockup` |

### Most Common Workflows

1. **Feature Development**: Problem Decomposition → PRD Framework → Cross-functional Coordination
2. **Strategic Planning**: User Research Synthesis → Feature Prioritization → Strategic Planning
3. **Decision Making**: Quick Decision → Risk Assessment → Documentation

---

**Version:** 1.0
**Created:** 2024-11-21
**Last Updated:** 2024-11-22

For detailed implementation guides, refer to individual workflow and agent documentation in `.claude/`.

---

**Keywords:** claude, product-management, pm, prd, cli, ai, assistant, user-stories, requirements, documentation, research, competitive-analysis
