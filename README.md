# ClaudeKit PM Framework

This repository contains the ClaudeKit PM framework files - workflows, agents, commands, templates, and skills for AI-enhanced product management.

## 📦 Contents

### Core Files
- **CLAUDE.md** - Main routing file that guides Claude's behavior and defines system architecture
- **version.json** - Version tracking and file counts

### Framework Directory (`.claude/`)

#### Workflows (18 files)
Comprehensive PM processes with multi-step reasoning chains:
- Problem Decomposition
- PRD Framework
- Strategic Planning
- Feature Prioritization
- User Research Synthesis
- Research Synthesis (multi-source with confidence scoring)
- Consensus Building
- Evidence-Based Decisions
- Matrix Generation
- Metrics & Analytics
- Stakeholder Management
- Cross-functional Coordination
- Risk Assessment
- Documentation Standards

#### Agents (10 files)
Specialized agents for systematic problem-solving:
- Problem Decomposer
- PRD Writer
- User Researcher
- Research Synthesizer
- Consensus Builder
- Matrix Generator
- Prioritization Engine
- Analytics Synthesizer

#### Commands (16 files)
Slash commands for quick workflow access:
- `/prd` - Generate comprehensive PRD
- `/decompose` - Systematic problem decomposition
- `/research` - Multi-source research synthesis
- `/consensus` - Build stakeholder consensus
- `/synthesize` - Synthesize user research
- `/prioritize` - Apply prioritization frameworks
- `/strategy` - Create strategic plans
- `/decide` - Quick decision framework
- `/matrix` - Generate comparison matrices
- `/evidence` - Gather and assess evidence quality

#### Templates (4 files)
Ready-to-use document templates:
- PRD Template
- Decision Log Template
- Persona Template
- Research Template

#### Skills (5 files)
Technical literacy modules for non-technical PMs:
- JSON Fundamentals
- API Basics
- ASCII Diagrams
- Frontend Prompts
- Debug Without Code

## 🚀 Installation

This framework is installed via the `pm-kit-cli` tool:

```bash
# Install CLI globally
npm install -g pm-kit-cli

# Navigate to your project
cd your-project

# Initialize PM Kit
pm-kit init

# Start using with Claude
claude
/prd      # Create Product Requirements Document
/research # Multi-source research synthesis
/decide   # Quick decision framework
```

## 📋 Version

**Current Version:** 0.1.0
**Release Date:** 2024-11-21
**Minimum CLI Version:** 0.1.0

## 🎯 Key Features

- **Long Chain-of-Thought Reasoning**: Extended reasoning chains with 15+ systematic steps
- **Multi-Agent Orchestration**: Specialized agents working together for complex tasks
- **Systematic Validation**: Multi-layer verification at each phase
- **Evidence-Based**: Confidence scoring and source quality assessment
- **Comprehensive Templates**: Ready-to-use formats for all PM activities

## 📖 Documentation

Complete documentation available in the [ClaudeKit PM repository](https://github.com/vanlumberworks/claude-kit-pm):

- [Getting Started Guide](https://github.com/vanlumberworks/claude-kit-pm/blob/main/GETTING_STARTED.md)
- [Installation Guide](https://github.com/vanlumberworks/claude-kit-pm/blob/main/INSTALLATION.md)
- [Commands Reference](https://github.com/vanlumberworks/claude-kit-pm/blob/main/COMMANDS.md)
- [Visual Installation Guide](https://github.com/vanlumberworks/claude-kit-pm/blob/main/docs/INSTALLATION_VISUAL_GUIDE.md)

## 🔄 Updates

The framework is automatically updated via `pm-kit update` command:

```bash
# Check for updates
pm-kit update

# View current version
pm-kit doctor
```

## 🤝 Contributing

This framework is part of the ClaudeKit PM project. For contributions:

1. Fork the repository
2. Make your changes
3. Submit a pull request
4. Update version.json with your changes

See [CONTRIBUTING.md](https://github.com/vanlumberworks/claude-kit-pm/blob/main/CONTRIBUTING.md) for detailed guidelines.

## 📜 License

MIT License - See LICENSE file for details

## 🆘 Support

- **Issues**: Report bugs or request features via [GitHub Issues](https://github.com/vanlumberworks/claude-kit-pm/issues)
- **Documentation**: See the main repository for complete guides
- **Community**: Join discussions in GitHub Discussions

## 🗂️ File Structure

```
claudekit-pm-framework/
├── CLAUDE.md              # Main routing file
├── version.json           # Version tracking
├── README.md             # This file
├── LICENSE               # MIT license
├── .gitignore            # Git exclusions
│
└── .claude/              # Framework directory
    ├── workflows/        # 18 PM workflow files
    ├── agents/           # 10 specialized agent files
    ├── commands/         # 16 slash command files
    ├── templates/        # 4 document template files
    └── skills/           # 5 technical literacy files
```

## 🔖 Release Notes

### v0.1.0 (2024-11-21)

Initial release of ClaudeKit PM Framework with:
- 18 comprehensive PM workflows
- 10 specialized agents
- 16 quick-access slash commands
- 4 document templates
- 5 technical literacy modules
- Complete Long Chain-of-Thought methodology
- Multi-agent orchestration system

---

**Made with ❤️ for Product Managers**
