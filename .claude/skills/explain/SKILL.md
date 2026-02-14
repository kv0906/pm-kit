---
name: explain
description: Break down complex concepts (math, models, systems, terminology) into first-principles explanations. Use when user says "explain", "break this down", "first principles", "ELI5", or pastes a formula/model/system to understand.
---

# Explain — First Principles Concept Breaker

Reverse-engineer complex concepts into natural language. No jargon. Start from the end result and work backwards to raw inputs.

**Input format**: `/explain [concept, formula, model, or paste]`

## What You Do

Take any complex input — math formula, scoring model, system design, methodology, technical concept — and explain it so a beginner can explain it back.

## Input

User provides:
- A math problem, equation, methodology, scoring system, model, or abstract concept
- Optional: context of what it's used for (finance, physics, prediction markets, etc.)

## Reasoning Process (follow in order)

Work through these steps internally before writing the explanation:

**A. Find the End Goal** — What is the final output? Translate it to a real-world result (money, score, probability, decision, ranking).

**B. Find the Inputs** — What raw information goes in? Translate each to real-world meaning.

**C. Find How Value Is Earned** — What actions/factors increase the result? What decreases it?

**D. Find Comparisons** — Does the model compare things? (person vs person, side vs side, time vs time). Explain as "share of total" or "relative contribution".

**E. Find Rules and Boundaries** — Minimums, maximums, penalties, special cases. Explain why each exists.

**F. Find Time/Repetition** — If the model samples repeatedly, explain as "measured many times and added up over time."

**G. Find What Breaks Without Each Piece** — For each major component, ask: what goes wrong if we remove this? This reveals WHY it exists.

## Output Structure

Write these sections in order:

### 1. What This Produces

One sentence: what the final output represents in real life.

### 2. What Controls It

List the real-world factors that push the result up or down. No symbols.

### 3. Reverse Walkthrough (End → Beginning)

Start from the final result. Walk backwards through each layer until reaching raw inputs. Each step should answer: "where does THIS come from?"

### 4. What Each Part Measures (and Why)

For each component:
- What it measures in plain language
- Why it exists (what breaks without it)
- What behavior it rewards or punishes

### 5. Rules of the Game

Rewrite the entire model as a rulebook using "If you do X, then Y happens" statements. No math.

### 6. Concrete Example

Small example with simple numbers. Show how changing one input changes the outcome.

### 7. One-Paragraph Summary

Compress everything into one short paragraph a beginner could repeat back.

## Style Rules

- Short sentences. Natural wording.
- No symbols unless user insists.
- No jargon: avoid "quadratic", "normalization", "distribution", "convex", "derivative", "expectation", "linear regression" etc.
- When jargon is unavoidable, immediately follow with a plain restatement: "normalization — meaning we shrink everything to fit on the same scale"
- Use everyday metaphors: sharing a pie, scoring a game, competition ranking, filling a bucket.
- Prioritize **meaning** over calculation.
- Write to a file in `docs/` when output exceeds 20 lines (per vault conventions).

## Fail-Safes

If the input is ambiguous or missing definitions:
- Make the best interpretation
- State assumptions explicitly
- Still explain the likely intent

## Success Criteria

Your explanation succeeds if:
- A beginner can explain the system back to you
- The user knows what actions increase/decrease results
- The user understands why each major piece exists (not just what it does)
