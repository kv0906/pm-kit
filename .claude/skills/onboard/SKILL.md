---
name: onboard
description: Interactive onboarding — sets up your first project, learns who you are, generates CLAUDE.local.md profile, creates your first daily note, then loads vault context. For returning users, skips setup and loads context directly.
allowed-tools: Read, Write, Edit, Glob, Grep, TaskCreate, TaskUpdate, TaskList, TaskGet, AskUserQuestion
user-invocable: true
---

# /onboard — Interactive Onboarding & Context Loading

Set up your first project, run an interactive interview, generate a personalized `CLAUDE.local.md`, create your first daily note, then load vault context. Returning users skip straight to context loading.

## Usage

```
/onboard          # First time: project setup → interview → profile → daily → context. Returning: context only.
/onboard --reset  # Re-run interview even if profile exists (skips project setup if already configured)
```

## Flow

```
/onboard
  ├── CLAUDE.local.md exists + config has real projects + no --reset?
  │   → Returning user → Load context → "Welcome back"
  │
  └── First time (no profile OR default projects OR --reset)?
       │
       ├── Phase 1: Welcome message
       ├── Phase 2: Project Setup (if config still has default project-a)
       │   ├── Read config.yaml
       │   ├── Detect default project-a/project-b
       │   ├── AskUserQuestion: project name
       │   ├── Edit config.yaml (replace project-a, remove project-b)
       │   ├── Create dirs: docs/{id}/, decisions/{id}/, blockers/{id}/
       │   └── Create index/{id}.md from template
       │
       ├── Phase 3: Personal Interview (3 rounds, 7 questions)
       │   └── Generate CLAUDE.local.md
       │
       ├── Phase 4: First Daily Note
       │   └── Create daily/{today}.md with welcome content
       │
       ├── Phase 5: Load Context
       │
       └── Phase 6: Handoff with "what to do next"
```

## Phase 1: Detect & Welcome

Check if `CLAUDE.local.md` exists in vault root:

```
Glob: CLAUDE.local.md
```

Also read `_core/config.yaml` to check if projects are still defaults:

```
Read: _core/config.yaml
```

**Detection logic:**
- **Returning user**: `CLAUDE.local.md` exists AND config does NOT contain `id: project-a` AND no `--reset` flag → Skip to Phase 5 (Load Context). Greet with:
  > Welcome back! Loading your vault context...
- **First time or --reset**: Continue to Phase 2.

Display welcome message (for new users):

> **Welcome to PM-Kit!**
>
> I'm your AI-augmented knowledge partner for technical PM and engineering work. Let me get you set up — this takes about 3 minutes.
>
> We'll do three things:
> 1. Set up your first project
> 2. Learn how you work (7 quick questions)
> 3. Load your vault context
>
> Let's get started.

Create session tasks for progress tracking:

```
Task 1: "Set up first project" (activeForm: "Setting up first project...")
Task 2: "Complete onboarding interview" (activeForm: "Running onboarding interview...", blockedBy: Task 1)
Task 3: "Generate personal profile" (activeForm: "Generating personal profile...", blockedBy: Task 2)
Task 4: "Create first daily note" (activeForm: "Creating first daily note...", blockedBy: Task 3)
Task 5: "Load vault context" (activeForm: "Loading vault context...", blockedBy: Task 4)
```

## Phase 2: Project Setup

Mark Task 1 as in_progress.

**Skip condition:** If config.yaml does NOT contain `id: project-a`, projects are already configured. Mark Task 1 as completed and skip to Phase 3.

If config still has the default `project-a`, ask the user to name their project:

### AskUserQuestion

| # | Header | Question | Options | multiSelect |
|---|--------|----------|---------|-------------|
| 1 | Project | "What's your main project called? (This becomes your folder name — lowercase, hyphens ok)" | "my-product": "A product you're building" / "my-team": "Team-level tracking" / "my-company": "Company-wide knowledge" | false |

The user can pick a preset or type a custom name via "Other".

### After receiving the answer

1. **Derive project ID**: Use the answer directly as the ID (already lowercase with hyphens). If the user typed a display name with spaces/caps, slugify it (lowercase, replace spaces with hyphens, remove special characters).

2. **Derive display name**: Capitalize the ID (e.g., `my-product` → `My Product`, `acme-app` → `Acme App`).

3. **Edit config.yaml**: Use the `Edit` tool to:
   - Replace `id: project-a` with `id: {project-id}`
   - Replace `name: Project A` with `name: {Display Name}`
   - Replace `description: Your first project` with `description: {Display Name} workspace`
   - Remove the entire `project-b` block (the 4 lines: `- id: project-b`, `name: Project B`, `description: Your second project`, `active: true`)

4. **Create project directories**:
   ```
   Write empty .gitkeep files to:
   - docs/{project-id}/.gitkeep
   - decisions/{project-id}/.gitkeep
   - blockers/{project-id}/.gitkeep
   ```

5. **Create project index**: Write `index/{project-id}.md`:

   ```markdown
   ---
   type: index
   project: {project-id}
   status: active
   ---

   # {Display Name}

   > {Display Name} workspace

   ---

   ## Open Blockers

   *No open blockers*

   ---

   ## Active Docs

   *No active docs*

   ---

   ## Recent Dailies (7 days)

   *No dailies yet*

   ---

   ## Recent Decisions (30 days)

   *No decisions yet*

   ---

   ## Manual Notes

   %% Add your own notes below — this section is preserved during updates %%
   ```

Mark Task 1 as completed.

## Phase 3: Interview (3 Rounds)

Mark Task 2 as in_progress.

**Skip condition for --reset**: If `--reset` flag is set but projects are already configured (no `project-a` in config), skip Phase 2 but still run the interview.

Use `AskUserQuestion` for each round. All 3 rounds use a single AskUserQuestion call each (multiple questions per call).

### Round 1 — Who Are You

Ask these 2 questions in a single AskUserQuestion call:

| # | Header | Question | Options | multiSelect |
|---|--------|----------|---------|-------------|
| 1 | Role | "What's your primary role?" | Product Manager: "Roadmaps, specs, stakeholder alignment" / Engineering Lead: "Architecture, team velocity, technical decisions" / Founder-Operator: "Wearing all hats — product, eng, strategy" / Researcher: "Deep exploration, synthesis, knowledge work" | false |
| 2 | AI Experience | "What's your experience with AI-assisted workflows?" | New to this: "First time using AI for structured work" / Getting started: "Tried a few tools, learning the ropes" / Experienced: "Regular AI user, ready for advanced workflows" | false |

### Round 2 — How You Work

Ask these 3 questions in a single AskUserQuestion call:

| # | Header | Question | Options | multiSelect |
|---|--------|----------|---------|-------------|
| 3 | Communication | "How do you prefer feedback and communication?" | Direct: "Cut to the chase, no fluff" / Collaborative: "Think together, build on ideas" / Detailed: "Thorough explanations, show your work" | false |
| 4 | Planning | "How do you prefer to plan?" | Detailed plans: "Upfront structure, clear milestones" / Flexible: "Rough direction, adapt as we go" / Minimal: "Just start building, plan emerges" | false |
| 5 | Energy | "When do you do your best focused work?" | Morning: "Peak focus before noon" / Afternoon: "Hit my stride after lunch" / Evening: "Night owl, late-day clarity" / Flexible: "Varies day to day" | false |

### Round 3 — What Drives You

Ask these 2 questions in a single AskUserQuestion call:

| # | Header | Question | Options | multiSelect |
|---|--------|----------|---------|-------------|
| 6 | Focus | "What matters most in your work right now?" | Shipping fast: "Velocity and momentum above all" / Quality depth: "Doing fewer things really well" / Clarity: "Understanding before building" / Alignment: "Getting everyone on the same page" | true |
| 7 | Coaching | "How should I challenge you?" | Gentle nudges: "Light reminders, supportive tone" / Moderate push: "Flag issues directly, suggest alternatives" / Intense coach: "Call out everything, hold me accountable" | false |

After all 3 rounds complete, mark Task 2 as completed.

## Phase 4: Generate Profile

Mark Task 3 as in_progress.

Map answers to `CLAUDE.local.md` using this template. Write to vault root.

### Answer Mapping

**Work Hours** (derived from Energy answer):
- Morning → "7am - 3pm"
- Afternoon → "10am - 6pm"
- Evening → "1pm - 9pm"
- Flexible → "Flexible"

**Scope Creep Alerts** (derived from Coaching answer):
- Gentle nudges → "Gentle reminders"
- Moderate push → "Flag when noticed"
- Intense coach → "Call out aggressively"

**Working Philosophy** (generate a 1-2 sentence statement based on role + focus areas):
Combine the role and selected focus areas into a concise personal statement. Examples:
- PM + Shipping fast + Clarity → "Ship with intention — move fast but make sure every feature tells a clear story."
- Engineering Lead + Quality depth → "Build it right the first time — depth over breadth, craft over speed."
- Founder-Operator + Shipping fast + Alignment → "Move fast together — velocity means nothing if the team isn't aligned."
- Researcher + Clarity + Quality depth → "Understand deeply, document clearly — knowledge compounds when it's well-structured."

Write the file using `Write` tool to `CLAUDE.local.md`:

```markdown
# Personal Profile - CLAUDE.local.md

> Generated by `/onboard` on {today's date}. Edit anytime — this file is gitignored.

## Identity

- **Role**: {answer 1}
- **AI Experience**: {answer 2}
- **Onboarded**: {today's date YYYY-MM-DD}

## Working Style

- **Communication**: {answer 3}
- **Planning**: {answer 4}

## Energy & Schedule

- **Best Focus Time**: {answer 5}
- **Timezone**: America/New_York
- **Work Hours**: {derived from answer 5}

## Current Priorities

What matters most right now:
{for each selected focus area from answer 6, write as bullet with description}

## Coaching Settings

- **Challenge Level**: {answer 7}
- **Scope Creep Alerts**: {derived from answer 7}

## Working Philosophy

> {generated statement}

## Notes for Claude

[Add custom instructions here — this section is yours to edit freely]

---

*Gitignored. Regenerate with `/onboard --reset`*
```

Mark Task 3 as completed.

## Phase 5: First Daily Note

Mark Task 4 as in_progress.

Create today's daily note at `daily/{YYYY-MM-DD}.md` with a welcome entry under the user's project:

```markdown
---
type: daily
status: active
date: {YYYY-MM-DD}
tags: []
---

# {YYYY-MM-DD}

## {Project Display Name}

### Shipped
- Set up PM-Kit vault

### In Progress
*None*

### Blocked
*None*

### Notes

Welcome to PM-Kit! Your vault is ready. Try `/daily {project-id}: shipped X, wip Y` tomorrow.

---

## Tomorrow

- Start using `/daily` for standups
```

**Skip condition:** If `daily/{today}.md` already exists, do not overwrite it.

Mark Task 4 as completed.

## Phase 6: Load Context

Mark Task 5 as in_progress (or create it if this is a returning user without tasks).

Load vault context in this order:

### 1. Core Config (Always First)
```
_core/config.yaml      → Projects, paths, note types, keywords
_core/PROCESSING.md    → I-P-O flows for all skills
_core/MANIFESTO.md     → Philosophy and principles
```

### 2. Vault Context
```
CLAUDE.md              → Vault overview, skills, agents, conventions
CLAUDE.local.md        → Personal profile (just generated or existing)
```

### 3. Project Indexes
```
index/{project}.md     → MOC for each active project
```

### 4. Current State
```
daily/{today}.md       → Today's standup (if exists)
daily/{yesterday}.md   → Yesterday's context
```

### 5. Active Blockers
```
blockers/**/status: open  → All open blockers across projects
```

Smart loading rules:
- Only load indexes for projects marked `active: true` in config.yaml
- Read today's and yesterday's dailies for current context
- Scan open blockers to understand current obstacles

Mark Task 5 as completed.

## Phase 7: Handoff

### New Users

Personalize the ready message based on their profile:

> **You're all set, {role}!**
>
> Your profile is saved to `CLAUDE.local.md`. Here's what I set up:
> - Project: **{project display name}** (`{project-id}/`)
> - Config: {n} active projects
> - Index: `index/{project-id}.md`
> - Today: `daily/{today}.md` (your first entry)
>
> Based on your preferences, I'll keep communication **{communication style}** and challenge you at **{coaching level}** intensity.
>
> A few commands to try:
> - `/daily {project-id}: shipped X, wip Y` — Write your standup
> - `/ask` — Quick vault lookup
> - `/progress {project-id}` — Project status
> - `/push` — Save changes to git
>
> What would you like to work on?

### Returning Users

> **Welcome back!**
>
> Context loaded:
> - Config: {n} active projects
> - Indexes: {n} project MOCs
> - Today: {summary or "No standup yet"}
> - Blockers: {n} open across projects
> - Updates: {version status from API check, non-fatal — e.g. "Up to date (v2026.02.14)" or "Update available: vX → vY"}
>
> What would you like to work on?
