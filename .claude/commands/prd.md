---
description: Generate a comprehensive Product Requirements Document with multi-layer validation
---

# PRD Generation Command

You are acting as the **PRD Writer Agent** for this task.

## Your Task

Create a comprehensive Product Requirements Document for the following feature/product:

**Feature/Product**: {{input}}

## Workflow to Follow

Refer to `./.claude/workflows/prd-framework.md` for the complete methodology.

## Your Process

### Phase 1: Foundation Building
1. **Context Synthesis**:
   - Load user research from `./research/`
   - Review market analysis and competitive landscape
   - Check technical constraints from `./specs/technical/`
   - Load relevant problem decomposition if exists

2. **Problem-Solution Fit Validation**:
   - Define user problem statement
   - Align with business objectives
   - Formulate solution hypothesis
   - **Gate**: Problem validated with users? Solution addresses root cause?

### Phase 2: Solution Specification
1. **Feature Architecture**: Break down into components
2. **User Stories**: Create with acceptance criteria (Given/When/Then)
3. **Technical Requirements**: APIs, data models, integrations
4. **Verification**: All user paths covered? Edge cases identified?

### Phase 3: Implementation Planning
1. **Phasing Strategy**: MVP, Phase 2, Phase 3
2. **Risk Assessment**: Identify and mitigate risks
3. **Success Metrics**: Define KPIs and measurement plan
4. **Dependencies**: Map what's needed

### Phase 4: Stakeholder Alignment
1. Get engineering, design, marketing, legal reviews
2. Incorporate feedback
3. Obtain sign-offs
4. **Verification**: All stakeholders approved?

### Phase 5: Documentation
Generate complete PRD following the template in `./.claude/workflows/prd-framework.md`

## Output Location

Save PRD to: `./prds/active/[feature-name]-[date].md`

## PRD Structure

Your PRD must include:
- Executive Summary (problem, solution, metrics, timeline)
- Background and Context
- Goals and Success Metrics
- User Personas and Use Cases
- Solution Overview
- Detailed Requirements (functional and non-functional)
- Design Specifications
- Technical Approach
- Implementation Plan (phasing, dependencies, risks)
- Success Criteria
- Open Questions
- Appendices

## Quality Checklist

Before finalizing, verify:
- [ ] All template sections complete
- [ ] User stories have clear acceptance criteria
- [ ] Technical approach validated by engineering
- [ ] Success metrics are measurable
- [ ] Risks identified with mitigation plans
- [ ] Stakeholder reviews completed
- [ ] Links and references working

## Agent Capabilities

Refer to `./.claude/agents/prd-writer.md` for detailed capabilities including:
- Executive summary synthesis
- Success metrics definition
- User story generation
- Acceptance criteria specification
- Technical requirement documentation
- Risk mitigation planning
- Implementation phasing

Begin PRD creation now.
