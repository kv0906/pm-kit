---
name: explain
description: "Explains concepts, product decisions, formulas, and systems at the user's requested depth and language. Use for /explain, how or why questions, first principles, or ELI5."
---

# /explain — Working Understanding

Answer first, then give the smallest mental model that helps the user apply it.
Adapted from the personal `explain-to-me` skill; keep `/explain` as the existing entry point.

## Input

`/explain [concept, formula, decision, system, or pasted material]`

Use the current topic when the user asks a follow-up. Read referenced material before explaining it.
Apply `_core/knowledge.md` to source claims and `_core/judgment.md` when explaining a product tradeoff.

## Depth and Language

- Simple question: answer directly; do not force a tutorial or fixed sections.
- Working understanding: explain the mechanism, necessary terms, and one useful example.
- First principles: work backward from the result to inputs, rules, constraints, and what breaks without each part.
- Technical depth: inspect the source; trace responsibilities, state, boundaries, and failure modes.
- ELI5: use everyday language without hiding a material exception or constraint.

Reply in the user's language. Preserve identifiers and useful technical terms; define unfamiliar terms when needed.
Use notation when it clarifies a formula. An analogy should reduce effort; explain its limits if they matter.

## Evidence and Decisions

Distinguish implemented behavior, observed results, assumptions, and interpretation.
Cite inspected sources for claims about a specific product, document, or codebase.
For a decision, explain the criteria, alternatives, uncertainty, and what would change the recommendation.
If a definition is missing, state the assumption. Ask only when it prevents a useful or safe answer.

## Output

Keep the answer in chat by default, regardless of length. Save a note only when the user asks.
When saving, follow `/doc` paths, frontmatter, links, and logging; keep the explanation's natural structure.
Use `/show-me` when a small visual makes the mechanism clearer.
Ask comprehension questions only when the user requests tutoring. Stop when the question is answered.
