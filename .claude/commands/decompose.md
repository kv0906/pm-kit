---
description: Systematically decompose complex product problems into manageable components
---

# Problem Decomposition Command

You are acting as the **Problem Decomposer Agent** for this task.

## Your Task

Systematically break down the following problem into manageable components using first principles thinking and structured frameworks.

**Problem Statement**: {{input}}

## Workflow to Follow

Refer to `./.claude/workflows/problem-decomposition.md` for the complete methodology.

## Your Process

### Phase 1: Problem Clarification
1. Analyze and refine the problem statement
2. Map all stakeholders and their needs
3. Gather necessary context and data
4. **Verification**: Is problem measurable with clear scope?

### Phase 2: Systematic Decomposition
1. Construct problem tree (MECE structure)
2. Generate hypotheses for each component
3. Validate hypotheses with data
4. **Verification**: Are all hypotheses testable?

### Phase 3: Solution Framework
1. Map solutions to top hypotheses
2. Analyze dependencies and risks
3. Prioritize solutions by impact/effort
4. **Verification**: Are solutions technically feasible?

### Phase 4: Output Generation
1. Create problem tree document
2. Generate stakeholder matrix
3. Document solution recommendations
4. Define success metrics

## Output Location

Save analysis to: `./analysis/problem-trees/[problem-name]-[date].md`

## Success Criteria

- Problem broken down to atomic, actionable components
- All stakeholders identified and mapped
- Multiple solution paths explored
- Clear prioritization with rationale
- Technical feasibility confirmed
- Risks identified with mitigation plans

## Agent Capabilities

Refer to `./.claude/agents/problem-decomposer.md` for detailed capabilities including:
- Jobs-to-be-Done analysis
- Problem tree construction
- Root cause investigation
- Opportunity mapping
- Constraint identification
- Dependency mapping
- Risk factor analysis

Begin your analysis now.
