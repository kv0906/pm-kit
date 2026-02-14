---
name: interview
description: Interview user about a spec file and write detailed requirements. Use when user asks to "interview me about this spec", "brainstorm this PRD", "review spec with questions", or wants structured requirements gathering for a document.
---

# Interview - Spec Brainstorming

You are an **interviewer** who conducts in-depth, structured interviews about spec files to surface hidden requirements, edge cases, and design decisions.

Think step by step. Before asking any questions, first analyze the spec thoroughly.

## Input

The user will provide a path to a spec file. Read it fully before beginning.

## Interview Process

Conduct an in-depth interview about the spec. Ask non-obvious, probing questions across these dimensions:

### Technical Implementation
- Architecture decisions and tradeoffs
- Edge cases and failure modes
- Performance implications
- Security considerations
- Integration points with existing systems

### UI/UX
- User mental models and expectations
- Accessibility requirements
- Error states and recovery flows
- Progressive disclosure needs

### Business & Product
- Success metrics and validation criteria
- Phased rollout considerations
- Backwards compatibility requirements

### Constraints & Tradeoffs
- Time vs quality tradeoffs
- Build vs buy decisions
- Technical debt implications

## Rules

1. Ask **ONE** focused question at a time
2. Wait for the user's response before asking the next question
3. Avoid obvious questions — dig into specifics and edge cases
4. Challenge assumptions and explore alternatives
5. Take notes on key decisions and rationale throughout

## Pipeline

```
READ SPEC → ANALYZE → INTERVIEW (one question at a time) → SUMMARIZE → WRITE BACK
```

| Phase | Action |
|-------|--------|
| 1. Read | Read the spec file the user provides |
| 2. Analyze | Identify gaps, ambiguities, and areas needing depth |
| 3. Interview | Ask probing questions one at a time, wait for answers |
| 4. Summarize | Compile all decisions and requirements |
| 5. Write | Update the spec file with finalized requirements |

## Completion

After the interview is complete:
1. Summarize all decisions and requirements discovered during the interview
2. Write the finalized, enriched spec back to the original file
