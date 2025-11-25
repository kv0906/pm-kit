---
name: gemini-grounded-search
description: Use Google's Gemini API directly for real-time web search, code execution, and URL analysis via Python CLI scripts. Includes tools for market research, competitive analysis, data validation, and evidence gathering with automatic source citations.
---

# Gemini Grounded Search (Python CLI)

Use Google's Gemini API directly through Python CLI scripts for real-time web search with automatic source citations.

## Quick Setup (2 Steps)

### Step 1: Get Your Free API Key

1. Go to [Google AI Studio](https://aistudio.google.com/apikey)
2. Sign in with your Google account
3. Click **"Create API Key"**
4. Copy the key (starts with `AIza...`)

### Step 2: Set Environment Variable

```bash
# Add to your shell profile (.bashrc, .zshrc, etc.)
export GEMINI_API_KEY="AIza...your-key-here"
```

That's it! You can now use the CLI scripts.

---

## CLI Scripts

### Web Search with Citations

```bash
uv run --with google-genai scripts/gemini/grounded_search.py "your query"
```

Use for:
- Market research ("What are the top CRM tools in 2025?")
- Competitive analysis ("Compare Notion vs Obsidian features")
- Evidence gathering ("What studies support remote work effectiveness?")
- Trend analysis ("Latest AI developments this month")

### Code Execution

```bash
uv run --with google-genai scripts/gemini/code_execution.py "calculate X"
```

Use for:
- Mathematical calculations
- Data analysis with NumPy/Pandas
- Creating charts with Matplotlib
- Running Python code in sandbox

### Combined Search + Code

```bash
uv run --with google-genai scripts/gemini/multi_tool_query.py "research and visualize X"
```

Use for:
- Research that requires calculations
- Data visualization from web sources
- Complex queries needing multiple steps

### URL Analysis

```bash
uv run --with google-genai scripts/gemini/url_context.py "https://..." "summarize this"
```

Use for:
- Analyzing specific web pages
- Extracting information from URLs
- Summarizing long articles

See `scripts/gemini/` directory for full documentation and examples.

---

## What You Get

- **Real-time web results** - Not limited to training data cutoff
- **Source citations** - Every claim linked to its source
- **Search transparency** - See what queries were used
- **Synthesized answers** - Analyzed information, not raw search results
- **Code execution** - Run Python in secure sandbox environment

---

## Technical Reference

### Supported Models

The scripts use Google's Gemini models:

| Model | Best For |
|-------|----------|
| `gemini-2.5-flash` | Fast search, general use (default) |
| `gemini-2.5-pro` | Complex queries, deep research |

### Grounding Capabilities

- **Google Search** - Real-time web search with citations
- **Code Execution** - Run Python in sandbox (NumPy, Pandas, Matplotlib)
- **URL Context** - Analyze specific web pages

### API Quotas

- **Free tier**: Generous limits for personal use
- **Rate limits**: Subject to Google AI Studio quotas
- **Enterprise**: Consider Vertex AI for higher quotas

---

## Best Practices

### Be Specific About Time
> "What are the AI trends in **November 2025**?"

### Request Sources Explicitly
> "What evidence exists for X? **Include sources.**"

### Ask for Comparisons
> "Compare A vs B vs C. **Include recent updates.**"

### Specify Data Needs
> "What is the current price of Bitcoin? **Include the source.**"

---

## Notes

- All responses include source attribution
- Grounding metadata shows search queries used
- Python scripts run locally with direct API access
- No MCP server required - simple CLI tools
