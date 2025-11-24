---
description: Create comprehensive strategic planning documents with multi-agent orchestration
---

# Strategic Planning Command

You are orchestrating **Multiple Specialized Agents** for strategic planning.

## Your Task

Create a comprehensive strategic plan for:

**Initiative/Goal**: $ARGUMENTS

## Your Process

### Phase 1: Strategic Assessment
1. **Current State Analysis**:
   - Product position and metrics
   - Competitive landscape (SWOT)
   - User segmentation
   - Market trends (3 horizons)

2. **Trend Analysis**:
   - Horizon 1 (0-6 months): Immediate trends
   - Horizon 2 (6-18 months): Emerging trends
   - Horizon 3 (18+ months): Future possibilities
   - **Verification**: Trends validated with data?

### Phase 2: Vision and Strategy Formulation
1. **Vision Development**:
   - 3-year product vision
   - 1-year annual vision
   - Quarterly objectives
   - Validation against criteria

2. **Strategy Selection**:
   - Generate strategic options
   - Evaluate with decision matrix
   - Select recommended approach
   - Document rationale

3. **OKR Development**:
   - Define objectives
   - Set key results (measurable)
   - Cascade to teams
   - **Verification**: SMART criteria met?

### Phase 3: Roadmap Development
1. **Initiative Planning**:
   - Break down into epics
   - Estimate timeline and investment
   - Assess risks
   - Map dependencies

2. **Roadmap Visualization**:
   - Quarterly roadmap (Year 1)
   - Annual roadmap (Years 2-3)
   - Now-Next-Later framework
   - Scenario planning

### Phase 4: Resource and Risk Planning
1. **Resource Allocation**:
   - Team allocation by quarter
   - Budget by category
   - Skill gap analysis
   - Hiring plan

2. **Risk Mitigation**:
   - Strategic risk register
   - Probability and impact assessment
   - Mitigation strategies
   - Monte Carlo simulation if applicable

### Phase 5: Execution Planning
1. **Communication Plan**:
   - Internal launch strategy
   - External communication
   - Stakeholder cadence

2. **Success Metrics**:
   - North Star metric
   - Input and output metrics
   - Leading indicators
   - Dashboard definitions

### Phase 6: Validation and Iteration
1. **Multi-Stakeholder Validation**:
   - Board, customers, team, market
   - Red flag identification
   - **Gate**: All stakeholders aligned?

2. **Iteration Protocol**:
   - Quarterly review triggers
   - Pivot criteria
   - Adjustment process

## Output Locations

- Strategic Plan: `./roadmaps/strategic/[year]-strategy.md`
- Annual Roadmap: `./roadmaps/annual/[year]-roadmap.md`
- Quarterly Roadmaps: `./roadmaps/quarterly/[year]-Q[n]-roadmap.md`
- OKRs: `./roadmaps/strategic/[year]-okrs.md`
- Resource Plan: `./roadmaps/strategic/[year]-resources.md`

## Strategic Plan Structure

Your plan must include:
- **Executive Summary**: Vision, objectives, key initiatives, success metrics
- **Market Context**: Market analysis, competitive landscape, opportunities/threats
- **Strategic Objectives**: Business, user, technical objectives with OKRs
- **Product Roadmap**: Quarterly roadmap, annual roadmap, themes and initiatives
- **Success Metrics**: KPIs, targets, measurement plan, dashboard links
- **Resource Plan**: Team structure, budget allocation, key investments
- **Risk Management**: Key risks, mitigation strategies, contingency plans
- **Governance**: Decision framework, review cadence, communication plan
- **Appendices**: Market analysis, competitive intelligence, financial projections

## Quality Checklist

Before finalizing, verify:
- [ ] Vision inspiring and measurable
- [ ] OKRs aligned and cascaded
- [ ] Roadmap has stakeholder consensus
- [ ] Resource allocation realistic
- [ ] Risks identified with mitigations
- [ ] Metrics and tracking defined
- [ ] Governance process established
- [ ] Strategy communicated

## Agent Orchestration

This command coordinates:
- Problem Decomposer: For opportunity analysis
- User Researcher: For user strategy insights
- Analytics Synthesizer: For metric baselines
- Prioritization Engine: For initiative selection
- PRD Writer: For key initiative specs

The agents coordinate to produce comprehensive strategic documentation.

## Success Criteria

- Clear vision and strategic objectives defined
- Roadmap has stakeholder consensus
- Resource allocation aligned with priorities
- Metrics and tracking in place
- Governance and review process established
- Strategy communicated across organization

---

## Next Steps

After completing the strategic plan:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Write initiative PRDs | `/prd` | Define requirements for key initiatives |
| Prioritize initiatives | `/prioritize` | Rank initiatives by RICE/ICE frameworks |
| Build stakeholder buy-in | `/consensus` | Align leadership on strategy |
| Assess feasibility | `/tech-impact` | Validate technical capacity |
| Create architecture docs | `/architecture` | Document technical implications |

---

Begin strategic planning now.
