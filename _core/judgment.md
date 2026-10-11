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

## Choose the Smallest Useful Method

Name the decision, the intended outcome, and the uncertainty that could change the choice.
Use direct reasoning first. Add a method only when it exposes that uncertainty or clarifies a real tradeoff.
Scale depth by consequence, uncertainty, and reversibility, not feature size alone.
Ask only for missing information that changes the decision. Leave other gaps explicit rather than blocking useful work.

| Question to resolve | Method when needed | Existing workflow |
|---------------------|--------------------|-------------------|
| What progress does the customer seek? | JTBD using concrete episodes and current alternatives | `/discover` |
| Why does a process fail? | Root-cause investigation or Input–Process–Output | `/discover` |
| Does an offer address the customer's needs? | Value Proposition Canvas; mark untested fit as a hypothesis | `/discover` or `/doc` |
| Which opportunities and solutions could improve an outcome? | Opportunity Solution Tree, with evidence and assumption tests | `/discover` |
| What could make an investment fail? | Four Product Risks; investigate the consequential unknown first | `/discover` |
| Where does the user encounter friction? | Scoped journey map | `/journey` |
| What should we do next or fit in a release? | Direct triage or MoSCoW | `/prioritize` |
| Which investments come first, or what affects satisfaction? | RICE for comparable estimates; Kano for customer preference evidence | `/prioritize` |
| What outcome and signals should guide us? | Metric tree, North Star, OKRs, or HEART as appropriate | `/doc` |
| How should work flow or a decision be communicated? | Existing Scrum/Kanban cadence or a short evidence-backed narrative | `/doc` or `/weekly` |

Choose one method for the current question. Combine methods only when each resolves a distinct uncertainty.
Explain a non-obvious choice in one sentence: the method, why it fits, and the decision it informs.
Do not make the user select from a framework catalog or complete the whole product loop for every request.
Stop when the next action is clear. A research step is a useful result when evidence cannot support a commitment.

## Test Investment Risks

For consequential investments, consider these risks with product, design, engineering, and relevant business partners:
- Value: will target customers choose, use, or pay for it?
- Usability: can they understand and use it in their actual context?
- Feasibility: can the team build and operate it within technology, data, reliability, time, and cost constraints?
- Viability: does it meet business, operational, legal, privacy, security, and commercial constraints?

Identify the assumption most likely to change the investment decision and the cheapest discriminating test.
Use existing evidence; do not require four new studies or a risk matrix for a small reversible change.
For AI features, include relevant quality, data rights, hallucination, access control, latency, cost, oversight, and rollback risks.
Treat those as product risks within the same model. A customer request or a passing technical demo does not settle all four.

## Define Outcomes and Measures

Connect the business outcome to customer progress and observable behavior before selecting metrics.
Use a metric tree when relationships between customer value, product behavior, and business results need explanation.
Use a North Star for long-term realized customer value, OKRs for time-bounded outcomes, or HEART for relevant UX measures.
For HEART, move from goal to observable signal to metric. Select relevant categories rather than measuring all five.
Treat causal links in a metric model as hypotheses until supported; logins, downloads, or revenue alone may miss realized value.
Use the team's existing goals when adequate. A small improvement does not need a new North Star or quarterly OKR.

Before a consequential release or experiment, define the primary outcome, relevant early signals, business result, and guardrails.
Include metric definitions, baseline, target, timeframe, segment, and source when known; mark absent values as unknown.
Propose what result would support scaling, iteration, stopping, or further investigation, and when to review it.
Account for instrumentation gaps and limits on causal conclusions. Never substitute delivery milestones for evidence of impact.

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
