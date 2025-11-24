# Contributing to ClaudeKit PM

Thank you for your interest in contributing to ClaudeKit PM! This document provides guidelines and instructions for contributing to the framework.

## Table of Contents

- [Types of Contributions](#types-of-contributions)
- [Getting Started](#getting-started)
- [Style Guide](#style-guide)
- [Creating New Components](#creating-new-components)
- [Testing Your Changes](#testing-your-changes)
- [Pull Request Process](#pull-request-process)
- [Deprecation Policy](#deprecation-policy)

---

## Types of Contributions

We welcome contributions in several areas:

| Contribution Type | Location | Description |
|-------------------|----------|-------------|
| **Commands** | `.claude/commands/` | Slash commands that PMs invoke directly |
| **Workflows** | `.claude/workflows/` | Detailed 15+ step methodologies |
| **Agents** | `.claude/agents/` | Persona definitions with capabilities |
| **Templates** | `.claude/templates/` | Output document formats |
| **Skills** | `.claude/skills/` | Educational content for non-technical PMs |
| **Documentation** | Root files | README, guides, etc. |
| **Bug Reports** | GitHub Issues | Report problems or inconsistencies |
| **Feature Requests** | GitHub Issues | Suggest new commands or workflows |

---

## Getting Started

### Prerequisites

- Git
- A text editor (VS Code recommended for markdown preview)
- Basic understanding of markdown
- Familiarity with product management concepts

### Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/pm-kit.git
   cd pm-kit
   ```
3. Create a branch for your contribution:
   ```bash
   git checkout -b feature/your-feature-name
   ```

---

## Style Guide

### File Naming

| Component | Convention | Example |
|-----------|------------|---------|
| Commands | `kebab-case.md` | `feature-request.md` |
| Workflows | `kebab-case.md` | `user-research-synthesis.md` |
| Agents | `kebab-case.md` | `problem-decomposer.md` |
| Templates | `kebab-case.md` | `decision-matrix.md` |
| Skills | `kebab-case.md` | `api-basics.md` |

### Command Structure

All commands must follow this structure:

```markdown
---
description: Brief one-line description (shown in command menu)
---

# Command Title

You are acting as the **[Agent Name] Agent** for this task.

## Your Task

[Description of what this command does]

**Input**: {{input}}

## Your Process

### Phase 1: [Phase Name]
1. Step 1
2. Step 2
3. **Verification**: [Checkpoint question]

### Phase 2: [Phase Name]
...

## Output Locations

- **Primary Output**: `./path/to/output.md`

## Quality Checklist

Before finalizing:
- [ ] Criterion 1
- [ ] Criterion 2

---

## Next Steps

After completing this task, consider:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| [Action] | `/command` | [Context] |

---

Begin [task] now.
```

### Workflow Structure

Workflows should include:

1. **Overview section** with purpose, when to use, and outputs
2. **Multiple phases** (typically 4-6 phases)
3. **15+ total steps** across all phases
4. **Verification checkpoints** at each phase end
5. **Backtracking triggers** - when to return to previous phases
6. **Quality checklist** before finalization

### Agent Structure

Agents should define:

1. **Purpose** - One paragraph describing the agent's role
2. **Core Capabilities** - 5-7 specific abilities with details
3. **Analysis/Validation Protocols** - How the agent validates work
4. **Input/Output Artifacts** - What it receives and produces
5. **Integration Points** - How it works with other agents
6. **Success Criteria** - When the agent's work is complete

### Writing Style

- Use **active voice** and **imperative mood** in instructions
- Be **specific** - avoid vague phrases like "consider various factors"
- Include **examples** where helpful
- Use **tables** for structured information
- Use **ASCII diagrams** for visual concepts
- Include **verification checkpoints** throughout

### Markdown Conventions

- Use `#` for main title, `##` for sections, `###` for subsections
- Use `**bold**` for emphasis on key terms
- Use `` `backticks` `` for file paths, commands, and code
- Use `>` blockquotes for important notes or warnings
- Use `-` for unordered lists, `1.` for ordered lists
- Use `- [ ]` for checklists

---

## Creating New Components

### Adding a New Command

1. Create file in `.claude/commands/your-command.md`
2. Follow the [command structure](#command-structure) above
3. Reference an existing agent or create a new one
4. Include "Next Steps" section
5. Update `README.md` command tables
6. Update `CLAUDE.md` command list
7. Update `version.json` file counts

### Adding a New Workflow

1. Create file in `.claude/workflows/your-workflow.md`
2. Ensure 15+ steps across multiple phases
3. Include verification checkpoints at each phase
4. Add backtracking triggers
5. Update `version.json` file counts

### Adding a New Agent

1. Create file in `.claude/agents/your-agent.md`
2. Define capabilities, protocols, and success criteria
3. Update `CLAUDE.md` agent list
4. Update `version.json` file counts

### Adding a New Skill

Skills are educational content, not commands. They should:

1. Explain concepts clearly for non-technical readers
2. Include practical examples
3. Provide quick reference cards
4. Link to related skills
5. Update `version.json` file counts

---

## Testing Your Changes

Since ClaudeKit PM is a markdown-only framework, "testing" means validation:

### Manual Validation Checklist

- [ ] **Syntax**: Markdown renders correctly (use VS Code preview)
- [ ] **Links**: All internal links work
- [ ] **Structure**: Follows the style guide for component type
- [ ] **Completeness**: All required sections present
- [ ] **Consistency**: Terminology matches existing components
- [ ] **Quality**: Content is clear, specific, and actionable

### Testing Commands

1. Install the framework in a test project
2. Invoke your command with sample input
3. Verify the output matches expectations
4. Check that "Next Steps" suggestions make sense

### Cross-Reference Check

Ensure your contribution doesn't break existing references:

```bash
# Find all references to a file
grep -r "your-file-name" .
```

---

## Pull Request Process

### Before Submitting

1. **Self-review** your changes against the style guide
2. **Test** your changes as described above
3. **Update documentation** (README, CLAUDE.md, version.json)
4. **Write clear commit messages**

### Commit Message Format

```
type(scope): brief description

- Detail 1
- Detail 2
```

Types: `feat`, `fix`, `docs`, `refactor`, `deprecate`

Examples:
```
feat(commands): add /stakeholder-map command

- Creates stakeholder influence matrix
- Includes communication planning
- References consensus-builder agent
```

```
deprecate(commands): consolidate research commands into /research

- /evidence now redirects to /research
- Added migration guide
- Updated README and CLAUDE.md
```

### PR Requirements

Your PR should include:

- [ ] Clear description of changes
- [ ] Link to related issue (if applicable)
- [ ] Updated documentation (README, CLAUDE.md)
- [ ] Updated version.json (if adding/removing files)
- [ ] Follows style guide
- [ ] Self-tested

### Review Process

1. Submit PR with description
2. Maintainers review within 3-5 business days
3. Address feedback if requested
4. Maintainers merge when approved

---

## Deprecation Policy

When consolidating or removing components:

### Do NOT Delete Files

Instead, add a deprecation notice:

```markdown
# Component Title

> **DEPRECATED**: This [command/agent/workflow] has been consolidated into `[replacement]`.
>
> [Explanation of what changed]
>
> **Please use `[replacement]` instead.**

---

## Migration Guide

| Old Usage | New Usage |
|-----------|-----------|
| `/old-command` | `/new-command` |

---

# Legacy Documentation (Below)

[Original content preserved]
```

### Update References

1. Update `CLAUDE.md` to mark as deprecated
2. Update `README.md` if command is listed
3. Add to `deprecatedFiles` in `version.json`
4. Update `CHANGELOG.md`

### Minimum Deprecation Period

Deprecated components remain for at least **2 minor versions** before removal consideration.

---

## Questions?

- Open a [GitHub Issue](https://github.com/vanlumberworks/pm-kit/issues) for questions
- Tag issues with `question` label

---

## Recognition

Contributors are recognized in:
- Release notes
- CHANGELOG.md (for significant contributions)

Thank you for contributing to ClaudeKit PM!
