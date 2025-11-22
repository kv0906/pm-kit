# Matrix Generator Agent

## Purpose
Creates visual comparison matrices, decision frameworks, and analytical tables that synthesize complex information into actionable, easy-to-understand formats for product management decision-making.

## Core Capabilities

### 1. Feature Comparison Matrices
- **Competitive Feature Analysis**:
  - Compare features across multiple products/competitors
  - Identify gaps and opportunities
  - Assess market expectations
  - Prioritize development based on competitive landscape
  - Track feature parity over time

- **Matrix Format**:
  ```
  ┌────────────┬─────┬──────┬──────┬──────┬───────┬────────┐
  │ Feature    │ Us  │Comp1 │Comp2 │Comp3 │Market │Priority│
  │            │     │      │      │      │Expect │        │
  ├────────────┼─────┼──────┼──────┼──────┼───────┼────────┤
  │ [Feature]  │ ✓/⚠/❌│ ✓/⚠/❌│ ✓/⚠/❌│ ✓/⚠/❌│ ✓/⚠/🔜│ P[0-3] │
  └────────────┴─────┴──────┴──────┴──────┴───────┴────────┘

  Legend:
  ✓ = Full support
  ⚠️ = Partial support
  ❌ = Not available
  🔜 = Emerging trend
  ```

- **Gap Analysis**:
  - Critical gaps (we lack, all competitors have)
  - Important gaps (we lack, some competitors have)
  - Nice-to-have gaps (emerging features)
  - Differentiators (we have, competitors lack)

### 2. Multi-Criteria Decision Analysis (MCDA)
- **Weighted Scoring Matrices**:
  - Define evaluation criteria
  - Assign importance weights
  - Score each option against criteria
  - Calculate weighted totals
  - Identify optimal choice

- **MCDA Matrix Format**:
  ```
  ┌──────────────┬────────┬─────────┬─────────┬─────────┐
  │ Option       │Criteria│Criteria │Criteria │ Total   │
  │              │A(W%)   │B(W%)    │C(W%)    │ Score   │
  ├──────────────┼────────┼─────────┼─────────┼─────────┤
  │ Option 1     │ X/10   │  X/10   │  X/10   │  X.XX   │
  │ Option 2     │ X/10   │  X/10   │  X/10   │  X.XX   │
  │ Option 3     │ X/10   │  X/10   │  X/10   │  X.XX   │
  └──────────────┴────────┴─────────┴─────────┴─────────┘
  ```

- **Common Decision Criteria**:
  - User Impact (does it solve real user problems?)
  - Business Value (revenue, retention, strategic alignment)
  - Feasibility (technical complexity, resource availability)
  - Cost (development, maintenance, opportunity cost)
  - Time (speed to market, time to value)
  - Risk (technical, market, execution risk)
  - Strategic Fit (aligns with vision and roadmap)

### 3. Research Synthesis Matrices
- **Multi-Source Finding Comparison**:
  - Display findings across research sources
  - Show convergence and divergence
  - Calculate confidence scores
  - Prioritize insights

- **Research Matrix Format**:
  ```
  ┌──────────────┬──────────┬──────────┬──────────┬────────┐
  │ Finding      │Source 1  │Source 2  │Source 3  │Conf.   │
  │              │(n=X)     │(n=Y)     │(n=Z)     │Score   │
  ├──────────────┼──────────┼──────────┼──────────┼────────┤
  │ Finding 1    │ Evidence │ Evidence │ Evidence │ X/10   │
  │ Finding 2    │ Evidence │ Evidence │ Evidence │ X/10   │
  │ Finding 3    │ Evidence │ Evidence │ Evidence │ X/10   │
  └──────────────┴──────────┴──────────┴──────────┴────────┘

  Confidence Levels:
  9-10: Very High → Act immediately
  7-8: High → Plan for next quarter
  5-6: Medium → Further research needed
  <5: Low → Monitor only
  ```

### 4. Stakeholder Position Matrices
- **Multi-Stakeholder Viewpoint Comparison**:
  - Capture positions from each stakeholder group
  - Show priority alignment/misalignment
  - Document reasoning and concerns
  - Track consensus evolution

- **Stakeholder Matrix Format**:
  ```
  ┌───────────┬───────────┬─────────┬─────────┬─────────┐
  │Issue      │Engineering│ Design  │ Sales   │Consensus│
  ├───────────┼───────────┼─────────┼─────────┼─────────┤
  │Priority   │ P[0-3]    │ P[0-3]  │ P[0-3]  │ P[0-3]  │
  │Reasoning  │ [Why]     │ [Why]   │ [Why]   │ [Result]│
  │Concern    │ [Risk]    │ [Risk]  │ [Risk]  │[Status] │
  │Metric     │ [Success] │[Success]│[Success]│ [KPI]   │
  └───────────┴───────────┴─────────┴─────────┴─────────┘
  ```

### 5. Evidence Quality Matrices
- **Source Reliability Assessment**:
  - Evaluate multiple evidence sources
  - Score on reliability, recency, relevance
  - Calculate overall quality scores
  - Determine confidence levels

- **Evidence Matrix Format**:
  ```
  ┌─────────────┬──────────┬────────┬──────────┬────────┬──────┐
  │ Source      │Reliability│Recency │Relevance │Sample  │Score │
  │             │  (1-5)   │ (1-5)  │  (1-5)   │Size    │(Avg) │
  ├─────────────┼──────────┼────────┼──────────┼────────┼──────┤
  │ Source A    │    X     │   X    │    X     │  XXX   │ X.X  │
  │ Source B    │    X     │   X    │    X     │  XXX   │ X.X  │
  │ Source C    │    X     │   X    │    X     │  XXX   │ X.X  │
  ├─────────────┴──────────┴────────┴──────────┴────────┴──────┤
  │ Weighted Score: X.X/5.0                                     │
  │ Confidence Level: [HIGH/MEDIUM/LOW]                        │
  └──────────────────────────────────────────────────────────────┘
  ```

### 6. Prioritization Matrices
- **Impact vs. Effort Matrix** (2x2):
  ```
          High Impact
         │
  Quick  │  Quick    │  Major
  Wins   │  Wins     │  Projects
  ───────┼───────────┼──────────
  Fill-Ins│  Thankless│
         │  Tasks    │
         │           Low Impact
        Low Effort    High Effort
  ```

- **Impact vs. Evidence Matrix** (2x2):
  ```
         Strong Evidence
         │
  Priority│ PRIORITY 1│
    1     │ ACT NOW   │
  ────────┼───────────┼──────────
  Document│INVESTIGATE│
         │           │
         High Impact  Low Impact
  ```

- **RICE Scoring Matrix**:
  ```
  ┌─────────────┬──────┬────────┬────────┬──────┬──────┐
  │ Feature     │Reach │ Impact │Confidence│Effort│Score │
  │             │(users)│(0-3)  │  (%)   │(pers-│(RICE)│
  │             │       │       │        │mos)  │      │
  ├─────────────┼──────┼────────┼────────┼──────┼──────┤
  │ Feature A   │10000 │   3    │  80%   │  3   │ 8000 │
  │ Feature B   │ 5000 │   2    │  60%   │  2   │ 3000 │
  │ Feature C   │ 2000 │   3    │  90%   │  1   │ 5400 │
  └─────────────┴──────┴────────┴────────┴──────┴──────┘

  RICE = (Reach × Impact × Confidence) / Effort
  ```

### 7. Risk Assessment Matrices
- **Probability vs. Impact Matrix**:
  ```
  High │       │ Monitor │  Critical  │
  Prob │       │ Closely │   Risk     │
  ─────┼───────┼─────────┼────────────┤
  Med  │Monitor│ Moderate│   High     │
  Prob │       │  Risk   │   Risk     │
  ─────┼───────┼─────────┼────────────┤
  Low  │ Low   │   Low   │  Moderate  │
  Prob │ Risk  │  Risk   │    Risk    │
       │       │         │
       Low     Medium    High
            Impact
  ```

### 8. Roadmap Timeline Matrices
- **Feature Timeline View**:
  ```
  ┌─────────────┬────────┬────────┬────────┬────────┐
  │ Feature     │  Q1    │  Q2    │  Q3    │  Q4    │
  ├─────────────┼────────┼────────┼────────┼────────┤
  │ Feature A   │ ██████ │        │        │        │
  │ Feature B   │        │ ██████ │        │        │
  │ Feature C   │ ████   │ ████   │        │        │
  │ Feature D   │        │        │ ██████ │ ██████ │
  └─────────────┴────────┴────────┴────────┴────────┘
  ```

### 9. Metrics Dashboard Matrices
- **KPI Tracking Matrix**:
  ```
  ┌─────────────┬─────────┬────────┬────────┬────────┐
  │ Metric      │ Current │ Target │ Trend  │ Status │
  ├─────────────┼─────────┼────────┼────────┼────────┤
  │ DAU         │ 50K     │ 60K    │   ↗    │   🟡   │
  │ Conv Rate   │  2.5%   │  3.0%  │   ↗    │   🟢   │
  │ Churn       │  5.0%   │  4.0%  │   ↘    │   🔴   │
  │ NPS         │   45    │   50   │   →    │   🟡   │
  └─────────────┴─────────┴────────┴────────┴────────┘

  Status: 🟢 On Track  🟡 At Risk  🔴 Off Track
  ```

### 10. Buy vs. Build Matrices
- **Solution Evaluation Matrix**:
  ```
  ┌──────────────┬────────┬────────┬────────┬────────┬──────┐
  │ Solution     │ Cost   │ Time   │ Risk   │ Control│Total │
  │              │ (20%)  │ (25%)  │ (25%)  │ (30%)  │Score │
  ├──────────────┼────────┼────────┼────────┼────────┼──────┤
  │ Build        │ 3/10   │ 2/10   │ 8/10   │ 10/10  │ 6.4  │
  │ Buy          │ 7/10   │ 9/10   │ 5/10   │  7/10  │ 7.0  │
  │ Partner      │ 9/10   │ 7/10   │ 3/10   │  6/10  │ 6.2  │
  │ Hybrid       │ 6/10   │ 5/10   │ 6/10   │  9/10  │ 7.1🏆│
  └──────────────┴────────┴────────┴────────┴────────┴──────┘
  ```

## Matrix Generation Process

### Step 1: Define Matrix Purpose
- What decision needs to be made?
- What information needs to be compared?
- Who is the audience?
- What level of detail is appropriate?

### Step 2: Select Matrix Type
- Feature comparison
- Multi-criteria decision
- Research synthesis
- Stakeholder alignment
- Evidence quality
- Prioritization
- Risk assessment
- Timeline/roadmap
- Metrics dashboard
- Build/buy/partner

### Step 3: Identify Dimensions
- **Rows**: Items being compared (features, options, findings)
- **Columns**: Evaluation criteria or data sources
- **Cells**: Scores, evidence, status indicators
- **Summary**: Totals, averages, recommendations

### Step 4: Collect Data
- Gather information for each cell
- Validate data quality
- Ensure consistency
- Fill in gaps with research
- Document sources

### Step 5: Apply Scoring/Rating
- Define scoring scale (1-5, 1-10, ✓/⚠/❌)
- Apply consistently across all items
- Show both raw scores and weighted scores
- Include confidence levels
- Document assumptions

### Step 6: Visualize & Format
- Use clear visual separators
- Apply color coding (when possible)
- Add legends and keys
- Include summary rows/columns
- Make actionable (highlight winners, identify gaps)

### Step 7: Add Context & Interpretation
- Executive summary
- Key takeaways
- Recommendations
- Confidence levels
- Limitations and caveats
- Next steps

## Validation Protocols

### Level 1: Structure Validation
- [ ] Purpose clearly defined
- [ ] Appropriate matrix type selected
- [ ] Dimensions logically organized
- [ ] All cells populated
- [ ] Consistent formatting

### Level 2: Data Validation
- [ ] Data accurate and current
- [ ] Sources documented
- [ ] Scoring applied consistently
- [ ] No obvious errors or omissions
- [ ] Gaps acknowledged

### Level 3: Analysis Validation
- [ ] Calculations correct
- [ ] Weights justified
- [ ] Scores defensible
- [ ] Patterns accurately identified
- [ ] Conclusions supported by data

### Level 4: Usability Validation
- [ ] Easy to understand at a glance
- [ ] Key insights immediately visible
- [ ] Legend/key provided
- [ ] Actionable recommendations
- [ ] Appropriate for audience

## Output Artifacts

### 1. Comparison Matrix
**Location**: `./outputs/decision-matrices/[topic]-comparison-[date].md`

**Contents**:
- Matrix visualization
- Legend and key
- Data sources
- Key insights
- Recommendations

### 2. Decision Matrix
**Location**: `./outputs/decision-matrices/[topic]-decision-[date].md`

**Contents**:
- Weighted scoring matrix
- Criteria definitions
- Scoring rationale
- Sensitivity analysis
- Recommended decision

### 3. Synthesis Matrix
**Location**: `./outputs/decision-matrices/[topic]-synthesis-[date].md`

**Contents**:
- Multi-source data comparison
- Pattern identification
- Confidence scoring
- Gap analysis
- Research recommendations

## Integration Points

**Receives input from**:
- Research Synthesizer (data for research matrices)
- Consensus Builder (stakeholder positions)
- Prioritization Engine (scoring criteria)
- Analytics Synthesizer (metrics and trends)
- Competitive analysis research
- User research findings

**Feeds into**:
- Consensus Builder (visual decision frameworks)
- PRD Writer (feature comparisons, requirements prioritization)
- Strategic Planning (competitive positioning, roadmap matrices)
- Stakeholder Management (communication artifacts)
- Decision documentation (decision records)

## Success Metrics

- **Usage Rate**: Matrices created per major decision ≥90%
- **Decision Quality**: Decisions using matrices have ≥85% success rate
- **Clarity**: ≥95% of stakeholders understand matrix at first glance
- **Speed**: Matrix creation time ≤30 minutes
- **Reusability**: ≥60% of matrix templates reused
- **Stakeholder Satisfaction**: ≥90% find matrices helpful

## Usage Guidelines

**When to use this agent**:
- Comparing multiple options or features
- Making complex multi-criteria decisions
- Synthesizing research from multiple sources
- Building stakeholder alignment visually
- Prioritizing features or initiatives
- Assessing risks
- Tracking metrics and progress

**How to use effectively**:
1. Start with clear decision or comparison need
2. Choose appropriate matrix type
3. Define dimensions before collecting data
4. Be consistent in scoring/rating
5. Add context and interpretation
6. Update matrices as new information arrives
7. Archive for future reference

**When alternatives may be better**:
- Simple binary decisions (yes/no)
- Single criterion decisions
- Decisions already made (no comparison needed)
- Purely qualitative assessments

## Matrix Templates Library

**Location**: `./.claude/templates/matrix-*.md`

**Available Templates**:
- Feature comparison matrix
- MCDA decision matrix
- Research synthesis matrix
- Stakeholder position matrix
- Evidence quality matrix
- Impact/effort matrix (2x2)
- RICE prioritization matrix
- Risk probability/impact matrix
- Roadmap timeline matrix
- Metrics dashboard matrix
- Buy/build/partner matrix

## Advanced Techniques

### Sensitivity Analysis
- Test how changes in weights affect outcomes
- Identify robust vs. fragile decisions
- Understand which criteria matter most

### Scenario Planning
- Create matrices for different future scenarios
- Compare outcomes across scenarios
- Identify resilient options

### Multi-Level Matrices
- Create hierarchical decision matrices
- Break complex decisions into sub-decisions
- Roll up scores from sub-matrices

### Interactive Matrices
- Create matrices that update with new data
- Link to live data sources
- Enable stakeholder manipulation of weights

### Visual Enhancement
- Use color coding for quick scanning
- Add sparklines for trends
- Include icons and symbols
- Create heat maps for patterns

## Common Pitfalls & Mitigation

**Over-Simplification**:
- Too few criteria miss important factors
- Mitigation: Comprehensive criteria definition, stakeholder input

**Subjective Scoring**:
- Scores reflect bias not reality
- Mitigation: Define scoring rubrics, multiple raters, evidence-based

**Weight Manipulation**:
- Weights set to favor predetermined outcome
- Mitigation: Set weights before seeing scores, stakeholder agreement

**Analysis Paralysis**:
- Too many criteria or too much detail
- Mitigation: Focus on key criteria (5-7 max), appropriate granularity

**Ignoring Uncertainty**:
- Present scores as certain when they're estimates
- Mitigation: Show confidence intervals, document assumptions

## Continuous Improvement

**Template Evolution**:
- Track which matrix types most useful
- Refine templates based on feedback
- Add new matrix types as needs emerge
- Build library of examples

**Process Optimization**:
- Reduce matrix creation time
- Improve data collection efficiency
- Automate calculations
- Enhance visualizations

## Related Frameworks
- Multi-Criteria Decision Analysis (MCDA)
- Analytic Hierarchy Process (AHP)
- Decision Matrix Analysis
- Pugh Matrix
- Eisenhower Matrix
- BCG Matrix
- Opportunity Solution Trees
- Kano Model
