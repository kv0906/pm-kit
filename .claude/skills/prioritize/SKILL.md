---
name: prioritize
description: "Prioritizes feature intake with the smallest useful method: direct triage, MoSCoW, RICE, or Kano. Use for /prioritize, scope tradeoffs, or competing backlog requests."
---

# /prioritize — Proportionate Feature Intake

Resolve the priority decision without adding unnecessary PM work.

## Input and Context

`/prioritize [project or requests]`

Read `_core/judgment.md`, `_core/knowledge.md`, the project index, and relevant approved decisions.
Identify the decision, affected user, intended outcome, constraints, deadline, and available evidence.
Accept pasted intake or linked notes. Ask only for missing information that changes the choice.
Treat mandatory safety, legal, and contractual constraints separately from optional feature scores.

## Choose One Method

| Decision | Method | Minimum useful input |
|----------|--------|----------------------|
| One small, reversible request | Direct triage | Problem, expected benefit, cost/risk, next step |
| What fits a bounded release | MoSCoW | Agreed release objective, capacity, dependencies |
| Which comparable investments come first | RICE | Reach, impact, confidence, effort with sources and common units |
| How users value feature presence or absence | Kano | Customer research, ideally paired functional/dysfunctional responses |

Choose by the question and evidence, not feature complexity alone. Use the user's approved method when it fits.
Do not run every framework or require scores for an obvious next step. Explain the method choice only when it is not obvious.
If evidence is too weak to rank, identify the smallest discovery step instead of manufacturing certainty.

Before ranking optional work, check strategy/outcome fit, customer evidence, invalidating assumptions, and dependencies.
Explain what existing work would be displaced if a candidate starts now.
Keep mandatory obligations outside optional scores; low reach or weak demand evidence does not remove a safety or contractual requirement.
Use scores to inform judgment. Surface a conflict between the score and evidence or constraints rather than letting the number end the decision.

## Direct Triage and MoSCoW

For direct triage, recommend act, defer, decline, or investigate, with a reason and a next step.
Keep a small request's answer short; it does not need framework headings or a long account of the reasoning process.
For MoSCoW, fix the release boundary first:
- Must: without it, the release cannot meet its agreed objective or a mandatory constraint; explain why.
- Should: important, but a viable workaround or deferral exists.
- Could: useful if capacity remains after higher-priority scope.
- Won't this time: explicitly outside this release, not necessarily rejected forever.

Check dependencies and capacity. Challenge a list where everything is Must; do not apply arbitrary percentage quotas.

## RICE

Use \(\text{score} = \text{reach} \times \text{impact} \times \text{confidence} / \text{effort}\).
Use one reach period and population, one impact scale, and one effort unit across candidates.
Use confidence as a fraction from 0 to 1; convert a provided percentage before calculation.
Reach and impact must be nonnegative; effort must be positive. Flag invalid inputs and leave scores uncomputed when required estimates are missing.
Label estimates, cite their basis, and do not substitute zero for unknown values.
Show the input table and calculation. Check whether plausible estimate changes reverse the leading choice when it is close.
Treat ties as ties. Explain dependencies and strategic constraints that the score does not capture.

## Kano

Distinguish must-be expectations, performance attributes, attractive features, indifferent features, and reverse preferences.
Do not confuse Kano must-be with MoSCoW Must for a particular release.
Use paired questions about how users feel with and without the feature when designing a Kano survey.
Classify actual paired responses using the Kano evaluation matrix; retain questionable responses and segment differences.
Without that evidence, label categories as hypotheses and propose research. A stakeholder opinion is not a measured Kano result.

For each response pair, rows describe feature presence and columns describe feature absence:

| Present / Absent | Like | Expect | Neutral | Tolerate | Dislike |
|------------------|------|--------|---------|----------|---------|
| Like | Q | A | A | A | O |
| Expect | R | I | I | I | M |
| Neutral | R | I | I | I | M |
| Tolerate | R | I | I | I | M |
| Dislike | R | R | R | R | Q |

A = attractive, O = performance (one-dimensional), M = must-be, I = indifferent, R = reverse, Q = questionable.
"Expect" means "it must be that way"; "Tolerate" means "I can live with it." Report mixed responses rather than hiding disagreement in one label.

## Output and Approval

Return the recommendation, evidence, main tradeoff, uncertainty, and next step. Use a comparison table only when it helps.
Keep the answer in chat unless asked to save it. Use `/doc` conventions for a saved comparison and `/decide` for a chosen direction.
Do not change shared backlog priorities, create tickets, or promise dates without explicit authorization.
