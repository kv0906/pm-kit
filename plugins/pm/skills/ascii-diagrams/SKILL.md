# ASCII Diagrams for Product Managers

A practical guide to creating clear, text-based flowcharts and diagrams that work in any tool - from Slack to PRDs to code comments.

## Why ASCII Diagrams?

**Benefits for PMs**:
- **Universal**: Works everywhere (Slack, GitHub, docs, email)
- **Fast**: Faster than Figma for quick concepts
- **Version Control**: Git-friendly, shows changes clearly
- **Accessible**: No special tools needed
- **Claude-Friendly**: AI can read and generate these easily

**Use Cases**:
- User flows
- System architecture
- Decision trees
- Process flows
- State machines
- Data relationships

## Basic Building Blocks

### 1. Boxes (Components/Steps)

```
Simple box:
┌─────────┐
│  Login  │
└─────────┘

Rounded corners:
╭─────────╮
│  Login  │
╰─────────╯

Double border (emphasis):
╔═════════╗
║  Start  ║
╚═════════╝

Multiple boxes:
┌─────────┐  ┌──────────┐  ┌─────────┐
│  Login  │  │Dashboard │  │ Profile │
└─────────┘  └──────────┘  └─────────┘
```

### 2. Arrows (Flow Direction)

```
Horizontal flow:
Step 1 → Step 2 → Step 3 → Done

Vertical flow:
Start
  ↓
Process
  ↓
End

Bidirectional:
Client ←→ Server

Multiple paths:
     ┌→ Success
Start ├→ Pending
     └→ Failed
```

### 3. Decision Points (Diamonds)

```
       ┌─────┐
       │Start│
       └──┬──┘
          ↓
       ┌──────┐
       │Valid?│
       └─┬──┬─┘
      Yes│  │No
         ↓  ↓
    ┌────┐ ┌──────┐
    │Save│ │Error │
    └────┘ └──────┘
```

## User Flow Diagrams

### Example 1: Simple Login Flow

```
┌─────────────────────────────────────────────────┐
│            User Authentication Flow             │
└─────────────────────────────────────────────────┘

    ┌─────────┐
    │  Start  │
    └────┬────┘
         ↓
    ┌────────────┐
    │ Login Page │
    └─────┬──────┘
          ↓
    Enter credentials
          ↓
    ┌────────────┐
    │  Validate  │
    └─┬────────┬─┘
   Yes│        │No
      ↓        ↓
┌──────────┐  ┌────────────┐
│Dashboard │  │ Show Error │
└──────────┘  └─────┬──────┘
                    ↓
               ┌──────────┐
               │Try Again │
               └──────────┘
```

### Example 2: E-commerce Checkout

```
┌──────────────────────────────────────────────────┐
│           Checkout Process Flow                  │
└──────────────────────────────────────────────────┘

┌──────┐    ┌──────────┐    ┌─────────┐    ┌─────────┐
│ Cart │ →  │ Shipping │ →  │ Payment │ →  │Confirm  │
└──────┘    └──────────┘    └─────────┘    └─────────┘
   ↓             ↓               ↓              ↓
 Items      Address Info     Card Details   Review Order
   ↓             ↓               ↓              ↓
Validate   ←  Validate    ←  Authorize   →  Complete
   │             │               │              │
   │             │          ┌────┴────┐         │
   │             │      Success    Declined     │
   │             │          │         │         │
   └─────────────┼──────────┘         │         │
                 │                    ↓         │
                 │              ┌───────────┐   │
                 │              │Try Again/ │   │
                 └──────────────┤New Method │   │
                                └───────────┘   │
                                                 ↓
                                         ┌─────────────┐
                                         │Confirmation │
                                         └─────────────┘
```

### Example 3: Feature Flag Decision Tree

```
┌────────────────────────────────────────────────┐
│      Feature Flag Evaluation Flow              │
└────────────────────────────────────────────────┘

                ┌──────────────┐
                │  User Visits │
                └──────┬───────┘
                       ↓
            ┌──────────────────┐
            │ Feature Enabled? │
            └────┬────────┬────┘
              Yes│        │No
                 ↓        └──────────┐
       ┌─────────────────┐           ↓
       │In Target Group? │    ┌─────────────┐
       └────┬───────┬────┘    │ Old Version │
         Yes│       │No       └─────────────┘
            ↓       └───────┐
    ┌───────────┐           ↓
    │ % Rollout │    ┌─────────────┐
    └─────┬─────┘    │ Old Version │
          ↓          └─────────────┘
    ┌────────────┐
    │Random < %? │
    └─┬────────┬─┘
   Yes│        │No
      ↓        ↓
┌──────────┐ ┌─────────────┐
│New Feat. │ │ Old Version │
└──────────┘ └─────────────┘
```

## System Architecture Diagrams

### Example 1: Three-Tier Architecture

```
┌──────────────────────────────────────────────────┐
│           System Architecture                    │
└──────────────────────────────────────────────────┘

┌──────────────┐
│              │
│   Frontend   │  (React App)
│              │
└──────┬───────┘
       │ HTTPS
       ↓
┌──────────────┐
│              │
│   Backend    │  (Node.js API)
│              │
└───┬──────┬───┘
    │      │
    │      └──────────┐
    ↓                 ↓
┌─────────┐     ┌──────────┐
│Database │     │  Cache   │
│(Postgres)     │  (Redis) │
└─────────┘     └──────────┘
```

### Example 2: Microservices Architecture

```
┌─────────────────────────────────────────────────────────┐
│              Microservices Architecture                 │
└─────────────────────────────────────────────────────────┘

                    ┌─────────────┐
                    │   API       │
                    │   Gateway   │
                    └──────┬──────┘
                           │
        ┌──────────────────┼──────────────────┐
        ↓                  ↓                  ↓
  ┌───────────┐     ┌────────────┐    ┌───────────┐
  │   User    │     │  Product   │    │  Payment  │
  │  Service  │     │  Service   │    │  Service  │
  └─────┬─────┘     └──────┬─────┘    └─────┬─────┘
        ↓                  ↓                  ↓
  ┌───────────┐     ┌────────────┐    ┌───────────┐
  │   User    │     │  Product   │    │  Payment  │
  │    DB     │     │     DB     │    │    DB     │
  └───────────┘     └────────────┘    └───────────┘
        │                  │                  │
        └──────────────────┼──────────────────┘
                           ↓
                    ┌─────────────┐
                    │   Message   │
                    │    Queue    │
                    │  (RabbitMQ) │
                    └─────────────┘
```

### Example 3: Data Flow Diagram

```
┌──────────────────────────────────────────────────┐
│          Analytics Data Pipeline                 │
└──────────────────────────────────────────────────┘

┌──────────┐
│   User   │
│  Events  │
└────┬─────┘
     ↓
┌─────────────┐    ┌──────────────┐
│   Collect   │ →  │   Validate   │
│  (Segment)  │    │  (Lambda)    │
└─────────────┘    └──────┬───────┘
                          ↓
                   ┌──────────────┐
                   │    Store     │
                   │  (S3 Bucket) │
                   └──────┬───────┘
                          ↓
     ┌────────────────────┼────────────────────┐
     ↓                    ↓                    ↓
┌─────────┐         ┌──────────┐        ┌──────────┐
│ETL Job  │         │Analytics │        │Real-time │
│(Airflow)│         │Warehouse │        │Dashboard │
└────┬────┘         │(Snowflake)        │(Tableau) │
     ↓              └──────────┘        └──────────┘
┌─────────┐
│ Reports │
└─────────┘
```

## State Machine Diagrams

### Example: Order Status States

```
┌──────────────────────────────────────────────────┐
│          Order State Machine                     │
└──────────────────────────────────────────────────┘

              ┌─────────┐
              │ Pending │ ←─────┐
              └────┬────┘       │
                   ↓           cancel
             ┌──────────┐       │
             │ Confirmed│───────┘
             └────┬─────┘
                  ↓
             ┌─────────┐
             │Processing│
             └────┬─────┘
                  ↓
             ┌─────────┐      ┌─────────┐
        ┌────│ Shipped │─────→│Delivered│
        │    └─────────┘      └─────────┘
        │
        ↓
  ┌──────────┐
  │ Returned │
  └──────────┘

Allowed Transitions:
  Pending → Confirmed → Processing → Shipped → Delivered
           ↓                               ↘
        Cancelled                       Returned
```

## Sequence Diagrams

### Example: API Authentication Flow

```
┌──────────────────────────────────────────────────┐
│        OAuth Authentication Sequence             │
└──────────────────────────────────────────────────┘

 User         Client App      Auth Server     API Server
  │               │                │               │
  │ Click Login   │                │               │
  │──────────────>│                │               │
  │               │                │               │
  │               │ Redirect to    │               │
  │               │ /authorize     │               │
  │               │───────────────>│               │
  │               │                │               │
  │ Enter creds   │                │               │
  │──────────────────────────────>│               │
  │               │                │               │
  │               │ Auth code      │               │
  │               │<───────────────│               │
  │               │                │               │
  │               │ Exchange code  │               │
  │               │ for token      │               │
  │               │───────────────>│               │
  │               │                │               │
  │               │ Access token   │               │
  │               │<───────────────│               │
  │               │                │               │
  │               │ API request    │               │
  │               │ + token        │               │
  │               │───────────────────────────────>│
  │               │                │               │
  │               │                │  User data    │
  │               │<───────────────────────────────│
  │               │                │               │
  │ Show dashboard│                │               │
  │<──────────────│                │               │
```

## Table-Based Diagrams

### Example 1: Feature Comparison Matrix

```
┌──────────────────────────────────────────────────┐
│        Feature Comparison: Plans                 │
└──────────────────────────────────────────────────┘

Feature            │ Free  │ Pro   │ Enterprise
───────────────────┼───────┼───────┼────────────
Users              │   5   │  25   │ Unlimited
Storage (GB)       │   1   │  100  │ Unlimited
API Calls/month    │ 1,000 │ 50k   │ Unlimited
Priority Support   │   ✗   │   ✓   │     ✓
Custom Domain      │   ✗   │   ✓   │     ✓
SSO                │   ✗   │   ✗   │     ✓
SLA                │  None │ 99.5% │   99.9%
Price/month        │  $0   │  $49  │  Custom
```

### Example 2: Decision Matrix

```
┌──────────────────────────────────────────────────┐
│    Integration Options: Decision Matrix          │
└──────────────────────────────────────────────────┘

           │ Build │ Zapier │ Workato │ Custom API
───────────┼───────┼────────┼─────────┼───────────
Time       │ 8wks  │ 1 day  │ 2 weeks │  4 weeks
Cost       │ $80k  │ $500/m │ $2k/m   │  $30k
Flexibility│  ★★★  │   ★    │   ★★    │   ★★★
Maintenance│  High │  Low   │  Medium │  Medium
Scalability│  ★★★  │   ★    │   ★★★   │   ★★★
───────────┼───────┼────────┼─────────┼───────────
Score      │  8/15 │  7/15  │  11/15  │  10/15
```

## Timeline Diagrams

### Example: Product Roadmap

```
┌──────────────────────────────────────────────────┐
│           Q1 2024 Roadmap                        │
└──────────────────────────────────────────────────┘

Jan              Feb              Mar
├────────────────├────────────────├────────────────┤

┌────────────────────────┐
│ User Authentication    │
│ (OAuth + SSO)          │
└────────────────────────┘

      ┌─────────────────────────────┐
      │ Dashboard Redesign          │
      └─────────────────────────────┘

                    ┌──────────────────────────┐
                    │ API v2 Launch            │
                    └──────────────────────────┘

│       │              │              │         │
Kickoff  Sprint 1      Sprint 2       Sprint 3  Launch
```

## Collaboration Diagrams

### Example: Stakeholder Communication Map

```
┌──────────────────────────────────────────────────┐
│      Stakeholder Communication Flow              │
└──────────────────────────────────────────────────┘

                   ┌────────────┐
                   │     PM     │
                   └─────┬──────┘
                         │
         ┌───────────────┼───────────────┐
         ↓               ↓               ↓
    ┌─────────┐    ┌─────────┐    ┌─────────┐
    │Engineers│    │Designers│    │  Sales  │
    └────┬────┘    └────┬────┘    └────┬────┘
         │              │              │
Daily    │         Weekly│         Bi-weekly
Standup  │         Review│         Update
         │              │              │
         ↓              ↓              ↓
    ┌─────────────────────────────────────┐
    │     Shared Docs & Slack Channels    │
    └─────────────────────────────────────┘
```

## Tips for Creating ASCII Diagrams

### 1. Start Simple

```
Before:
╔══════════════════════════════════════════════╗
║  ┌──────────────────────────────────────┐  ║
║  │                                      │  ║
║  │        Overly Complex Box            │  ║
║  │                                      │  ║
║  └──────────────────────────────────────┘  ║
╚══════════════════════════════════════════════╝

After:
┌──────────────┐
│ Simple Box   │
└──────────────┘
```

### 2. Use Consistent Spacing

```
Bad:
Box1→Box2→→→Box3→Box4

Good:
Box1  →  Box2  →  Box3  →  Box4
```

### 3. Label Everything

```
┌─────────┐
│ Process │  ← What this does
└────┬────┘
     ↓      (Why this path)
┌─────────┐
│ Output  │
└─────────┘
```

### 4. Use Alignment

```
Left-aligned:
┌─────────┐
│   Box   │
└─────────┘
     ↓
┌─────────┐
│   Box   │
└─────────┘

Right-aligned:
     ┌─────────┐
     │   Box   │
     └─────────┘
           ↓
     ┌─────────┐
     │   Box   │
     └─────────┘
```

## Character Quick Reference

```
Box Characters:
┌ ─ ┐  Top corners & horizontal
│     │  Vertical sides
└ ─ ┘  Bottom corners

╭ ─ ╮  Rounded corners
│     │
╰ ─ ╯

╔ ═ ╗  Double border
║     ║
╚ ═ ╝

Arrows:
→ ← ↑ ↓  Directional
↔ ↕      Bidirectional
⇒ ⇐      Bold

Connectors:
├ ┤ ┬ ┴  T-junctions
┼         Cross
╭ ╮ ╰ ╯  Curved

Symbols:
✓ ✗      Check/X
★ ☆      Star
● ○      Circle
■ □      Square
```

## Tools for ASCII Diagrams

### 1. Online Tools
- **asciiflow.com** - Draw with mouse
- **textik.com** - Simple ASCII editor
- **draw.io** - Export to ASCII

### 2. Terminal Tools
- **boxes** - Draw boxes around text
- **figlet** - Large ASCII text
- **graph-easy** - Generate from markup

### 3. Editor Plugins
- VS Code: ASCII Tree Generator
- Sublime: ASCII Decorator
- Vim: DrawIt

## Practice Exercises

### Exercise 1: Draw Your Product's User Flow

Pick your product's core feature and diagram:
1. Entry point
2. Decision points
3. Success/failure paths
4. Exit points

### Exercise 2: System Architecture

Draw your product's architecture:
1. Frontend layer
2. Backend services
3. Databases
4. External APIs

### Exercise 3: Feature Rollout Timeline

Create a timeline showing:
1. Research phase
2. Design phase
3. Development sprints
4. QA & Launch

## Using with Claude

### Prompt Examples

**Generate Flow**:
```
Create an ASCII diagram showing the user flow for
password reset, including:
- Forgot password click
- Email verification
- Token validation
- New password entry
- Success confirmation
```

**Explain Architecture**:
```
Here's my system architecture as ASCII:
[paste diagram]

Can you identify potential bottlenecks and
suggest improvements?
```

**Convert to Diagram**:
```
Convert this text description to an ASCII flowchart:
1. User clicks checkout
2. If cart empty, show error
3. If cart has items, go to shipping
4. Collect address
5. Proceed to payment
```

## Next Steps

Now that you understand ASCII diagrams:

1. ✅ Practice with asciiflow.com
2. ✅ Create a user flow for your product
3. ✅ Add diagrams to your next PRD
4. ✅ Use `/visualize` command in ClaudeKit PM
5. ✅ Move on to **Frontend Prompts** skill

## Quick Reference Card

```
Common Patterns Cheat Sheet
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Linear Flow:
A → B → C → D

Branching:
     ┌→ B
A ───┼→ C
     └→ D

Decision:
    ┌────┐
    │ ?  │
    └┬──┬┘
  Yes│  │No

State Machine:
A ⇄ B ⇄ C

Sequence:
A │  B │  C
  ↓    ↓    ↓
  │────│────│
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Related Skills

- **Foundation**: JSON Fundamentals - Data structure understanding
- **Next**: Frontend Prompts - Design specifications
- **Advanced**: Debug Without Code - Process visualization
