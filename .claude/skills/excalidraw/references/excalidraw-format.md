# Excalidraw JSON Format Reference

## File Structure

Excalidraw files use plaintext JSON with the following structure:

```json
{
  "type": "excalidraw",
  "version": 2,
  "source": "https://excalidraw.com",
  "elements": [],
  "appState": {},
  "files": {}
}
```

## Core Attributes

- **type**: Must be `"excalidraw"`
- **version**: Schema version (use `2`)
- **source**: `"https://excalidraw.com"`
- **elements**: Array of canvas elements
- **appState**: Application configuration
- **files**: Image data for embedded elements (usually `{}`)

## Element Types

Supported element types:
- `rectangle` - Rectangular shapes
- `ellipse` - Circles and ovals
- `diamond` - Diamond shapes
- `arrow` - Arrows with optional arrowheads
- `line` - Straight lines
- `freedraw` - Hand-drawn paths
- `text` - Text labels
- `image` - Embedded images
- `frame` - Grouping frames

## Common Element Properties

All elements share these properties:

```typescript
{
  "id": string,              // Unique ID (use random string)
  "type": string,            // Element type
  "x": number,               // X position
  "y": number,               // Y position
  "width": number,           // Width
  "height": number,          // Height
  "angle": number,           // Rotation in radians (0 for no rotation)
  "strokeColor": string,     // Border color (hex, e.g., "#000000")
  "backgroundColor": string, // Fill color (hex, e.g., "#ffffff" or "transparent")
  "fillStyle": string,       // "solid" | "hachure" | "cross-hatch"
  "strokeWidth": number,     // Border thickness (1, 2, 4)
  "strokeStyle": string,     // "solid" | "dashed" | "dotted"
  "roughness": number,       // 0 (smooth) to 2 (very rough)
  "opacity": number,         // 0-100
  "groupIds": array,         // Array of group IDs (usually [])
  "frameId": null,           // Parent frame ID (null if none)
  "roundness": object|null,  // Corner rounding config
  "boundElements": array,    // Connected elements (usually [])
  "updated": number,         // Timestamp
  "link": null,              // Hyperlink data
  "locked": boolean,         // Lock state (false)
  "versionNonce": number,    // Version number (use random int)
  "isDeleted": boolean,      // Deletion state (false)
  "seed": number             // Random seed for roughness
}
```

## Element-Specific Properties

### Text Elements
```typescript
{
  "type": "text",
  "text": string,           // Text content
  "fontSize": number,      // Font size (16, 20, 28, 36)
  "fontFamily": number,    // 1 (Hand-drawn) | 2 (Normal) | 3 (Code)
  "textAlign": string,     // "left" | "center" | "right"
  "verticalAlign": string, // "top" | "middle"
  "baseline": number,      // Baseline position
  "containerId": null,     // Container element ID
  "originalText": string,  // Original text (same as text)
  "lineHeight": number     // Line height multiplier (1.25)
}
```

### Arrow/Line Elements
```typescript
{
  "type": "arrow" | "line",
  "points": array,          // [[0,0], [x,y], ...] relative to element position
  "lastCommittedPoint": array, // Last point
  "startArrowhead": string|null, // "arrow" | "bar" | "dot" | null
  "endArrowhead": string|null,   // "arrow" | "bar" | "dot" | null
  "startBinding": object|null,   // Binding to other element
  "endBinding": object|null      // Binding to other element
}
```

### Rectangle/Ellipse/Diamond Elements
No additional properties beyond common properties. Ellipses/diamonds use `width` and `height` to define shape.

## appState Structure

Minimal appState for valid files:

```json
{
  "gridSize": null,
  "viewBackgroundColor": "#ffffff"
}
```

## Layout Guidelines

### Automatic Layout Calculation

When generating diagrams, use these spacing guidelines:

- **Minimum spacing between elements**: 50-100px
- **Standard element sizes**:
  - Small boxes: 100x60
  - Medium boxes: 150x80
  - Large boxes: 200x100
- **Connector arrow offset**: Start/end 10-20px from element edges
- **Hierarchical spacing**: Parent-child vertical gap of 120-150px

### Text Height Calculation Formula

**CRITICAL**: Always calculate text height accurately:

```
textHeight = fontSize × lineHeight × numberOfLines
```

Where `lineHeight = 1.25` (Excalidraw default)

**Examples:**
- Single-line title (fontSize 20): `20 × 1.25 × 1 = 25px`
- 3-line methods list (fontSize 14): `14 × 1.25 × 3 = 52.5px` (round to 53px)
- 12-line properties list (fontSize 15): `15 × 1.25 × 12 = 225px`

### UML Class Diagram Layout

For UML class diagrams, calculate container heights dynamically:

**Container height formula:**
```
containerHeight = headerSection + attributesSection + methodsSection

Where:
- headerSection = classNameHeight + topPadding + dividerSpace
  (typically: 20-25px + 15px + 10px = 45-50px)

- attributesSection = (fontSize × 1.25 × numberOfAttributes) + bottomPadding
  (typically: computed height + 10px)

- methodsSection = (fontSize × 1.25 × numberOfMethods) + bottomPadding
  (typically: computed height + 10px)
```

**Positioning guide:**
```
classNameText.y = container.y + 15 (top padding)
divider1.y = classNameText.y + classNameText.height + 10
attributesText.y = divider1.y + 15
divider2.y = attributesText.y + attributesText.height + 10
methodsText.y = divider2.y + 15
container.height = methodsText.y + methodsText.height + 10 - container.y
```

**Example calculation** (class with 12 attributes, 10 methods, fontSize 15):
- Class name (fontSize 20): 20 × 1.25 = 25px
- Attributes: 15 × 1.25 × 12 = 225px
- Methods: 15 × 1.25 × 10 = 187.5px ≈ 188px
- Container height: 45 + 235 + 198 = 478px (round to 480-500px)

### ID Generation

Generate unique IDs using random strings (8-16 chars). Example: `"abc123xyz789"`

### Coordinate System

- Origin (0, 0) is top-left of canvas
- All measurements in pixels
- Arrows use relative coordinates in `points` array from element's (x, y)

## Example: Simple Flowchart Element

```json
{
  "id": "box1",
  "type": "rectangle",
  "x": 100,
  "y": 100,
  "width": 150,
  "height": 80,
  "angle": 0,
  "strokeColor": "#1e1e1e",
  "backgroundColor": "#a5d8ff",
  "fillStyle": "solid",
  "strokeWidth": 2,
  "strokeStyle": "solid",
  "roughness": 1,
  "opacity": 100,
  "groupIds": [],
  "frameId": null,
  "roundness": { "type": 3 },
  "boundElements": [],
  "updated": 1705276800000,
  "link": null,
  "locked": false,
  "versionNonce": 123456789,
  "isDeleted": false,
  "seed": 987654321
}
```

## Color Palette Recommendations

**Professional colors:**
- Primary: `#4c6ef5` (blue)
- Success: `#51cf66` (green)
- Warning: `#ffd43b` (yellow)
- Error: `#ff6b6b` (red)
- Neutral: `#e9ecef` (light gray)
- Text: `#1e1e1e` (dark gray)

**Professional mode colors (light backgrounds for better readability):**
- Blue: `#e7f5ff`
- Green: `#ebfbee`
- Yellow: `#fff9db`
- Red: `#ffe3e3`
- Purple: `#f3f0ff`
- Orange: `#fff4e6`

**Hand-drawn mode colors (pastel/medium saturation):**
- Blue: `#a5d8ff`
- Green: `#b2f2bb`
- Yellow: `#ffec99`
- Red: `#ffc9c9`
- Purple: `#d0bfff`
- Orange: `#ffd8a8`
