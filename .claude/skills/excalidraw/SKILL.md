---
name: excalidraw-generator
description: Professional Excalidraw diagram generation expert that creates complete, valid .excalidraw.json files based on user descriptions. Use ONLY when users explicitly mention "Excalidraw" or request to create diagrams specifically with Excalidraw (e.g., "用 Excalidraw 画个流程图", "generate an Excalidraw diagram", "create Excalidraw file"). Do NOT trigger for generic diagram requests without Excalidraw mention. Generates ready-to-open files instead of requiring copy-paste.
---

# Excalidraw Diagram Generator

Create complete, valid `.excalidraw.json` files that users can directly open at excalidraw.com.

## Core Capabilities

Diagram types supported:
- **Flowcharts** - Process flows, decision trees, workflows
- **Architecture Diagrams** - System architectures, network topologies, component diagrams
- **UML Diagrams** - Class diagrams, sequence diagrams, use case diagrams
- **Mind Maps** - Hierarchical concept maps, brainstorming diagrams

**Two visual styles:**
- **Professional Mode** (default): Clean, polished diagrams for technical documentation
- **Hand-drawn Mode**: Sketch-style diagrams for brainstorming and informal use

---

## Quick Reference

### JSON Schema

```json
{
  "type": "excalidraw",
  "version": 2,
  "source": "https://excalidraw.com",
  "elements": [],
  "appState": {
    "gridSize": null,
    "viewBackgroundColor": "#ffffff"
  },
  "files": {}
}
```

### Coordinate System

- **Origin**: Top-left corner (0, 0)
- **X-axis**: Increases rightward
- **Y-axis**: Increases downward
- **Unit**: Pixels

### Grid-Based Layout System

Use a 20px grid for alignment:

```
GRID_UNIT = 20
COLUMN_WIDTH = 200    # Element + gap
ROW_HEIGHT = 150      # Element + gap

Position formula:
  x = START_X + (column * COLUMN_WIDTH)
  y = START_Y + (row * ROW_HEIGHT)

Recommended START_X = 50, START_Y = 100
```

### Standard Element Sizes

| Element | Width | Height | Use Case |
|---------|-------|--------|----------|
| Small box | 120 | 60 | Labels, simple steps |
| Standard box | 160 | 80 | Process steps |
| Large box | 200 | 100 | Detailed nodes |
| Wide box | 240 | 80 | Long text |
| Diamond | 100 | 100 | Decision points |
| Circle | 80 | 80 | Start/End nodes |

---

## Text Calculations (CRITICAL)

### Text Height Formula

```
textHeight = fontSize × lineHeight × numberOfLines
           = fontSize × 1.25 × numberOfLines

Examples:
- 1 line, fontSize 20: 20 × 1.25 × 1 = 25px
- 3 lines, fontSize 14: 14 × 1.25 × 3 = 52.5px ≈ 53px
- 12 lines, fontSize 15: 15 × 1.25 × 12 = 225px
```

### Text Centering Formula

```
text_x = shape_x + (shape_width - text_width) / 2
text_y = shape_y + (shape_height - text_height) / 2
```

### Text Size Reference

| Font Size | Char Width | Line Height | Use |
|-----------|------------|-------------|-----|
| 11 | ~6px | 15px | Labels, annotations |
| 12 | ~7px | 16px | Secondary text |
| 14 | ~8px | 18px | Body text |
| 16 | ~9px | 20px | Primary text |
| 18 | ~10px | 24px | Headings |
| 20 | ~11px | 26px | Titles |
| 28 | ~16px | 35px | Icons/Emoji |

**Estimate text_width**: `char_count × char_width`

### Centering Example

```
Shape: x=100, y=100, width=160, height=80
Text: "Process" (7 chars), fontSize=16

text_width = 7 × 9 = 63
text_height = 1 × 20 = 20
text_x = 100 + (160 - 63) / 2 = 148.5 ≈ 148
text_y = 100 + (80 - 20) / 2 = 130
```

### UML Class Diagram Container Height

```
containerHeight = headerHeight + attributesHeight + methodsHeight + padding

Where:
- headerHeight = classNameTextHeight + topPadding (typically 15px + 15px = 30px)
- attributesHeight = fontSize × 1.25 × numberOfAttributes + 10px
- methodsHeight = fontSize × 1.25 × numberOfMethods + 10px

Example (12 attributes, 10 methods, fontSize 15):
- Header: 20 + 15 = 35px
- Attributes: 15 × 1.25 × 12 + 10 = 235px
- Methods: 15 × 1.25 × 10 + 10 ≈ 198px
- Total: 35 + 10 + 235 + 10 + 198 = 488px (round to 500px)
```

---

## Arrow Positioning

### Horizontal Arrow (Left to Right)

```
From shape at (x1, y1, w1, h1) to shape at (x2, y2, w2, h2):

arrow_x = x1 + w1           # Right edge of source
arrow_y = y1 + h1/2         # Vertical center
gap = x2 - (x1 + w1)        # Space between shapes
points = [[0, 0], [gap, 0]]
```

### Vertical Arrow (Top to Bottom)

```
arrow_x = x1 + w1/2         # Horizontal center
arrow_y = y1 + h1           # Bottom edge of source
gap = y2 - (y1 + h1)
points = [[0, 0], [0, gap]]
```

### Feedback Loop (Return Arrow)

```
From bottom-right back to left:
  Start: (800, 400)
  points=[
    [0, 0],        # Start
    [0, 80],       # Down
    [-400, 80],    # Left
    [-400, -150]   # Up to target
  ]
```

---

## Z-Order (Element Array Order)

Elements render in array order. First = back, last = front.

**Correct order:**
1. Background shapes (containers, frames)
2. Connection lines/arrows
3. Foreground shapes (nodes, boxes)
4. Text labels
5. Icons/overlays

---

## Visual Styles

### Professional Mode (Default)

**Use for:** Architecture diagrams, UML, technical docs, formal presentations

```json
{
  "roughness": 0,
  "fillStyle": "solid",
  "strokeWidth": 2,
  "fontFamily": 2
}
```

**Colors (light backgrounds for readability):**
| Purpose | Background |
|---------|------------|
| Primary | `#e7f5ff` |
| Success | `#ebfbee` |
| Warning | `#fff9db` |
| Accent | `#f3f0ff` |
| Secondary | `#fff4e6` |

### Hand-drawn Mode

**Use for:** Brainstorming, sketches, informal sharing

```json
{
  "roughness": 1,
  "fillStyle": "hachure",
  "strokeWidth": 2,
  "fontFamily": 1
}
```

**Colors (medium saturation):**
| Purpose | Background |
|---------|------------|
| Primary | `#a5d8ff` |
| Success | `#b2f2bb` |
| Warning | `#ffec99` |
| Error | `#ffc9c9` |
| Accent | `#d0bfff` |
| Secondary | `#ffd8a8` |

**Stroke color:** `#1e1e1e` (dark gray, softer than pure black)

---

## Element Types

### Common Properties (required for all)

```json
{
  "id": "unique-id",
  "type": "rectangle",
  "x": 100,
  "y": 100,
  "width": 160,
  "height": 80,
  "strokeColor": "#1e1e1e",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 2,
  "roughness": 1,
  "opacity": 100,
  "angle": 0,
  "seed": 100,
  "version": 1,
  "isDeleted": false,
  "boundElements": null,
  "link": null,
  "locked": false
}
```

### Type-Specific Properties

**Rectangle**: Add `"roundness": {"type": 3}` for rounded corners

**Text**:
```json
{
  "type": "text",
  "text": "Content\nLine 2",
  "fontSize": 16,
  "fontFamily": 1,
  "textAlign": "center",
  "verticalAlign": "middle"
}
```
- fontFamily: 1=Virgil (hand), 2=Helvetica, 3=Cascadia (mono)

**Arrow/Line**:
```json
{
  "type": "arrow",
  "points": [[0, 0], [100, 0]],
  "startArrowhead": null,
  "endArrowhead": "arrow"
}
```
- Points are relative to element's x,y
- Arrowheads: `null`, `"arrow"`, `"bar"`, `"dot"`, `"triangle"`

---

## Workflow

### Step 1: Identify Diagram Type

Match the request to a diagram type:
- **Flowchart**: Process flows, algorithms, decision trees, workflows
- **Architecture**: System designs, microservices, cloud infrastructure
- **UML Class**: Object-oriented design, class hierarchies, relationships
- **Mind Map**: Brainstorming, concept hierarchies, topic exploration

### Step 2: Use Templates as Foundation

Templates in `assets/`:
- `flowchart-template.json`
- `architecture-template.json`
- `uml-class-template.json`
- `mindmap-template.json`

**Usage:**
1. Read the appropriate template
2. Modify IDs, text, positions, colors
3. Add/remove elements as needed
4. Ensure all IDs are unique

### Step 3: Generate Elements

Key element types:
- `rectangle` - Boxes, containers, processes
- `ellipse` - Start/end nodes, databases
- `diamond` - Decisions, conditional branches
- `arrow` / `line` - Connections, flows
- `text` - Labels, descriptions

### Step 4: Calculate Layout

Use the grid system and text centering formulas above.

**Layout strategies:**
- **Flowcharts**: Top-to-bottom, centered alignment
- **Architecture**: Left-to-right for flow, grouped by layer
- **UML Class**: Use container height formula; prevent text overflow
- **Mind Maps**: Radial from center, balanced branches

### Step 5: Style and Polish

1. Choose visual style (Professional or Hand-drawn)
2. Apply consistent colors from the palette
3. Ensure adequate spacing (80-100px between elements)

### Step 6: Save to File

**Always save directly as `.excalidraw.json`** (no code blocks).

1. Write complete JSON to file
2. Name descriptively (e.g., `user-login-flow.excalidraw.json`)
3. Save to current directory unless specified otherwise

**After saving, provide:**
1. Confirmation with file path
2. Brief description of diagram structure
3. Instructions: "Open at excalidraw.com → Menu → Open"

---

## Common Patterns

### Pattern 1: Sequential Flow

For A → B → C processes:
1. Place elements vertically with 120px gaps
2. Use rectangles for processes, ellipses for start/end
3. Connect with arrows (endArrowhead: "arrow")
4. Center-align all elements

### Pattern 2: Decision Tree

For conditional branches:
1. Use diamond for decision nodes
2. Branch arrows left/right or up/down
3. Add text labels on arrows ("Yes", "No")
4. Rejoin paths when appropriate

### Pattern 3: Hierarchical Structure

For layered architectures:
1. Group elements by layer (horizontal rows)
2. Use different colors per layer
3. Vertical arrows show dependencies
4. Consistent element sizes within layers

### Pattern 4: Radial Mind Map

For concept exploration:
1. Central node (ellipse) in middle
2. Lines radiate outward
3. Different colors per branch
4. Rectangles for sub-topics

---

## Positioning Checklist

Before generating:
1. Define grid: START_X, START_Y, COLUMN_WIDTH, ROW_HEIGHT
2. List all elements with row/column positions
3. Calculate exact x,y using formulas
4. Calculate text positions using centering formula
5. Calculate arrow start points and relative endpoints
6. Order elements correctly for z-order
7. Assign unique IDs and incrementing seeds

---

## Complete Node Example

```json
[
  {
    "id": "node1-box",
    "type": "rectangle",
    "x": 100, "y": 100, "width": 160, "height": 80,
    "strokeColor": "#1971c2",
    "backgroundColor": "#a5d8ff",
    "fillStyle": "solid",
    "strokeWidth": 2,
    "roughness": 1,
    "opacity": 100,
    "angle": 0,
    "seed": 100,
    "version": 1,
    "isDeleted": false,
    "boundElements": [{"id": "arrow1", "type": "arrow"}],
    "roundness": {"type": 3},
    "link": null,
    "locked": false
  },
  {
    "id": "node1-text",
    "type": "text",
    "x": 130, "y": 130,
    "width": 100, "height": 20,
    "text": "Process Step",
    "fontSize": 16,
    "fontFamily": 1,
    "textAlign": "center",
    "verticalAlign": "middle",
    "strokeColor": "#1e1e1e",
    "backgroundColor": "transparent",
    "fillStyle": "solid",
    "strokeWidth": 1,
    "roughness": 1,
    "opacity": 100,
    "angle": 0,
    "seed": 101,
    "version": 1,
    "isDeleted": false,
    "boundElements": null,
    "link": null,
    "locked": false
  }
]
```

---

## Tips for Quality Diagrams

1. **Unique IDs**: Generate random 8-16 character IDs for each element
2. **Consistent spacing**: Follow spacing guidelines strictly
3. **Color harmony**: Use the recommended color palette
4. **Text sizing**: Match text width to container width with padding
5. **Arrow connections**: Position arrow start/end points precisely
6. **Version numbers**: Use random integers for versionNonce and seed

## Handling Complex Requests

For large or complex diagrams:
1. **Start simple**: Create core structure first
2. **Iterate**: Add details progressively
3. **Group logically**: Use visual grouping (colors, spacing)
4. **Limit complexity**: Suggest breaking into multiple diagrams if needed
5. **Maintain readability**: Ensure text doesn't overlap, adequate spacing

---

## Resources

### assets/
Templates for common diagram types:
- `flowchart-template.json`
- `architecture-template.json`
- `uml-class-template.json`
- `mindmap-template.json`

### references/
- `excalidraw-format.md` - Complete JSON format specification
- `elements.md` - Element types and properties
- `processing-loop-template.md` - Processing loop example
