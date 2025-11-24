# PM-Kit Strategy: Scaling the AI-Native Product Manager
**Document Owner:** CPO Office
**Date:** October 2023
**Status:** Living Strategy
**Target:** Mass Adoption within the Claude Code Ecosystem

---

## 1. Executive Summary

We are at an inflection point in software development. The line between "Product Manager" and "Builder" is blurring. **PM-Kit** is not just a productivity tool; it is the **enablement platform for the AI-Native Product Manager.**

Our goal is to reach **mass scale adoption** by transforming Product Managers from *administrators of requirements* into *architects of solutions*. We will achieve this by making the Claude Code CLI accessible, educational, and indispensable for PMs, regardless of their prior coding experience.

---

## 2. Product-Led Growth: The Features That Drive Adoption
*Focus: Features that create "Aha!" moments immediately.*

To achieve mass scale, the product must sell itself through utility. We focus on features that solve "Blank Page Syndrome" and "Technical Imposter Syndrome."

### A. The "Magic Context" Engine (Usability)
**Problem:** PMs hate manually copy-pasting code or context to explain things to AI.
**Feature:** Automatic Context Ingestion.
*   **Repo-Walk:** On install, PM-Kit runs a silent analysis of the repo structure (`package.json`, `README`, file tree) to understand the *product* being built.
*   **Jargon Dictionary:** Automatically builds a glossary of project-specific terms (e.g., "What is a 'LollipopUser' in this codebase?").
*   **Value:** When a PM asks `/prd "New Feature"`, the agent *already knows* the tech stack, the user personas, and the design patterns.
*   **Implementation:** `/pm init` creates a `.pm-context` summary file that all agents read.

### B. Interactive "Try It" Tutorials (Onboarding)
**Problem:** CLI tools feel dangerous to non-coders.
**Feature:** Safe-Mode Sandbox.
*   **`/pm tutorial`:** A gamified command that launches a fake project simulation.
*   **Scenario:** "You are the PM for a Pizza App. Run `/decompose` to find why delivery is late."
*   **Reward:** Users get a "License to PM" badge (ASCII art) upon completion.
*   **Value:** Removes fear of breaking the "real" codebase.

### C. Visual Thinking output (Communication)
**Problem:** Text walls are hard to read. Stakeholders want diagrams.
**Feature:** Text-to-Diagram Standard.
*   **Mermaid.js Default:** Every relevant command (`/flow`, `/architecture`, `/strategy`) outputs a Mermaid code block *and* instructions on how to view it.
*   **ASCII Fallback:** High-quality ASCII diagrams for terminals that don't support graphics.
*   **Value:** Makes the CLI output "Boardroom Ready" instantly.

---

## 3. The "Technical PM" Skill Tree
*Focus: Education as a Retention Mechanic.*

We don't just do the work; we teach the user *how* it works. This builds long-term loyalty.

### Level 1: Data Fluency
*   **Skill:** **JSON/YAML Literacy.**
*   **How we teach it:** When `/research` returns data, we show the raw JSON snippet and explain: "This is a key-value pair. The 'confidence_score' key tells us how much to trust this source."
*   **Goal:** PMs stop fearing structured data and start manipulating it.

### Level 2: Architecture Basics
*   **Skill:** **API & System Design.**
*   **How we teach it:** The `/tech-impact` command doesn't just say "High Effort." It says: "High Effort because it requires a database migration (changing the table structure) and a new API endpoint."
*   **Call to Action:** "Type `/explain-code migration` to learn what this means."

### Level 3: Agentic Orchestration
*   **Skill:** **Prompt Engineering & Logic Flow.**
*   **How we teach it:** We expose the "Brain" of the agents.
*   **Feature:** `/pm peep [command]`. Shows the raw system prompt used for that command.
*   **Lesson:** "See how we asked the AI to 'act as a skeptic'? You can change this line in `agents/prd-writer.md` to make it 'act as an optimist'."

---

## 4. Feeding the Context (Making it Usable)
*Focus: Integration into the Real World.*

A tool without context is a toy. We must ingest the "Real World" into the CLI.

### Source 1: The Codebase (The Truth)
*   **Mechanism:** Deep integration with `grep` and `read_file` tools.
*   **Usage:** The `/explain-code` command isn't generic; it cites specific lines in *your* `src/` folder. "This logic lives in `UserAuth.ts` lines 40-50."

### Source 2: The Team Brain (The History)
*   **Mechanism:** `docs/` folder parsing.
*   **Usage:** Before writing a PRD, the agent scans `docs/decisions/` to ensure we aren't re-litigating settled debates.
*   **Feature:** "Conflict Warning: This PRD contradicts Decision Record #004 (Mobile First Strategy)."

### Source 3: External Signals (The Market)
*   **Mechanism:** MCP (Model Context Protocol) Connectors.
*   **Usage:** (Future) Connect to Linear/Jira to see *actual* velocity.
*   **Feature:** "You want to build this in Q4? Based on Linear history, the team only ships 2 epics per quarter. This is risk level: High."

---

## 5. Strategic Roadmap & Phasing

### Phase 1: The "Trust" Quarter (Fixing the Foundation)
*   **Goal:** Users trust the output 100% of the time.
*   **Deliverables:**
    *   Robust Error Handling (No crashing on missing files).
    *   `/pm init` context scanner.
    *   Refined `agents/` prompts to be less generic, more opinionated.

### Phase 2: The "Learn" Quarter (Education)
*   **Goal:** Users feel smarter after using the tool.
*   **Deliverables:**
    *   `/explain` flags on all commands.
    *   "Skill Cards" output at the end of complex tasks.
    *   Launch of `skills/` module expansion.

### Phase 3: The "Scale" Quarter (Community)
*   **Goal:** Users build for us.
*   **Deliverables:**
    *   "Agent Marketplace": Easy import of other people's workflows.
    *   Plugin Architecture: Allow 3rd party scripts in `scripts/`.

---

## 6. Business Model (Sustainability)

**Primary:** Open Source (MIT). Maximizes adoption and trust.
**Secondary:** "Pro" Context Cloud.
*   **Idea:** Sync your `.pm-context` and Decision Logs across the entire team securely.
*   **Enterprise:** Private hosted instances for IP-sensitive orgs.
