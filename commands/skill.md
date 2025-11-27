---
description: Interactive skill browser - learn technical concepts for PMs
---

# Skill Browser

Learn about: $ARGUMENTS

## Available Skills

| Skill | What You'll Learn | Difficulty |
|-------|-------------------|------------|
| `api-basics` | HTTP methods, status codes, REST concepts | Beginner |
| `json-fundamentals` | Reading and understanding JSON data structures | Beginner |
| `debug-without-code` | Debugging strategies without writing code | Beginner |
| `frontend-design` | How to specify frontend design requirements | Intermediate |
| `ascii-diagrams` | Creating effective ASCII diagrams and wireframes | Beginner |
| `mermaid-diagrams` | Mermaid syntax, optimization, rendering best practices | Intermediate |
| `gemini-grounded-search` | Real-time web search and code execution via Gemini API | Advanced |
| `excalidraw-skill` | Hand-drawn diagram creation for presentations | Beginner |

## Instructions

### If no argument provided:

Display the skill catalog above and ask:
- "Which topic would you like to learn about?"
- "What's your current experience level with technical concepts?"

### If topic specified:

1. **Load the skill** from `./skills/[topic]/SKILL.md`
2. **Present the overview** - What this skill covers
3. **Teach interactively** - Break down concepts with examples
4. **Provide quick reference** - Cheat sheet or summary
5. **Suggest related skills** - What to learn next

## Learning Approach

1. **Assess** - Understand user's current knowledge
2. **Explain** - Present concepts clearly with PM-relevant examples
3. **Practice** - Provide exercises or real-world scenarios
4. **Reference** - Offer quick-lookup resources

## Topic Matching

| User Says | Skill to Load |
|-----------|---------------|
| "api", "rest", "http", "endpoints" | `api-basics` |
| "json", "data", "payload", "structure" | `json-fundamentals` |
| "debug", "troubleshoot", "logs", "errors" | `debug-without-code` |
| "frontend", "ui", "design", "specs" | `frontend-design` |
| "ascii", "text diagram", "box drawing" | `ascii-diagrams` |
| "mermaid", "flowchart", "sequence", "gantt" | `mermaid-diagrams` |
| "gemini", "search", "grounding", "web search" | `gemini-grounded-search` |
| "excalidraw", "hand-drawn", "sketch" | `excalidraw-skill` |

## Example Usage

```
/skill                    # Show all skills
/skill api                # Learn API basics
/skill json               # Learn JSON fundamentals
/skill mermaid            # Learn Mermaid diagrams
/skill debug              # Learn debugging strategies
```

---

## Next Steps

After learning a skill:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Create diagrams | `/mermaid` or `/ascii` | Apply diagram skills |
| Explain code | `/explain-code` | Understand technical code |
| Assess feasibility | `/tech-impact` | Apply technical knowledge |
| Create architecture | `/architecture` | Document systems |

---

Begin skill browsing now.
