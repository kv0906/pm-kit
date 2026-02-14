---
name: obsidian-cli
description: Control Obsidian from the terminal using the `obsidian` CLI. Use when the agent needs to open notes, search the vault inside Obsidian, append/prepend content to the active file, create notes from templates, manage properties, check backlinks/orphans, query Bases, or interact with the running Obsidian app. Requires Obsidian 1.12+ running.
---

# Obsidian CLI Skill

Control the running Obsidian app from the terminal. Supplementary tool alongside Read/Write/Edit, Glob, Grep, QMD, and Neo4j.

## Prerequisites

- Obsidian 1.12+ running (early access, Catalyst license)
- CLI registered: Settings > General > Command line interface
- Templates plugin: Settings > Core Plugins > Templates > Template folder → `_templates`
- PATH: `/Applications/Obsidian.app/Contents/MacOS` (in `~/.zprofile`)

## Important: Noisy Output

The CLI outputs `Loading updated app package...` to stdout on every invocation. **Always filter with `grep -v`**:

```bash
obsidian orphans total 2>/dev/null | grep -v "Loading updated"    # correct — clean output
obsidian orphans total                                             # noisy output in agent context
```

Shorthand for all examples below: `2>/dev/null | grep -v "Loading updated"` is abbreviated as `2>/dev/null` for readability, but always include the full filter in practice.

## When to Use CLI vs File Tools

| Scenario | Use CLI | Use File Tools |
|----------|---------|----------------|
| Open a note in Obsidian UI | `obsidian open` | No equivalent |
| Read/write file content | Either works | **Prefer Read/Write/Edit** |
| Search vault content | `obsidian search` | **Prefer Grep/QMD** |
| Open today's daily note in Obsidian | `obsidian daily` | No equivalent |
| Append task to daily note | `obsidian daily:append` | Either |
| Create note from template | `obsidian create template=X` | Manual template apply |
| Check backlinks/orphans/unresolved | `obsidian backlinks/orphans` | Manual grep |
| Set/read properties (frontmatter) | `obsidian property:set` | Edit tool |
| Query a Base view | `obsidian base:query` | No equivalent |
| Execute Obsidian commands | `obsidian command` | No equivalent |

**Rule of thumb**: CLI for Obsidian-app-specific actions (open files, trigger commands, query Bases, graph relationships). File tools for direct file manipulation.

## Agent Integration Patterns

### Keeper — Supplementary Health Checks

```bash
# Quick vault health stats (supplement Python/Neo4j checks)
obsidian unresolved verbose 2>/dev/null | grep -v "Loading updated"
obsidian orphans total 2>/dev/null | grep -v "Loading updated"
obsidian deadends total 2>/dev/null | grep -v "Loading updated"
```

### Scribe — Quick Capture

```bash
# Fast append to daily note (no file path needed)
obsidian daily:append content="- [ ] Review TPM progress" silent 2>/dev/null

# Atomic frontmatter update
obsidian property:set name=status value=shipped path="prd/xmarket/checkout.md" 2>/dev/null

# Template-based note creation
obsidian create name="New PRD" template=prd silent 2>/dev/null

# Surface created note in Obsidian
obsidian open path="decisions/xmarket/2026-02-11-payment-provider.md" newtab 2>/dev/null
```

### Scout — Fallback Search

```bash
# Backlinks via Obsidian's graph (alternative to Neo4j)
obsidian backlinks file=Note 2>/dev/null

# Quick text search (alternative to QMD)
obsidian search query="payment provider" 2>/dev/null
```

### Today — Workflow Touchpoints

```bash
# Phase 0: Ensure daily note visible in Obsidian
obsidian daily silent 2>/dev/null

# Phase 3: Quick health stats
obsidian unresolved total 2>/dev/null
obsidian orphans total 2>/dev/null

# Phase 5: Surface daily note
obsidian open path="daily/2026-02-11.md" 2>/dev/null
```

## Command Reference

### Vault & File Targeting

```bash
# Auto-detects vault from CWD
obsidian daily 2>/dev/null

# Target specific vault
obsidian vault=Notes daily 2>/dev/null

# By name (wikilink resolution)
obsidian read file=Recipe 2>/dev/null

# By exact path
obsidian read path="prd/xmarket/checkout.md" 2>/dev/null
```

### Daily Notes

```bash
obsidian daily 2>/dev/null                              # Open today's daily note
obsidian daily:read 2>/dev/null                         # Read daily note contents
obsidian daily:append content="- [ ] Task" 2>/dev/null  # Append to daily note
obsidian daily:prepend content="## Morning" 2>/dev/null # Prepend after frontmatter
obsidian daily:append content="text" silent 2>/dev/null # Append without opening
```

### Files & Folders

```bash
obsidian files 2>/dev/null                        # List all files
obsidian files folder=prd 2>/dev/null             # List files in folder
obsidian files ext=md total 2>/dev/null           # Count .md files
obsidian open file=Note 2>/dev/null               # Open a file
obsidian open file=Note newtab 2>/dev/null        # Open in new tab
obsidian create name="New Note" 2>/dev/null       # Create file
obsidian create name=Note template=prd 2>/dev/null  # Create from template
obsidian create name=Note content="text" silent overwrite 2>/dev/null
obsidian read file=Note 2>/dev/null               # Read file contents
obsidian append file=Note content="new line" 2>/dev/null
obsidian prepend file=Note content="top line" 2>/dev/null
obsidian move file=Note to="archive/" 2>/dev/null
obsidian delete file=Note 2>/dev/null             # Trash (recoverable)
```

### Search

```bash
obsidian search query="meeting notes" 2>/dev/null          # Search vault
obsidian search query="TODO" path=daily 2>/dev/null        # Search in folder
obsidian search query="bug" total 2>/dev/null              # Count matches
obsidian search query="fix" matches 2>/dev/null            # Show match context
obsidian search query="test" format=json 2>/dev/null       # JSON output
```

### Links & Graph

```bash
obsidian backlinks file=Note 2>/dev/null           # Backlinks to a file
obsidian backlinks file=Note counts 2>/dev/null    # With link counts
obsidian links file=Note 2>/dev/null               # Outgoing links from a file
obsidian unresolved 2>/dev/null                    # Broken/unresolved links
obsidian unresolved verbose 2>/dev/null            # Include source files
obsidian orphans 2>/dev/null                       # Files with no incoming links
obsidian orphans total 2>/dev/null                 # Count orphans
obsidian deadends 2>/dev/null                      # Files with no outgoing links
```

### Properties (Frontmatter)

```bash
obsidian properties file=Note 2>/dev/null                  # List properties
obsidian properties all counts 2>/dev/null                 # All vault properties
obsidian property:read name=status file=Note 2>/dev/null   # Read a property
obsidian property:set name=status value=done file=Note 2>/dev/null  # Set a property
obsidian property:set name=tags value="[a,b]" type=list file=Note 2>/dev/null
obsidian property:remove name=old_prop file=Note 2>/dev/null
```

### Tags

```bash
obsidian tags all counts 2>/dev/null              # All tags with counts
obsidian tags file=Note 2>/dev/null               # Tags in a file
obsidian tag name=project verbose 2>/dev/null     # Tag info with file list
```

### Tasks

```bash
obsidian tasks 2>/dev/null                         # Tasks in active file
obsidian tasks daily 2>/dev/null                   # Tasks from daily note
obsidian tasks daily todo 2>/dev/null              # Incomplete daily tasks
obsidian tasks all todo 2>/dev/null                # All incomplete tasks
obsidian task daily line=3 toggle 2>/dev/null      # Toggle a daily task
```

### Bases

```bash
obsidian bases 2>/dev/null                         # List all .base files
obsidian base:query file=MyBase format=json 2>/dev/null     # Query base
obsidian base:query file=MyBase view=TableView format=csv 2>/dev/null
```

### Templates

```bash
obsidian templates 2>/dev/null                     # List templates
obsidian template:read name=prd 2>/dev/null        # Read template
obsidian template:insert name=prd 2>/dev/null      # Insert into active file
```

### Workspace & Tabs

```bash
obsidian tabs 2>/dev/null                          # List open tabs
obsidian workspace 2>/dev/null                     # Show workspace tree
obsidian workspace:load name=Writing 2>/dev/null   # Load workspace
```

### Commands

```bash
obsidian commands 2>/dev/null                      # List all command IDs
obsidian command id=editor:toggle-bold 2>/dev/null # Execute a command
```

## Common Patterns for This Vault

### Quick daily task capture
```bash
obsidian daily:append content="- [ ] Review TPM progress" silent 2>/dev/null
```

### Check vault health via CLI
```bash
obsidian orphans total 2>/dev/null
obsidian unresolved verbose 2>/dev/null
obsidian deadends total 2>/dev/null
```

### Open a PRD in Obsidian
```bash
obsidian open path="prd/tpm/private-market-mvp-phases.md" 2>/dev/null
```

### Find all notes tagged with a project
```bash
obsidian tag name=xmarket verbose 2>/dev/null
```

### Query a Base for structured data
```bash
obsidian base:query file=Projects format=json 2>/dev/null
```
