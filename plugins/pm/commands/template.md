---
description: Browse and apply PM-Kit templates for common documents
argument-hint: "[optional: template type]"
---

# Template Browser

Browse and apply templates for: $ARGUMENTS

## Available Templates

| Template | Purpose | Use Case |
|----------|---------|----------|
| `consensus-template` | Stakeholder alignment document | Getting buy-in on decisions |
| `decision-matrix` | Structured option comparison | Evaluating alternatives |
| `evidence-log` | Evidence tracking and scoring | Validating hypotheses |
| `research-matrix` | Research organization | Synthesizing multiple sources |

## Instructions

### If no argument provided:

Display the template catalog above and ask:
- "Which template would you like to use?"
- "What topic or context should I apply it to?"

### If template type specified:

1. **Load the template** from `./templates/[name].md`
2. **Review the structure** and explain what each section is for
3. **Ask for context** - What topic/decision/research is this for?
4. **Generate a customized version** with the user's context filled in
5. **Save output** to appropriate directory

## Template Application Process

1. **Preview** - Show template structure and purpose
2. **Customize** - Gather user context for personalization
3. **Generate** - Create filled template with user's content
4. **Save** - Output to relevant directory with descriptive name

## Output Locations

| Template | Output Directory |
|----------|-----------------|
| consensus-template | `./decisions/` |
| decision-matrix | `./decisions/` |
| evidence-log | `./research/` |
| research-matrix | `./research/` |

## Example Usage

```
/template                           # Show all templates
/template consensus                 # Use consensus template
/template decision-matrix           # Use decision matrix
/template evidence for "API choice" # Apply evidence log to topic
```

---

## Next Steps

After applying a template:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Research topic | `/research` | Need more evidence |
| Build consensus | `/consensus` | Ready for stakeholder alignment |
| Make decision | `/decide` | Ready to choose |
| Create matrix | `/matrix` | Need structured comparison |

---

Begin template browsing now.
