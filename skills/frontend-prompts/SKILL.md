# Frontend Design Prompts for Product Managers

A comprehensive guide for non-technical PMs to write effective design specifications that AI tools (like v0, Claude Code) can convert into working prototypes.

## Why This Matters

**Traditional Flow** (Slow):
PM → Designer mockup → Developer code → Review → Iterate

**AI-Assisted Flow** (Fast):
PM writes detailed prompt → AI generates prototype → Designer refines → Developer integrates

**Benefits**:
- **Speed**: Get working prototypes in minutes
- **Clarity**: Forces you to think through details
- **Communication**: Clear specs reduce back-and-forth
- **Testing**: Validate ideas before investing design time

## The Anatomy of a Great Frontend Prompt

### 1. Core Components

Every frontend prompt should include:

```
┌──────────────────────────────────────┐
│  1. Context & Purpose                │  Why this exists
│  2. User Flow                        │  What users do
│  3. Layout Structure                 │  Component arrangement
│  4. Visual Design                    │  Colors, typography, spacing
│  5. Interactions                     │  Buttons, forms, states
│  6. Data & Content                   │  What displays
│  7. Responsive Behavior              │  Mobile/desktop
│  8. Edge Cases                       │  Empty, loading, error states
└──────────────────────────────────────┘
```

### 2. The Template

```
## Context
[What is this? Who uses it? What problem does it solve?]

## User Flow
[Step-by-step: User does X, sees Y, clicks Z]

## Layout
[Describe component hierarchy and positioning]

## Visual Design
- Color scheme: [primary, secondary, accent colors]
- Typography: [headings, body text sizes]
- Spacing: [padding, margins, gaps]
- Style: [modern, minimal, bold, friendly]

## Interactive Elements
- Buttons: [labels, colors, states]
- Forms: [fields, validation, submission]
- Navigation: [menus, links, breadcrumbs]

## Content
- Headings: [exact text]
- Copy: [button labels, descriptions]
- Placeholder data: [example entries]

## States
- Default: [normal view]
- Loading: [spinners, skeletons]
- Success: [confirmations]
- Error: [error messages]
- Empty: [no data view]

## Responsive
- Desktop: [layout at 1440px]
- Tablet: [layout at 768px]
- Mobile: [layout at 375px]
```

## Real-World Examples

### Example 1: Login Page

```
Create a modern login page for a B2B SaaS product analytics platform.

## Context
This is the primary authentication page for PMs and analysts to access
their analytics dashboard. Should feel professional and trustworthy.

## User Flow
1. User lands on login page
2. Sees email and password fields
3. Can click "Forgot password?" link
4. Clicks "Sign in" button
5. Sees loading state briefly
6. Either: redirects to dashboard OR shows inline error

## Layout
┌────────────────────────────────────────────┐
│              [Logo]                        │
│                                            │
│        Sign in to Analytics Hub            │
│                                            │
│    ┌──────────────────────────────┐       │
│    │ Email                        │       │
│    └──────────────────────────────┘       │
│                                            │
│    ┌──────────────────────────────┐       │
│    │ Password                     │       │
│    └──────────────────────────────┘       │
│                                            │
│    [✓] Remember me    Forgot password?    │
│                                            │
│         ┌──────────────┐                  │
│         │   Sign in    │                  │
│         └──────────────┘                  │
│                                            │
│    Don't have an account? Sign up         │
└────────────────────────────────────────────┘

## Visual Design
- Primary color: #4F46E5 (Indigo)
- Background: #F9FAFB (Light gray)
- Card background: White with subtle shadow
- Typography:
  - Heading: 32px, bold, gray-900
  - Labels: 14px, medium, gray-700
  - Links: 14px, medium, indigo-600
- Card: Centered, max-width 400px, rounded corners (8px), shadow-lg
- Spacing: 24px between sections, 16px between inputs

## Interactive Elements
- Email input:
  - Type: email
  - Placeholder: "you@company.com"
  - Validation: Required, must be valid email
  - Error state: Red border + error message below

- Password input:
  - Type: password
  - Placeholder: "••••••••"
  - Show/hide toggle icon on right
  - Validation: Required, min 8 characters

- Remember me:
  - Checkbox, 16px, unchecked by default

- Sign in button:
  - Full width, 48px height
  - Background: indigo-600
  - Hover: indigo-700
  - Disabled state: gray-400, cursor not-allowed
  - Loading state: Show spinner + "Signing in..."

- Forgot password:
  - Text link, underline on hover

- Sign up link:
  - Text link, underline on hover

## Content
- Heading: "Sign in to Analytics Hub"
- Email label: "Email address"
- Password label: "Password"
- Remember me: "Remember me for 30 days"
- Button: "Sign in"
- Forgot link: "Forgot password?"
- Sign up: "Don't have an account? Sign up"

## States

### Default
- Empty form fields
- Sign in button enabled
- No error messages

### Validation Errors
- Email invalid: "Please enter a valid email address"
- Password too short: "Password must be at least 8 characters"
- Display below respective field in red text (14px)

### Loading
- Button shows spinner icon + "Signing in..."
- Button disabled
- Form inputs disabled

### Auth Error
- Show error banner at top of card:
  - Background: red-50
  - Border: red-200
  - Text: red-700
  - Icon: ⚠️
  - Message: "Invalid email or password. Please try again."

### Success
- Brief checkmark animation
- Redirect to dashboard (not shown in this component)

## Responsive

### Desktop (1440px+)
- Card centered in viewport
- Full width inputs
- Logo at top

### Tablet (768px)
- Same as desktop
- Card remains 400px max-width

### Mobile (375px)
- Card becomes full-screen with padding
- Remove centering, align to top
- Increase touch targets to 48px minimum
- Stack "Remember me" and "Forgot password" vertically

## Accessibility
- All inputs have labels (visible)
- Keyboard navigation: Tab through inputs, Enter submits
- Focus states: 2px indigo outline
- Error messages announced by screen reader
- Color contrast: WCAG AA compliant
```

### Example 2: Dashboard Overview

```
Create a product analytics dashboard overview page for a B2B SaaS platform.

## Context
This is the home page after login. PMs see key metrics at a glance and
can navigate to detailed reports. Should feel data-dense but scannable.

## User Flow
1. User logs in, lands on dashboard
2. Sees metrics cards at top (MAU, revenue, etc.)
3. Scrolls to see chart of user growth
4. Can click date range picker to change timeframe
5. Can click metric cards to drill into detail pages
6. Sidebar navigation to other sections

## Layout
┌─────────────────────────────────────────────────────┐
│ [☰] Analytics Hub    [Search] [?] [Profile]  [🔔]  │
├──────┬──────────────────────────────────────────────┤
│      │                                              │
│ Nav  │  Dashboard Overview               [Last 30d]│
│      │                                              │
│ 📊   │  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐       │
│ Dash │  │ MAU  │ │ Rev  │ │Churn │ │ NPS  │       │
│      │  │12.4K │ │ $45K │ │ 3.2% │ │  42  │       │
│ 📈   │  │+8.2% │ │+12%  │ │-0.5% │ │  +3  │       │
│ Rep  │  └──────┘ └──────┘ └──────┘ └──────┘       │
│      │                                              │
│ 👥   │  ┌────────────────────────────────────────┐ │
│ User │  │   User Growth (Last 30 Days)          │ │
│      │  │                                        │ │
│ ⚙️   │  │   [Line chart visualization]          │ │
│ Sett │  │                                        │ │
│      │  └────────────────────────────────────────┘ │
│      │                                              │
│      │  ┌─────────────────┐  ┌──────────────────┐ │
│      │  │ Top Features    │  │ Recent Activity  │ │
│      │  │                 │  │                  │ │
│      │  │ 1. Dashboard    │  │ User signed up   │ │
│      │  │ 2. Reports      │  │ Export complete  │ │
│      │  │ 3. Exports      │  │ New integration  │ │
│      │  └─────────────────┘  └──────────────────┘ │
└──────┴──────────────────────────────────────────────┘

## Visual Design
- Primary: #4F46E5 (Indigo)
- Success: #10B981 (Green)
- Warning: #F59E0B (Amber)
- Error: #EF4444 (Red)
- Background: #F9FAFB
- Card background: White
- Text: Gray-900 (headings), Gray-600 (body)
- Borders: Gray-200

Typography:
- Page title: 28px, bold
- Card titles: 18px, semibold
- Metric values: 32px, bold
- Metric labels: 14px, medium
- Body text: 14px, regular

Spacing:
- Page padding: 32px
- Card padding: 24px
- Grid gap: 24px
- Card border-radius: 12px
- Card shadow: shadow-sm

## Interactive Elements

### Metric Cards
- Hover: Shadow increases (shadow-md)
- Cursor: pointer
- Click: Navigate to detail page
- Each card shows:
  - Icon (top-left, 24px)
  - Label (below icon, gray-600)
  - Value (large, bold, gray-900)
  - Change indicator (green ↑ or red ↓ + percentage)

### Date Range Picker
- Button: "Last 30 days" + dropdown icon
- Click: Show dropdown with options:
  - Last 7 days
  - Last 30 days (selected)
  - Last 90 days
  - Custom range
- Selected option: Indigo background

### Sidebar Navigation
- Icons + labels
- Active item: Indigo background
- Hover: Gray-100 background
- Click: Navigate to section

### Search
- Input with magnifying glass icon
- Placeholder: "Search..."
- Focus: Border becomes indigo

### Profile Menu
- Avatar with initials
- Click: Dropdown with:
  - Profile
  - Settings
  - Logout

### Notifications Bell
- Badge with count if unread
- Click: Show notifications panel

## Content

### Metric Cards (Sample Data)
1. Monthly Active Users
   - Value: 12,428
   - Change: +8.2% vs. last period
   - Icon: 👥

2. Monthly Revenue
   - Value: $45,239
   - Change: +12.4% vs. last period
   - Icon: 💰

3. Churn Rate
   - Value: 3.2%
   - Change: -0.5% vs. last period (improvement)
   - Icon: 📉

4. Net Promoter Score
   - Value: 42
   - Change: +3 vs. last period
   - Icon: ⭐

### Top Features (Usage %)
1. Dashboard - 95%
2. Reports - 78%
3. Exports - 45%
4. Integrations - 34%
5. API Access - 23%

### Recent Activity
- "Sarah Chen signed up for Premium" - 2m ago
- "Export to CSV completed" - 15m ago
- "New Slack integration added" - 1h ago
- "API rate limit increased" - 2h ago

## States

### Loading
- Show skeleton screens for all cards
- Pulse animation
- Chart shows empty state with spinner

### Empty State (First Time User)
- Replace chart with illustration
- Heading: "Welcome to Analytics Hub!"
- Subheading: "Complete setup to see your data"
- CTA button: "Start Setup"

### Error State (API Failure)
- Show error banner at top:
  - Background: red-50
  - Border: red-200
  - Icon: ⚠️
  - Message: "Unable to load dashboard. Try refreshing."
  - Button: "Retry"
- Cards show last cached data (if available)

### Refreshing Data
- Small loading indicator in top-right
- Subtle pulse on updating cards
- No blocking of interactions

## Responsive

### Desktop (1440px)
- Full sidebar (80px with icons + labels)
- 4 metric cards in row
- 2-column layout for bottom sections

### Tablet (768px)
- Collapsible sidebar (icons only, 60px)
- 2 metric cards per row
- Single column for bottom sections
- Chart height reduced

### Mobile (375px)
- Bottom navigation (not sidebar)
- 1 metric card per row (full width)
- Horizontal scroll for chart
- Simplified navigation (icon bar)
- Date picker becomes full-width modal

## Interactions Timeline
1. Page loads → Show skeleton (200ms)
2. API responds → Animate cards in (stagger 50ms each)
3. Chart data loads → Animate line drawing (500ms)
4. User hovers card → Shadow increases (150ms transition)
5. User clicks card → Navigate with fade transition

## Accessibility
- Keyboard navigation: Tab through all interactive elements
- Screen reader: Announce metric changes ("up 8.2 percent")
- Color-blind safe: Use icons + text (not just color)
- Focus indicators: 2px indigo outline
- Skip to content link for screen readers
- Chart has data table alternative
```

### Example 3: Mobile App - Feature Card

```
Create a mobile feature card component for a task management app.

## Context
This is a reusable card that displays a single task in a list view.
Used by busy professionals to track work items on mobile.

## User Flow
1. User sees list of task cards
2. Can tap card to open task details
3. Can swipe left to reveal "Delete" action
4. Can tap checkbox to mark complete
5. Can tap priority badge to change priority

## Layout (Mobile 375px)
┌─────────────────────────────────────┐
│  ☐  Task Title Here                │
│     Brief description of task...   │
│     👤 Assigned  📅 Due  🏷️ High   │
└─────────────────────────────────────┘

Expanded with actions (swipe left):
┌─────────────────────────────┬──────┐
│  ☐  Task Title             │Delete│
│     Brief description...   │      │
│     👤 👤  📅  🏷️           │      │
└─────────────────────────────┴──────┘

## Visual Design
- Card background: White
- Border: 1px solid gray-200
- Border-radius: 12px
- Padding: 16px
- Margin: 8px horizontal, 4px vertical
- Shadow: shadow-sm

Priority colors:
- High: Red-500 background, white text
- Medium: Amber-500 background, white text
- Low: Gray-400 background, white text

Status:
- Not started: Gray-400
- In progress: Blue-500
- Completed: Green-500 (with strikethrough)

Typography:
- Title: 16px, semibold, gray-900
- Description: 14px, regular, gray-600
- Metadata: 12px, regular, gray-500
- Max lines: Title (2), Description (2)

## Interactive Elements

### Checkbox
- Size: 24px
- Border: 2px gray-300
- Checked: Blue-500 background with white checkmark
- Tap: Toggle completion state
- Animation: Scale bounce on tap

### Card Tap
- Tap anywhere (except checkbox): Open detail modal
- Active state: Gray-50 background (while pressed)
- Haptic feedback on tap

### Swipe Actions
- Swipe left: Reveal red "Delete" button (80px wide)
- Swipe velocity: Medium (not too sensitive)
- Release: If swiped >50%, show delete; else, snap back
- Delete button: Red-600 background, white text, icon 🗑️

### Priority Badge
- Pill shape: border-radius 9999px
- Padding: 4px 12px
- Tap: Show priority picker modal (Low/Medium/High)

## Content

### Sample Task 1
- Title: "Review Q4 product roadmap"
- Description: "Prepare presentation for stakeholder meeting"
- Assigned: "Sarah Chen"
- Due date: "Jan 25"
- Priority: "High"
- Status: "Not started"

### Sample Task 2
- Title: "Update API documentation"
- Description: "Add examples for new endpoints"
- Assigned: "You"
- Due date: "Tomorrow"
- Priority: "Medium"
- Status: "In progress"

### Sample Task 3
- Title: "Schedule user interviews"
- Description: "Find 5 participants for next week"
- Assigned: "Alex Kim"
- Due date: "Today"
- Priority: "Low"
- Status: "Completed"

## States

### Default
- White background
- All elements visible
- No swipe actions showing

### Pressed
- Gray-50 background
- Slight scale (0.98)
- Duration: while touch held

### Swiping
- Card translates left
- Delete button revealed
- Red shadow under card

### Completed
- Title has strikethrough
- Lower opacity (0.6)
- Green checkmark in checkbox
- "Completed" badge (green)

### Overdue
- Red dot next to due date
- Due date in red text
- Subtle red border on card

### Loading (After Action)
- Show spinner in place of checkbox
- Card disabled (opacity 0.5)
- No interactions allowed

## Animations

### On Card Tap
1. Scale down to 0.98 (100ms)
2. Scale up to 1.0 (100ms)
3. Fade in detail modal (300ms)

### On Checkbox Toggle
1. Checkbox bounce (150ms)
2. If completed:
   - Strikethrough text (200ms)
   - Fade opacity (200ms)
3. If uncompleted:
   - Remove strikethrough (200ms)
   - Fade to full opacity (200ms)

### On Swipe
- Card follows finger position
- Delete button fades in (relative to swipe distance)
- Release: Snap back with spring animation (300ms)

### On Delete
1. Scale card to 0.9 (150ms)
2. Fade opacity to 0 (150ms)
3. Collapse height to 0 (200ms)
4. Remaining cards slide up (300ms, stagger 50ms)

## Edge Cases

### Very Long Title
- Truncate at 2 lines
- Add ellipsis (...)
- Full title shown in detail view

### No Description
- Remove description line
- Reduce card height
- Metadata moves up

### No Assignee
- Show "Unassigned" in gray
- Icon: 👤 (outline)

### Past Due
- Due date in red
- Red dot indicator
- "Overdue" badge (red)

### Today/Tomorrow
- Show "Today" or "Tomorrow" instead of date
- Due date in amber for today
- Due date in blue for tomorrow

## Accessibility
- Checkbox has label (hidden, for screen reader)
- Swipe alternative: Long-press shows action menu
- VoiceOver: Reads "Task, [title], [status], assigned to [name], due [date], priority [level], double-tap to open"
- Dynamic type: Text scales with system settings
- Haptic feedback: Light tap on interactions
- Color contrast: WCAG AA compliant

## Performance
- Lazy load cards (virtualized list)
- Images/avatars: Cached, low-res placeholders
- Swipe: Use transform (not left/margin) for 60fps
- Debounce checkbox toggles (prevent double-tap)
```

## Prompting Best Practices

### Do's ✅

1. **Be Specific**
   ```
   ❌ "Make it look modern"
   ✅ "Use rounded corners (8px), subtle shadows (shadow-sm),
       and a clean sans-serif font (Inter or system default)"
   ```

2. **Include Exact Measurements**
   ```
   ❌ "Add some spacing"
   ✅ "24px padding, 16px gap between cards, 8px border-radius"
   ```

3. **Specify All States**
   ```
   ❌ "Add a button"
   ✅ "Blue button, 48px height, full width
       Hover: Darker blue
       Disabled: Gray with cursor not-allowed
       Loading: Show spinner + 'Loading...'"
   ```

4. **Provide Real Content**
   ```
   ❌ "Show user data"
   ✅ "Display: Name (Sarah Chen), Email (sarah@company.com),
       Role (Product Manager), Last login (2 hours ago)"
   ```

5. **Include Edge Cases**
   ```
   ❌ "List products"
   ✅ "List products. If empty, show illustration + 'No products yet'
       button. If loading, show 3 skeleton cards. If error, show
       retry button."
   ```

### Don'ts ❌

1. **Vague Descriptions**
   ```
   ❌ "Nice UI with good UX"
   ```

2. **Missing Interactions**
   ```
   ❌ "Add a form" (but no validation, submission, error handling)
   ```

3. **No Responsive Specs**
   ```
   ❌ "Create a dashboard" (but only desktop described)
   ```

4. **Unclear Hierarchy**
   ```
   ❌ "Show title, description, button" (but no layout specified)
   ```

5. **No Color Codes**
   ```
   ❌ "Use blue" (which blue? #4F46E5? #3B82F6? #1E40AF?)
   ```

## Advanced Techniques

### 1. Component Composition

```
Create a settings page composed of:

1. SettingsHeader
   - Title: "Account Settings"
   - Description: "Manage your account preferences"
   - Save button (top-right)

2. SettingsNav (left sidebar)
   - Sections: Profile, Security, Notifications, Billing
   - Active section highlighted

3. SettingsPanel (main content)
   - Profile Section:
     - ProfileForm (Name, Email, Avatar upload)
     - DeleteAccount button (bottom, red, danger zone)

   - Security Section:
     - PasswordForm
     - TwoFactorAuth toggle
     - ActiveSessions list

   - Notifications Section:
     - EmailNotifications toggle group
     - PushNotifications toggle group

   - Billing Section:
     - CurrentPlan card
     - PaymentMethod card
     - BillingHistory table

Each component is self-contained with its own states.
```

### 2. Animation Sequences

```
Create a multi-step wizard with smooth transitions:

Step 1 (Welcome):
- Fade in from bottom (0 → 100% opacity, 0 → 0px translateY)
- Duration: 400ms
- Easing: ease-out
- Delay: 100ms

On "Next" click:
- Current step slides left + fades out (200ms)
- Next step slides in from right + fades in (200ms)
- Progress bar fills (300ms, easing: ease-in-out)
- Step indicator updates (color change, 150ms)

On "Back" click:
- Reverse animation direction
- Previous step slides in from left

Final step (Success):
- Checkmark icon scales from 0 → 1.2 → 1.0 (bounce)
- Success message fades in
- Confetti animation (optional, 2s)
```

### 3. Micro-interactions

```
Button with rich feedback:

Idle state:
- Background: Blue-600
- Shadow: shadow-sm
- Scale: 1.0

On hover:
- Background: Blue-700
- Shadow: shadow-md
- Scale: 1.02
- Transition: 150ms ease-out

On press:
- Background: Blue-800
- Shadow: shadow-sm
- Scale: 0.98
- Transition: 100ms ease-in

On release (success):
- Brief flash (white overlay, 100ms)
- Checkmark replaces text (fade transition)
- Background: Green-600
- Duration: 1000ms
- Return to idle state

On release (error):
- Shake animation (5px left/right, 3 times, 400ms total)
- Background: Red-600
- Error icon appears
- Haptic feedback (if mobile)
```

## Using AI Tools

### Tool Recommendations

1. **v0.dev** (Vercel)
   - Best for: React components
   - Input: Natural language prompts
   - Output: Production-ready React + Tailwind code

2. **Claude Code** (Anthropic)
   - Best for: Complex interactions, full features
   - Input: Detailed specifications
   - Output: Multiple file implementations

3. **GPT-4** (OpenAI)
   - Best for: Planning, structure, pseudo-code
   - Input: High-level requirements
   - Output: Component architecture

4. **Midjourney / DALL-E**
   - Best for: Visual inspiration, not code
   - Input: Style descriptions
   - Output: Reference images

### Prompt Workflow

```
Step 1: High-Level Prompt
→ "Create a dashboard overview page with metrics cards"

Step 2: Refine Layout
→ Add ASCII diagram showing component positions

Step 3: Add Visual Details
→ Specify colors (#4F46E5), spacing (24px), typography (16px)

Step 4: Define Interactions
→ "Card hover increases shadow, click navigates to detail page"

Step 5: Specify States
→ Loading, error, empty states with exact messages

Step 6: Add Responsive Breakpoints
→ Desktop (1440px), tablet (768px), mobile (375px) layouts

Step 7: Include Accessibility
→ Keyboard navigation, screen reader labels, WCAG compliance

Step 8: Provide Sample Data
→ Real-looking user names, metrics, dates
```

## Common Patterns Library

### Pattern 1: Form with Validation

```
Multi-field form:
- Email (required, format validation)
- Password (required, min 8 chars, strength indicator)
- Confirm password (must match)
- Terms checkbox (required)

Inline validation:
- Validate on blur (not on every keystroke)
- Show green checkmark when valid
- Show red error message when invalid

Submit button:
- Disabled until all fields valid
- Loading state during submission
- Success: Show confirmation message
- Error: Show error banner + keep form data
```

### Pattern 2: Infinite Scroll List

```
Scrollable list of items:
- Load 20 items initially
- When user scrolls within 200px of bottom, load next 20
- Show loading spinner at bottom while fetching
- If error, show "Failed to load" + Retry button
- If end reached, show "You've reached the end"
- Maintain scroll position on navigation back
```

### Pattern 3: Modal Dialog

```
Modal overlay:
- Background: Black with 50% opacity
- Click outside to close
- ESC key to close
- Trap focus inside modal
- Disable body scroll

Modal content:
- Center aligned
- Max-width: 600px
- Padding: 32px
- Rounded corners: 16px
- Shadow: shadow-2xl
- Slide up + fade in animation (300ms)
- Close button (top-right)

Actions:
- Primary button (right)
- Secondary button (left)
- Cancel button/link
```

## Next Steps

Now that you understand frontend prompts:

1. ✅ Practice with v0.dev or Claude Code
2. ✅ Start with simple components (button, card)
3. ✅ Progress to complex layouts (dashboard, form)
4. ✅ Use `/prototype` command in ClaudeKit PM
5. ✅ Move on to **Debug Without Code** skill

## Quick Reference Card

```
Prompt Checklist
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
□ Context & purpose
□ User flow (step-by-step)
□ Layout (ASCII diagram)
□ Colors (hex codes)
□ Typography (sizes, weights)
□ Spacing (px values)
□ Interactive elements (hover, click, etc.)
□ States (loading, error, empty, success)
□ Content (exact text, sample data)
□ Responsive (desktop, tablet, mobile)
□ Accessibility (keyboard, screen reader)
□ Animations (duration, easing, sequence)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Related Skills

- **Foundation**: ASCII Diagrams - Layout visualization
- **Foundation**: JSON Fundamentals - Data structure
- **Next**: Debug Without Code - Troubleshooting UI issues
- **Advanced**: API Basics - Connect frontend to backend
