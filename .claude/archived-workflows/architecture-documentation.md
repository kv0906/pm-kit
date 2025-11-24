# Architecture Documentation Workflow

## Long-CoT Architecture Documentation Framework

This workflow enables systematic exploration and documentation of system architecture for non-technical Product Managers, translating technical implementation into PM-friendly language with visual representations.

## Phase 1: Codebase Discovery

### Step 1.1: Repository Structure Mapping
- Identify main directories and their purposes
- Locate configuration files (package.json, docker-compose, requirements.txt, etc.)
- Find entry points (main files, server files, index files)
- Identify test directories and documentation
- **Verification**: Core project structure understood? All major directories identified?

### Step 1.2: Technology Stack Identification
- Programming languages used (primary and secondary)
- Frameworks and libraries (React, Django, Express, etc.)
- Database technologies (PostgreSQL, MongoDB, Redis, etc.)
- Infrastructure tools (Docker, Kubernetes, CI/CD)
- **Verification**: Complete technology inventory created?

### Step 1.3: Component Discovery
- Identify major services/modules/packages
- Locate API definitions (REST, GraphQL, gRPC)
- Find database schemas and models
- Map background jobs and scheduled tasks
- **Verification**: All executable components identified?

## Phase 2: Dependency Analysis

### Step 2.1: Internal Dependencies
- Map service-to-service communication
- Identify shared libraries and utilities
- Document data dependencies between components
- Create dependency graph (Mermaid diagram)
- **Verification**: Circular dependencies identified? Critical paths mapped?

### Step 2.2: External Dependencies
- Third-party APIs and services
- Authentication providers (OAuth, SSO)
- Payment gateways, email services, etc.
- Cloud provider services (AWS S3, Google Cloud)
- **Verification**: All external touchpoints documented?

### Step 2.3: Data Flow Mapping
- Request lifecycle (user action → response)
- Data transformation points
- Caching layers and strategies
- Event-driven flows (if applicable)
- **Backtracking Point**: If data flow unclear, return to Step 1.3 for deeper component analysis

## Phase 3: Architecture Pattern Recognition

### Step 3.1: Identify Architecture Type
- **Monolithic**: Single unified codebase
- **Microservices**: Independent services
- **Serverless**: Function-as-a-Service
- **Hybrid**: Mix of patterns
- **Verification**: Pattern correctly identified with evidence?

### Step 3.2: Communication Patterns
- **Synchronous**: REST API, RPC calls
- **Asynchronous**: Message queues, pub/sub
- **Real-time**: WebSockets, Server-Sent Events
- **Batch**: Scheduled jobs, ETL processes
- **Verification**: All communication mechanisms documented?

### Step 3.3: Data Architecture Analysis
- Database types and purposes (transactional, analytical, cache)
- Data models and key entities
- Data consistency strategy (ACID, eventual consistency)
- Backup and disaster recovery approach
- **Verification**: Data architecture clearly understood?

## Phase 4: Translation to PM Language

### Step 4.1: Component Translation
For each major component, translate:
- **Technical name** → **Business capability**
- **Implementation details** → **What it enables for users**
- **Technical constraints** → **Product limitations**
- Use analogy library for complex concepts
- **Verification**: Non-technical PM can understand each component?

### Step 4.2: Create Visual Representations
Generate Mermaid diagrams:
1. **System Overview**: High-level component relationships
2. **Data Flow**: User request → system → response
3. **Deployment Architecture**: How components are deployed
4. **Integration Map**: External service connections
- **Verification**: Diagrams accurate and easy to understand?

### Step 4.3: Constraint Identification
Translate technical constraints to product implications:
- **Performance limits** → Impact on user experience
- **Scalability boundaries** → User growth limitations
- **Security restrictions** → Feature constraints
- **Cost implications** → Budget considerations
- **Verification**: All constraints mapped to product impact?

## Phase 5: Impact Analysis

### Step 5.1: Feature Feasibility Matrix
Categorize features by implementation complexity:
- **Easy (1-2 weeks)**: Within existing capabilities
- **Moderate (3-6 weeks)**: Requires integration work
- **Complex (2-3 months)**: New infrastructure needed
- **Very Complex (6+ months)**: Major architectural changes
- **Verification**: Examples provided for each category?

### Step 5.2: Change Impact Zones
Map system areas by change risk:
- **Safe zones**: Low risk, well-isolated components
- **Integration zones**: Medium risk, multiple dependencies
- **Core infrastructure**: High risk, system-wide impact
- **Third-party dependent**: External risk factors
- **Verification**: PM understands where changes are risky?

### Step 5.3: Technical Debt Identification
Document technical debt affecting product:
- Legacy code limiting new features
- Performance bottlenecks
- Security vulnerabilities
- Maintenance burden areas
- **Backtracking Point**: If major debt blocks product goals, escalate for refactoring discussion

## Phase 6: Documentation Generation

### Step 6.1: Executive Summary
- System purpose and key capabilities (2-3 sentences)
- Architecture type and rationale
- Scale characteristics (users, requests, data volume)
- Critical constraints for product planning
- **Verification**: Executive can understand this summary?

### Step 6.2: Component Documentation
For each major component, document:
- Plain-English name and purpose
- Product capabilities it enables
- Key dependencies
- Technical constraints
- File locations in codebase
- **Verification**: Complete information for PM decision-making?

### Step 6.3: PM Glossary Creation
Define technical terms used in documentation:
- Jargon-free definitions
- Real-world analogies
- Examples in product context
- Links to deeper technical docs (for reference)
- **Verification**: All technical terms explained?

## Phase 7: Validation and Refinement

### Step 7.1: Technical Accuracy Review
- Verify architecture diagrams with engineering
- Confirm constraint accuracy
- Validate performance/scale numbers
- Check technical terminology
- **Verification**: Engineering sign-off obtained?

### Step 7.2: PM Comprehension Test
- Can PM explain system to stakeholders?
- Can PM assess basic feature feasibility?
- Can PM identify change impact areas?
- Can PM ask smart technical questions?
- **Backtracking Point**: If comprehension low, return to Step 4.1 for better translation

### Step 7.3: Documentation Refinement
- Add clarifying diagrams where needed
- Expand glossary for unclear terms
- Include more analogies for complex concepts
- Add examples for abstract explanations
- **Verification**: Documentation clear and actionable?

## Error Correction Mechanisms

### Automatic Detection
- **Incomplete component mapping**: Alert if major directories not explained
- **Missing diagrams**: Warn if complex architecture lacks visual representation
- **Undefined technical terms**: Flag jargon without glossary entry
- **Inconsistent translations**: Detect conflicting component descriptions

### Manual Review Checkpoints
- Phase 2 completion: Engineering review of dependencies
- Phase 4 completion: PM comprehension test
- Phase 7 completion: Final accuracy and clarity review
- Post-documentation: Update based on usage feedback

## Output Artifacts

1. **Architecture Documentation** (`./docs/architecture/[system-name]-architecture-[date].md`)
   - Executive summary
   - System overview diagrams
   - Component descriptions
   - Constraint analysis
   - PM implications

2. **PM Glossary** (`./docs/architecture/[system-name]-glossary.md`)
   - Technical term definitions
   - Analogies library
   - Examples and context

3. **Feature Feasibility Guide** (`./docs/architecture/[system-name]-feasibility-guide.md`)
   - Easy/Moderate/Complex/Very Complex categories
   - Change impact zones
   - Smart questions for engineering

4. **Visual Diagram Collection** (embedded in documentation)
   - System overview (Mermaid)
   - Data flow diagrams
   - Deployment architecture
   - Integration map

## Integration Points

- **Feeds into PRD Framework**: Technical approach section
- **Supports Tech Impact Assessment**: Architecture baseline
- **Informs Feature Prioritization**: Technical complexity input
- **Enables Technical Translation**: Base knowledge for code explanations
- **Guides Strategic Planning**: Technical capability assessment

## Success Criteria

- Non-technical PM can explain system architecture to stakeholders
- PM can assess basic feature feasibility independently
- PM understands which changes are easy vs. risky
- PM can ask informed technical questions in discussions
- Engineering confirms documentation accuracy
- PM glossary enables autonomous learning
- Visual diagrams make complex concepts accessible

## PM Technical Literacy Development

This workflow progressively builds PM technical understanding:

### Level 1: Basic Awareness (After Phase 1-2)
- Knows major system components
- Understands high-level data flow
- Can identify main technologies

### Level 2: Functional Understanding (After Phase 3-4)
- Understands architecture patterns
- Can explain system to non-technical stakeholders
- Knows key constraints

### Level 3: Decision-Making Capability (After Phase 5-6)
- Can assess feature feasibility
- Understands change impact
- Makes informed technical trade-offs

### Level 4: Technical Partnership (After Phase 7)
- Engages effectively with engineering
- Asks smart technical questions
- Contributes to technical discussions

## Common Architecture Patterns - PM Translation

### Monolithic Architecture
**Technical**: Single unified application
**PM Translation**: Like a kitchen where everyone cooks together—fast to build initially, but changes affect everyone
**Implications**: Quick initial development, all-or-nothing deployments, scaling means scaling everything

### Microservices Architecture
**Technical**: Independent services with API communication
**PM Translation**: Like a food court with specialized restaurants—teams work independently but coordination is complex
**Implications**: Team autonomy, complex integration, can scale services independently

### Event-Driven Architecture
**Technical**: Components react to events/messages
**PM Translation**: Like a news broadcasting system—actions trigger automatic responses across system
**Implications**: Enables real-time features, harder to debug, eventual consistency

### Serverless Architecture
**Technical**: Functions run on-demand without managing servers
**PM Translation**: Like vending machines—pay per use, automatically available
**Implications**: Auto-scaling, cold start delays, cost per request

### Three-Tier Architecture
**Technical**: Presentation, logic, data layers
**PM Translation**: Like restaurant (dining room, kitchen, pantry)—clear separation of concerns
**Implications**: Standard web applications, clear boundaries, easier to understand

## Advanced Documentation Techniques

### Progressive Disclosure
Start simple, add detail progressively:
1. **One-paragraph summary**: System purpose
2. **One-page overview**: Major components and flow
3. **Multi-page deep-dive**: Component details and constraints
4. **Appendix**: Technical specifications and references

### Layered Diagrams
Create diagrams at multiple abstraction levels:
- **Level 1**: Business capabilities view (what system does for users)
- **Level 2**: Component view (major services and their relationships)
- **Level 3**: Technical view (implementation details and infrastructure)

### Analogy Consistency
Use consistent analogies throughout documentation:
- If system is a "restaurant," database is "pantry," API is "menu"
- Maintain metaphor across all explanations
- Avoid mixing metaphors (don't switch to "factory" mid-document)

## Quality Checklist

**Completeness**:
- [ ] All major components documented
- [ ] All external dependencies identified
- [ ] All technical constraints mapped to product impact
- [ ] Visual diagrams for each key concept

**Clarity**:
- [ ] No undefined technical jargon
- [ ] Analogies used for complex concepts
- [ ] Examples provided for abstract ideas
- [ ] Diagrams clear and labeled

**Actionability**:
- [ ] PM can assess feature feasibility
- [ ] Change impact zones identified
- [ ] Smart questions provided for engineering discussions
- [ ] Constraints inform product decisions

**Accuracy**:
- [ ] Engineering reviewed and approved
- [ ] Performance/scale numbers verified
- [ ] Diagrams match actual architecture
- [ ] Constraints accurately represent limitations

## Continuous Improvement

Update architecture documentation when:
- Major technical changes occur (new services, infrastructure)
- PMs ask questions not covered in docs
- Analogies prove confusing or inaccurate
- New PM joins team (test documentation effectiveness)
- Technical debt significantly impacts product planning

## Related Frameworks
- C4 Model for Software Architecture (Simon Brown)
- Architecture Decision Records (ADRs)
- System Thinking (Donella Meadows)
- Wardley Mapping (Simon Wardley)
