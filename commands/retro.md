---
description: Transform meeting notes into structured retrospective with actions and owners
---

# Retro Command

Transform raw meeting notes, discussion points, or feedback into a structured retrospective document with clear categories, patterns, and actionable items with owners.

**Meeting Notes/Feedback**: $ARGUMENTS

## Instructions

Use the **Retro Facilitator Agent** (`agents/retro-facilitator.md`) to complete this task.

The agent will guide you through:
1. **Notes Parsing** - Extract and organize discussion points
2. **Categorization** - Sort into What went well / What didn't / Questions
3. **Pattern Recognition** - Identify recurring themes and root causes
4. **Action Generation** - Create specific action items with owners
5. **Documentation** - Format the structured retro output

## Output

Save the retrospective to: `./docs/retro-[topic]-[date].md`

## Output Structure

Your retrospective document must include:

### 1. Retro Overview
- Sprint/Period covered
- Participants (if known)
- Key context

### 2. What Went Well (WWW)
- Wins and successes
- Things to continue doing
- Team strengths demonstrated

### 3. What Didn't Go Well (WDGW)
- Challenges and friction
- Missed expectations
- Areas needing improvement

### 4. Questions/Puzzles
- Open questions raised
- Things to investigate
- Unclear outcomes

### 5. Themes & Patterns
- Recurring issues across categories
- Root cause analysis
- Systemic observations

### 6. Action Items
| Action | Owner | Due Date | Priority |
|--------|-------|----------|----------|
| Specific action | Person | When | High/Med/Low |

### 7. Follow-Up Decisions
- Decisions that need to be made
- Escalations required
- Experiments to try

---

## Next Steps

After completing the retrospective:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Plan daily work | `/today` | Start acting on action items |
| Build consensus | `/consensus` | Need team alignment on changes |
| Prioritize actions | `/prioritize` | Many action items to rank |
| Deep dive problem | `/decompose` | Complex issue needs analysis |
| Create improvement PRD | `/prd` | Action requires feature work |

---

Begin retrospective generation now.
