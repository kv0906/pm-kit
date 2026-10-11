# Product Judgment

Framework defaults for product reasoning. Personal preferences and approved examples belong in the user's vault, not this file.

## Load Relevant Context

Read `_core/identity.md` and the relevant project index before recommending a product decision.
Follow links to product context, judgment examples, and active decisions; do not scan unrelated projects.
If personal guidance is missing, use these defaults and say when the gap affects the recommendation.
Apply `_core/knowledge.md` to the evidence behind the decision.

## Start With the Problem

Identify the affected users, their task, the observed problem, and why solving it matters to the business.
Separate customer requests from the underlying problem. A requested feature is one possible solution.
Check whether the problem deserves action before selecting an implementation.
Consider doing nothing, changing the process, and testing a smaller intervention.

## Compare Real Tradeoffs

Use the user's approved prioritization method when relevant. Otherwise compare user impact, business outcome, evidence strength, effort, risk, and reversibility.
Explain important dependencies and who bears the cost. Do not invent scores or treat P0/P1 labels as proof of priority.
State the recommendation, alternatives, assumptions, and evidence that would change the choice.
Prefer a small reversible test when uncertainty is high; flag irreversible commitments for human review.
Challenge unsupported reasoning even when it matches the user's preferences.

## Record and Revisit

Link recommendations to supporting and conflicting evidence. Record a decision through `/decide` when the user chooses a direction.
Define the expected outcome, how to check it, and when to review it. Shipping alone does not demonstrate impact.
Use `/weekly` to compare observed results with expectations and propose changes to assumptions or judgment rules.

## Personal Judgment and Voice

Keep personal rules in `_core/identity.md` or linked documents such as `docs/general/product-judgment.md`.
Keep product-specific context and exceptions in `docs/{project}/`; use existing document frontmatter and links.
For an approved example, record the situation, options, choice, reasoning, exceptions, and outcome if known.
Include approved writing examples and explain why an edit improves the document; a tone label alone is insufficient.
Follow explicit audience and language instructions before general writing preferences.
Use direct language, concrete claims, and sources. Never make uncertainty sound settled to match a confident tone.

## Approval Boundaries

Read, analyze, and draft within the requested scope. Distinguish suggested priorities from commitments the user has approved.
Ask before publishing, changing shared priorities, or creating external commitments unless that action is explicitly authorized.
Propose updates to personal judgment rules after feedback; do not silently rewrite the user's profile or approved examples.
These are agent instructions, not runtime enforcement. Tool permissions and the host's approval controls still apply.

## File Ownership

Framework updates may replace this file. They must preserve `_core/identity.md`, `_core/config.yaml`, and user content under `docs/`.
Do not store personal product knowledge in framework skills, rules, or templates that updates overwrite.
