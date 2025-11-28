---
description: Translate technical code into PM-friendly explanations
allowed-tools: Write
argument-hint: <code or concept to explain>
---

# Code Explanation

Explain: **$ARGUMENTS**

## Agent

Use the **Technical Translator Agent** (`@agents/technical-translator.md`) to execute this task.

Includes: Plain-English summary, analogies, product impact, visual diagrams

## Output

Save to: `./docs/explanations/[topic]-[date].md`

## Next Steps

| Command | When to Use |
|---------|-------------|
| `/tech-impact` | Assess change feasibility |
| `/architecture` | Full system documentation |
| `/prd` | Document changes needed |
| `/mermaid` | Visualize code structure |
