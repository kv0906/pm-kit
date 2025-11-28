---
description: Generate ASCII wireframes and low-fidelity UI mockups for quick screen visualization
allowed-tools: Write
argument-hint: <screen or feature to wireframe>
---

# Wireframe Generation Command

You are acting as the **Rapid Prototyper Agent** for this task.

## Your Task

Generate ASCII wireframes and low-fidelity mockups for:

**Feature/Screen**: $ARGUMENTS

## Your Process

### Phase 1: Requirement Gathering
1. **Understand Feature Scope**:
   - What is being built?
   - What are the key user actions?
   - What screens/views are needed?
   - **Verification**: Feature scope clear?

2. **Identify Components**:
   - Navigation elements
   - Content areas
   - Forms and inputs
   - Buttons and actions
   - **Verification**: All UI elements identified?

### Phase 2: Wireframe Creation
1. **Generate ASCII Mockups**:
   - Use box-drawing characters for structure
   - Include labels and placeholders
   - Show interactive elements clearly
   - Maintain consistent spacing
   - **Verification**: Layout clear and readable?

2. **Add Annotations**:
   - Explain non-obvious interactions
   - Note responsive behavior
   - Specify states (hover, active, disabled)
   - Document data requirements
   - **Verification**: All behaviors documented?

### Phase 3: Iteration Support
1. **Generate Alternatives**:
   - Create 2-3 layout options
   - Show mobile vs. desktop
   - Compare simple vs. complex approaches
   - **Verification**: Options clearly different?

2. **State Variations**:
   - Default state
   - Loading state
   - Error state
   - Empty state
   - Success state

## Output Format

### Screen Wireframes

Generate wireframes using ASCII art:

```
┌─────────────────────────────────────────┐
│ Screen Title                            │
├─────────────────────────────────────────┤
│                                         │
│  [Content area with components]         │
│                                         │
│  [Buttons and actions]                  │
│                                         │
└─────────────────────────────────────────┘
```

Use wireframe component library from `./agents/rapid-prototyper.md`

### Structure

For each screen, provide:

1. **Screen Name**: Clear, descriptive name
2. **Purpose**: What user accomplishes here
3. **ASCII Wireframe**: Visual layout
4. **Components**:
   - List all UI elements
   - Specify component types
   - Note data sources
5. **Interactions**:
   - What happens when user clicks/taps
   - Navigation flows
   - Form submissions
6. **States**:
   - Loading: What user sees during data fetch
   - Error: How errors are displayed
   - Empty: What shows with no data
7. **Responsive Notes**: Mobile vs. desktop differences

## Wireframe Symbols

Use these standard symbols:

**Containers**:
```
┌───┐  ┏━━━┓  ╔═══╗  (boxes, borders)
│   │  ┃   ┃  ║   ║
└───┘  ┗━━━┛  ╚═══╝
```

**Forms**:
```
[_________________]  (text input)
[▼ Select option ]  (dropdown)
● Radio  ○ Radio    (radio buttons)
☑ Checked  ☐ Box   (checkboxes)
```

**Buttons**:
```
[Primary Button]  (primary action)
<Secondary Btn>  (secondary action)
{ Icon Button }  (icon button)
```

**Content**:
```
Lorem ipsum text  (placeholder text)
[Image]          (image placeholder)
★★★★☆           (ratings)
```

## Example Output

```markdown
# Feature: User Profile Page

## Screen 1: Profile View

**Purpose**: Display user information and allow editing

┌──────────────────────────────────────────────────┐
│  ← Back    Profile                    [Edit]     │
├──────────────────────────────────────────────────┤
│                                                  │
│   ┌────────┐   John Doe                         │
│   │ Avatar │   john@example.com                  │
│   │  [📷]  │   Member since Jan 2024             │
│   └────────┘                                     │
│                                                  │
│   Bio:                                           │
│   Product manager passionate about...           │
│                                                  │
│   ┌────────────────────────────────┐            │
│   │ Recent Activity                │            │
│   │ ───────────────────────────────│            │
│   │ • Created project "App v2"     │            │
│   │ • Updated profile              │            │
│   │ • Joined team "Design"         │            │
│   └────────────────────────────────┘            │
│                                                  │
│   [Settings]  [Privacy]  [Logout]               │
│                                                  │
└──────────────────────────────────────────────────┘

**Components**:
- Avatar: 80x80px image, clickable to upload
- User name: H1 heading
- Email: Secondary text, non-editable
- Member since: Tertiary text
- Bio: Multiline text, 200 char max
- Activity feed: List of recent actions
- Action buttons: Settings, Privacy, Logout

**Interactions**:
- [Edit] → Navigate to edit profile screen
- Avatar [📷] → Open file picker for upload
- [Settings] → Navigate to settings
- [Privacy] → Navigate to privacy settings
- [Logout] → Confirm modal, then logout

**States**:
- Loading: Show skeleton placeholders
- Error: "Unable to load profile. [Retry]"
- Empty bio: Show "Add bio" placeholder

**Responsive**:
- Mobile: Stack avatar above info, single column
- Desktop: Avatar left, info right, two columns

---

## Screen 2: Edit Profile

**Purpose**: Allow user to update their information

┌──────────────────────────────────────────────────┐
│  ← Cancel    Edit Profile            [Save]      │
├──────────────────────────────────────────────────┤
│                                                  │
│   ┌────────┐                                    │
│   │ Avatar │   [Change Photo]                    │
│   │  [📷]  │                                     │
│   └────────┘                                     │
│                                                  │
│   Name:                                          │
│   [John Doe_________________]                    │
│                                                  │
│   Email: (read-only)                             │
│   john@example.com                               │
│                                                  │
│   Bio:                                           │
│   [________________________]                     │
│   [________________________]                     │
│   [________________________]                     │
│   0/200 characters                               │
│                                                  │
│   [Cancel]  [Save Changes]                       │
│                                                  │
└──────────────────────────────────────────────────┘

**Components**:
- Name input: Required, 1-50 chars
- Email: Display only, grayed out
- Bio textarea: Optional, 0-200 chars
- Character counter: Live update
- Save button: Disabled until changes made

**Interactions**:
- [Change Photo] → File picker
- Name/Bio input → Enable [Save] button
- [Cancel] → Confirm if unsaved changes, go back
- [Save] → Validate, POST /api/profile, show success

**States**:
- Saving: Button shows "Saving..." with spinner
- Success: Brief "✓ Saved" message, navigate back
- Error: Show error message above form, keep edits
- Validation error: Inline error under field

**Responsive**:
- Mobile: Full width inputs, stack vertically
- Desktop: Fixed width form, centered
```

## Quality Checklist

Before finalizing mockups:
- [ ] All key screens included
- [ ] ASCII wireframes clear and readable
- [ ] Interactive elements obvious
- [ ] States (loading, error, empty) specified
- [ ] Responsive behavior noted
- [ ] Annotations explain complex interactions
- [ ] Component specifications complete
- [ ] Non-technical person can understand

## Output Location

Save wireframes to: `./prototypes/wireframes/[feature-name]-wireframe-[date].md`

## Agent Capabilities

Refer to `./agents/rapid-prototyper.md` for detailed capabilities including:
- ASCII wireframe generation
- Component specification
- State management documentation
- Responsive design notation

---

## Next Steps

After completing the wireframes:

**Related commands you might find useful:**
- `/mermaid` - Create user flow diagrams showing navigation between screens
- `/design-spec` - Generate detailed specifications for the design team
- `/prd` - Document full feature requirements based on wireframes
- `/consensus` - Build stakeholder alignment on design direction
- `/excalidraw` - Create hand-drawn style wireframes for presentations

---

Begin wireframe generation now.
