# Documentation Standards Workflow

## Comprehensive Documentation Framework for Product Management

This workflow establishes standards and best practices for creating, maintaining, and organizing product management documentation to ensure clarity, consistency, and accessibility.

## Phase 1: Documentation Principles

### Step 1.1: Core Documentation Values
**Clarity**:
- Write for your audience
- Use simple, direct language
- Avoid jargon unless necessary
- Define terms when first used
- Use examples to illustrate concepts

**Completeness**:
- Answer all relevant questions
- Include necessary context
- Document assumptions and constraints
- Provide supporting evidence
- Link to related documentation

**Consistency**:
- Follow established templates
- Use consistent terminology
- Maintain standard structure
- Apply uniform formatting
- Align with brand voice

**Accessibility**:
- Easy to find and navigate
- Searchable and organized
- Available to appropriate audiences
- Mobile-friendly when possible
- Consider accessibility standards

**Maintainability**:
- Single source of truth
- Version control
- Clear ownership
- Regular updates
- Archive outdated docs

### Step 1.2: Documentation Types and Purposes
**Strategic Documents**:
- Vision and strategy
- Product roadmaps
- OKRs and goals
- Audience: Leadership, stakeholders
- Update: Quarterly

**Planning Documents**:
- PRDs and feature specs
- User stories and requirements
- Technical specifications
- Audience: Product, eng, design teams
- Update: Per initiative

**Research Documents**:
- User research reports
- Market analysis
- Competitive intelligence
- Audience: Product, design, marketing
- Update: Per study or quarterly

**Operational Documents**:
- Process documentation
- Runbooks and guides
- Templates and frameworks
- Audience: Team members
- Update: As needed

**Communication Documents**:
- Status updates
- Launch communications
- Stakeholder memos
- Audience: Varies
- Update: Per cadence

## Phase 2: Document Structure and Templates

### Step 2.1: Standard Document Structure
**Every document should include**:
```markdown
# [Document Title]

**Document Type**: [PRD/Strategy/Report/etc.]
**Owner**: [Name]
**Created**: [Date]
**Last Updated**: [Date]
**Status**: [Draft/In Review/Approved/Archived]
**Reviewers**: [Names]
**Related Docs**: [Links]

---

## Executive Summary
[Brief overview - what, why, when, who]

## [Main Content Sections]
[Organized logically for document type]

## Appendix
[Supporting details, data, references]

---

## Change Log
| Date | Author | Changes |
|------|--------|---------|
| [Date] | [Name] | [Description] |
```

### Step 2.2: PRD Template
```markdown
# [Feature/Product Name] PRD

**Document Owner**: [PM Name]
**Created**: [Date]
**Last Updated**: [Date]
**Status**: [Draft/In Review/Approved]
**Target Release**: [Date or Version]

---

## Executive Summary
**Problem**: [User problem in 1-2 sentences]
**Solution**: [Proposed solution in 1-2 sentences]
**Success Metrics**: [3-5 key metrics]
**Timeline**: [Key milestones]

## Background and Context
### Problem Statement
[Detailed description of user and business problem]

### User Research
[Key insights from user research]
[Link to research reports]

### Market Context
[Competitive landscape, market trends]

### Strategic Alignment
[How this supports product strategy and company goals]

## Goals and Success Metrics
### User Goals
- [Goal 1]
- [Goal 2]

### Business Goals
- [Goal 1]
- [Goal 2]

### Success Metrics
| Metric | Baseline | Target | Timeline |
|--------|----------|--------|----------|
| [Metric 1] | [Value] | [Value] | [Date] |

## User Personas and Use Cases
### Primary Personas
[Persona descriptions]

### Key Use Cases
1. **[Use Case Title]**: [Description]
2. **[Use Case Title]**: [Description]

## Solution Overview
[High-level description of solution]
[Key capabilities]
[User experience highlights]

## Detailed Requirements
### Functional Requirements
**User Story 1**: As a [user], I want [capability], so that [benefit]
- **Acceptance Criteria**:
  - Given [context]
  - When [action]
  - Then [outcome]

[Repeat for each user story]

### Non-Functional Requirements
- **Performance**: [Requirements]
- **Security**: [Requirements]
- **Accessibility**: [Requirements]
- **Scalability**: [Requirements]

### Out of Scope
[Explicitly list what's not included]

## Design
[Link to design files]
[Key user flows]
[Wireframes/mockups]

## Technical Approach
[High-level technical architecture]
[Link to detailed technical spec]
[API requirements]
[Data model]

## Implementation Plan
### MVP Scope
[Core features for MVP]

### Phased Rollout
- **Phase 1**: [Features] - [Timeline]
- **Phase 2**: [Features] - [Timeline]

### Dependencies
- [Dependency 1]: [Owner] - [Timeline]
- [Dependency 2]: [Owner] - [Timeline]

## Risks and Mitigations
| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| [Risk] | [H/M/L] | [H/M/L] | [Strategy] |

## Success Criteria and Launch Readiness
### Launch Criteria
- [ ] [Criteria 1]
- [ ] [Criteria 2]

### Post-Launch Monitoring
[What metrics to watch]
[Success/failure criteria]

## Open Questions
- [Question 1]
- [Question 2]

## Appendix
### Research Data
[Links to research]

### Competitive Analysis
[Competitive comparison]

### Technical Details
[Detailed technical information]

---

## Change Log
| Date | Author | Changes |
|------|--------|---------|
| [Date] | [Name] | [Initial draft] |
```

### Step 2.3: Strategy Document Template
```markdown
# [Product Name] Strategy [Year]

**Owner**: [PM Name]
**Created**: [Date]
**Last Updated**: [Date]
**Status**: [Draft/Approved]

---

## Executive Summary
[One-page overview of strategy]

## Vision and Mission
### Vision (3-5 years)
[Aspirational future state]

### Mission
[Core purpose and value proposition]

## Market Analysis
### Market Size and Growth
[TAM, SAM, SOM analysis]

### Market Trends
[Key trends shaping the market]

### Competitive Landscape
[Major competitors and positioning]

### Opportunities and Threats
[SWOT analysis]

## Strategic Objectives
### [Timeframe] Objectives
**Objective 1**: [Description]
- **Key Result 1**: [Metric and target]
- **Key Result 2**: [Metric and target]

[Repeat for each objective]

## Product Roadmap
### [Quarter/Year] Themes
[Major focus areas]

### Key Initiatives
[Major projects and features]

### Milestone Timeline
[Visual roadmap or table]

## Success Metrics
| Metric | Current | Target | Timeline |
|--------|---------|--------|----------|
| [Metric] | [Value] | [Value] | [Date] |

## Resource Plan
### Team Structure
[Team composition and roles]

### Budget Allocation
[Investment areas]

### Key Hires
[Critical positions to fill]

## Risk Management
[Key risks and mitigation strategies]

## Governance
[Decision framework, review cadence]

---

## Change Log
| Date | Author | Changes |
|------|--------|---------|
```

### Step 2.4: Research Report Template
```markdown
# [Study Name] Research Report

**Researcher**: [Name]
**Date**: [Date]
**Study Type**: [Interviews/Survey/Usability/etc.]

---

## Executive Summary
**Key Insights**:
- [Insight 1]
- [Insight 2]
- [Insight 3]

**Recommendations**:
- [Recommendation 1]
- [Recommendation 2]

## Research Objectives
[Questions we aimed to answer]

## Methodology
**Method**: [Interviews/Survey/etc.]
**Participants**: [n=X, demographics]
**Timeline**: [Dates]
**Recruitment**: [How participants found]

## Key Findings
### Finding 1: [Title]
**Insight**: [Clear statement]

**Evidence**:
- [Quote or data point]
- [Quote or data point]

**Impact**: [Why this matters]

**Opportunity**: [Product implications]

[Repeat for each finding]

## Recommendations
1. **[Recommendation]**: [Details]
2. **[Recommendation]**: [Details]

## Limitations
[Sample size, biases, constraints]

## Next Steps
[Follow-up research or actions]

## Appendix
[Raw data location, interview guides, etc.]

---

## Related Documents
- [Link to related research]
- [Link to PRD using this research]
```

## Phase 3: Writing Best Practices

### Step 3.1: Effective Writing Techniques
**Clarity**:
- Use active voice ("We will launch" not "It will be launched")
- Write short sentences (under 25 words)
- Break up long paragraphs (4-5 sentences max)
- Use bullet points for lists
- Use headings to structure content

**Precision**:
- Be specific ("Increase conversion by 15%" not "Improve conversion")
- Use concrete examples
- Define metrics clearly
- Avoid weasel words ("likely", "should", "might" without context)

**Conciseness**:
- Remove unnecessary words
- Avoid redundancy
- Get to the point quickly
- Use appendix for supporting details

**Storytelling**:
- Start with why (problem and impact)
- Use narrative structure (context, complication, resolution)
- Include user quotes and stories
- Make data meaningful with context

### Step 3.2: Visual Communication
**When to use visuals**:
- Complex relationships (diagrams)
- Data trends (charts)
- Process flows (flowcharts)
- User journeys (journey maps)
- Comparisons (tables)
- Hierarchy (org charts, taxonomies)

**Visual best practices**:
- Label clearly
- Keep simple and focused
- Use consistent style
- Make accessible (alt text, color contrast)
- Place near relevant text
- Link to higher resolution version

### Step 3.3: Formatting Standards
**Typography**:
- Use consistent heading hierarchy (H1, H2, H3)
- Use bold for emphasis sparingly
- Use italics for terms or quotes
- Use code formatting for technical terms
- Use lists for scanability

**Links**:
- Use descriptive link text (not "click here")
- Link to specific sections when possible
- Ensure links stay current
- Use relative links for internal docs

**Tables**:
- Use for structured data comparison
- Keep columns to minimum
- Use header row
- Align numbers right, text left
- Consider alternatives for mobile

## Phase 4: Document Management

### Step 4.1: Organization System
**File Naming Convention**:
```
[document-type]-[topic]-[date].md

Examples:
- prd-user-authentication-2024-03-15.md
- strategy-product-2024-annual.md
- research-mobile-onboarding-2024-03-20.md
- decision-pricing-model-2024-03-18.md
```

**Directory Structure**:
```
./prds/
  /templates/
  /active/
  /archive/
./specs/
  /technical/
  /functional/
./research/
  /user-interviews/
  /surveys/
  /insights/
  /personas/
./roadmaps/
  /quarterly/
  /annual/
  /strategic/
./metrics/
  /dashboards/
  /reports/
  /analyses/
./decisions/
  /logs/
  /templates/
  /reviews/
./frameworks/
  /prioritization/
  /analysis/
  /templates/
```

### Step 4.2: Version Control
**Document Status States**:
- **Draft**: Work in progress, not for distribution
- **In Review**: Ready for feedback
- **Approved**: Reviewed and approved
- **Published**: Broadly distributed
- **Archived**: Historical reference only

**Version Tracking**:
- Use change log at bottom of document
- Include date, author, and summary of changes
- Consider using git for complex documents
- Link to previous versions if major revision

**Review Process**:
1. Author completes draft
2. Self-review and edit
3. Send for review (specify reviewers and deadline)
4. Incorporate feedback
5. Get approval from decision maker(s)
6. Publish and distribute

### Step 4.3: Document Lifecycle
**Creation**:
- Start from template
- Fill in all required sections
- Set status to "Draft"
- Share for early feedback

**Active Use**:
- Keep updated with changes
- Link from related documents
- Reference in meetings and discussions
- Monitor for questions or confusion

**Maintenance**:
- Review quarterly for accuracy
- Update as context changes
- Archive when no longer relevant
- Maintain single source of truth

**Archival**:
- Move to archive folder
- Add "Archived" status and date
- Keep for historical reference
- Link to replacement if applicable

## Phase 5: Documentation Tools and Systems

### Step 5.1: Tool Selection Criteria
**Required capabilities**:
- Version control
- Search functionality
- Access control
- Collaboration features
- Template support
- Export options

**Tool options**:
- **Markdown + Git**: Simple, version controlled, developer-friendly
- **Notion/Confluence**: Rich collaboration, wikis
- **Google Docs**: Real-time collaboration, commenting
- **Specialized tools**: ProductBoard, Aha!, etc.

**Recommendation**: Use markdown in git for this ClaudeKit PM system

### Step 5.2: Search and Discoverability
**Make documents findable**:
- Descriptive file names
- Clear document titles
- Comprehensive README files
- Index or table of contents
- Consistent tagging
- Cross-linking between docs

**Search optimization**:
- Include keywords in titles and headings
- Use clear, searchable terminology
- Add metadata (tags, categories)
- Create glossary of terms

### Step 5.3: Access and Permissions
**Access levels**:
- **Public**: Anyone can view
- **Internal**: Company employees
- **Team**: Specific team or function
- **Confidential**: Named individuals only

**Consider**:
- Who needs to see this?
- What's the risk of broader access?
- How to balance transparency and sensitivity?
- Legal or compliance requirements?

## Phase 6: Collaboration and Review

### Step 6.1: Feedback Process
**Requesting feedback**:
- Be specific about what feedback you need
- Provide context and background
- Set clear deadline
- Specify how to provide feedback (comments, email, meeting)
- Thank reviewers for their time

**Providing feedback**:
- Be specific and constructive
- Explain reasoning
- Suggest alternatives
- Distinguish between "must fix" and "nice to have"
- Recognize what's working well

**Incorporating feedback**:
- Read all feedback before responding
- Categorize (must address, should consider, won't change)
- Update document with accepted changes
- Respond to reviewers about decisions
- Re-share if significant changes

### Step 6.2: Async vs Sync Review
**Async review (written feedback)**:
- Good for: Detailed editing, thoughtful review
- Tools: Comment features, tracked changes
- Timeline: Give 2-5 days for review

**Sync review (meeting)**:
- Good for: Complex discussions, consensus building
- Format: Share doc ahead, walk through in meeting
- Timeline: 30-60 min meeting

**Hybrid approach**:
- Async review first
- Sync meeting to resolve open questions

### Step 6.3: Stakeholder Sign-off
**When formal approval needed**:
- Strategic decisions
- Resource commitments
- Cross-functional initiatives
- Policy changes

**Sign-off process**:
- Clear approval criteria
- Designated approvers
- Approval deadline
- Document approval (email, sign-off section)
- Archive approved version

## Verification and Quality Assurance

### Level 1: Completeness
- All template sections included
- No placeholder text (TBD, TODO)
- Supporting evidence provided
- Links working and relevant

### Level 2: Clarity
- Audience can understand without explanation
- Terms defined
- Structure logical
- Grammar and spelling correct

### Level 3: Accuracy
- Facts verified
- Data sources cited
- Technical details reviewed
- Assumptions validated

### Level 4: Utility
- Document serves intended purpose
- Answers key questions
- Enables decisions or actions
- Referenced and used by team

## Output Artifacts

1. **Documentation Standards Guide** (this file)
2. **Document Templates** (`./frameworks/templates/`)
3. **Style Guide** (if needed, create separately)
4. **Documentation Index** (`./README.md` with links)

## Integration Points

- Templates used across all workflows
- Standards applied to all documentation
- Quality checks in review processes
- Organization system for all artifacts

## Success Criteria

- Consistent documentation across product org
- Easy to find information
- High-quality, clear documents
- Documents kept up to date
- Reduced time creating documents (templates)
- Improved stakeholder satisfaction with documentation
- Team follows standards naturally
