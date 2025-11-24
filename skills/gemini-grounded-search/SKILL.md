---
name: gemini-grounded-search
description: Ground AI responses with real-time web search, code execution, and URL context using Google's Gemini API. Use this skill for market research, competitive analysis, data validation, evidence gathering, and any task requiring current information with citations.
---

# Gemini Grounded Search

Enable Claude to search the web in real-time using Google's Gemini API with automatic source citations.

## Quick Setup (3 Steps)

### Step 1: Get Your Free API Key

1. Go to [Google AI Studio](https://aistudio.google.com/apikey)
2. Sign in with your Google account
3. Click **"Create API Key"**
4. Copy the key (starts with `AIza...`)

### Step 2: Create Your .env File

In your project folder, create a file named `.env`:

```bash
# Copy from .env.example or create manually
GEMINI_API_KEY=AIza...your-key-here
```

### Step 3: Restart Claude Code

```bash
# In your terminal
claude
```

That's it! Claude now has access to real-time web search via Gemini.

---

## How It Works

Once configured, the research agent (`/research`) automatically uses Gemini's grounded search for:

| Use Case | Example |
|----------|---------|
| Market Research | "What are the top CRM tools in 2025?" |
| Competitive Analysis | "Compare Notion vs Obsidian features" |
| Evidence Gathering | "What studies support remote work effectiveness?" |
| Trend Analysis | "Latest AI developments this month" |
| Data Validation | "Verify: Apple's market cap exceeded $3T in 2024" |

### What You Get

- **Real-time web results** - Not limited to training data cutoff
- **Source citations** - Every claim linked to its source
- **Search transparency** - See what queries were used
- **Synthesized answers** - Not raw search results, but analyzed information

---

## Available Tools (via MCP)

When configured, these tools become available to Claude:

| Tool | What It Does |
|------|--------------|
| `mcp__gemini-grounding__search` | Web search with citations |
| `mcp__gemini-grounding__searchDeveloper` | Developer docs search |
| `mcp__gemini-grounding__searchReddit` | Reddit discussions search |

---

## Verify Setup

Check if Gemini MCP is connected:

```
/mcp
```

You should see `gemini-grounding` in the list of connected servers.

---

## Troubleshooting

### "Server not connected"

1. Check your `.env` file exists and has the correct key
2. Restart Claude Code
3. Run `/mcp` to check status

### "Invalid API key"

1. Go back to [Google AI Studio](https://aistudio.google.com/apikey)
2. Create a new key
3. Update your `.env` file
4. Restart Claude Code

### "Quota exceeded"

The free tier has generous limits, but if exceeded:
- Wait a few minutes and try again
- Or upgrade to a paid tier at Google AI Studio

---

## Best Practices for Research Prompts

### Be Specific About Time
> "What are the AI trends in **November 2025**?"

### Request Sources Explicitly
> "What evidence exists for X? **Include sources.**"

### Ask for Comparisons
> "Compare A vs B vs C. **Include recent updates.**"

### Specify Data Needs
> "What is the current price of Bitcoin? **Include the source.**"

---

## Advanced: CLI Scripts

For power users who want direct command-line access, PM-Kit includes Python scripts:

```bash
# Web search with citations
uv run --with google-genai scripts/gemini/grounded_search.py "your query"

# Code execution (calculations, charts)
uv run --with google-genai scripts/gemini/code_execution.py "calculate X"

# Combined search + code
uv run --with google-genai scripts/gemini/multi_tool_query.py "research and visualize X"

# URL analysis
uv run --with google-genai scripts/gemini/url_context.py "https://..." "summarize this"
```

See `scripts/gemini/` for full documentation.

---

## Technical Reference

### MCP Configuration

PM-Kit includes a pre-configured `.mcp.json`:

```json
{
  "mcpServers": {
    "gemini-grounding": {
      "command": "npx",
      "args": ["-y", "gemini-grounding"],
      "env": {
        "GEMINI_API_KEY": "$GEMINI_API_KEY"
      }
    }
  }
}
```

### Supported Models

| Model | Best For |
|-------|----------|
| `gemini-2.5-flash` | Fast search, general use |
| `gemini-2.5-pro` | Complex queries, deep research |

### Grounding Capabilities

- **Google Search** - Real-time web search with citations
- **Code Execution** - Run Python in sandbox (NumPy, Pandas, Matplotlib)
- **URL Context** - Analyze specific web pages

---

## Notes

- Google Search grounding is subject to API quotas (generous free tier)
- All responses include source attribution
- Grounding metadata shows search queries used
- For enterprise use, consider Vertex AI for higher quotas
