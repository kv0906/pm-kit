---
description: Apply multiple prioritization frameworks to feature backlog with systematic validation
---

# Feature Prioritization Command

You are acting as the **Prioritization Engine Agent** for this task.

## Your Task

Prioritize the following features using multiple frameworks:

**Features/Backlog**: {{input}}

## Workflow to Follow

Refer to `./.claude/workflows/feature-prioritization.md` for the complete methodology.

## Your Process

### Phase 1: Feature Normalization
1. **Standardize Features**:
   - Assign unique IDs
   - Categorize (UX, Performance, Security, Feature, Bug, Tech Debt)
   - Link to sources
   - Map dependencies

2. **Collect Baseline Data**:
   - User impact data
   - Business value estimates
   - Technical effort estimates
   - Strategic alignment

### Phase 2: Multi-Framework Scoring

Apply ALL of the following frameworks:

1. **RICE Scoring**: (Reach × Impact × Confidence) / Effort
   - Reach: Users affected per quarter
   - Impact: 0.25-3 scale
   - Confidence: Percentage
   - Effort: Person-months

2. **ICE Scoring**: (Impact × Confidence × Ease) / 3
   - Quick assessment
   - 1-10 scales

3. **Value vs. Effort Matrix**: 2×2 grid
   - Quick Wins (high value, low effort)
   - Big Bets (high value, high effort)
   - Fill-ins (low value, low effort)
   - Time Sinks (low value, high effort)

4. **Kano Model**: Categorize features
   - Must-have (basic expectations)
   - Performance (linear satisfaction)
   - Delighters (excitement features)
   - Indifferent
   - Reverse (some dislike)

5. **MoSCoW Method**:
   - Must have (60% capacity)
   - Should have (20% capacity)
   - Could have (20% capacity)
   - Won't have

6. **Weighted Scoring**: Custom criteria
   - Define criteria and weights
   - Score each feature
   - Calculate weighted totals

### Phase 3: Cross-Framework Analysis
1. **Normalize Scores**: Convert all to 0-100 scale
2. **Build Consensus**: Identify strong agreement vs. disagreement
3. **Sensitivity Analysis**: Test different scenarios
4. **Verification**: Frameworks applied consistently?

### Phase 4: Recommendation Generation
1. Synthesize across frameworks
2. Create priority tiers (P0, P1, P2, P3)
3. Document rationale for each decision
4. Prepare stakeholder communication

### Phase 5: Continuous Validation
1. Track actual vs. predicted impact post-launch
2. Calibrate frameworks based on results
3. Update prioritization as context changes

## Output Locations

- Prioritized Backlog: `./frameworks/prioritization/backlog-[date].md`
- Analysis Report: `./frameworks/prioritization/analysis-[date].md`
- Decision Log: `./decisions/logs/prioritization-[date].md`
- Visual Matrix: Include 2×2 plot in analysis

## Prioritization Report Structure

Your report must include:
- **Executive Summary**: Top priorities and rationale
- **Multi-Framework Results**: Scores from each framework
- **Consensus Analysis**: Where frameworks agree/disagree
- **Priority Tiers**: P0 (immediate), P1 (next), P2 (future), P3 (deprioritize)
- **Recommendations**: What to do and why
- **Trade-offs**: What we're not doing and why
- **Sensitivity Analysis**: How priorities change under different scenarios
- **Backtracking Triggers**: Conditions requiring reprioritization

## Quality Checklist

Before finalizing, verify:
- [ ] All features have complete scoring data
- [ ] Effort estimates validated by engineering
- [ ] Multiple frameworks applied
- [ ] Consensus documented with rationale
- [ ] Portfolio balanced across themes
- [ ] Stakeholder agreement obtained
- [ ] Decision rationale clear

## Agent Capabilities

Refer to `./.claude/agents/prioritization-engine.md` for detailed capabilities including:
- RICE scoring
- ICE framework
- Value vs. Effort matrix
- Kano model analysis
- MoSCoW method
- Weighted scoring model
- Cost of Delay (CD3)
- Backtracking protocols

---

## Next Steps

After completing prioritization, consider:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Get stakeholder alignment | `/consensus` | Build buy-in on priorities |
| Write PRD for top priority | `/prd` | Spec out highest priority feature |
| Create strategic plan | `/strategy` | Plan roadmap execution |
| Compare options further | `/matrix` | Deep-dive comparison if needed |

---

Begin feature prioritization now.
