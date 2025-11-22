# User Research Synthesis Workflow

## Systematic Research Analysis and Insight Generation

This workflow transforms raw user research data into actionable insights that inform product decisions, validate hypotheses, and drive user-centered design.

## Phase 1: Research Planning

### Step 1.1: Research Objectives Definition
- **Key questions**: What do we need to learn?
- **Decision to inform**: What product decision depends on this research?
- **Success criteria**: What answers would make this research successful?
- **Scope and constraints**: Timeline, budget, participant access
- **Verification**: Ensure research aligned with product needs

### Step 1.2: Research Methodology Selection
- **Qualitative methods**:
  - User interviews (exploratory, validation)
  - Usability testing (moderated, unmoderated)
  - Field studies and contextual inquiry
  - Diary studies
  - Focus groups
- **Quantitative methods**:
  - Surveys (attitude, behavioral)
  - Analytics analysis
  - A/B testing
  - Card sorting and tree testing
- **Method selection rationale**: Why chosen methods answer research questions
- **Cross-validation**: Multiple methods for triangulation

### Step 1.3: Participant Recruitment
- **Target personas**: Which user segments to include
- **Screening criteria**: How to qualify participants
- **Sample size**: Number needed for statistical or thematic saturation
- **Diversity considerations**: Ensure representative sample
- **Recruitment plan**: Channels and timeline

## Phase 2: Data Collection

### Step 2.1: Research Execution
- **Interview guide / Survey design**: Structured questions and protocols
- **Pilot testing**: Test with 1-2 participants, refine
- **Data collection**: Conduct interviews, deploy surveys, run tests
- **Raw data storage**: Organize recordings, transcripts, responses
  - Location: `./research/user-interviews/[study-name]/`
  - Location: `./research/surveys/[study-name]/`

### Step 2.2: Observation Documentation
- **Verbatim quotes**: Capture exact user language
- **Behavioral observations**: What users did (not just said)
- **Emotional responses**: Reactions, frustrations, delights
- **Context notes**: Environment, interruptions, circumstances
- **Artifacts**: Screenshots, photos, recordings

### Step 2.3: Data Organization
- **Tagging system**: Apply consistent labels and categories
- **Participant metadata**: Demographics, segment, date
- **Session notes**: Key observations per session
- **Verification**: Ensure data complete and properly stored

## Phase 3: Analysis and Synthesis

### Step 3.1: Qualitative Analysis
**Thematic Analysis**:
1. **Familiarization**: Read through all data multiple times
2. **Initial coding**: Identify interesting features, patterns
3. **Theme development**: Group codes into themes
4. **Theme review**: Refine and validate themes
5. **Theme definition**: Clearly name and define each theme
6. **Report generation**: Create narrative with evidence

**Affinity Mapping**:
- Write each observation on virtual/physical note
- Cluster related observations
- Identify patterns and themes
- Create hierarchy of insights
- Verification: Do themes emerge from data (not preconceptions)?

**Jobs-to-be-Done Analysis**:
- Identify functional jobs (tasks to accomplish)
- Identify emotional jobs (how users want to feel)
- Identify social jobs (how users want to be perceived)
- Map current solutions and workarounds
- Identify unmet needs and opportunities

### Step 3.2: Quantitative Analysis
**Survey Analysis**:
- Descriptive statistics (means, medians, distributions)
- Segmentation analysis (patterns by user type)
- Correlation analysis (relationships between variables)
- Statistical significance testing
- Trend analysis (if longitudinal data)

**Analytics Analysis**:
- Funnel analysis (where users drop off)
- Cohort analysis (behavior patterns over time)
- Feature usage analysis (adoption and engagement)
- User flow analysis (common paths)
- Anomaly detection (unexpected patterns)

**Cross-validation**: Do quantitative and qualitative findings align?

### Step 3.3: Insight Generation
**Insight Criteria**:
- **Surprising**: Not obvious or already known
- **Actionable**: Suggests clear product opportunities
- **Evidence-based**: Supported by data, not opinion
- **Relevant**: Matters to business and users
- **Specific**: Concrete and detailed

**Insight Template**:
```markdown
## Insight: [Descriptive title]

**What we learned**: [Clear statement of insight]

**Evidence**:
- [Quote/data point 1]
- [Quote/data point 2]
- [Quantitative metric]

**Why it matters**: [Business and user impact]

**Opportunity**: [Product implications]

**Related insights**: [Links to connected insights]
```

### Step 3.4: Persona Development/Refinement
**Persona Components**:
- **Demographics**: Age, role, experience level
- **Goals**: What they're trying to achieve
- **Pain points**: Current challenges and frustrations
- **Behaviors**: How they currently solve problems
- **Needs**: What would make them successful
- **Motivations**: Why they do what they do
- **Quote**: Representative statement
- **Verification**: Based on research data, not assumptions

## Phase 4: Opportunity Mapping

### Step 4.1: Problem Opportunity Matrix
- **User problems identified**: List all pain points discovered
- **Current solutions**: How users solve today (including workarounds)
- **Satisfaction level**: How well current solutions work (1-10)
- **Frequency**: How often this problem occurs
- **User segments affected**: Who experiences this problem
- **Opportunity score**: Calculate based on frequency × dissatisfaction × segment size

### Step 4.2: Solution Hypothesis Generation
- **Problem to solve**: Clearly defined user problem
- **Hypothesis**: We believe [solution] will help [users] achieve [goal]
- **Validation approach**: How we'll test this hypothesis
- **Success metrics**: What would prove hypothesis correct
- **Risks**: What could go wrong or invalidate hypothesis

### Step 4.3: Prioritization Input
- Provide prioritization data for opportunity backlog
- Connect insights to existing feature requests
- Identify new opportunities not yet in backlog
- Feed into Feature Prioritization workflow

## Phase 5: Documentation and Communication

### Step 5.1: Research Report Structure
```markdown
# [Study Name] Research Report

## Executive Summary
- Key insights (3-5 bullet points)
- Recommendations
- Next steps

## Research Objectives
- Questions we aimed to answer
- Decisions to inform

## Methodology
- Research methods used
- Participant details (n=X, demographics)
- Timeline and activities

## Key Findings
### Finding 1: [Title]
- Insight statement
- Supporting evidence
- Quotes and data
- Visualizations

[Repeat for each finding]

## User Personas
[If created/updated]

## Opportunities
- Product opportunities identified
- Prioritization suggestions

## Recommendations
- Immediate actions
- Short-term initiatives
- Long-term considerations

## Limitations
- Sample size, biases, constraints
- Confidence levels

## Appendix
- Raw data location
- Detailed methodology
- Participant screening criteria
- Interview guides/survey questions
```

### Step 5.2: Insight Distribution
- **Research repository**: Save to `./research/insights/[study-name].md`
- **Team share-out**: Present findings to product, eng, design
- **Stakeholder memo**: Executive summary for leadership
- **Wiki/knowledge base**: Add to searchable repository
- **PRD integration**: Link insights to relevant PRDs

### Step 5.3: Insight Library Maintenance
- **Tagging system**: Tag by theme, persona, problem area
- **Search capability**: Make insights easily discoverable
- **Connection mapping**: Link related insights across studies
- **Insight decay**: Review and update as context changes
- **Learning capture**: Track which insights led to which decisions

## Phase 6: Validation and Testing

### Step 6.1: Assumption Testing
- **Key assumptions**: List critical assumptions in insights
- **Validation methods**: How to test each assumption
- **Test designs**: Specific experiments or studies
- **Backtracking Point**: If validation fails, reassess insights

### Step 6.2: Prototype Testing
- **Concept testing**: Test solutions addressing insights
- **Usability testing**: Validate designs solve problems
- **Preference testing**: Compare alternative approaches
- **Feedback integration**: Iterate based on results

### Step 6.3: Post-Launch Learning
- **Metrics tracking**: Measure impact on predicted metrics
- **Follow-up research**: Did solution work as expected?
- **Learning documentation**: What we got right/wrong
- **Framework refinement**: Improve research and synthesis process

## Verification and Quality Assurance

### Level 1: Data Quality
- Sufficient sample size for method
- Diverse participant representation
- Complete data collection (no major gaps)
- Proper data storage and organization

### Level 2: Analysis Rigor
- Themes emerge from data (not imposed)
- Multiple researchers review for bias
- Quantitative analysis statistically sound
- Triangulation across multiple sources
- Disconfirming evidence considered

### Level 3: Insight Quality
- Insights meet quality criteria (surprising, actionable, evidence-based)
- Clear connection between data and insight
- Insights relevant to product decisions
- Opportunities clearly defined

### Level 4: Actionability
- Recommendations specific and feasible
- Prioritization guidance provided
- Clear next steps identified
- Stakeholders understand and accept findings

## Output Artifacts

1. **Research Report** (`./research/insights/[study-name]-report.md`)
2. **Insight Library Entry** (`./research/insights/[study-name]-insights.md`)
3. **Personas** (`./research/personas/[persona-name].md`)
4. **Opportunity Map** (`./frameworks/analysis/opportunity-map-[date].md`)
5. **Raw Data** (`./research/[method]/[study-name]/raw/`)
6. **Presentation Deck** (for stakeholder sharing)

## Integration Points

- Feeds into Problem Decomposition for problem definition
- Informs PRD Framework with user needs and requirements
- Provides data for Feature Prioritization frameworks
- Validates Strategic Planning user strategy
- Connects to Metrics & Analytics for baseline and tracking
- Supports Stakeholder Management with evidence

## Success Criteria

- Research objectives fully addressed
- Clear, actionable insights generated
- Findings validated and trusted by stakeholders
- Insights influence product decisions
- Opportunity pipeline enriched
- Knowledge captured and accessible for future reference
- Research process improves iteratively
