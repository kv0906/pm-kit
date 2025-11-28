# Command: help-mkt

Marketing commands and workflows in PM-Kit.

---

## Marketing Plugins Overview

PM-Kit includes two marketing plugins that implement compounding intelligence:

| Plugin | Purpose | Version |
|--------|---------|---------|
| **CM** | Compounding Marketing - Campaign planning | 0.1.0 |
| **CF** | Content Factory - Content generation | 0.1.0 |

---

## CM: Compounding Marketing

### `/cm:plan`

Create comprehensive campaign briefs with compounding intelligence.

**Purpose**: Research, analyze, and generate complete campaign plans that learn from past campaigns.

**Usage**:
```bash
/cm:plan "<campaign-name>" [options]
```

**Options**:
- `--budget <amount>` - Campaign budget in dollars
- `--duration <timeframe>` - Campaign duration (e.g., "6 weeks", "Q2 2025")
- `--goal <objective>` - Primary campaign goal (e.g., "500 trial signups")
- `--audience <personas>` - Target audience (comma-separated)
- `--channels <list>` - Preferred channels (comma-separated)

**Examples**:
```bash
# Basic usage
/cm:plan "Q2 Product Launch"

# Full specification
/cm:plan "Q2 Launch" --budget 50000 --duration "6 weeks" --goal "500 signups" --channels "email, LinkedIn, blog"

# Quick campaign
/cm:plan "Flash Sale Weekend" --budget 5000 --duration "72 hours"
```

**What it creates**:
- Comprehensive campaign brief (12 sections)
- Research summary (competitive & audience analysis)
- Execution checklist (pre-launch, launch, post-launch)
- Timeline (week-by-week schedule)

**Compounding Effect**:
- Campaign 1: General best practices
- Campaign 5: Leverages 4 past campaigns, 65% pre-filled
- Campaign 10: Predictive insights, 80% pre-filled

---

## CF: Content Factory

### `/cf:generate`

Batch content creation across multiple formats simultaneously.

**Purpose**: Create weeks of content in hours with parallel generation.

**Usage**:
```bash
/cf:generate "<brief>" --formats "<types>" --quantity "<counts>"
```

**Options**:
- `--formats` - Content formats (blog, email, social, video, podcast)
- `--quantity` - How many of each (e.g., "5 blogs, 10 emails, 30 social")
- `--timeline` - Timeline content covers (e.g., "4 weeks", "Q1")
- `--seo-keywords` - Target keywords for SEO
- `--output` - Custom output directory

**Examples**:
```bash
# Launch content
/cf:generate "Product Launch" --formats "blog,email,social" --quantity "5 blogs, 10 emails, 30 social"

# SEO campaign
/cf:generate "SEO Content: Project Management" --formats "blog" --quantity "10 blogs" --seo-keywords "project management, team collaboration"

# Full campaign
/cf:generate "Q1 Brand Awareness" --formats "blog,email,social,video" --quantity "8 blogs, 12 emails, 60 social, 4 video scripts"
```

**What it creates**:
- All content pieces across formats
- Content calendar with publishing schedule
- SEO optimization for each piece
- Brand voice validation
- Organized folder structure

---

### `/cf:repurpose`

Transform one piece of content into multiple formats.

**Purpose**: Maximize content ROI by repurposing across channels.

**Usage**:
```bash
/cf:repurpose <source-file> --into "<formats>" --platforms "<platforms>"
```

**Examples**:
```bash
# Blog to social
/cf:repurpose blog/case-study.md --into "social" --platforms "linkedin,twitter,instagram"

# Webinar to content series
/cf:repurpose webinar-transcript.txt --into "blog,email,social,video-clips"

# Research report to multi-format
/cf:repurpose research/report.pdf --into "blog,infographic,social,email-series"
```

---

### `/cf:schedule`

Create and manage content calendars.

**Purpose**: Plan and organize content publishing schedules.

**Usage**:
```bash
/cf:schedule --period "<timeframe>" --frequency "<publishing-rate>"
```

**Examples**:
```bash
# Monthly calendar
/cf:schedule --period "March 2025" --frequency "2 blogs/week, 5 social/day"

# Campaign-specific
/cf:schedule --period "6 weeks" --campaigns "product-launch" --generate-content true

# Quarterly planning
/cf:schedule --period "Q2 2025" --frequency "3 blogs/week, 10 social/day"
```

---

## Marketing Agents

Specialized reviewers for multi-perspective feedback:

### Quality & Brand
- **`@brand-voice-guardian`** - Brand consistency validation
- **`@conversion-optimizer`** - Conversion rate optimization
- **`@seo-specialist`** - SEO optimization

### Persona Validation
- **`@startup-sam-reviewer`** - Founder perspective (28-year-old startup founder)
- **`@manager-maria-reviewer`** - Manager perspective (38-year-old team manager)
- **`@solo-steve-reviewer`** - Solopreneur perspective (32-year-old freelancer)

**Usage**:
```bash
@brand-voice-guardian Review this blog post for brand consistency
@seo-specialist Optimize this for "team productivity software"
@startup-sam-reviewer Does this resonate with founders?
```

---

## Workspace Structure

Your marketing workspace: `exercises/markit/`

```
markit/
├── campaigns/          # Campaign briefs (/cm:plan)
├── content/           # Generated content (/cf:generate)
│   ├── blog/
│   ├── email/
│   ├── social/
│   └── ads/
├── brand/             # Brand guidelines, personas
├── research/          # Competitive analysis
├── analytics/         # Performance data, patterns
└── templates/         # Reusable templates
```

---

## Quick Workflow

**1. Plan Campaign**
```bash
/cm:plan "Q2 Launch" --budget 50000 --duration "6 weeks"
```

**2. Generate Content**
```bash
/cf:generate "Q2 Launch" --formats "blog,email,social"
```

**3. Review with Agents**
```bash
@brand-voice-guardian Review campaigns/q2-launch/blog/post-1.md
@seo-specialist Optimize for "productivity software"
```

**4. Repurpose Content**
```bash
/cf:repurpose content/blog/post-1.md --into "social" --platforms "linkedin,twitter"
```

---

## The Compounding Effect

Each campaign builds on the last:

- **Campaign 1**: 40 hours - Build foundation
- **Campaign 5**: 15 hours - Leverage patterns (62% faster)
- **Campaign 10**: 10 hours - Systematized (75% faster)

Templates, patterns, and insights accumulate over time.

---

## Resources

- **Project Overview**: `exercises/markit/README.md`
- **CM Plugin Docs**: `plugins/cm/PLUGIN.md`
- **CF Plugin Docs**: `plugins/cf/PLUGIN.md`
- **Getting Started**: Type `/start-mkt`

---

**Questions?** Type `/pm` for main PM-Kit help or `/start-mkt` to begin the marketing course.
