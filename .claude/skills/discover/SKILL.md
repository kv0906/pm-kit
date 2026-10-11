---
name: discover
description: "Investigates user problems with evidence, root-cause analysis, I-P-O, and Jobs to Be Done (JTBD). Use for /discover, customer research plans, why a problem happens, or understanding user needs before requirements."
---

# /discover — Understand the Problem

Find what must be understood before choosing a solution. Use only the investigation depth the decision needs.

## Input and Context

`/discover [project, problem, incident, or customer feedback]`

Read `_core/judgment.md` and `_core/knowledge.md`; retrieve relevant project context, research, and decisions.
State the decision this research should inform. Separate the reported symptom, affected users, desired outcome, and unknowns.
Accept existing evidence before asking questions. Do not require a full research plan for a small clarification.

## Choose the Lens

- Root cause: use when a failure or recurring symptom needs explanation.
- Input–Process–Output (I-P-O): use when a process or system transforms inputs into an unexpected result.
- Jobs to Be Done (JTBD): use when the user's motivation, context, or alternative solution is unclear.
- Opportunity mapping: use when several customer problems or solution options could contribute to an outcome.
- Product risks: use when an investment depends on uncertain value, usability, feasibility, or viability.
- Research plan: use when available evidence cannot distinguish competing explanations or choices.

Follow the selection rules in `_core/judgment.md`; choose the method without requiring the user to know its name.
Combine lenses only if each answers a distinct uncertainty. Keep mechanisms, motivations, and solution ideas separate.

## Root Cause and I-P-O

Start from expected versus observed behavior in a specific case. Trace the result backward to its prerequisites and inputs.
For I-P-O, identify input quality and constraints, process steps and handoffs, and observed versus desired output.
Mark the first evidenced divergence. Check plausible alternative causes, boundaries, and cases where the problem does not occur.
Use "why" questions to investigate, not to force a five-step story. Several factors may contribute to the same symptom.
Call an explanation a hypothesis until evidence from the relevant case supports it.
Propose the cheapest test that could distinguish explanations. Do not invent the missing evidence to complete a causal chain.

## JTBD

Describe the job as: "When [situation], I want to [make progress], so I can [desired outcome]."
Keep the job solution-independent; a requested button or feature is not automatically the job.
Identify current alternatives, triggers, obstacles, and what success means for the user.
Explore functional, emotional, or social dimensions only where relevant evidence supports them.
Use recent concrete episodes: what triggered action, what the user tried, why it failed, and what happened next.
Separate users, buyers, and other actors when their jobs differ. Mark inferred jobs as hypotheses needing validation.

## Opportunities and Investment Tests

When mapping is useful, connect one outcome to customer opportunities, candidate solutions, and assumption tests.
Keep an opportunity phrased as a need, pain, or desired progress; a feature or AI assistant is a solution option.
Link evidence to opportunities and mark gaps. Do not retrofit a tree to justify an existing backlog.
Consider alternative solutions, including a process change or no build, before committing to one.
Apply the product-risk checks in `_core/judgment.md` to consequential investments; reuse evidence and investigate the largest consequential uncertainty first.
Match the test to the risk: observation for usability, a spike for feasibility, or a behavioral test for value.
An interview reveals context; a usability test evaluates a proposed design. Neither alone proves willingness to pay or business viability.
State what evidence would change the choice. Keep opportunities, causal links, and untested value propositions as hypotheses.

## Research Guideline

Choose a method matched to the uncertainty: interviews for context, observation/usability tests for behavior, analytics for frequency or drop-off.
For a decision needing research, specify the question, target participants, recruitment limits, method, and what result would change the choice.
Prefer questions about past behavior; avoid leading questions and hypothetical purchase promises as proof of demand.
Seek disconfirming cases and include people affected by the problem, not only convenient stakeholders.
Do not claim population prevalence from a few qualitative interviews or invent a universal sample size.
Record consent and privacy needs, and limitations of the sample and method. Use existing evidence when enough for a reversible decision.
Draft outreach or interview questions only; do not contact people or collect sensitive data without authorization.

## Output

Return the problem framing, supporting/conflicting evidence, hypotheses, important unknowns, and smallest next investigation.
Include an I-P-O sketch or JTBD statement only when it helps. Use `/journey` for friction across a sequence of user steps.
Keep the answer in chat unless asked to save it; use `/doc` conventions for a research brief.
Proceed to `/prioritize` or requirements only when the uncertainty is understood well enough; explain what remains unverified.
