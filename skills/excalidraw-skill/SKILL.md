---
name: excalidraw
description: Create Excalidraw diagrams as JSON files for flowcharts, user journeys, system architectures, wireframes, and visual documentation. Use when the user asks to create diagrams, flowcharts, visual representations, architecture diagrams, mind maps, or any Excalidraw-compatible visualizations. Outputs .excalidraw.json files that can be opened in excalidraw.com or any Excalidraw-compatible app.
---

# Excalidraw Diagram Generator

Create Excalidraw-compatible JSON diagrams. Output files use `.excalidraw.json` extension.

## JSON Schema Structure

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

## Element Types

All elements share common properties. See `references/elements.md` for complete element specifications.

### Common Properties (all elements)

```json
{
  "id": "unique-string",
  "type": "rectangle|ellipse|diamond|line|arrow|text|freedraw|image",
  "x": 100,
  "y": 100,
  "width": 200,
  "height": 100,
  "strokeColor": "#1e1e1e",
  "backgroundColor": "#a5d8ff",
  "fillStyle": "solid|hachure|cross-hatch",
  "strokeWidth": 1,
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 12345,
  "version": 1,
  "isDeleted": false,
  "boundElements": null,
  "link": null,
  "locked": false
}
```

### Quick Element Reference

| Type | Key Properties |
|------|----------------|
| `rectangle` | Common + `roundness: {type: 3}` for rounded corners |
| `ellipse` | Common only |
| `diamond` | Common only |
| `text` | Common + `text`, `fontSize`, `fontFamily`, `textAlign`, `verticalAlign` |
| `arrow` | Common + `points`, `startBinding`, `endBinding`, `startArrowhead`, `endArrowhead` |
| `line` | Common + `points` |

## Color Palette

### Stroke Colors
- Blue: `#1971c2`, Green: `#2f9e44`, Orange: `#e8590c`, Purple: `#9c36b5`
- Yellow: `#f08c00`, Teal: `#099268`, Red: `#e03131`, Gray: `#868e96`
- Black: `#1e1e1e`

### Background Colors (light fills)
- Blue: `#a5d8ff`, Green: `#b2f2bb`, Orange/Red: `#ffc9c9`, Purple: `#eebefa`
- Yellow: `#ffec99`, Teal: `#96f2d7`, Gray: `#dee2e6`

## Layout Guidelines

1. **Spacing**: Use 220px horizontal gap, 200px vertical gap between elements
2. **Element sizes**: Standard box 160x80, larger boxes 200x100
3. **Text positioning**: Center text within boxes, offset by ~20px from box x/y
4. **Arrow points**: Use relative coordinates `[[0,0], [50,0]]` for horizontal arrows
5. **Flow direction**: Left-to-right for horizontal flows, top-to-bottom for vertical

## Minimal Examples

### Rectangle with Text

```json
{
  "elements": [
    {
      "id": "box1",
      "type": "rectangle",
      "x": 100, "y": 100, "width": 160, "height": 80,
      "strokeColor": "#1971c2",
      "backgroundColor": "#a5d8ff",
      "fillStyle": "solid",
      "strokeWidth": 2,
      "roughness": 1,
      "opacity": 100,
      "roundness": {"type": 3}
    },
    {
      "id": "text1",
      "type": "text",
      "x": 120, "y": 125,
      "width": 120, "height": 30,
      "text": "Step 1",
      "fontSize": 16,
      "fontFamily": 1,
      "textAlign": "center",
      "strokeColor": "#1e1e1e",
      "backgroundColor": "transparent"
    }
  ]
}
```

### Arrow Connecting Elements

```json
{
  "id": "arrow1",
  "type": "arrow",
  "x": 265, "y": 140,
  "width": 50, "height": 0,
  "strokeColor": "#1971c2",
  "strokeWidth": 2,
  "roughness": 1,
  "points": [[0, 0], [50, 0]],
  "startArrowhead": null,
  "endArrowhead": "arrow"
}
```

## Diagram Patterns

### Flowchart Pattern
- Use rectangles for process steps
- Use diamonds for decisions
- Connect with arrows
- Color-code by category/phase

### User Journey Pattern
- Horizontal or snake-path flow
- Phase labels above sections
- Details/bullet points below each step
- Drop-off indicators where applicable
- Loop-back arrows for repeat customers

### Architecture Pattern
- Group related components with proximity
- Use different colors for different layers
- Add connecting lines/arrows for data flow

## Best Practices

1. **Generate unique IDs**: Use descriptive IDs like `"stage1"`, `"arrow-1-2"`, `"title"`
2. **Set seed values**: Use incrementing numbers (100, 200, 300) for consistent rendering
3. **Pair shapes with text**: Place text elements centered within shapes
4. **Use boundElements**: Link arrows to shapes for dynamic connections
5. **Keep roughness consistent**: Use `1` for hand-drawn look, `0` for clean lines
6. **Always set version to 1**: Required for proper rendering

## Output Instructions

1. Save as `.excalidraw.json` file
2. Copy to `/mnt/user-data/outputs/` for user download
3. Inform user: "Open in Excalidraw (excalidraw.com) → Menu → Open → Select file"
