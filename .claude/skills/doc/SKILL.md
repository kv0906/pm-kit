---
name: doc
description: Draft or edit a document — PRD, spec, design doc, technical brief. Use for "/doc project title" to create a new doc or edit existing.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet
user-invocable: true
---

# /doc — Document Drafting

Create or edit documents (specs, PRDs, design docs, etc.).

## Context

Today's date: `!date +%Y-%m-%d`
Existing docs: `!ls docs/*/*.md 2>/dev/null | tail -10`

Reference template: @_templates/doc.md
Config: @_core/config.yaml
Processing logic: @_core/PROCESSING.md
Product judgment: @_core/judgment.md
Knowledge and evidence: @_core/knowledge.md

## Input

User input: $ARGUMENTS

## Processing Steps

1. **Parse Input**
   - Extract project
   - Extract title/feature name

2. **Check Existing**
   - Search `docs/{project}/*.md` for similar titles (or `docs/general/*.md` if no project)
   - If found: Offer to edit or create new

3. **Gather Context**
   - Read the user's profile and relevant project index; follow linked product context and approved judgment/writing examples
   - Search related docs, customer feedback, meetings, decisions, and blockers
   - Identify the affected user, their task, observed problem, and desired business outcome before proposing requirements
   - Separate sources, interpretations, and assumptions; retain conflicting evidence and mark missing evidence as unknown
   - Use `/discover` when the problem needs investigation and `/prioritize` when competing requests need a scope decision

4. **Interactive Drafting**
   - Accept existing content; ask only for gaps that materially affect the problem, scope, or validation
   - Draft problem statement, evidence, assumptions, goals/non-goals, and requirements at the depth the task needs
   - For goals, state the intended outcome; include metric definition, baseline, target, period, and source when known
   - Follow `_core/judgment.md` to select outcome measures; reuse existing goals rather than forcing a North Star, OKR, or metric tree
   - For consequential releases or experiments, include relevant guardrails, instrumentation gaps, and proposed scale/iterate/stop criteria
   - Propose the smallest validation step and review point; distinguish proposed targets from approved commitments
   - Do not invent metric values, customer quotes, priorities, owners, or technical decisions
   - For an approved feature direction, break work into small user stories with actor, need, benefit, and observable acceptance criteria
   - Cover relevant failure and recovery cases; flag dependencies. If direction is unapproved, label any stories as proposed
   - Keep technical approach optional when unknown; match the requested audience, language, and approved voice examples

5. **Create Doc Note**
   - If no project specified: write to `docs/general/{slug}.md`
   - If project specified: write to `docs/{project}/{slug}.md`
   - Apply template with gathered data
   - For saved explanations, research briefs, comparisons, or journey maps, adapt template sections to the purpose; do not add PRD requirements to a thinking note
   - Status: draft
   - Mark missing sections as unknown or not applicable; never leave unresolved template variables
   - When editing, preserve existing content and structure; add evidence and validation only where they are relevant
   - Add `## Links` section

6. **Update References**
   - Add to project index if exists

7. **Append to Vault Log**
   - Append entry to `01-index/_vault-log.md` (see `.claude/rules/vault-log.md`)
   - Action: `doc`
   - Details: doc title and status

## Output

```
Created: docs/{project}/{slug}.md
Status: draft
Sections: {filled}/{total}
```

Highlight important evidence gaps and the next validation step. Creating a local draft does not authorize publishing it or creating external tickets.

## Export (Optional)

Supports `--docx`, `--pdf` flags. See `.claude/rules/export-formats.md` for layout specs and workflow. Complete normal processing first, then generate the formatted file.
