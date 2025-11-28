# Processing Loop with Conditional Branching Template

Generic template for systems with: Input → Processor → Condition → Output/Action branches with feedback loop.

## Use Cases

- AI agent tool-calling loops
- Order processing workflows
- Request handling systems
- API gateway routing
- Approval workflows
- Error handling pipelines

## Template Variables

| Variable | Description | Examples |
|----------|-------------|----------|
| `{{INPUT_TEXT}}` | Initial input/request | "Process order #123", "User query", "API request" |
| `{{INPUT_LABEL}}` | Label for input arrow | "Request", "Query", "Order", "Message" |
| `{{PROCESSOR_TITLE}}` | Main processor node title | "Order Processor", "Router", "Agent", "Handler" |
| `{{PROCESSOR_ICON}}` | Emoji for processor | "🧠", "⚙️", "🔄", "📦" |
| `{{CAPABILITY_1}}` | First capability/tool | "Validator", "Database", "API Call" |
| `{{CAPABILITY_1_COLOR}}` | Color for capability 1 | "#868e96" (gray) |
| `{{CAPABILITY_2}}` | Second capability/tool | "Notifier", "Logger", "Cache" |
| `{{CAPABILITY_2_COLOR}}` | Color for capability 2 | "#1971c2" (blue) |
| `{{CONDITION_LABEL}}` | Decision point label | "Route", "Validate", "Check", "Condition" |
| `{{OUTPUT_LABEL}}` | Direct output path label | "Response", "Complete", "Success", "Done" |
| `{{OUTPUT_TEXT}}` | Final output text | "Order confirmed", "Result: OK", "Done" |
| `{{ACTION_LABEL}}` | Action path label | "Process", "Execute", "Handle", "Action" |
| `{{ACTION_ARGS}}` | Action parameters | "id: 123\ntype: fulfillment" |
| `{{EXECUTOR_TITLE}}` | Executor node title | "Executor", "Worker", "Handler", "Service" |
| `{{EXECUTOR_RESULT}}` | Execution result | "success", "completed", "processed" |
| `{{FEEDBACK_LABEL}}` | Feedback loop label | "Result", "Callback", "Response", "Update" |

## Layout Coordinates

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  Y=55-75: Direct output text                                                 │
│                                                                              │
│  Y=95-130: Node labels                                                       │
│                                                                              │
│  Y=155-235: Main flow (Processor → Condition → branches)                    │
│                                                                              │
│  Y=245-370: Executor area                                                    │
│                                                                              │
│  Y=380-510: Feedback loop path                                               │
└─────────────────────────────────────────────────────────────────────────────┘

X positions:
- Input: 20-230
- Processor Node: 320-500
- Condition: 590-660
- Executor Node: 755-915
```

## Color Scheme

| Element | Stroke | Background | Purpose |
|---------|--------|------------|---------|
| Processor icon | `#e03131` | `#ffc9c9` | Main processing unit |
| Condition diamond | `#1e1e1e` | `#1e1e1e` | Decision point |
| Output arrow | `#2f9e44` | - | Success/completion path |
| Action arrow | `#e8590c` | - | Processing/action path |
| Feedback arrow | `#9c36b5` | - | Return/callback loop |
| Node boxes | `#868e96` | transparent | Containers |

## JSON Template

```json
{
  "type": "excalidraw",
  "version": 2,
  "source": "https://excalidraw.com",
  "elements": [
    {
      "id": "input-text",
      "type": "text",
      "x": 20,
      "y": 180,
      "width": 200,
      "height": 30,
      "text": "{{INPUT_TEXT}}",
      "fontSize": 16,
      "fontFamily": 1,
      "textAlign": "left",
      "verticalAlign": "middle",
      "strokeColor": "#1e1e1e",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 100,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "arrow-input",
      "type": "arrow",
      "x": 230,
      "y": 195,
      "width": 80,
      "height": 0,
      "strokeColor": "#1e1e1e",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 2,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 101,
      "version": 1,
      "isDeleted": false,
      "points": [[0, 0], [80, 0]],
      "startArrowhead": null,
      "endArrowhead": "arrow",
      "link": null,
      "locked": false
    },
    {
      "id": "label-input",
      "type": "text",
      "x": 245,
      "y": 165,
      "width": 80,
      "height": 25,
      "text": "{{INPUT_LABEL}}",
      "fontSize": 12,
      "fontFamily": 3,
      "textAlign": "center",
      "verticalAlign": "middle",
      "strokeColor": "#868e96",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 102,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "processor-box",
      "type": "rectangle",
      "x": 320,
      "y": 120,
      "width": 180,
      "height": 150,
      "strokeColor": "#868e96",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 200,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "roundness": {"type": 3},
      "link": null,
      "locked": false
    },
    {
      "id": "processor-label",
      "type": "text",
      "x": 320,
      "y": 95,
      "width": 180,
      "height": 20,
      "text": "{{PROCESSOR_TITLE}}",
      "fontSize": 11,
      "fontFamily": 3,
      "textAlign": "left",
      "verticalAlign": "middle",
      "strokeColor": "#1e1e1e",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 201,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "processor-icon-bg",
      "type": "ellipse",
      "x": 365,
      "y": 155,
      "width": 90,
      "height": 80,
      "strokeColor": "#e03131",
      "backgroundColor": "#ffc9c9",
      "fillStyle": "solid",
      "strokeWidth": 2,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 202,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "processor-icon",
      "type": "text",
      "x": 388,
      "y": 182,
      "width": 45,
      "height": 25,
      "text": "{{PROCESSOR_ICON}}",
      "fontSize": 28,
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
      "seed": 203,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "capability-1",
      "type": "text",
      "x": 340,
      "y": 245,
      "width": 70,
      "height": 20,
      "text": "{{CAPABILITY_1}}",
      "fontSize": 12,
      "fontFamily": 2,
      "textAlign": "center",
      "verticalAlign": "middle",
      "strokeColor": "{{CAPABILITY_1_COLOR}}",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 204,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "capability-2",
      "type": "text",
      "x": 420,
      "y": 245,
      "width": 80,
      "height": 20,
      "text": "{{CAPABILITY_2}}",
      "fontSize": 12,
      "fontFamily": 2,
      "textAlign": "center",
      "verticalAlign": "middle",
      "strokeColor": "{{CAPABILITY_2_COLOR}}",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 205,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "arrow-to-condition",
      "type": "arrow",
      "x": 505,
      "y": 195,
      "width": 80,
      "height": 0,
      "strokeColor": "#1e1e1e",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 2,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 300,
      "version": 1,
      "isDeleted": false,
      "points": [[0, 0], [80, 0]],
      "startArrowhead": null,
      "endArrowhead": "arrow",
      "link": null,
      "locked": false
    },
    {
      "id": "condition-diamond",
      "type": "diamond",
      "x": 590,
      "y": 160,
      "width": 70,
      "height": 70,
      "strokeColor": "#1e1e1e",
      "backgroundColor": "#1e1e1e",
      "fillStyle": "solid",
      "strokeWidth": 2,
      "roughness": 0,
      "opacity": 100,
      "angle": 0,
      "seed": 400,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "condition-label",
      "type": "text",
      "x": 580,
      "y": 130,
      "width": 90,
      "height": 25,
      "text": "{{CONDITION_LABEL}}",
      "fontSize": 12,
      "fontFamily": 3,
      "textAlign": "center",
      "verticalAlign": "middle",
      "strokeColor": "#1e1e1e",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 401,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "arrow-output",
      "type": "arrow",
      "x": 625,
      "y": 155,
      "width": 120,
      "height": 80,
      "strokeColor": "#2f9e44",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 2,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 500,
      "version": 1,
      "isDeleted": false,
      "points": [[0, 0], [60, -80], [120, -80]],
      "startArrowhead": null,
      "endArrowhead": "arrow",
      "link": null,
      "locked": false
    },
    {
      "id": "label-output",
      "type": "text",
      "x": 660,
      "y": 55,
      "width": 60,
      "height": 20,
      "text": "{{OUTPUT_LABEL}}",
      "fontSize": 12,
      "fontFamily": 3,
      "textAlign": "center",
      "verticalAlign": "middle",
      "strokeColor": "#2f9e44",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 501,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "output-text",
      "type": "text",
      "x": 755,
      "y": 60,
      "width": 120,
      "height": 30,
      "text": "{{OUTPUT_TEXT}}",
      "fontSize": 16,
      "fontFamily": 1,
      "textAlign": "left",
      "verticalAlign": "middle",
      "strokeColor": "#1e1e1e",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 502,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "arrow-action",
      "type": "arrow",
      "x": 625,
      "y": 235,
      "width": 120,
      "height": 80,
      "strokeColor": "#e8590c",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 2,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 600,
      "version": 1,
      "isDeleted": false,
      "points": [[0, 0], [60, 80], [120, 80]],
      "startArrowhead": null,
      "endArrowhead": "arrow",
      "link": null,
      "locked": false
    },
    {
      "id": "label-action",
      "type": "text",
      "x": 665,
      "y": 300,
      "width": 55,
      "height": 20,
      "text": "{{ACTION_LABEL}}",
      "fontSize": 12,
      "fontFamily": 3,
      "textAlign": "center",
      "verticalAlign": "middle",
      "strokeColor": "#e8590c",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 601,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "action-args",
      "type": "text",
      "x": 720,
      "y": 330,
      "width": 180,
      "height": 35,
      "text": "{{ACTION_ARGS}}",
      "fontSize": 11,
      "fontFamily": 3,
      "textAlign": "left",
      "verticalAlign": "middle",
      "strokeColor": "#868e96",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 602,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "executor-box",
      "type": "rectangle",
      "x": 755,
      "y": 270,
      "width": 160,
      "height": 100,
      "strokeColor": "#868e96",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 700,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "roundness": {"type": 3},
      "link": null,
      "locked": false
    },
    {
      "id": "executor-label",
      "type": "text",
      "x": 755,
      "y": 245,
      "width": 100,
      "height": 20,
      "text": "{{EXECUTOR_TITLE}}",
      "fontSize": 12,
      "fontFamily": 3,
      "textAlign": "left",
      "verticalAlign": "middle",
      "strokeColor": "#1e1e1e",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 701,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "executor-capability-1",
      "type": "text",
      "x": 775,
      "y": 295,
      "width": 70,
      "height": 20,
      "text": "{{CAPABILITY_1}}",
      "fontSize": 12,
      "fontFamily": 2,
      "textAlign": "center",
      "verticalAlign": "middle",
      "strokeColor": "{{CAPABILITY_1_COLOR}}",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 702,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "executor-capability-2",
      "type": "text",
      "x": 850,
      "y": 295,
      "width": 60,
      "height": 20,
      "text": "{{CAPABILITY_2}}",
      "fontSize": 11,
      "fontFamily": 2,
      "textAlign": "center",
      "verticalAlign": "middle",
      "strokeColor": "{{CAPABILITY_2_COLOR}}",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 703,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "executor-description",
      "type": "text",
      "x": 755,
      "y": 380,
      "width": 220,
      "height": 35,
      "text": "Executes action and\nreturns result: {{EXECUTOR_RESULT}}",
      "fontSize": 11,
      "fontFamily": 3,
      "textAlign": "left",
      "verticalAlign": "middle",
      "strokeColor": "#868e96",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 704,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    },
    {
      "id": "arrow-feedback",
      "type": "arrow",
      "x": 835,
      "y": 375,
      "width": 425,
      "height": 130,
      "strokeColor": "#9c36b5",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 2,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 800,
      "version": 1,
      "isDeleted": false,
      "points": [[0, 0], [0, 130], [-425, 130], [-425, -100]],
      "startArrowhead": null,
      "endArrowhead": "arrow",
      "link": null,
      "locked": false
    },
    {
      "id": "label-feedback",
      "type": "text",
      "x": 450,
      "y": 490,
      "width": 80,
      "height": 20,
      "text": "{{FEEDBACK_LABEL}}",
      "fontSize": 12,
      "fontFamily": 3,
      "textAlign": "center",
      "verticalAlign": "middle",
      "strokeColor": "#9c36b5",
      "backgroundColor": "transparent",
      "fillStyle": "solid",
      "strokeWidth": 1,
      "roughness": 1,
      "opacity": 100,
      "angle": 0,
      "seed": 801,
      "version": 1,
      "isDeleted": false,
      "boundElements": null,
      "link": null,
      "locked": false
    }
  ],
  "appState": {
    "gridSize": null,
    "viewBackgroundColor": "#ffffff"
  },
  "files": {}
}
```

## Example Configurations

### AI Agent Tool Loop
```
INPUT_TEXT: "What is magic_function(3)"
INPUT_LABEL: Human message
PROCESSOR_TITLE: Assistant Node (LLM w/ bound tools)
PROCESSOR_ICON: 🧠
CAPABILITY_1: Magic Fxn
CAPABILITY_2: Web Search
CONDITION_LABEL: Tools Condition
OUTPUT_LABEL: Response
OUTPUT_TEXT: The result is 5
ACTION_LABEL: Tool call
ACTION_ARGS: arguments: '{"input":3}'\nname: magic_function
EXECUTOR_TITLE: Tool Node
EXECUTOR_RESULT: '5'
FEEDBACK_LABEL: Tool message
```

### Order Processing System
```
INPUT_TEXT: "Order #12345"
INPUT_LABEL: New Order
PROCESSOR_TITLE: Order Processor
PROCESSOR_ICON: 📦
CAPABILITY_1: Inventory
CAPABILITY_2: Payment
CONDITION_LABEL: Validate
OUTPUT_LABEL: Complete
OUTPUT_TEXT: Order Confirmed
ACTION_LABEL: Fulfill
ACTION_ARGS: items: 3\nwarehouse: US-West
EXECUTOR_TITLE: Fulfillment Service
EXECUTOR_RESULT: shipped
FEEDBACK_LABEL: Status Update
```

### API Gateway Router
```
INPUT_TEXT: "GET /api/users/123"
INPUT_LABEL: HTTP Request
PROCESSOR_TITLE: API Gateway
PROCESSOR_ICON: 🔀
CAPABILITY_1: Auth
CAPABILITY_2: RateLimit
CONDITION_LABEL: Route
OUTPUT_LABEL: Cached
OUTPUT_TEXT: 200 OK (from cache)
ACTION_LABEL: Forward
ACTION_ARGS: service: user-svc\nmethod: GET
EXECUTOR_TITLE: Microservice
EXECUTOR_RESULT: user_data
FEEDBACK_LABEL: Response
```

### Approval Workflow
```
INPUT_TEXT: "Expense Report $5,000"
INPUT_LABEL: Submit
PROCESSOR_TITLE: Approval Engine
PROCESSOR_ICON: ✅
CAPABILITY_1: Policy
CAPABILITY_2: Budget
CONDITION_LABEL: Review
OUTPUT_LABEL: Auto-Approve
OUTPUT_TEXT: Approved
ACTION_LABEL: Escalate
ACTION_ARGS: approver: manager\namount: $5,000
EXECUTOR_TITLE: Manager Review
EXECUTOR_RESULT: approved
FEEDBACK_LABEL: Decision
```

## Variations

### Remove Feedback Loop
Delete: `arrow-feedback`, `label-feedback`

### Add Third Capability
Duplicate capability elements, adjust positions:
- Y=265 for third row in both nodes

### Multiple Executors
Duplicate executor section, shift Y by +150px each
