# PLAN-MKT: Multi-Plugin Marketplace Restructure

> Draft plan for transforming pm-kit into a multi-plugin marketplace.
> **Status:** Draft | **Created:** 2025-11-28

---

## Vision

Transform pm-kit from a single plugin repository into a **marketplace** hosting multiple plugins:

| Plugin | Purpose | Status |
|--------|---------|--------|
| **pm** | Product Management (PRDs, research, prioritization, etc.) | ✅ Existing |
| **marketing** | Marketing management (briefs, campaigns, performance, ROI) | 📋 Planned |

---

## Current vs Target Structure

### Current (Single Plugin)
```
pm-kit/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── commands/              # 23 commands at root
├── agents/                # 14 agents at root
├── skills/                # 7 skills at root
├── templates/             # 4 templates at root
└── ...docs
```

### Target (Multi-Plugin Marketplace)
```
pm-kit/
├── .claude-plugin/
│   └── marketplace.json   # References all plugins
├── plugins/
│   ├── pm/                # Product Management plugin
│   │   ├── plugin.json
│   │   ├── commands/
│   │   ├── agents/
│   │   ├── skills/
│   │   └── templates/
│   └── marketing/         # Marketing plugin (future)
│       ├── plugin.json
│       ├── commands/      # /brief, /campaign, /roi, /timeline
│       ├── agents/
│       └── skills/
├── README.md              # Marketplace overview
├── CLAUDE.md
├── PLAN.md
└── ...docs
```

---

## Migration Steps

### Step 1: Create Directory Structure
```bash
mkdir -p plugins/pm
```

### Step 2: Move Plugin Contents
```bash
mv commands/ plugins/pm/
mv agents/ plugins/pm/
mv skills/ plugins/pm/
mv templates/ plugins/pm/
mv .claude-plugin/plugin.json plugins/pm/
```

### Step 3: Update marketplace.json
```json
{
  "name": "pm-kit",
  "owner": {
    "name": "Will Tran",
    "username": "kv0906",
    "url": "https://github.com/kv0906",
    "website": "https://vanthk.com",
    "twitter": "@will_tran33"
  },
  "plugins": [
    {
      "name": "pm",
      "source": "./plugins/pm",
      "description": "Product Management framework with Long Chain-of-Thought methodology. 23 commands for PRDs, research, prioritization, North Star frameworks, retrospectives, daily planning, and more.",
      "version": "0.7.0",
      "author": {
        "name": "Will Tran",
        "username": "kv0906",
        "twitter": "@will_tran33"
      },
      "category": "productivity",
      "tags": ["product-management", "prd", "research", "prioritization", "decision-making", "ai-augmented", "technical-pm"]
    }
  ]
}
```

### Step 4: Update Documentation
- [ ] `CLAUDE.md` - Update repository structure section
- [ ] `README.md` - Update structure and installation instructions
- [ ] `PLAN.md` - Add ADR for marketplace restructure
- [ ] `CHANGELOG.md` - Document restructuring

### Step 5: Test Installation
```bash
# Test marketplace install
/plugin install kv0906/pm-kit

# Verify pm plugin works
/pm
/prd test
```

---

## Future: Marketing Plugin

### Potential Commands
| Command | Purpose |
|---------|---------|
| `/brief` | Create marketing brief from ideas |
| `/campaign` | Campaign planning and timeline |
| `/roi` | ROI calculation and analysis |
| `/performance` | Marketing performance dashboard |
| `/timeline` | Campaign timeline management |
| `/stats` | Marketing metrics synthesis |

### Plugin Structure
```
plugins/marketing/
├── plugin.json
├── commands/
│   ├── brief.md
│   ├── campaign.md
│   ├── roi.md
│   ├── performance.md
│   └── timeline.md
├── agents/
│   ├── campaign-planner.md
│   ├── performance-analyst.md
│   └── roi-calculator.md
└── skills/
    ├── marketing-metrics/
    └── campaign-frameworks/
```

---

## Breaking Changes

**None expected:**
- Install command unchanged: `/plugin install kv0906/pm-kit`
- Plugin name unchanged: `pm`
- All commands work identically: `/prd`, `/research`, `/prioritize`, etc.

---

## References

- [Claude Code Plugin Marketplaces](https://code.claude.com/docs/en/plugin-marketplaces.md)
- [Plugin Structure Documentation](https://code.claude.com/docs/en/plugins.md)
