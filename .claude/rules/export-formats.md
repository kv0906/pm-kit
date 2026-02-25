# Export Format Rules

When a user appends `--xlsx`, `--docx`, `--pdf`, or `--pptx` to any skill invocation, generate the output in that format **after completing normal processing**.

## Supported Export Flags

| Flag | Format | Uses Skill |
|------|--------|------------|
| `--xlsx` | Excel spreadsheet | `.claude/skills/xlsx/SKILL.md` |
| `--docx` | Word document | `.claude/skills/docx/SKILL.md` |
| `--pdf` | PDF document | `.claude/skills/pdf/SKILL.md` |
| `--pptx` | PowerPoint deck | `.claude/skills/pptx/SKILL.md` |

## Workflow

1. **Complete normal skill processing first** — gather data, synthesize, create markdown as usual
2. **Detect export flag** in `$ARGUMENTS`
3. **Prepare structured data** from the skill's output (tables, lists, metadata)
4. **Read the corresponding format skill** (xlsx/docx/pdf/pptx SKILL.md) for creation instructions
5. **Generate the file** following that skill's patterns and best practices
6. **Save to** `reports/exports/{date}-{source}-{project}.{ext}`

If multiple format flags are present (e.g., `--xlsx --pdf`), generate each format.

## Output Location

```
reports/exports/
  2026-02-25-progress-all.xlsx
  2026-02-25-progress-project-a.docx
  2026-02-25-sprint-retro.pdf
  2026-02-25-blockers-project-a.xlsx
```

Pattern: `reports/exports/{YYYY-MM-DD}-{skill}-{project-or-scope}.{ext}`

## Skill → Format Matrix

Not every skill maps to every format. Use what makes sense:

| Skill | `--xlsx` | `--docx` | `--pdf` | `--pptx` | Best For |
|-------|----------|----------|---------|----------|----------|
| `/progress` | Tracker with Status + Blockers sheets | Formatted status report | Executive summary | Status deck | Sharing with leadership |
| `/doc` | — | Formatted PRD/spec | Print-ready doc | — | Sending to stakeholders |
| `/meet` | — | Meeting minutes | Meeting minutes | — | Sharing with attendees |
| `/weekly` | Metrics sheet + Details sheet | Sprint retro report | Sprint summary | Sprint deck | Sprint reviews |
| `/block` | Blocker tracker | — | — | — | Cross-team blocker visibility |
| `/decide` | — | Decision record | Decision record | — | Audit trail |

"—" means the format doesn't add value for that skill. If the user explicitly requests it anyway, generate it.

## Format-Specific Layout Guidelines

### Excel (--xlsx) — via xlsx skill

Use openpyxl. Follow xlsx SKILL.md for formulas, formatting, and validation.

**`/progress --xlsx`**:
- Sheet "Status": columns `Project | Item | Category | Date` (Category = Shipped/WIP/Blocked)
- Sheet "Blockers": columns `Project | Title | Severity | Owner | Due | Status`
- Header row: bold, colored background (RGB: 68,114,196 with white text)
- Conditional formatting: red fill for high severity, yellow for medium
- Auto-filter on all columns
- Column widths auto-fitted

**`/weekly --xlsx`**:
- Sheet "Metrics": columns `Project | Shipped | Blockers Resolved | Blockers Open | Carry-over`
- Sheet "Details": columns `Project | Item | Type | Status | Date`
- Summary row at bottom with totals

**`/block --xlsx`**:
- Single sheet: columns `Project | Title | Severity | Owner | Due | Status | Description`
- Conditional formatting on Severity column
- Sort by severity (high → medium → low), then by due date

### Word (--docx) — via docx skill

Use docx-js. Follow docx SKILL.md for headings, tables, TOC, and validation.

**General layout for all Word exports**:
- US Letter page size (12240 x 15840 DXA)
- 1-inch margins
- Arial font, 12pt body, styled headings (H1=16pt, H2=14pt, H3=12pt bold)
- Header: document title + date
- Footer: page numbers

**`/progress --docx`**:
- Title: "{Project} Status Report"
- Sections: Executive Summary, Shipped, In Progress, Blockers (as table), Recent Decisions
- Blocker table with borders and header row shading

**`/doc --docx`**:
- Map markdown H1→Heading1, H2→Heading2, H3→Heading3
- Preserve bullet lists and tables
- Auto-generate Table of Contents if 3+ H2 sections
- Include frontmatter metadata as document properties

**`/meet --docx`**:
- Title: "{Meeting Type}: {Title}"
- Metadata block: Date, Project, Attendees
- Sections: Notes, Decisions, Action Items (as table with Owner/Due), Blockers

### PDF (--pdf) — via pdf skill

Use reportlab. Follow pdf SKILL.md for layout and styling.

**General layout for all PDF exports**:
- US Letter page size
- Professional styling: clean headers, consistent spacing
- Page numbers in footer

**Map content sections to PDF elements**:
- Headings → reportlab Heading styles
- Tables → reportlab Table with grid lines
- Lists → indented paragraphs with bullet characters

### PowerPoint (--pptx) — via pptx skill

Use pptxgenjs. Follow pptx SKILL.md for slide creation.

**`/progress --pptx`**:
- Slide 1: Title slide with project name + date range
- Slide 2: Executive summary (shipped count, blocker count, key metrics)
- Slide 3: Shipped items list
- Slide 4: Open blockers table
- Slide 5: Decisions + next steps

**`/weekly --pptx`**:
- Slide 1: Title "Sprint Review — Week of {date}"
- Slide 2: Key metrics (shipped, resolved, open blockers)
- Slide 3: What went well / What didn't
- Slide 4: Next week priorities

## Dependency Handling

Before generating any export, verify the required tool is available:

```bash
# xlsx
python3 -c "import openpyxl" 2>/dev/null

# docx
node -e "require('docx')" 2>/dev/null

# pdf
python3 -c "from reportlab.lib.pagesizes import letter" 2>/dev/null

# pptx
node -e "require('pptxgenjs')" 2>/dev/null
```

If a dependency is missing, tell the user:

```
Export to {format} requires {package}.
Install with: pip install {package}  (or: npm install -g {package})

Or run: ./scripts/setup-export.sh to install all export dependencies.
```

Do NOT fail silently. Always explain what's needed.

## Combining with --save

If both `--save` and a format flag are used (e.g., `/progress all --save --xlsx`):
1. Create the markdown note as usual (per `--save` behavior)
2. Also generate the formatted export file
3. Report both output paths
