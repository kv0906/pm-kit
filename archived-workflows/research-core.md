# Research Core Workflow

## Base Research Framework for All Research Types

This is the core research workflow that provides shared methodology for all research activities in ClaudeKit PM. It implements the fundamental phases that all research types share, with extension points for specialized research approaches.

---

## Overview

**Purpose**: Provide unified, systematic research methodology with quality assurance and validation protocols

**Research Types Supported**:
- Multi-source research synthesis
- User research data synthesis
- Evidence quality assessment
- Analytics synthesis

**Core Principles**:
1. Evidence-based decision making
2. Triangulation across multiple sources
3. Confidence scoring and transparency
4. Systematic validation at each phase
5. Actionable insights generation

---

## Phase 1: Research Planning

### Step 1.1: Define Research Objectives

**Goal**: Clearly articulate what needs to be learned and why

**Activities**:
1. **Identify the decision**: What product decision depends on this research?
2. **Formulate key questions**: What specific questions must be answered? (3-5 questions)
3. **Set success criteria**: What answers would make this research successful?
4. **Define scope**: What's in scope vs. out of scope?
5. **Set constraints**: Timeline, budget, resource availability
6. **Establish confidence threshold**: What minimum confidence level is needed? (e.g., 7/10)

**Output Template**:
```markdown
# Research Objectives: [Topic]

## Decision to Inform
[What product decision depends on this research?]

## Key Research Questions
1. [Primary question - must answer]
2. [Secondary question - should answer]
3. [Tertiary question - nice to answer]

## Success Criteria
- [ ] [Criterion 1: Specific, measurable]
- [ ] [Criterion 2: Specific, measurable]
- [ ] [Minimum confidence level: X/10]

## Scope
**In Scope**: [What we're investigating]
**Out of Scope**: [What we're explicitly NOT investigating]

## Constraints
- Timeline: [Duration]
- Budget: [Amount]
- Resources: [Team, tools]
```

**Verification Checkpoint**:
- [ ] Decision clearly stated
- [ ] 3-5 key research questions defined
- [ ] Success criteria measurable
- [ ] Scope boundaries set
- [ ] Stakeholders aligned on objectives

---

### Step 1.2: Identify Research Sources

**Goal**: Determine what sources will provide the needed information

**Source Categories**:

**Primary Research** (direct from users):
- User interviews (qualitative insights, n≥15 for saturation)
- Surveys (quantitative validation, n≥100 for statistical significance)
- Usability testing (behavioral observation, n≥5-8 per variant)
- Field studies (contextual understanding)
- A/B tests (causal evidence)

**Secondary Research** (existing data):
- Analytics (behavioral patterns, large sample sizes)
- Competitor analysis (market landscape)
- Industry reports (market trends)
- Academic research (theoretical foundation)
- Support tickets (pain points and frequency)
- Customer feedback (qualitative insights)

**Organizational Knowledge**:
- Sales feedback (customer needs, objections)
- Customer success insights (user challenges, workarounds)
- Engineering constraints (technical feasibility)
- Previous research (historical context, validation)
- Expert opinions (domain expertise)

**Selection Criteria**:
- **Relevance**: Directly addresses research questions (5/5 ideal)
- **Quality**: Reliable methodology and credible sources (4+/5 minimum)
- **Accessibility**: Can be obtained within timeline and budget
- **Timeliness**: Recent data preferred (<6 months ideal)
- **Sample Size**: Adequate for method and confidence needed

**Verification Checkpoint**:
- [ ] 3+ diverse sources identified (multi-source triangulation)
- [ ] Mix of qualitative and quantitative
- [ ] Sources accessible within timeline
- [ ] Gaps in coverage identified
- [ ] Data collection plan created

---

### Step 1.3: Create Research Plan

**Goal**: Document the complete research approach

**Research Plan Template**:
```markdown
# Research Plan: [Topic]
**Date**: [YYYY-MM-DD]
**Researcher**: [Name]
**Decision Owner**: [Name]

## Objective
[Clear statement of what decision needs to be made]

## Key Questions
1. [Question 1]
2. [Question 2]
3. [Question 3]

## Sources & Methods
| Source | Method | Sample | Timeline | Owner | Quality Est. |
|--------|--------|--------|----------|-------|--------------|
| User Interviews | Semi-structured | n=15 | Week 1 | PM | 4.5/5 |
| Analytics | Dashboard analysis | All users | Week 1 | Analyst | 5.0/5 |
| Survey | Online survey | n=500 | Week 1-2 | PM | 4.0/5 |
| Competitor Analysis | Feature audit | Top 5 | Week 1 | PM | 3.5/5 |

## Timeline
- **Week 1**: Data collection
- **Week 2**: Analysis and synthesis
- **Week 3**: Report and decision

## Success Criteria
- [ ] All key questions answered with ≥7/10 confidence
- [ ] Actionable insights generated
- [ ] Stakeholder alignment achieved

## Resources
- **Budget**: $X
- **Team**: [Names and roles]
- **Tools**: [Software/services needed]
```

**Verification Checkpoint**:
- [ ] Plan documented
- [ ] Timeline realistic
- [ ] Resources secured
- [ ] Stakeholders reviewed plan
- [ ] Ready to execute

---

## Phase 2: Data Collection

### Step 2.1: Execute Research Activities

**Goal**: Gather high-quality data from all planned sources

**Execution Principles**:
1. **Follow protocols**: Use consistent methodology
2. **Ensure quality**: Validate data as collected
3. **Document thoroughly**: Capture context and metadata
4. **Maintain ethics**: Privacy, consent, confidentiality
5. **Stay organized**: Structured storage and tagging

**Data Storage Standards**:
- **Raw data**: `./research/[source-type]/[study-name]/raw/`
- **Processed data**: `./research/[source-type]/[study-name]/processed/`
- **Metadata**: `./research/[source-type]/[study-name]/metadata.json`
- **Notes**: `./research/[source-type]/[study-name]/notes.md`

**Quality Checks During Collection**:
- [ ] Complete data captured (no major missing fields)
- [ ] Proper consent and permissions obtained
- [ ] Metadata documented (date, participant details, context)
- [ ] Data backed up securely
- [ ] Preliminary quality assessment performed

**Verification Checkpoint**:
- [ ] All planned data collected
- [ ] Quality checks performed
- [ ] Data properly stored
- [ ] Metadata documented
- [ ] Gaps identified and addressed

---

### Step 2.2: Evaluate Source Quality

**Goal**: Assess the reliability and relevance of each source

**Source Quality Framework**:

**Reliability (1-5 scale)**:
- **5 - Gold Standard**: Peer-reviewed research, controlled experiments, A/B tests with statistical significance
- **4 - High Quality**: Reputable sources, sound methodology, good sample size
- **3 - Moderate**: Acceptable methodology, some limitations acknowledged
- **2 - Low Quality**: Questionable methodology, significant biases, small sample
- **1 - Unreliable**: Anecdotal evidence, unverified claims, highly biased

**Recency (1-5 scale)**:
- **5 - Very Recent**: < 1 month old
- **4 - Recent**: 1-3 months
- **3 - Acceptable**: 3-6 months
- **2 - Aging**: 6-12 months
- **1 - Stale**: > 12 months (may be outdated)

**Relevance (1-5 scale)**:
- **5 - Directly Addresses**: Exactly answers research questions
- **4 - Highly Relevant**: Minor gaps but very useful
- **3 - Moderately Relevant**: Partially addresses questions
- **2 - Tangentially Relevant**: Provides some context
- **1 - Minimally Relevant**: Barely related

**Sample Size Assessment**:
- Document sample size for each source
- Note if statistically significant (for quantitative)
- Check for saturation (for qualitative)
- Consider representation and diversity
- Flag inadequate samples for caution

**Source Evaluation Matrix**:
```
┌─────────────┬──────────┬────────┬──────────┬────────┬──────┐
│ Source      │Reliability│Recency │Relevance │Sample  │Score │
│             │  (1-5)   │ (1-5)  │  (1-5)   │Size    │(Avg) │
├─────────────┼──────────┼────────┼──────────┼────────┼──────┤
│ [Source 1]  │    X     │   X    │    X     │  XXX   │  X.X │
│ [Source 2]  │    X     │   X    │    X     │  XXX   │  X.X │
│ [Source 3]  │    X     │   X    │    X     │  XXX   │  X.X │
├─────────────┴──────────┴────────┴──────────┴────────┴──────┤
│ Weighted Score: X.X/5.0                                     │
│ Overall Confidence Level: [HIGH/MEDIUM/LOW]                │
└──────────────────────────────────────────────────────────────┘
```

**Output**: `./outputs/evidence-logs/[topic]-source-quality-[date].md`

**Verification Checkpoint**:
- [ ] All sources evaluated systematically
- [ ] Quality scores assigned with justification
- [ ] Low-quality sources flagged
- [ ] Overall confidence level appropriate
- [ ] Documented in evidence log

---

## Phase 3: Analysis and Synthesis

### Step 3.1: Analyze Individual Sources

**Goal**: Extract findings from each source independently

**Analysis Methods by Data Type**:

**Qualitative Data**:
1. **Familiarization**: Read/review all data multiple times
2. **Coding**: Apply descriptive labels to data segments
3. **Theming**: Group codes into higher-level themes
4. **Validation**: Check themes against raw data
5. **Insight Extraction**: Generate actionable conclusions

**Quantitative Data**:
1. **Descriptive Statistics**: Means, medians, distributions
2. **Visualization**: Charts, graphs, dashboards
3. **Segmentation**: Patterns by user groups
4. **Statistical Testing**: Significance, correlations
5. **Trend Analysis**: Temporal patterns

**Mixed Methods**:
1. **Convergence**: Look for agreement across qualitative and quantitative
2. **Complementarity**: Use each method to enrich understanding
3. **Divergence**: Investigate discrepancies
4. **Integration**: Combine insights into unified understanding

**Verification Checkpoint**:
- [ ] Each source analyzed appropriately
- [ ] Findings documented with evidence
- [ ] Confidence levels assessed
- [ ] Limitations noted
- [ ] Ready for cross-source synthesis

---

### Step 3.2: Cross-Source Synthesis

**Goal**: Identify patterns, conflicts, and gaps across all sources

**Pattern Recognition**:

**Converging Evidence** (High Confidence):
- Where 3+ sources agree
- Strong, consistent pattern
- High confidence (8-10/10)
- **Action**: Trust and act on this insight

**Diverging Evidence** (Requires Investigation):
- Where sources conflict
- Need to understand why
- Medium to low confidence (4-6/10)
- **Action**: Investigate further or gather more data

**Unique Insights** (Single Source):
- Only one source reports this
- Low to medium confidence (3-5/10)
- **Action**: Validate with additional research or document as hypothesis

**Knowledge Gaps**:
- What we still don't know
- Critical vs. nice-to-know
- **Action**: Plan follow-up research or acknowledge limitation

**Research Synthesis Matrix**:
```
┌──────────────┬──────────┬──────────┬──────────┬────────┬─────┐
│ Finding      │Source 1  │Source 2  │Source 3  │Source 4│Conf.│
│              │(n=X)     │(n=Y)     │(n=Z)     │(n=W)   │Score│
├──────────────┼──────────┼──────────┼──────────┼────────┼─────┤
│ Finding 1    │ Evidence │ Evidence │ Evidence │Evidence│ 9.2 │
│ Finding 2    │ Evidence │ Evidence │ ---      │Evidence│ 7.5 │
│ Finding 3    │ Evidence │ ---      │ ---      │---     │ 5.1 │
└──────────────┴──────────┴──────────┴──────────┴────────┴─────┘

Confidence Score Calculation:
- 4+ sources converge: 9-10 (Very High Confidence)
- 3 sources converge: 7-8 (High Confidence)
- 2 sources converge: 5-6 (Medium Confidence)
- 1 source only: 3-5 (Low Confidence - depends on source quality)
```

**Output**: `./outputs/research-reports/[topic]-synthesis-matrix-[date].md`

**Verification Checkpoint**:
- [ ] All findings cross-referenced
- [ ] Patterns identified (converging, diverging, unique)
- [ ] Conflicts analyzed and explained
- [ ] Confidence scores calculated
- [ ] Matrix documented

---

### Step 3.3: Insight Generation

**Goal**: Transform findings into actionable insights

**Insight Quality Criteria**:

Every insight must be:
1. **Surprising**: Not obvious or already known
2. **Actionable**: Suggests clear product opportunities or decisions
3. **Evidence-based**: Grounded in data, not opinion or assumption
4. **Relevant**: Matters to both business goals and user needs
5. **Specific**: Concrete and detailed, not vague generalization

**Insight Template**:
```markdown
## Insight: [Descriptive Title]

**What we learned**:
[Clear, concise statement of the insight - 1-2 sentences]

**Evidence**:
- [Quote/data point from Source 1]
- [Statistical finding from Source 2]
- [Observation from Source 3]
- [Supporting data from Source 4]

**Confidence Level**: X/10
- **Sources**: X independent sources
- **Sample**: Total n=XXX across sources
- **Quality**: Average source quality X.X/5
- **Triangulation**: [Converging/Diverging/Unique]

**Why it matters**:
- **User Impact**: [How this affects users]
- **Business Impact**: [How this affects business metrics/goals]

**Implications**:
- **Product**: [What to build, change, or stop doing]
- **Strategy**: [How this affects product direction]
- **Operations**: [Process or organizational changes needed]

**Next Steps**:
1. [Immediate action - this sprint]
2. [Short-term action - this quarter]
3. [Long-term consideration - this year]

**Related Insights**: [Links to connected insights]
```

**Verification Checkpoint**:
- [ ] Insights meet all quality criteria
- [ ] Evidence clearly supports insights
- [ ] Confidence levels appropriately calibrated
- [ ] Implications actionable and specific
- [ ] Next steps defined

---

### Step 3.4: Prioritize Insights

**Goal**: Rank insights by importance and confidence

**Impact vs. Evidence Matrix**:
```
                Strong Evidence
           ┌─────────────┬─────────────┐
           │             │             │
High Impact│ PRIORITY 1  │ INVESTIGATE │
           │ Act Now     │ More Data   │
           │             │             │
           ├─────────────┼─────────────┤
           │             │             │
Low Impact │ DOCUMENT    │ IGNORE      │
           │ Track       │ Deprioritize│
           │             │             │
           └─────────────┴─────────────┘
          Weak Evidence    Strong Evidence
```

**Prioritization Criteria**:
1. **Impact** (1-10): Effect on users and business
2. **Evidence** (1-10): Strength and convergence of data
3. **Urgency** (1-10): Time sensitivity
4. **Feasibility** (1-10): Ease of acting on insight

**Priority Levels**:
- **P0 (Critical)**: High impact + Strong evidence + Urgent (act this sprint)
- **P1 (Important)**: High impact + Good evidence (plan this quarter)
- **P2 (Valuable)**: Medium impact or Medium evidence (roadmap this year)
- **P3 (Nice-to-have)**: Low impact or Weak evidence (backlog, revisit later)

**Verification Checkpoint**:
- [ ] All insights prioritized systematically
- [ ] Prioritization criteria applied consistently
- [ ] Priorities defensible with data
- [ ] Stakeholder input incorporated
- [ ] Priority matrix documented

---

## Phase 4: Documentation and Communication

### Step 4.1: Create Research Report

**Goal**: Document findings comprehensively

**Report Structure**:
```markdown
# Research Report: [Topic]
**Date**: [YYYY-MM-DD]
**Researcher**: [Name]
**Decision Owner**: [Name]

## Executive Summary
**Key Findings** (3-5 bullets):
- [Finding 1] (Confidence: X/10)
- [Finding 2] (Confidence: X/10)
- [Finding 3] (Confidence: X/10)

**Recommendations** (prioritized):
1. **Immediate** (This Sprint): [Action]
2. **Short-term** (This Quarter): [Action]
3. **Long-term** (This Year): [Action]

**Overall Confidence Level**: [HIGH/MEDIUM/LOW] (X.X/10)

## Research Objectives
- **Decision to inform**: [Description]
- **Key questions**: [List]
- **Success criteria**: [List]

## Methodology
### Sources Used
[Include source quality matrix]

### Methods Applied
[Description of research methods]

### Timeline
[Data collection dates]

### Participants/Sample
[Demographics and sample sizes]

## Key Findings

### Finding 1: [Title]
[Use insight template from Step 3.3]

### Finding 2: [Title]
[Use insight template from Step 3.3]

[Repeat for each priority finding]

## Research Synthesis
[Include synthesis matrix from Step 3.2]

**Converging Evidence**:
- [Pattern 1]: Supported by X sources
- [Pattern 2]: Supported by X sources

**Diverging Evidence**:
- [Conflict 1]: [Explanation]
- [Conflict 2]: [Explanation]

**Unique Insights**:
- [Insight 1]: From [Source]
- [Insight 2]: From [Source]

## Insights Prioritization
[Include impact/evidence matrix from Step 3.4]

## Recommendations

### Immediate Actions (This Sprint)
- [ ] [Action 1]
- [ ] [Action 2]

### Short-term Initiatives (This Quarter)
- [ ] [Initiative 1]
- [ ] [Initiative 2]

### Long-term Considerations (This Year)
- [ ] [Consideration 1]
- [ ] [Consideration 2]

## Knowledge Gaps
**What we still don't know**:
- [Gap 1]: [Description]
  - **Why it matters**: [Impact on decision]
  - **How to fill**: [Suggested research method]
  - **Priority**: [High/Medium/Low]

## Limitations
- **Sample size**: [If applicable]
- **Methodology constraints**: [If applicable]
- **Bias concerns**: [If applicable]
- **Generalizability**: [If applicable]
- **Data freshness**: [If applicable]

## Appendices
- A: Detailed Methodology
- B: Raw Data Location
- C: Interview Guide / Survey Questions
- D: Participant Screening Criteria
- E: Additional Analysis
```

**Output Location**: `./outputs/research-reports/[topic]-report-[date].md`

**Verification Checkpoint**:
- [ ] Report complete and comprehensive
- [ ] Findings clearly stated with evidence
- [ ] Limitations acknowledged
- [ ] Recommendations actionable
- [ ] Professional and polished

---

## Phase 5: Validation and Quality Assurance

### Quality Assurance Checklist

**Research Design Quality**:
- [ ] Objectives clearly defined and aligned with decision needs
- [ ] Appropriate methods selected for questions asked
- [ ] Adequate sample sizes for methods used
- [ ] Multiple sources used (3+ for triangulation)
- [ ] Bias mitigation planned and executed

**Data Quality**:
- [ ] Data complete and accurate
- [ ] Sources reliable (average quality ≥3.5/5)
- [ ] Methodology sound and well-documented
- [ ] Proper documentation and storage
- [ ] Privacy and ethics maintained

**Analysis Quality**:
- [ ] Appropriate analysis techniques used
- [ ] Patterns validated across sources
- [ ] Alternative explanations considered
- [ ] Confidence levels calibrated appropriately
- [ ] Limitations acknowledged explicitly

**Insight Quality**:
- [ ] Insights meet all quality criteria (surprising, actionable, evidence-based, relevant, specific)
- [ ] Strong evidence supports conclusions (avg confidence ≥7/10 for key findings)
- [ ] Actionable implications identified
- [ ] Relevant to strategic decisions
- [ ] Specific and concrete (not vague)

**Communication Quality**:
- [ ] Report clear and comprehensive
- [ ] Findings accessible to non-researchers
- [ ] Visual aids effective (matrices, charts)
- [ ] Recommendations actionable and prioritized
- [ ] Stakeholder buy-in achieved

---

## Success Criteria

Research is successful when:
- [ ] Research objectives fully addressed
- [ ] Confidence level ≥7/10 on key findings
- [ ] Clear, actionable insights generated
- [ ] Evidence from multiple sources triangulated
- [ ] Patterns and conflicts identified and explained
- [ ] Recommendations specific and prioritized
- [ ] Knowledge gaps identified with follow-up plan
- [ ] Limitations acknowledged transparently
- [ ] Stakeholders trust findings and make informed decisions

---

## Extension Points for Specialized Research

This core workflow provides the foundation. Specialized research types extend it with:

### Multi-Source Research Extensions
- Advanced triangulation methods
- Meta-analysis techniques
- Cross-industry benchmarking
- Longitudinal trend analysis

### User Research Extensions
- Persona development protocols
- Journey mapping frameworks
- Jobs-to-be-Done analysis
- Behavioral observation protocols

### Evidence Quality Extensions
- Detailed evidence hierarchies
- Source reliability frameworks
- Conflict resolution protocols
- Confidence calibration methods

### Analytics Research Extensions
- Statistical testing protocols
- Cohort analysis frameworks
- Funnel optimization methods
- Predictive modeling approaches

---

## Integration Points

**Feeds into**:
- Consensus Building (evidence for stakeholder alignment)
- Decision Making (data-driven decisions)
- Problem Decomposition (validated problem definition)
- PRD Framework (requirements validation)
- Feature Prioritization (evidence-based prioritization)
- Strategic Planning (market and user insights)

**Receives input from**:
- User interviews, surveys, usability tests
- Analytics systems (product, web, mobile)
- Market research and competitive intelligence
- Customer feedback (support, sales, success)
- Expert consultations
- Academic and industry research

---

## Continuous Improvement

**Learning Loop**:
1. Conduct research
2. Generate insights
3. Make decisions based on insights
4. Measure outcomes
5. Validate predictions
6. Refine research methods
7. Document learnings

**Process Optimization**:
- Track research-to-decision cycle time
- Measure prediction accuracy rate
- Assess stakeholder satisfaction
- Identify bottlenecks in process
- Refine templates and frameworks
- Build institutional knowledge base

---

**This core workflow ensures consistent, high-quality research across all ClaudeKit PM research activities.**
