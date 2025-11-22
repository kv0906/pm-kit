# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Project Overview

ClaudeKit PM is a Product Management framework implementing Long Chain-of-Thought methodology. This is a **framework-only repository** containing markdown files (workflows, agents, commands, templates, skills) that are distributed via the separate `pm-kit-cli` installer.

## Repository Structure

```
framework-repo-setup/
├── .claude/                      # Core framework files
│   ├── commands/      (17)       # Slash commands (/prd, /decompose, etc.)
│   ├── workflows/     (19)       # Long-form workflow implementations
│   ├── agents/        (11)       # Specialized agent definitions
│   ├── templates/     (4)        # Reusable templates
│   └── skills/        (5)        # Technical literacy modules
├── CLAUDE.md                     # This file - primary routing
├── version.json                  # Version tracking and file counts
└── README.md                     # Framework overview
```

**No code to build/test** - This repo contains only markdown framework files.

## Core Architecture

### File System As Context Pattern
All workflows, agents, and prompts are stored as markdown files that Claude reads dynamically. This is the core design pattern.

### Long Chain-of-Thought Methodology
All workflows implement 15+ step reasoning chains with verification checkpoints, multi-phase validation, and backtracking capabilities.

### Multi-Agent Orchestration
Specialized agents in `.claude/agents/`:
- **problem-decomposer.md** - Root cause analysis
- **prd-writer.md** - Requirements documents
- **research-synthesizer.md** / **research-agent.md** - Multi-source research
- **consensus-builder.md** - Stakeholder alignment
- **prioritization-engine.md** - RICE, ICE, Kano frameworks
- **matrix-generator.md** - Decision matrices
- **analytics-synthesizer.md** - Data insights
- **technical-translator.md** - Code translation for PMs
- **rapid-prototyper.md** - ASCII wireframes, Mermaid diagrams
- **user-researcher.md** - User research synthesis

## Slash Commands

Commands are defined in `.claude/commands/`. Key commands:

| Command | Purpose |
|---------|---------|
| `/prd` | Generate comprehensive PRD with validation |
| `/decompose` | Systematic problem decomposition |
| `/research` | Multi-source research synthesis |
| `/research-unified` | Unified research (all types) |
| `/prioritize` | Apply RICE, ICE, Kano frameworks |
| `/decide` | Quick decision framework |
| `/consensus` | Build stakeholder alignment |
| `/matrix` | Generate comparison matrices |
| `/evidence` | Evidence quality assessment |
| `/strategy` | Strategic planning documents |
| `/synthesize` | Synthesize research insights |
| `/architecture` | PM-friendly architecture docs |
| `/explain-code` | Translate code for PMs |
| `/tech-impact` | Technical feasibility assessment |
| `/mockup` | ASCII wireframes |
| `/flow` | User flow diagrams (Mermaid) |
| `/design-spec` | Design handoff specifications |

## Working with This Framework

### When Modifying Workflows
1. Edit markdown files in `.claude/workflows/`
2. Maintain 15+ step reasoning chains with verification checkpoints
3. Include backtracking triggers for returning to previous phases

### When Creating New Agents
1. Add agent definitions to `.claude/agents/`
2. Define responsibilities, capabilities, and invocation triggers
3. Include validation and error correction protocols

### When Adding Slash Commands
1. Create command file in `.claude/commands/`
2. Reference appropriate workflow or agent
3. Define input/output expectations

## Templates

Pre-built templates in `.claude/templates/`:
- `consensus-template.md` - Stakeholder alignment
- `decision-matrix.md` - Decision framework
- `evidence-log.md` - Evidence tracking
- `research-matrix.md` - Research organization

## Skills (Technical Literacy)

Modules in `.claude/skills/` for non-technical PMs:
- `json-fundamentals.md` - JSON basics
- `api-basics.md` - API concepts
- `ascii-diagrams.md` - Text-based diagrams
- `frontend-prompts.md` - Frontend design specs
- `debug-without-code.md` - Debugging strategies