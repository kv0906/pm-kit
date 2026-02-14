# Excalidraw Elements Reference

Complete specification for all Excalidraw element types.

## Table of Contents
1. [Common Properties](#common-properties)
2. [Rectangle](#rectangle)
3. [Ellipse](#ellipse)
4. [Diamond](#diamond)
5. [Text](#text)
6. [Arrow](#arrow)
7. [Line](#line)
8. [Frame](#frame)
9. [Image](#image)

---

## Common Properties

Every element requires these properties:

```json
{
  "id": "string",           // Unique identifier
  "type": "string",         // Element type
  "x": 0,                   // X position (top-left corner)
  "y": 0,                   // Y position (top-left corner)
  "width": 100,             // Width in pixels
  "height": 50,             // Height in pixels
  "strokeColor": "#1e1e1e", // Border/stroke color
  "backgroundColor": "transparent", // Fill color or "transparent"
  "fillStyle": "solid",     // "solid" | "hachure" | "cross-hatch"
  "strokeWidth": 1,         // 1 (thin) | 2 (medium) | 4 (thick)
  "roughness": 1,           // 0 (architect) | 1 (artist) | 2 (cartoonist)
  "opacity": 100,           // 0-100
  "angle": 0,               // Rotation in radians
  "seed": 1,                // Random seed for hand-drawn effect
  "version": 1,             // Element version
  "isDeleted": false,
  "boundElements": null,    // Array of bound elements or null
  "link": null,             // Hyperlink or null
  "locked": false
}
```

### Property Details

#### strokeColor / backgroundColor
Hex color codes. Common options:
- Transparent: `"transparent"`
- Black: `"#1e1e1e"`
- White: `"#ffffff"`
- Colors: See color palette in SKILL.md

#### fillStyle
- `"solid"`: Solid fill
- `"hachure"`: Diagonal lines (hand-drawn look)
- `"cross-hatch"`: Cross-hatched lines

#### roughness
- `0`: Clean, architect style
- `1`: Hand-drawn, artist style (default)
- `2`: Sketchy, cartoonist style

#### boundElements
Array of objects linking this element to others:
```json
"boundElements": [
  {"id": "arrow1", "type": "arrow"},
  {"id": "text1", "type": "text"}
]
```

---

## Rectangle

```json
{
  "type": "rectangle",
  "roundness": {"type": 3}  // Optional: rounded corners
  // ... common properties
}
```

### Roundness Options
- `null` or omitted: Sharp corners
- `{"type": 3}`: Rounded corners (proportional to size)
- `{"type": 2}`: Less rounded

---

## Ellipse

```json
{
  "type": "ellipse"
  // ... common properties
}
```

Circle: Set equal width and height.

---

## Diamond

```json
{
  "type": "diamond"
  // ... common properties
}
```

Used for decision points in flowcharts.

---

## Text

```json
{
  "type": "text",
  "text": "Your text here\nSecond line",
  "fontSize": 20,           // Pixels
  "fontFamily": 1,          // 1=Virgil(hand), 2=Helvetica, 3=Cascadia(code)
  "textAlign": "center",    // "left" | "center" | "right"
  "verticalAlign": "middle", // "top" | "middle"
  "lineHeight": 1.25,       // Optional
  "baseline": 18            // Optional
  // ... common properties
}
```

### Font Families
- `1`: Virgil (hand-drawn style) - default
- `2`: Helvetica (clean sans-serif)
- `3`: Cascadia (monospace/code)

### Multi-line Text
Use `\n` for line breaks in the `text` property.

---

## Arrow

```json
{
  "type": "arrow",
  "points": [[0, 0], [100, 0]],  // Relative coordinates
  "startBinding": null,          // Link to start element
  "endBinding": null,            // Link to end element
  "startArrowhead": null,        // null | "arrow" | "bar" | "dot" | "triangle"
  "endArrowhead": "arrow"        // null | "arrow" | "bar" | "dot" | "triangle"
  // ... common properties
}
```

### Points Array
- Relative to element's x,y position
- Minimum 2 points for straight line
- Add more points for curves/bends

```json
// Straight horizontal arrow (50px)
"points": [[0, 0], [50, 0]]

// Right-angle arrow (down then right)
"points": [[0, 0], [0, 50], [100, 50]]

// Curved path with multiple segments
"points": [[0, 0], [25, -20], [50, 0], [75, 20], [100, 0]]
```

### Bindings
Connect arrows to shapes:
```json
"startBinding": {
  "elementId": "rectangle1",
  "focus": 0,      // -1 to 1, position on element edge
  "gap": 5         // Space between arrow and element
}
```

### Arrowhead Types
- `null`: No arrowhead
- `"arrow"`: Standard arrow (>)
- `"bar"`: Perpendicular line (|)
- `"dot"`: Circle
- `"triangle"`: Filled triangle

---

## Line

```json
{
  "type": "line",
  "points": [[0, 0], [100, 50]],
  "startBinding": null,
  "endBinding": null
  // ... common properties
}
```

Same as arrow but no arrowheads. Use for connectors without direction.

---

## Frame

```json
{
  "type": "frame",
  "name": "Frame Name"      // Displayed label
  // ... common properties
}
```

Use frames to group elements visually.

---

## Image

```json
{
  "type": "image",
  "fileId": "abc123",       // Reference to files object
  "scale": [1, 1]           // X and Y scale
  // ... common properties
}
```

### Files Object
Images require an entry in the root `files` object:
```json
"files": {
  "abc123": {
    "mimeType": "image/png",
    "id": "abc123",
    "dataURL": "data:image/png;base64,iVBORw0KGgo...",
    "created": 1690295874454,
    "lastRetrieved": 1690295874454
  }
}
```

---

## Element Grouping

Group elements by adding them to the same group:
```json
{
  "id": "el1",
  "groupIds": ["group1"],
  // ...
},
{
  "id": "el2",
  "groupIds": ["group1"],
  // ...
}
```

Nested groups: `"groupIds": ["innerGroup", "outerGroup"]`

---

## Z-Order

Elements render in array order. First element = back, last element = front.

To layer correctly:
1. Background shapes first
2. Connecting lines/arrows
3. Foreground shapes
4. Text on top
