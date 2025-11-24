---
description: Generate North Star framework from raw ideas (Problem → Vision → Target → Constraints → Bets)
---

# North Star Command

Transform a raw product idea or concept into a structured North Star framework that provides strategic clarity and alignment.

**Raw Idea/Concept**: $ARGUMENTS

## Instructions

Use the **North Star Architect Agent** (`agents/northstar-architect.md`) to complete this task.

The agent will guide you through:
1. **Idea Extraction** - Parse and understand the core concept
2. **Problem Framing** - Define the problem being solved
3. **Vision Articulation** - Craft a compelling North Star vision
4. **Target Definition** - Establish success metrics and goals
5. **Constraints Mapping** - Identify technical, resource, and time boundaries
6. **Bets Documentation** - Document key hypotheses and assumptions

## Output

Save the North Star document to: `./docs/northstar-[topic]-[date].md`

## Output Structure

Your North Star document must include:

### 1. Problem Statement
- Who experiences this problem?
- What is the current pain?
- Why does it matter now?

### 2. North Star Vision
- One-sentence aspirational statement
- What does success look like in 2-3 years?
- The "so what" factor

### 3. Target Metrics
- Primary metric (the North Star metric)
- Supporting metrics (2-3 max)
- Current baseline vs target

### 4. Key Constraints
- Technical constraints
- Resource constraints
- Time constraints
- Regulatory/compliance constraints

### 5. Strategic Bets
- Hypothesis 1: We believe that... We will know we're right when...
- Hypothesis 2: We believe that... We will know we're right when...
- Hypothesis 3: We believe that... We will know we're right when...

### 6. What This Is NOT
- Explicit anti-goals
- Out of scope items
- Future considerations (not now)

---

## Next Steps

After completing the North Star framework:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Create detailed PRD | `/prd` | Ready to define specific features |
| Prioritize initiatives | `/prioritize` | Have multiple bets to rank |
| Research validation | `/research` | Need evidence for assumptions |
| Stakeholder alignment | `/consensus` | Need buy-in on vision |
| Break down problem | `/decompose` | Problem still too large |

---

Begin North Star framework generation now.
