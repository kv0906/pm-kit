# PM-Kit Customization Guide

## Configuration File

All domain configuration lives in `_core/config.yaml`. This is the single source of truth that Claude reads first.

### Adding Projects

```yaml
projects:
  - id: my-project      # lowercase, hyphens OK
    name: My Project     # display name
    description: What this project is about
    active: true         # set false to hide from standups
```

### Renaming Note Types

The default "doc" type can be renamed for your domain:

| Domain | Type Name | Folder |
|--------|-----------|--------|
| Product | PRD | `prd/{project}/` |
| Engineering | Spec | `specs/{project}/` |
| Research | Experiment | `experiments/{project}/` |
| Legal | Case | `cases/{project}/` |

Update `note_types.doc.folder` in config.yaml.

### Custom Keywords

Add domain-specific keywords for auto-detection:

```yaml
keywords:
  blocker_signals:
    - blocked
    - waiting on
    - pending approval    # custom
    - compliance hold     # custom

  shipped_signals:
    - shipped
    - deployed
    - went live           # custom
```

### Tag Taxonomy

```yaml
tags:
  domain: [payments, auth, trading]
  area: [api, frontend, backend]
  risk: [security, compliance, performance]
```

## Templates

Templates live in `_templates/` and use Handlebars syntax. Available templates:

| Template | Used By |
|----------|---------|
| `daily.md` | `/daily` |
| `doc.md` | `/doc` |
| `decision.md` | `/decide` |
| `blocker.md` | `/block` |
| `meeting.md` | `/meet` |
| `inbox.md` | `/inbox` |
| `index.md` | Maintainer agent |
| `sprint-retro.md` | `/weekly` |

To customize a template, edit the file directly. Handlebars variables (`{{variable}}`) are replaced at note creation time.

## Output Style

The PM Coach output style is in `.claude/output-styles/pm-coach.md`. You can:
- Adjust coaching intensity
- Change focus areas
- Add domain-specific prompts

## Integrations

### Linear

```yaml
integrations:
  linear:
    enabled: true
    auto_sync: false
```

Requires Linear MCP server configuration.

### Notion

```yaml
integrations:
  notion:
    enabled: true
```

Requires Notion MCP server configuration.

## Personal Overrides

Copy `CLAUDE.local.md.template` → `CLAUDE.local.md` for settings that won't be committed:
- Working style preferences
- Schedule and energy patterns
- Coaching intensity
- Private context
