# PM-Kit Strategy: Scaling the AI-Native Product Manager
**Document Owner:** CPO Office
**Date:** October 2023
**Status:** Draft
**Target:** Mass Adoption within the Claude Code Ecosystem

---

## 1. Executive Summary

We are at an inflection point in software development. The line between "Product Manager" and "Builder" is blurring. **PM-Kit** is not just a productivity tool; it is the **enablement platform for the AI-Native Product Manager.**

Our goal is to reach **mass scale adoption** by transforming Product Managers from *administrators of requirements* into *architects of solutions*. We will achieve this by making the Claude Code CLI accessible, educational, and indispensable for PMs, regardless of their prior coding experience.

## 2. Vision & Mission

*   **Vision:** A world where every Product Manager can conceive, define, and prototype software solutions autonomously, using AI agents as their engineering partners.
*   **Mission:** To provide the essential "Exoskeleton" for PMs—combining rigorous product methodology with agentic execution—enabling them to ship better products faster while learning technical skills.

## 3. The "Mindset Shift" (The Core Challenge)

To achieve mass scale, we must solve the psychological barrier: *"I'm not technical enough for a CLI."*

We will address this by reframing the CLI not as a "coding tool" but as a **"Command Center."**
*   **From:** "I write code." -> **To:** "I direct agents."
*   **From:** "I need to know Python." -> **To:** "I need to know how to structure logic."

## 4. Strategic Pillars

### Pillar 1: Frictionless Onboarding ("Zero-to-Value in 60s")
The current setup requires installation and familiarity with CLI concepts. We must lower the floor.
*   **Action:** Create a "PM-First" onboarding path.
*   **Tactic:** Interactive `/pm start` tutorial that runs immediately after install.
*   **Tactic:** Clear, jargon-free documentation that explains *why* CLI is superior to web chat (persistence, file access, structured output).

### Pillar 2: Education as a Feature ("Learn while Doing")
We will differentiate by being an educational platform. Every command should teach the user *why* it works that way.
*   **Action:** Expand `skills/` directory significantly.
*   **Tactic:** **"Just-in-Time" Learning.** When a user runs `/tech-impact` and sees "API Latency," the agent should offer to explain concepts via `/explain-code`.
*   **Tactic:** **"PM-to-Code" Bridge.** Tutorials that show how to tweak the *agents* themselves. "Don't like how the PRD is generated? Here is how to edit the prompt." -> This is the gateway drug to coding.

### Pillar 3: The "Full-Stack" PM Workflow
We must prove we cover the *entire* job, not just PRD writing.
*   **Discovery:** `/research`, `/decompose` (Root Cause Analysis).
*   **Definition:** `/prd`, `/flow`, `/design-spec`.
*   **Execution:** `/prioritize`, `/tech-impact`.
*   **Alignment:** `/consensus`, `/retro`.
*   **Strategy:** `/northstar`, `/strategy`.

### Pillar 4: Community-Led Growth (Open Source)
We will rely on the community to build the library of "Best Practices."
*   **Action:** Create a mechanism for users to share their own Agent templates.
*   **Tactic:** "Workflow Recipes." Users can submit their own `.md` agent files (e.g., "The Amazon 6-Pager Agent", "The Linear Method Agent").

---

## 5. Strategic Roadmap

### Phase 1: The "Trust & Polish" Quarter (Current Focus)
*Goal: Solidify the core experience so early adopters stick.*
1.  **Hardening Agents:** Ensure `/prd` and `/research` work flawlessly every time.
2.  **Interactive Guide:** Enhance `/pm` to act as a smart router/guide for new users.
3.  **Documentation Revamp:** Rewrite README to speak to the "Aspiring Technical PM" persona.

### Phase 2: The "Integration & Education" Quarter
*Goal: Embed into daily workflows and teach skills.*
1.  **Deep Integrations:** (Future Scope) Agents that can read/write to Jira/Linear via API tools.
2.  **Skill Modules 2.0:** Interactive lessons for SQL, API Design, and System Architecture running inside Claude Code.
3.  **Visual Output:** Enhanced ASCII/Mermaid diagram generation for `/flow`.

### Phase 3: Mass Scale & Ecosystem
*Goal: Viral growth through shared workflows.*
1.  **Template Marketplace:** A community folder where PMs submit their specific industry agents (FinTech PM, HealthTech PM).
2.  **The "Product Engineer" Certification:** A badge for PMs who have mastered the toolkit.

---

## 6. Business Model (Sustainability)

**Primary:** Open Source (MIT). Maximizes adoption and trust.
**Secondary (Future):** Donation / Sponsorship.
*   **Model:** "Buy the team a coffee" for specific agent development.
*   **Enterprise:** Consulting/Setup for large orgs wanting to deploy PM-Kit on private Claude instances with proprietary context.

## 7. Success Metrics (KPIs)

1.  **Activation Rate:** % of installs that run at least 3 distinct commands in week 1.
2.  **Retention:** % of users returning after 28 days.
3.  **Education Score:** Usage of `/explain-code` or `skills/` modules.
4.  **Contribution:** Number of community PRs for new Agents/Prompts.

---

## 8. Immediate Action Plan (Next 2 Weeks)

1.  **Audit current Agents:** Do they explain *what* they are doing? (Transparency builds trust).
2.  **Create "PM Coding 101" Guide:** A doc explaining how to modify the `agents/` markdown files to customize workflows.
3.  **Launch "PM-Kit Academy":** A series of simulated tasks (e.g., "Refactor this legacy PRD") using the tool.
