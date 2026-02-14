# Contributing to PM-Kit

Thank you for your interest in contributing to PM-Kit! This is an open-source Claude Code plugin that empowers Product Managers with AI-augmented systematic thinking.

## Table of Contents

- [Types of Contributions](#types-of-contributions)
- [Getting Started](#getting-started)
- [Architecture Overview](#architecture-overview)
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
| **Commands** | `commands/` | Slash commands that PMs invoke directly |
| **Agents** | `agents/` | Specialized agents with embedded workflows |
| **Skills** | `skills/[name]/SKILL.md` | Educational content for PMs |
| **Templates** | `templates/` | Output document formats |
| **Documentation** | Root files | README, CLAUDE.md, etc. |
| **Bug Reports** | GitHub Issues | Report problems or inconsistencies |
| **Feature Requests** | GitHub Issues | Suggest new commands or improvements |

---

## Getting Started

### Prerequisites

- Git
- A text editor (VS Code recommended for markdown preview)
- Claude Code installed
- Basic understanding of markdown
- Familiarity with product management concepts

### Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/cc-pmkt.git
   cd cc-pmkt
   ```
3. Create a branch for your contribution:
   ```bash
   git checkout -b feature/your-feature-name
   ```

### Testing Locally

To test your changes in Claude Code:

```bash
# Install your local fork as a plugin
cd your-project
# Copy or symlink pm-kit to test
```

---

## Architecture Overview

PM-Kit uses a **2-layer architecture**:

```
User invokes:       Command delegates to:
┌────────────┐     ┌────────────────────────────────┐
│  /command  │ ──> │ Agent (with embedded workflow) │ ──> Output
└────────────┘     └────────────────────────────────┘
```

### Key Patterns

| Pattern | Description |
|---------|-------------|
| Commands use `$ARGUMENTS` | Placeholder for user input |
| Agents have YAML frontmatter | `name`, `description`, `tools`, `model` |
| "Use PROACTIVELY" in descriptions | Enables auto-delegation |
| Skills use `SKILL.md` format | In subdirectories for plugin discovery |
| Workflows embedded in agents | Single-file agents, no separate workflow files |

---

## Style Guide

### File Naming

| Component | Convention | Example |
|-----------|------------|---------|
| Commands | `kebab-case.md` | `northstar.md` |
| Agents | `kebab-case.md` | `daily-planner.md` |
| Templates | `kebab-case.md` | `decision-matrix.md` |
| Skills | `skill-name/SKILL.md` | `api-basics/SKILL.md` |

### Command Structure

All commands must follow this structure:

```markdown
---
description: Brief one-line description (shown in command menu)
---

# Command Title

[Description of what this command does]

**Input**: $ARGUMENTS

## Instructions

Use the **[Agent Name] Agent** (`agents/[agent-name].md`) to complete this task.

The agent will guide you through:
1. **Phase 1** - Description
2. **Phase 2** - Description
...

## Output

Save output to: `./path/to/output-[date].md`

## Output Structure

Your output must include:
- Section 1
- Section 2
...

---

## Next Steps

After completing this task:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| [Action] | `/command` | [Context] |

---

Begin [task] now.
```

### Agent Structure

Agents should include YAML frontmatter and embedded workflow:

```markdown
---
name: agent-name
description: Role description. Use PROACTIVELY when [trigger condition].
tools: Read, Write, Glob, Grep
model: sonnet
---

# Agent Name Agent

You are an expert [role] implementing Long Chain-of-Thought methodology with [approach].

## Core Capabilities

1. **Capability** - Description
2. **Capability** - Description
...

## Workflow Process

### Phase 1: [Phase Name]

**Step 1.1: [Step Name]**
- Action item
- Action item
- **Verification**: [Checkpoint question]

**Step 1.2: [Step Name]**
- Action item
- **Gate**: [Gate condition]

### Phase 2: [Phase Name]
...

### Phase N: Documentation

Generate output following this structure:

```markdown
[Template structure]
```

**Output Location**: `./path/to/output.md`

## Backtracking Triggers

Return to earlier phases if:
- Condition 1
- Condition 2

## Quality Checklist

**Before finalizing:**
- [ ] Checklist item
- [ ] Checklist item

## Output Artifacts

1. **Artifact Name** - Description
2. **Artifact Name** - Description
```

### Skill Structure

Skills are educational modules in `skills/[name]/SKILL.md`:

```markdown
# Skill Title

## Overview

[What this skill teaches]

## Key Concepts

### Concept 1
[Explanation with examples]

### Concept 2
[Explanation with examples]

## Quick Reference

[Cheat sheet or summary table]

## Related Skills

- [Link to related skill]
```

### Writing Style

- Use **active voice** and **imperative mood** in instructions
- Be **specific** - avoid vague phrases like "consider various factors"
- Include **examples** where helpful
- Use **tables** for structured information
- Use **ASCII diagrams** for visual concepts
- Include **verification checkpoints** throughout workflows

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

1. Create file in `commands/your-command.md`
2. Follow the [command structure](#command-structure) above
3. Use `$ARGUMENTS` placeholder for user input
4. Reference an existing agent or create a new one
5. Include "Next Steps" section at the end
6. Update `README.md` command tables
7. Update `CLAUDE.md` command list
8. Update `PLAN.md` component counts

### Adding a New Agent

1. Create file in `agents/your-agent.md`
2. Add YAML frontmatter with required fields:
   ```yaml
   ---
   name: your-agent
   description: Description. Use PROACTIVELY when [trigger].
   tools: Read, Write, Glob, Grep
   model: sonnet
   ---
   ```
3. Embed the complete workflow (15+ steps across phases)
4. Include verification checkpoints at each phase
5. Add backtracking triggers and quality checklist
6. Update `CLAUDE.md` agent list
7. Update `PLAN.md` component counts

### Adding a New Skill

1. Create subdirectory in `skills/` with skill name
2. Create `SKILL.md` file inside
3. Follow the [skill structure](#skill-structure) above
4. Skills are auto-discovered by the plugin system
5. Update `README.md` skills table

### Adding a New Template

1. Create file in `templates/your-template.md`
2. Use clear section headers
3. Include placeholder text showing what goes where
4. Update `CLAUDE.md` templates list

---

## Testing Your Changes

Since PM-Kit is a markdown-only framework, "testing" means validation:

### Manual Validation Checklist

- [ ] **Syntax**: Markdown renders correctly (use VS Code preview)
- [ ] **Links**: All internal links work
- [ ] **Structure**: Follows the style guide for component type
- [ ] **Completeness**: All required sections present
- [ ] **Consistency**: Terminology matches existing components
- [ ] **Quality**: Content is clear, specific, and actionable
- [ ] **Frontmatter**: YAML frontmatter is valid (for agents)

### Testing Commands in Claude Code

1. Install pm-kit in a test project
2. Invoke your command with sample input
3. Verify the output matches expectations
4. Check that "Next Steps" suggestions make sense
5. Test agent auto-delegation if applicable

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
3. **Update documentation** (README.md, CLAUDE.md, PLAN.md)
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
- References new stakeholder-mapper agent
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
- [ ] `## Changelog Entry` section in the PR body (required)
- [ ] Updated documentation (README.md, CLAUDE.md)
- [ ] Updated PLAN.md component counts (if adding/removing files)
- [ ] Follows style guide
- [ ] Self-tested in Claude Code

### Changelog Workflow (Required)

Every merged PR to `main` is automatically written into `CHANGELOG.md`.

To make this useful for releases:

1. Add a `## Changelog Entry` section in your PR body.
2. Write 2-4 clear bullets focused on user impact.
3. Include breaking-change notes when relevant.
4. Avoid placeholders such as "TBD" or "N/A" (CI checks this).

GitHub Actions will:
- Validate your PR includes a non-empty changelog entry section.
- Auto-label the PR based on changed paths.
- Append a changelog entry when the PR is merged into `main`.

### Review Process

1. Submit PR with description
2. Maintainers review within 3-5 business days
3. Address feedback if requested
4. Maintainers merge when approved

---

## Deprecation Policy

When consolidating or removing components:

### Do NOT Delete Files

Instead, add a deprecation notice at the top:

```markdown
---
description: [DEPRECATED] Use /new-command instead
---

# Command Title

> **DEPRECATED**: This command has been consolidated into `/new-command`.
>
> **Please use `/new-command` instead.**

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
3. Update `PLAN.md` component counts
4. Update `CHANGELOG.md`

### Minimum Deprecation Period

Deprecated components remain for at least **2 minor versions** before removal consideration.

---

## Questions?

- Open a [GitHub Issue](https://github.com/kv0906/cc-pmkt/issues) for questions
- Tag issues with `question` label
- Follow [@will_tran33](https://twitter.com/will_tran33) for updates

---

## Recognition

Contributors are recognized in:
- Release notes
- CHANGELOG.md (every merged PR to `main`)
- README.md acknowledgments (for major contributions)

---

## Code of Conduct

Please read our [Code of Conduct](CODE_OF_CONDUCT.md) before contributing.

---

Thank you for contributing to PM-Kit! Together, we're making PMs more technical.

**Maintainer:** [Will Tran](https://github.com/kv0906) | [@will_tran33](https://twitter.com/will_tran33)
