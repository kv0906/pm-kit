# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Project Overview

ClaudeKit PM is a comprehensive Product Management framework implementing Long Chain-of-Thought methodology. It's distributed as a CLI installer (`pm-kit-cli`) that provides AI-enhanced PM workflows through structured prompts, specialized agents, and slash commands.

## Development Commands

```bash
# Package Management (use pnpm)
pnpm install              # Install dependencies
pnpm test                 # Run tests with Jest
pnpm test:watch           # Run tests in watch mode
pnpm test:coverage        # Generate coverage report
pnpm lint                 # Lint code with ESLint
pnpm lint:fix             # Fix linting issues
pnpm format               # Format code with Prettier
pnpm prepublishOnly       # Pre-publish validation (test + lint)
```

## Repository Structure

This is a **framework/toolkit repository**, NOT a traditional CLI application. The `pm-kit-cli` package (defined in package.json) will eventually be implemented to install these framework files into user projects.

```
claude-kit-pm/
├── .claude/                      # Core framework files
│   ├── commands/                 # Slash commands (/prd, /decompose, etc.)
│   ├── workflows/                # Long-form workflow implementations
│   ├── agents/                   # Specialized agent definitions
│   └── templates/                # Reusable templates
├── prds/                         # Example/template PRDs
├── research/                     # Example research artifacts
├── decisions/                    # Example decision logs
├── templates/                    # User-facing templates
├── learning/                     # Educational content
├── workspace/                    # Workspace examples
├── CLAUDE.md                     # This file - primary routing
├── docs/                         # Organized documentation
│   ├── guides/                   # User-facing guides
│   ├── reference/                # Technical references (ARCHITECTURE.md, COMMANDS.md)
│   ├── development/              # Developer resources (USER_WORKFLOW.md, CONTRIBUTING.md)
│   ├── operations/               # Operational docs (SECURITY.md, CHANGELOG.md)
│   └── status/                   # Project status documents
└── package.json                  # CLI package definition (not yet implemented)
```

**Note**: The `bin/` and `lib/` directories mentioned in package.json do not exist yet. The current repository contains the framework files that will be distributed by the future CLI tool.

## Core Architecture

### 1. File System As Context Pattern
This framework uses the file system as an AI context mechanism. All workflows, agents, and prompts are stored as markdown files that Claude reads dynamically.

### 2. Long Chain-of-Thought Methodology
All workflows implement extended reasoning chains with:
- 15+ systematic steps with verification checkpoints
- Multi-phase validation and backtracking capabilities
- Error correction mechanisms
- Cross-validation between components

### 3. Multi-Agent Orchestration
Specialized agents handle specific PM tasks:
- **Problem Decomposer** (`.claude/agents/problem-decomposer.md`) - Root cause analysis
- **PRD Writer** (`.claude/agents/prd-writer.md`) - Comprehensive requirements docs
- **Research Synthesizer** (`.claude/agents/research-synthesizer.md`) - Multi-source research
- **Consensus Builder** (`.claude/agents/consensus-builder.md`) - Stakeholder alignment
- **Prioritization Engine** (`.claude/agents/prioritization-engine.md`) - Framework-based prioritization
- **Matrix Generator** (`.claude/agents/matrix-generator.md`) - Decision matrices
- **Analytics Synthesizer** (`.claude/agents/analytics-synthesizer.md`) - Data insights
- **Technical Translator** (`.claude/agents/technical-translator.md`) - Architecture & code translation for non-technical PMs
- **Rapid Prototyper** (`.claude/agents/rapid-prototyper.md`) - ASCII wireframes, Mermaid diagrams, design specs

## Workflow Files

All workflows implement 15+ step reasoning chains with validation checkpoints:

- `problem-decomposition.md` - Root cause analysis, Jobs-to-be-Done framework
- `prd-framework.md` - Multi-layer PRD validation
- `strategic-planning.md` - OKR development, roadmap visualization
- `feature-prioritization.md` - RICE, ICE, Kano, MoSCoW frameworks
- `user-research-synthesis.md` - Thematic analysis, persona development
- `research-synthesis.md` - Multi-source research with confidence scoring
- `consensus-report.md` - Stakeholder alignment protocols
- `matrix-generation.md` - Comparison matrices and decision tables
- `evidence-based-decision.md` - Systematic data-driven decisions
- `metrics-analytics.md` - KPI tracking and analytics
- `stakeholder-management.md` - Communication and alignment strategies
- `cross-functional.md` - Team coordination workflows
- `risk-assessment.md` - Risk identification and mitigation
- `documentation-standards.md` - Quality assurance protocols
- `architecture-documentation.md` - System architecture exploration and PM-friendly documentation
- `technical-translation.md` - Code and technical concept translation for PMs
- `rapid-prototyping.md` - Low-fidelity prototype creation (ASCII, Mermaid)
- `design-handoff.md` - Comprehensive design specification and handoff

## Output Directories

When workflows generate artifacts, they should be saved to:
- `./prds/` - Product Requirements Documents
- `./research/` - User Research & Market Analysis
- `./decisions/` - Decision Logs & Rationale
- `./decisions/tech-impact/` - Technical impact assessments
- `./docs/architecture/` - System architecture documentation
- `./prototypes/mockups/` - ASCII wireframes and mockups
- `./prototypes/flows/` - User flow diagrams (Mermaid)
- `./prototypes/design-specs/` - Design handoff specifications
- `./outputs/research-reports/` - Research synthesis findings
- `./outputs/consensus-reports/` - Stakeholder alignment docs
- `./outputs/decision-matrices/` - Comparison matrices
- `./outputs/evidence-logs/` - Evidence quality assessments

## Available Commands

### Core PM Commands
- `/decompose` - Systematic problem decomposition with visual trees
- `/prd` - Generate comprehensive PRD with validation
- `/synthesize` - Synthesize research data into actionable insights
- `/prioritize` - Apply prioritization frameworks to features
- `/strategy` - Create strategic planning documents
- `/decide` - Quick decision framework with clear rationale
- `/research` - Comprehensive multi-source research synthesis with confidence scoring
- `/consensus` - Build stakeholder consensus and create alignment reports
- `/matrix` - Generate comparison matrices and decision frameworks
- `/evidence` - Gather and assess evidence quality for data-driven decisions

### Technical Understanding Commands
- `/architecture` - Generate PM-friendly system architecture documentation with diagrams
- `/explain-code` - Translate code and technical concepts into plain English
- `/tech-impact` - Assess technical feasibility and impact of proposed features

### Rapid Prototyping Commands
- `/mockup` - Generate ASCII wireframes and low-fidelity mockups
- `/flow` - Create user flow diagrams and journey maps using Mermaid
- `/design-spec` - Generate comprehensive design handoff specifications

## Working with This Framework

### When Modifying Workflows
1. Workflows are markdown files in `.claude/workflows/`
2. Each workflow implements 15+ step reasoning chains
3. Maintain verification checkpoints and backtracking mechanisms
4. Follow the Long Chain-of-Thought methodology

### When Creating New Agents
1. Add agent definitions to `.claude/agents/`
2. Define clear responsibilities and capabilities
3. Specify when the agent should be invoked
4. Include validation and error correction protocols

### When Adding Slash Commands
1. Create command file in `.claude/commands/`
2. Reference appropriate workflow or agent
3. Define clear input/output expectations
4. Test command invocation and output generation

## Implementation Status

**Note**: This repository currently contains the framework files only. The CLI installer (`pm-kit-cli`) that will distribute these files to user projects is **not yet implemented**. The `bin/` and `lib/` directories referenced in `package.json` need to be created.

### Future CLI Implementation Roadmap
When implementing the CLI tool, create:
- `bin/pm-kit.js` - CLI entry point
- `lib/commands/init.js` - Initialize project with framework files
- `lib/commands/update.js` - Update framework files from repository
- `lib/commands/doctor.js` - Run diagnostics and health checks
- `lib/utils/` - GitHub integration, file management, configuration

See `docs/reference/ARCHITECTURE.md` for detailed implementation specifications.

## Key Design Principles

1. **File System As Context** - All knowledge stored as markdown files for AI consumption
2. **Long Chain-of-Thought** - 15+ step reasoning with validation checkpoints
3. **Multi-Layer Verification** - Systematic validation at each phase
4. **Backtracking Capability** - Clear triggers for returning to previous phases
5. **Agent Specialization** - Purpose-built agents for specific PM tasks
6. **Transparent Rationale** - All decisions documented with clear reasoning

## Templates

Pre-built templates are available in `./templates/`:
- `prd-template.md` - Standard product requirements format
- `api-test-template.md` - Test case structure
- `research-template.md` - User research documentation
- `problem-tree-template.md` - Decomposition framework
- `prototype-prompt-template.md` - Frontend design specifications
- `architecture-doc-template.md` - PM-friendly architecture documentation format
- `tech-impact-template.md` - Technical impact assessment structure

## Important References

- **docs/reference/ARCHITECTURE.md** - Detailed technical architecture for CLI implementation
- **docs/development/USER_WORKFLOW.md** - End-user workflow and installation guide
- **docs/README.md** - Documentation index and navigation
- **README.md** - Comprehensive framework overview and methodology

## Common Workflows

### Core PM Workflows
**Creating a PRD**: `/prd [feature name]` → Generates comprehensive PRD in `./prds/`
**Problem Analysis**: `/decompose [problem]` → Creates problem tree with root cause analysis
**Feature Prioritization**: `/prioritize [feature list]` → Applies RICE, ICE, Kano frameworks
**Research Synthesis**: `/research [topic]` → Multi-source research with confidence scoring
**Decision Making**: `/decide [decision]` → Structured decision framework with documentation

### Technical Understanding Workflows
**Architecture Documentation**: `/architecture [system/feature]` → PM-friendly architecture docs in `./docs/architecture/`
**Code Translation**: `/explain-code [file path or concept]` → Plain English explanations
**Technical Feasibility**: `/tech-impact [proposed feature]` → Impact assessment in `./decisions/tech-impact/`

### Rapid Prototyping Workflows
**Quick Wireframes**: `/mockup [feature/screen]` → ASCII mockups in `./prototypes/mockups/`
**User Flows**: `/flow [user journey]` → Mermaid diagrams in `./prototypes/flows/`
**Design Handoff**: `/design-spec [feature]` → Complete design specs in `./prototypes/design-specs/`

---

**For detailed methodology and best practices**, refer to the extensive documentation in README.md and individual workflow files in `.claude/workflows/`.
- always organize markdown file in /docs folder please