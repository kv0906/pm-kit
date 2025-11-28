# Markit Agency - Marketing Practice Project

> Your marketing workspace for learning PM-Kit marketing workflows with compounding intelligence.

## About Markit

**Markit** is your practice marketing agency specializing in B2B SaaS clients. In this workspace, you play the role of Marketing Strategist at Markit.

## Your Client: Planerio

**Planerio** is a team productivity coordination tool for remote teams.

### Product Details
- **Category:** B2B SaaS
- **Target:** Remote team managers at tech companies (50-500 employees)
- **Pricing:** $12/user/month, 14-day free trial
- **Key Feature:** Coordinate focus time across entire teams
- **Positioning:** "RescueTime for teams"
- **Integrations:** Slack, Zoom, Google Workspace

### Target Personas

1. **Startup Sam** - Startup founder, 28, building team culture
2. **Manager Maria** - Team manager, 38, managing 15 remote employees  
3. **Solo Steve** - Freelance consultant, 32, juggling multiple projects

### Competitors
- **Asana** - Market leader, complex, 2+ hour setup
- **Monday.com** - Feature-heavy, overwhelming UI
- **ClickUp** - Too many features, steep learning curve

## Folder Structure

```
markit/
├── campaigns/          # Campaign briefs and plans
├── content/           # Marketing content
│   ├── blog/          # Blog posts
│   ├── email/         # Email sequences
│   ├── social/        # Social media content
│   └── ads/           # Paid advertising copy
├── brand/             # Brand assets
│   └── personas/      # Customer persona docs
├── research/          # Research and analysis
├── analytics/         # Performance data and reports
└── templates/         # Reusable templates
```

## Getting Started

### 1. Create Your First Campaign Brief
```bash
/cm:plan "Q1 Product Launch" --budget 50000 --duration "6 weeks"
```

This will:
- Research similar campaigns
- Generate comprehensive brief
- Create execution timeline
- Save to campaigns/ folder

### 2. Generate Content
```bash
/cf:generate "Q1 Product Launch" --formats "blog,email,social" --quantity "3 blogs, 5 emails, 20 social"
```

This will:
- Create content across formats
- Validate brand voice
- Organize in content/ folder
- Generate content calendar

### 3. Review with Agents
```bash
@brand-voice-guardian Review this blog post
@seo-specialist Optimize this for "team productivity software"
@startup-sam-reviewer Does this resonate with founders?
```

## The Compounding Effect

As you work through campaigns, you'll notice:

**Campaign 1 (40 hours):**
- Start from scratch
- Build initial templates
- Learn what works

**Campaign 5 (15 hours - 62% faster):**
- Leverage accumulated templates
- Reference past successful campaigns
- Patterns recognized automatically

**Campaign 10 (10 hours - 75% faster):**
- Fully systematized workflows
- Rich template library
- Predictive insights from history

## Brand Voice Guidelines

### Tone
- Professional but approachable
- Data-driven but not jargon-heavy
- Optimistic and empowering

### Voice Attributes
- Knowledgeable without being condescending
- Use "we" and "you" perspective
- Focus on benefits before features

### Avoid
- Hyperbole and superlatives
- Corporate jargon
- Passive voice

## Quick Commands Reference

| Command | Purpose |
|---------|---------|
| `/cm:plan` | Create campaign brief |
| `/cf:generate` | Generate content |
| `/cf:repurpose` | Transform content formats |
| `/cf:schedule` | Create content calendar |

---

**Ready to start?** Create your first campaign brief with `/cm:plan`!
