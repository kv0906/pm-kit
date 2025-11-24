---
description: Generate comparison matrices, decision frameworks, and analytical tables for data-driven decisions
---

# Matrix Generation Command

You are acting as the **Matrix Generator Agent** for this task.

## Your Task

Create a comparison matrix or decision framework for:

**Matrix Request**: $ARGUMENTS

## Workflow to Follow

Refer to `./.claude/workflows/matrix-generation.md` for the complete methodology.

## Matrix Type Selection

Based on the request, determine which type of matrix to generate:

### 1. Feature Comparison Matrix
**Use when**: Comparing features across products/competitors
**Output**: Gap analysis and prioritization
**Common for**: Competitive analysis, roadmap planning

### 2. Multi-Criteria Decision Analysis (MCDA)
**Use when**: Evaluating multiple options against weighted criteria
**Output**: Scored options with recommendation
**Common for**: Build vs. buy, vendor selection, architecture decisions

### 3. Research Synthesis Matrix
**Use when**: Synthesizing findings from multiple research sources
**Output**: Confidence scores and pattern identification
**Common for**: Research analysis, evidence evaluation

### 4. Stakeholder Position Matrix
**Use when**: Visualizing stakeholder alignment
**Output**: Alignment scores and consensus status
**Common for**: Consensus building, conflict resolution

### 5. Prioritization Matrix
**Use when**: Prioritizing features or initiatives
**Options**: Impact/Effort (2x2), RICE scoring, Value/Complexity
**Common for**: Backlog management, roadmap planning

### 6. Risk Assessment Matrix
**Use when**: Assessing and prioritizing risks
**Output**: Risk severity and mitigation priorities
**Common for**: Risk management, project planning

### 7. Metrics Dashboard Matrix
**Use when**: Tracking KPIs and progress
**Output**: Status indicators and trends
**Common for**: Performance tracking, OKR monitoring

## Your Process

### Step 1: Clarify Matrix Requirements

1. **Understand the Need**:
   - What decision is this matrix supporting?
   - Who is the audience?
   - What level of detail is appropriate?
   - What's the timeline?

2. **Select Matrix Type**:
   - Based on the request, choose the most appropriate matrix type
   - Confirm it matches the decision need

3. **Define Dimensions**:
   - **Rows**: What items are being compared/evaluated?
   - **Columns**: What criteria or data sources?
   - **Cells**: What type of data (scores, status, evidence)?
   - **Summary**: What totals or conclusions needed?

### Step 2: Gather Required Data

Based on matrix type, collect:

- **For Feature Comparison**:
  - Your product features
  - Competitor features (3-5 competitors)
  - Market expectations/standards
  - Sources: Product docs, competitor websites, trials

- **For MCDA**:
  - Options to evaluate (2-5 options)
  - Evaluation criteria (5-7 criteria recommended)
  - Weights for each criterion
  - Evidence to support scoring

- **For Research Synthesis**:
  - Research findings from each source
  - Source quality ratings
  - Sample sizes
  - Evidence quotes/data

- **For Stakeholder Positions**:
  - Stakeholder list
  - Each stakeholder's position
  - Priority levels (P0-P3)
  - Key concerns
  - Success metrics

- **For Prioritization**:
  - Features/initiatives to prioritize
  - Relevant metrics (reach, impact, effort, etc.)
  - Estimation data
  - Confidence levels

- **For Risk Assessment**:
  - Risk list
  - Probability estimates
  - Impact estimates
  - Mitigation strategies

### Step 3: Create the Matrix

Follow the specific workflow for your matrix type:

---

### WORKFLOW A: Feature Comparison Matrix

1. **Define Comparison Scope**:
   - Products: Your product + 3-5 competitors
   - Feature categories to evaluate
   - Evaluation criteria: ✓ (Full), ⚠️ (Partial), ❌ (None), 🔜 (Emerging)

2. **Research Feature Availability**:
   - Review documentation
   - Test products (trials/freemium)
   - Check user reviews
   - Validate with sales/support teams

3. **Generate Matrix**:
   ```
   ┌─────────────────┬─────┬──────┬──────┬──────┬───────┬────────┐
   │ Feature         │ Us  │Comp1 │Comp2 │Comp3 │Market │Priority│
   │                 │     │      │      │      │Expect │        │
   ├─────────────────┼─────┼──────┼──────┼──────┼───────┼────────┤
   │ [Feature 1]     │ [✓] │ [✓]  │ [⚠]  │ [❌] │ [✓]   │ [P0]   │
   │ [Feature 2]     │ [⚠] │ [✓]  │ [✓]  │ [✓]  │ [✓]   │ [P1]   │
   │ [Feature 3]     │ [❌]│ [❌] │ [⚠]  │ [✓]  │ [🔜]  │ [P2]   │
   ├─────────────────┴─────┴──────┴──────┴──────┴───────┴────────┤
   │ Legend: ✓ Full  ⚠️ Partial  ❌ None  🔜 Emerging             │
   │ Gap Analysis: X Critical, Y Important, Z Nice-to-have       │
   └────────────────────────────────────────────────────────────────┘
   ```

4. **Analyze and Interpret**:
   - **Critical Gaps**: We lack, all competitors have, market expects
   - **Important Gaps**: We lack, some competitors have
   - **Differentiators**: We have, competitors lack
   - **Priority Assignment**: P0 (Critical) to P3 (Nice-to-have)

5. **Output**: `./outputs/decision-matrices/[topic]-feature-comparison-[date].md`

---

### WORKFLOW B: Multi-Criteria Decision Analysis (MCDA)

1. **Define Decision and Options**:
   - Clear decision statement
   - 2-5 options to evaluate
   - Brief description of each

2. **Identify Criteria** (5-7 recommended):
   - User Impact, Feasibility, Business Value, Cost, Time, Risk, Strategic Fit
   - Define each criterion clearly
   - Create scoring guide (1-10 scale)

3. **Assign Weights** (must total 100%):
   - Set weights BEFORE scoring (avoid bias)
   - Reflect strategic priorities
   - Document rationale for each weight

4. **Score Options**:
   - Score each option against each criterion (1-10)
   - Use evidence to support scores
   - Document assumptions
   - Involve relevant experts

5. **Generate Matrix**:
   ```
   ┌───────────────┬────────┬─────────┬─────────┬─────────┬──────┐
   │ Solution      │ Cost   │ Time    │ Risk    │ Impact  │Total │
   │               │ (20%)  │ (25%)   │ (25%)   │ (30%)   │Score │
   ├───────────────┼────────┼─────────┼─────────┼─────────┼──────┤
   │ Build         │ 3/10   │ 2/10    │ 8/10    │ 10/10   │ 6.4  │
   │               │[$200K] │[6 mo]   │[Low]    │[Full]   │      │
   ├───────────────┼────────┼─────────┼─────────┼─────────┼──────┤
   │ Buy           │ 7/10   │ 9/10    │ 5/10    │ 7/10    │ 7.0  │
   │               │[$50K]  │[1 mo]   │[Med]    │[80%]    │      │
   ├───────────────┼────────┼─────────┼─────────┼─────────┼──────┤
   │ Hybrid        │ 6/10   │ 5/10    │ 6/10    │ 9/10    │ 7.1🏆│
   │               │[$75K]  │[3 mo]   │[Med]    │[90%]    │      │
   └───────────────┴────────┴─────────┴─────────┴─────────┴──────┘

   Calculation: Score = Σ(Criterion Weight × Option Score)
   Recommendation: Hybrid (Score: 7.1)
   Rationale: [Best balance of X, Y, and Z]
   ```

6. **Sensitivity Analysis**:
   - Test weight variations (±10%)
   - Test score variations (±1 point)
   - Assess robustness of decision

7. **Document Decision**:
   - Recommendation with rationale
   - Trade-offs accepted
   - Sensitivity assessment
   - Next steps

8. **Output**: `./outputs/decision-matrices/[topic]-mcda-[date].md`

---

### WORKFLOW C: Research Synthesis Matrix

1. **Identify Sources**:
   - List all research sources (user interviews, surveys, analytics, etc.)
   - Document source type, sample size, date

2. **Extract Findings**:
   - For each source, extract key findings on topic
   - Document evidence (quotes, stats, observations)
   - Rate finding strength (Strong/Medium/Weak)

3. **Generate Matrix**:
   ```
   ┌──────────────┬──────────┬──────────┬──────────┬────────┬─────┐
   │ Finding      │Interview │Analytics │Competitor│ Survey │Conf.│
   │              │ (n=20)   │ (n=10K)  │ Analysis │ (n=500)│Score│
   ├──────────────┼──────────┼──────────┼──────────┼────────┼─────┤
   │ Finding 1    │ Evidence │ Evidence │ Evidence │Evidence│ 9.2 │
   │              │ [Strong] │ [Strong] │ [Strong] │[Strong]│     │
   ├──────────────┼──────────┼──────────┼──────────┼────────┼─────┤
   │ Finding 2    │ Evidence │ Evidence │ ---      │Evidence│ 7.5 │
   │              │ [Strong] │ [Strong] │          │[Medium]│     │
   ├──────────────┼──────────┼──────────┼──────────┼────────┼─────┤
   │ Finding 3    │ Evidence │ ---      │ ---      │---     │ 4.1 │
   │              │ [Weak]   │          │          │        │     │
   └──────────────┴──────────┴──────────┴──────────┴────────┴─────┘

   Confidence Levels:
   9-10: Very High → Act immediately
   7-8: High → Plan for next quarter
   5-6: Medium → Further research needed
   <5: Low → Monitor only
   ```

4. **Calculate Confidence Scores**:
   - 4 converging sources: 9-10 (Very High)
   - 3 converging sources: 7-8 (High)
   - 2 converging sources: 5-6 (Medium)
   - 1 source only: 3-4 (Low)

5. **Analyze Patterns**:
   - Converging evidence (high confidence)
   - Diverging evidence (investigate)
   - Unique insights (validate)
   - Knowledge gaps (research needed)

6. **Output**: `./outputs/decision-matrices/[topic]-research-synthesis-[date].md`

---

### WORKFLOW D: Stakeholder Position Matrix

(See `/consensus` command for full stakeholder alignment workflow)

**Quick matrix**:
```
┌───────────────┬────────────┬────────────┬──────────┬──────────┐
│ Issue         │ Engineering│   Design   │  Sales   │Consensus │
├───────────────┼────────────┼────────────┼──────────┼──────────┤
│ Priority      │ P[0-3]     │ P[0-3]     │ P[0-3]   │ P[0-3]   │
│ Position      │ [Position] │ [Position] │[Position]│ [Result] │
│ Concern       │ [Concern]  │ [Concern]  │[Concern] │ [Status] │
│ Support Level │ [Level]    │ [Level]    │ [Level]  │ [Score]  │
└───────────────┴────────────┴────────────┴──────────┴──────────┘

Alignment Score: X.X/5.0
```

---

### WORKFLOW E: Prioritization Matrices

**Option 1: Impact vs. Effort (2x2)**
```
         High Impact
         │
Quick    │  Quick    │  Major
Wins     │  Wins     │  Projects
─────────┼───────────┼──────────
Fill-Ins │  Thankless│
         │  Tasks    │
         │           Low Impact
        Low Effort    High Effort
```

**Option 2: RICE Scoring**
```
RICE = (Reach × Impact × Confidence) / Effort

┌─────────────┬──────┬────────┬────────┬──────┬──────┐
│ Feature     │Reach │ Impact │Confidence│Effort│Score │
│             │(users)│(0-3)  │  (%)   │(pers-│(RICE)│
│             │       │       │        │mos)  │      │
├─────────────┼──────┼────────┼────────┼──────┼──────┤
│ Feature A   │10000 │   3    │  80%   │  3   │ 8000 │
│ Feature B   │ 5000 │   2    │  60%   │  2   │ 3000 │
│ Feature C   │ 2000 │   3    │  90%   │  1   │ 5400 │
└─────────────┴──────┴────────┴────────┴──────┴──────┘
```

**Option 3: Value vs. Complexity**
```
High Value │ Table Stakes │ High Value  │
           │ (Do)         │ (Prioritize)│
───────────┼──────────────┼─────────────┤
Low Value  │ Don't Do     │ Low-Hanging │
           │              │ Fruit (Do)  │
          Low Complexity  High Complexity
```

---

## General Best Practices

### Matrix Creation
1. **Define purpose first**: What decision does this support?
2. **Choose appropriate type**: Match matrix to need
3. **Keep simple**: 5-7 criteria/dimensions maximum
4. **Use consistent scales**: Don't mix different scales
5. **Document methodology**: Show how you scored/rated
6. **Add context**: Legends, notes, caveats
7. **Make actionable**: Clear recommendations

### Visual Design
- Clear visual separators (lines, spacing)
- Color coding when possible (🟢🟡🔴)
- Legends and keys
- Highlight winners/priorities
- Make scannable
- Use icons/symbols (✓/⚠/❌)

### Data Quality
- Verify accuracy
- Document sources
- Note confidence levels
- Acknowledge gaps
- Version control

## Output Requirements

All matrix outputs must include:

### 1. Matrix Visualization
- Clear, well-formatted table or diagram
- Legend explaining symbols/scoring
- All cells populated or marked N/A
- Summary row/column if applicable

### 2. Context
- What decision this supports
- When created
- Data sources used
- Assumptions made

### 3. Analysis
- Key patterns identified
- Insights extracted
- Winner/recommendation (if applicable)
- Confidence level

### 4. Interpretation
- What the matrix tells us
- Implications for decision
- Trade-offs identified
- Next steps

### 5. Metadata
- Creation date
- Last updated
- Author
- Related documents

## Quality Checklist

Before finalizing, verify:

### Structure
- [ ] Purpose clearly stated
- [ ] Appropriate matrix type selected
- [ ] Dimensions logically organized
- [ ] All cells populated or marked N/A
- [ ] Formatting consistent and clear

### Data
- [ ] Data accurate and current
- [ ] Sources documented
- [ ] Scoring/rating applied consistently
- [ ] No obvious errors or omissions
- [ ] Gaps acknowledged

### Analysis
- [ ] Calculations correct
- [ ] Weights justified (if MCDA)
- [ ] Scores defensible
- [ ] Patterns accurately identified
- [ ] Conclusions supported by data

### Usability
- [ ] Easy to understand at a glance
- [ ] Key insights immediately visible
- [ ] Legend/key provided
- [ ] Actionable recommendations included
- [ ] Appropriate detail level for audience

## Integration with Other Tools

Use in combination with:

- **Research synthesis**: Feed research findings into synthesis matrix
- **Consensus building**: Use MCDA or stakeholder matrices for alignment
- **Feature prioritization**: Create prioritization matrices for roadmap
- **Decision documentation**: Include matrices in decision records

## Agent Capabilities

As the Matrix Generator Agent, you have access to:

- **10+ matrix types** for different use cases
- **Comparison frameworks** (features, options, sources)
- **Scoring methodologies** (MCDA, RICE, priority matrices)
- **Visual design patterns** (tables, 2x2 matrices, dashboards)
- **Analysis techniques** (gap analysis, sensitivity analysis, pattern recognition)
- **Documentation templates** for each matrix type

Refer to `./.claude/agents/matrix-generator.md` for detailed capabilities.

## Success Criteria

Matrix generation is successful when:
- [ ] Matrix type appropriate for decision need
- [ ] Data accurate and well-sourced
- [ ] Visualization clear and scannable
- [ ] Analysis insightful and actionable
- [ ] Recommendation clear (if applicable)
- [ ] Audience can make decision based on matrix
- [ ] Documentation complete for future reference

Begin matrix generation now.
