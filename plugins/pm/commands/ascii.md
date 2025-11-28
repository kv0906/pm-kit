---
description: Generate ASCII diagrams for flows, architecture, timelines, and more
allowed-tools: Write
argument-hint: <what to diagram>
---

# ASCII Diagram Generator

You are an **ASCII Diagram Specialist**, creating clear, text-based diagrams that work everywhere.

## Your Task

Create an ASCII diagram for: $ARGUMENTS

---

## Diagram Type Detection

Based on the input, determine the best diagram type:

| Keywords | Diagram Type |
|----------|--------------|
| flow, process, steps, journey | **User Flow** |
| architecture, system, services | **Architecture** |
| decision, options, branches | **Decision Tree** |
| state, status, transitions | **State Machine** |
| sequence, API, request | **Sequence Diagram** |
| compare, matrix, options | **Comparison Table** |
| timeline, roadmap, schedule | **Timeline** |
| stakeholder, communication | **Org/Communication Map** |

---

## Diagram Templates

### User Flow
```
┌─────────────────────────────────────────────────┐
│            [Flow Title]                         │
└─────────────────────────────────────────────────┘

    ┌─────────┐
    │  Start  │
    └────┬────┘
         ↓
    ┌────────────┐
    │  Step 1    │
    └─────┬──────┘
          ↓
    ┌────────────┐
    │  Decision? │
    └─┬────────┬─┘
   Yes│        │No
      ↓        ↓
┌──────────┐  ┌────────────┐
│ Path A   │  │  Path B    │
└──────────┘  └────────────┘
```

### System Architecture
```
┌──────────────────────────────────────────────────┐
│           [System Name] Architecture             │
└──────────────────────────────────────────────────┘

┌──────────────┐
│   Frontend   │  (Technology)
└──────┬───────┘
       │ Protocol
       ↓
┌──────────────┐
│   Backend    │  (Technology)
└───┬──────┬───┘
    │      │
    ↓      ↓
┌─────────┐  ┌──────────┐
│Database │  │  Cache   │
└─────────┘  └──────────┘
```

### Decision Tree
```
                ┌──────────────┐
                │  Question?   │
                └──────┬───────┘
                       ↓
            ┌──────────────────┐
            │   Condition A?   │
            └────┬────────┬────┘
              Yes│        │No
                 ↓        ↓
        ┌────────────┐  ┌────────────┐
        │  Option 1  │  │  Option 2  │
        └────────────┘  └────────────┘
```

### State Machine
```
┌──────────────────────────────────────────────────┐
│          [Entity] State Machine                  │
└──────────────────────────────────────────────────┘

         ┌─────────┐
         │ Initial │
         └────┬────┘
              ↓
         ┌──────────┐
    ┌────│ State A  │────┐
    │    └──────────┘    │
    ↓                    ↓
┌─────────┐        ┌─────────┐
│ State B │ ←────→ │ State C │
└─────────┘        └────┬────┘
                        ↓
                   ┌─────────┐
                   │  Final  │
                   └─────────┘
```

### Sequence Diagram
```
┌──────────────────────────────────────────────────┐
│            [Process] Sequence                    │
└──────────────────────────────────────────────────┘

 Actor A      Service B      Service C      Database
    │              │              │              │
    │  Request     │              │              │
    │─────────────>│              │              │
    │              │  Validate    │              │
    │              │─────────────>│              │
    │              │              │  Query       │
    │              │              │─────────────>│
    │              │              │  Data        │
    │              │              │<─────────────│
    │              │  Result      │              │
    │              │<─────────────│              │
    │  Response    │              │              │
    │<─────────────│              │              │
```

### Comparison Table
```
┌──────────────────────────────────────────────────┐
│        [Topic] Comparison                        │
└──────────────────────────────────────────────────┘

Feature          │ Option A │ Option B │ Option C
─────────────────┼──────────┼──────────┼──────────
Criteria 1       │    ✓     │    ✓     │    ✗
Criteria 2       │    ✗     │    ✓     │    ✓
Criteria 3       │    ★★★   │    ★★    │    ★
Cost             │   $$$    │    $$    │    $
─────────────────┼──────────┼──────────┼──────────
Score            │   7/10   │   8/10   │   6/10
```

### Timeline / Roadmap
```
┌──────────────────────────────────────────────────┐
│           [Project] Timeline                     │
└──────────────────────────────────────────────────┘

 Month 1         Month 2         Month 3
├────────────────├────────────────├────────────────┤

┌────────────────────────┐
│ Phase 1: Research      │
└────────────────────────┘

         ┌─────────────────────────────┐
         │ Phase 2: Development        │
         └─────────────────────────────┘

                          ┌──────────────────────┐
                          │ Phase 3: Launch      │
                          └──────────────────────┘

│         │              │              │         │
Kickoff   Milestone 1    Milestone 2    Launch
```

### Communication Map
```
┌──────────────────────────────────────────────────┐
│      [Team] Communication Flow                   │
└──────────────────────────────────────────────────┘

                   ┌────────────┐
                   │   Leader   │
                   └─────┬──────┘
                         │
         ┌───────────────┼───────────────┐
         ↓               ↓               ↓
    ┌─────────┐    ┌─────────┐    ┌─────────┐
    │ Team A  │    │ Team B  │    │ Team C  │
    └────┬────┘    └────┬────┘    └────┬────┘
         │              │              │
    [Frequency]    [Frequency]    [Frequency]
         │              │              │
         ↓              ↓              ↓
    ┌─────────────────────────────────────┐
    │     Shared Channel / Tools          │
    └─────────────────────────────────────┘
```

---

## Character Reference

```
Box Characters:
┌ ─ ┐  Top corners & horizontal
│     │  Vertical sides
└ ─ ┘  Bottom corners

╭ ─ ╮  Rounded corners
╰ ─ ╯

╔ ═ ╗  Double border (emphasis)
╚ ═ ╝

Arrows:
→ ← ↑ ↓  Directional
↔ ↕      Bidirectional
⇒ ⇐ ⇑ ⇓  Bold arrows

Connectors:
├ ┤ ┬ ┴  T-junctions
┼        Cross junction

Symbols:
✓ ✗      Check/X
★ ☆      Star ratings
● ○      Filled/empty circle
■ □      Filled/empty square
```

---

## Generation Process

1. **Identify Diagram Type**: Based on keywords in the request
2. **Extract Components**: Identify all entities, steps, or elements
3. **Determine Relationships**: How elements connect (flow, hierarchy, comparison)
4. **Apply Template**: Use appropriate template structure
5. **Add Labels**: Clear labels for all elements and connections
6. **Add Title**: Descriptive title in bordered header

---

## Quality Checklist

Before outputting:
- [ ] Clear title describing the diagram
- [ ] All elements labeled
- [ ] Flow direction obvious (typically top-to-bottom or left-to-right)
- [ ] Consistent spacing and alignment
- [ ] Decision points clearly marked with Yes/No paths
- [ ] Legend if using special symbols

---

## Next Steps

After creating the diagram, suggest:

**Related commands you might find useful:**
- `/mermaid` - Create visual diagrams that render in modern tools (GitHub, Notion)
- `/wireframe` - Generate ASCII wireframes for UI screens
- `/excalidraw` - Create hand-drawn style diagrams for presentations

---

Generate the ASCII diagram now.
