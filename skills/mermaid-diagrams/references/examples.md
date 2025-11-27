# Mermaid Diagram Examples and Exercises

Practice exercises and prompt patterns for generating Mermaid diagrams with Claude.

---

## Practice Exercises

### Exercise 1: User Flow
Create a flowchart for password reset:
1. Forgot password link
2. Email verification
3. Token validation
4. New password entry
5. Success/error states

**Solution approach**:
- Use flowchart TD
- Include decision diamonds for validation
- Show error paths with dashed lines
- Color code success (green) and error (red) states

---

### Exercise 2: API Sequence
Draw a sequence diagram for OAuth flow:
1. User authorization request
2. Redirect to provider
3. Callback with code
4. Token exchange
5. API access

**Solution approach**:
- Define participants: User, App, OAuth Provider, API
- Use solid arrows for requests
- Use dashed arrows for responses
- Add notes for important steps

---

### Exercise 3: Project Timeline
Create a Gantt chart for feature launch:
1. Research phase (2 weeks)
2. Design phase (1 week, after research)
3. Development (3 weeks, after design)
4. QA and launch (1 week, after dev)

**Solution approach**:
- Use `dateFormat YYYY-MM-DD`
- Group tasks by section (Research, Design, Dev, Launch)
- Use `after` dependencies for sequential tasks
- Mark launch as milestone

---

## Using with Claude

### Prompt Examples

**Generate Diagram**:
```
Create a Mermaid flowchart showing the checkout process with:
- Cart review
- Shipping address collection
- Payment processing (success/failure paths)
- Order confirmation
```

**Optimize Existing**:
```
Here's my Mermaid diagram:
[paste diagram]

Can you optimize it to prevent overlapping lines and improve clarity?
```

**Convert Description**:
```
Convert this to a Mermaid sequence diagram:
1. User clicks login
2. Frontend sends credentials to backend
3. Backend validates with database
4. Backend returns JWT token
5. Frontend stores token and redirects
```

**Add Styling**:
```
Take this flowchart and add color coding:
- Green for entry and success states
- Red for error states
- Blue for decision points

[paste diagram]
```

---

## Common Patterns

### Pattern 1: Authentication Flow
```mermaid
flowchart TD
    A[User Login] --> B{Valid Credentials?}
    B -->|Yes| C[Generate Session]
    B -->|No| D[Show Error]
    C --> E[Redirect to Dashboard]
    D --> A

    style A fill:#e1f5e1
    style E fill:#90EE90
    style D fill:#ffcccb
```

### Pattern 2: API Request Flow
```mermaid
sequenceDiagram
    participant Client
    participant Gateway
    participant Service
    participant Database

    Client->>Gateway: HTTP Request
    Gateway->>Service: Validate & Route
    Service->>Database: Query Data
    Database-->>Service: Result Set
    Service-->>Gateway: Response
    Gateway-->>Client: JSON Response
```

### Pattern 3: Sprint Timeline
```mermaid
gantt
    title Sprint 23 - Q1 2025
    dateFormat YYYY-MM-DD

    section Planning
    Sprint Planning     :done, plan, 2025-01-06, 1d
    Story Breakdown     :done, stories, after plan, 1d

    section Development
    Feature A           :active, dev1, 2025-01-08, 5d
    Feature B           :dev2, 2025-01-10, 4d
    Integration         :dev3, after dev2, 2d

    section Testing
    QA Testing          :qa, after dev3, 2d
    Bug Fixes           :bugs, after qa, 2d

    section Release
    Deploy to Production :milestone, 2025-01-20, 1d
```

### Pattern 4: State Machine
```mermaid
stateDiagram-v2
    [*] --> Draft
    Draft --> Review: submit
    Review --> Approved: approve
    Review --> Rejected: reject
    Rejected --> Draft: revise
    Approved --> Published: publish
    Published --> Archived: archive
    Archived --> [*]
```

---

## Quick Reference Card

```
Common Mermaid Patterns
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Flowchart:
flowchart TD
    A[Box] --> B{Decision}
    B -->|Yes| C[Action]
    B -->|No| D[Alternative]

Sequence:
sequenceDiagram
    A->>B: Request
    B-->>A: Response

State:
stateDiagram-v2
    [*] --> State1
    State1 --> [*]

Gantt:
gantt
    dateFormat YYYY-MM-DD
    Task: t1, 2025-01-01, 7d
    Task2: after t1, 5d
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Real-World Examples

### E-commerce Checkout Flow
```mermaid
flowchart TD
    A[View Cart] --> B{Items in Cart?}
    B -->|No| C[Continue Shopping]
    B -->|Yes| D[Enter Shipping]
    D --> E[Select Payment]
    E --> F{Payment Valid?}
    F -->|No| G[Show Error]
    F -->|Yes| H[Process Order]
    G --> E
    H --> I[Confirmation Page]

    style A fill:#e1f5e1
    style I fill:#90EE90
    style G fill:#ffcccb
```

### Microservices Architecture
```mermaid
C4Context
    title E-commerce Platform Architecture

    Person(user, "Customer")
    System(web, "Web App", "React SPA")
    System(api, "API Gateway", "Kong")
    System(order, "Order Service")
    System(payment, "Payment Service")
    System(inventory, "Inventory Service")
    System_Ext(stripe, "Stripe", "Payment processor")

    Rel(user, web, "Uses")
    Rel(web, api, "API calls")
    Rel(api, order, "Routes")
    Rel(api, payment, "Routes")
    Rel(api, inventory, "Routes")
    Rel(payment, stripe, "Processes")
```

### Product Roadmap
```mermaid
gantt
    title Product Roadmap 2025
    dateFormat YYYY-MM-DD

    section Q1 - Foundation
    User Research          :done, q1_research, 2025-01-01, 30d
    MVP Design            :done, q1_design, 2025-02-01, 20d
    Core Development      :active, q1_dev, 2025-02-15, 45d

    section Q2 - Launch
    Beta Testing          :q2_beta, 2025-04-01, 20d
    Marketing Campaign    :q2_marketing, 2025-04-15, 30d
    Public Launch         :milestone, q2_launch, 2025-05-15, 1d

    section Q3 - Growth
    Feature Set A         :q3_features, after q2_launch, 60d
    Analytics Dashboard   :q3_analytics, 2025-06-01, 45d
    Mobile App Beta       :q3_mobile, 2025-07-15, 45d
```
