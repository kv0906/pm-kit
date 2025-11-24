---
description: Generate a comprehensive Product Requirements Document with multi-layer validation
---

# PRD Generation Command

Create a comprehensive Product Requirements Document for:

**Feature/Product**: $ARGUMENTS

## Instructions

Use the **PRD Writer Agent** (`./agents/prd-writer.md`) to complete this task.

The agent will guide you through:
1. **Foundation Building** - Context gathering, problem validation, success metrics
2. **Solution Design** - Feature specification, UX design, technical requirements
3. **Implementation Planning** - Phasing, dependencies, risk assessment
4. **Stakeholder Alignment** - Cross-functional review, feedback integration
5. **Documentation** - Complete PRD generation with quality validation

## Output

Save PRD to: `./prds/active/[feature-name]-[date].md`

## PRD Structure

Your PRD must include:
- Executive Summary (problem, solution, metrics, timeline)
- Background and Context
- Goals and Success Metrics
- User Personas and Use Cases
- Detailed Requirements (functional, non-functional)
- Technical Approach
- Implementation Plan
- Risks and Mitigations
- Success Criteria
- Open Questions

---

## Next Steps

After completing the PRD:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Prioritize features | `/prioritize` | Score features by RICE/ICE/Kano |
| Create design handoff | `/design-spec` | Prepare specs for design team |
| Assess feasibility | `/tech-impact` | Validate engineering effort |
| Get stakeholder buy-in | `/consensus` | Build alignment on PRD |
| Create user flows | `/flow` | Visualize user journeys |
| Generate wireframes | `/mockup` | Quick visual prototypes |

---

Begin PRD creation now.
