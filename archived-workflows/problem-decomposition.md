# Problem Decomposition Workflow

## Long-CoT Problem Decomposition Framework

This workflow enables systematic breakdown of complex product problems into manageable components using first principles thinking and structured frameworks.

## Phase 1: Initial Problem Analysis

### Step 1.1: Problem Statement Clarification
- Extract core problem from ambiguous descriptions
- Identify implicit assumptions
- Define problem boundaries
- Distinguish symptoms from root causes
- **Verification**: Check problem completeness and clarity

### Step 1.2: Stakeholder Mapping
- Identify all affected parties (users, business, technical, legal, etc.)
- Map influence and interest levels using stakeholder matrix
- Define success criteria per stakeholder group
- Identify potential conflicts between stakeholder needs
- **Verification**: Validate coverage - ensure no critical stakeholders missed

### Step 1.3: Constraint Identification
- **Technical constraints**: Platform limitations, infrastructure, integrations
- **Resource constraints**: Budget, team capacity, skillsets
- **Time constraints**: Market windows, competitive pressure, dependencies
- **Regulatory constraints**: Compliance, privacy, security requirements
- **Business constraints**: Strategic alignment, revenue impact
- **Backtracking Point**: If constraints make problem unsolvable, return to problem redefinition

## Phase 2: Systematic Decomposition

### Step 2.1: First Principles Breakdown
- Identify core components of the problem
- Break down to atomic problem units
- Map dependencies between components
- Identify critical path elements
- **Verification**: Check for circular dependencies and logical consistency

### Step 2.2: Multi-Path Analysis
- **Primary solution path**: Most direct approach
- **Alternative approaches**: Backup strategies and creative solutions
- **Risk mitigation paths**: Fallback options if primary fails
- **Incremental paths**: Phased approach options
- **Cross-validation**: Compare paths for consistency and feasibility

### Step 2.3: Prioritization Matrix
- **Impact assessment**: User value, business value, strategic alignment
- **Effort estimation**: Development time, complexity, uncertainty
- **Risk evaluation**: Technical risk, market risk, execution risk
- **Dependencies**: Identify blockers and prerequisites
- **Verification**: Validate scoring consistency across framework

## Phase 3: Solution Framework Development

### Step 3.1: Component Solution Design
- Design solutions for individual components
- Define integration points between components
- Establish success metrics per component
- Create validation criteria
- **Verification**: Technical feasibility check with engineering

### Step 3.2: Validation Protocol
- **User validation criteria**: Desirability testing approach
- **Technical validation criteria**: Feasibility assessment checklist
- **Business validation criteria**: Viability metrics and thresholds
- **Market validation criteria**: Competitive positioning verification
- **Backtracking**: If validation fails, return to Phase 2 for path reassessment

## Phase 4: Documentation and Communication

### Step 4.1: Problem Tree Documentation
Create visual problem tree with:
- Root problem statement
- First-level decomposition
- Second and third-level breakdowns
- Dependency arrows
- Priority rankings

### Step 4.2: Solution Roadmap
- Component implementation sequence
- Milestone definitions
- Success metrics per milestone
- Risk mitigation checkpoints

## Error Correction Mechanisms

### Automatic Detection
- **Circular dependency detection**: Alert when component A depends on B and B depends on A
- **Constraint violation alerts**: Flag solutions that breach identified constraints
- **Missing stakeholder identification**: Warn about gaps in stakeholder coverage
- **Incomplete decomposition warnings**: Identify ambiguous or under-specified components

### Manual Review Checkpoints
- Phase completion reviews
- Cross-functional validation sessions
- Stakeholder alignment checks
- Technical feasibility reviews

## Output Artifacts

1. **Problem Tree Document** (`./analysis/problem-trees/[problem-name].md`)
2. **Stakeholder Matrix** (`./analysis/stakeholders/[problem-name].md`)
3. **Solution Framework** (`./analysis/solutions/[problem-name].md`)
4. **Prioritization Matrix** (`./frameworks/prioritization/[problem-name].md`)

## Integration Points

- Feeds into PRD Framework workflow for detailed specification
- Connects to Risk Assessment workflow for mitigation planning
- Links to Feature Prioritization for backlog management
- Integrates with Strategic Planning for roadmap alignment

## Success Criteria

- All stakeholders identified and mapped
- Problem broken down to atomic, actionable components
- Multiple solution paths explored and validated
- Clear prioritization with rationale
- Technical feasibility confirmed
- Business viability validated
- User desirability assessed
