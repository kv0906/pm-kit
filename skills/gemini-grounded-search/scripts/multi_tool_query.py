#!/usr/bin/env python3
"""
Multi-Tool Query using Google's Gemini API.

Combines Google Search grounding with code execution for complex research tasks.

Usage:
    python multi_tool_query.py "Research Tesla's 2024 revenue and visualize it"
    python multi_tool_query.py "Find current Bitcoin price and calculate monthly returns" --save-charts output/

Environment:
    GEMINI_API_KEY: Your Google AI Studio API key

Best For:
    - Research + analysis tasks
    - Data-driven visualizations
    - Market research with charts
    - Competitive analysis with comparisons
"""

import argparse
import base64
import json
import os
import sys
from datetime import datetime
from pathlib import Path

try:
    from google import genai
    from google.genai import types
except ImportError:
    print("Error: google-genai not installed. Run: pip install google-genai")
    sys.exit(1)

try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass  # dotenv is optional


def get_client():
    """Initialize Gemini client with API key."""
    api_key = os.environ.get("GEMINI_API_KEY")
    if not api_key:
        print("Error: GEMINI_API_KEY environment variable not set.")
        print("\nTo set up:")
        print("1. Get key from https://aistudio.google.com/apikey")
        print("2. Run: export GEMINI_API_KEY='your-key-here'")
        sys.exit(1)
    return genai.Client(api_key=api_key)


def extract_full_results(response):
    """Extract all results including grounding and code execution."""
    result = {
        "text": "",
        "grounded": False,
        "search_queries": [],
        "sources": [],
        "code_blocks": [],
        "execution_results": [],
        "charts": []
    }

    # Extract parts
    for part in response.parts:
        if hasattr(part, 'text') and part.text:
            result["text"] += part.text + "\n"

        elif hasattr(part, 'executable_code') and part.executable_code:
            result["code_blocks"].append({
                "language": getattr(part.executable_code, 'language', 'python'),
                "code": part.executable_code.code
            })

        elif hasattr(part, 'code_execution_result') and part.code_execution_result:
            exec_result = part.code_execution_result
            result["execution_results"].append({
                "outcome": getattr(exec_result, 'outcome', 'unknown'),
                "output": getattr(exec_result, 'output', '')
            })

        elif hasattr(part, 'inline_data') and part.inline_data:
            data = part.inline_data
            result["charts"].append({
                "mime_type": data.mime_type,
                "data": base64.b64encode(data.data).decode() if isinstance(data.data, bytes) else data.data
            })

    result["text"] = result["text"].strip()

    # Extract grounding metadata
    candidate = response.candidates[0]
    if hasattr(candidate, 'grounding_metadata') and candidate.grounding_metadata:
        metadata = candidate.grounding_metadata
        result["grounded"] = True

        if hasattr(metadata, 'web_search_queries') and metadata.web_search_queries:
            result["search_queries"] = list(metadata.web_search_queries)

        if hasattr(metadata, 'grounding_chunks') and metadata.grounding_chunks:
            for chunk in metadata.grounding_chunks:
                if hasattr(chunk, 'web') and chunk.web:
                    result["sources"].append({
                        "title": getattr(chunk.web, 'title', 'Unknown'),
                        "uri": getattr(chunk.web, 'uri', '')
                    })

    return result


def save_charts(charts, output_dir):
    """Save chart images to output directory."""
    output_path = Path(output_dir)
    output_path.mkdir(parents=True, exist_ok=True)

    saved_files = []
    for i, chart in enumerate(charts):
        ext = "png" if "png" in chart["mime_type"] else "jpg"
        filename = output_path / f"chart_{i + 1}.{ext}"

        image_data = base64.b64decode(chart["data"])
        with open(filename, "wb") as f:
            f.write(image_data)

        saved_files.append(str(filename))

    return saved_files


def multi_tool_query(prompt, model="gemini-2.5-flash", output_json=False,
                     save_charts_dir=None):
    """Execute multi-tool query combining search and code execution."""
    client = get_client()

    # Enable both tools
    config = types.GenerateContentConfig(
        tools=[
            types.Tool(google_search=types.GoogleSearch()),
            types.Tool(code_execution=types.ToolCodeExecution),
        ]
    )

    try:
        response = client.models.generate_content(
            model=model,
            contents=prompt,
            config=config,
        )
    except Exception as e:
        error_str = str(e).lower()
        if "quota" in error_str:
            print("Error: API quota exceeded. Try again later.")
        elif "invalid" in error_str or "api key" in error_str:
            print("Error: Invalid API key. Check your GEMINI_API_KEY.")
        else:
            print(f"Error: {e}")
        sys.exit(1)

    result = extract_full_results(response)

    # Save charts if requested
    saved_files = []
    if save_charts_dir and result["charts"]:
        saved_files = save_charts(result["charts"], save_charts_dir)

    if output_json:
        output = {
            "prompt": prompt,
            "model": model,
            "timestamp": datetime.now().isoformat(),
            "response": result["text"],
            "tools_used": {
                "search": result["grounded"],
                "code_execution": len(result["code_blocks"]) > 0
            },
            "search_queries_used": result["search_queries"],
            "sources": result["sources"],
            "code_executed": result["code_blocks"],
            "execution_results": result["execution_results"],
            "charts_generated": len(result["charts"]),
            "saved_files": saved_files
        }
        print(json.dumps(output, indent=2))
    else:
        # Human-readable output
        print(result["text"])

        print("\n" + "=" * 60)
        print("Tools Used:")
        print(f"  - Google Search: {'Yes' if result['grounded'] else 'No'}")
        print(f"  - Code Execution: {'Yes' if result['code_blocks'] else 'No'}")

        if result["search_queries"]:
            print("\nSearch Queries:")
            for q in result["search_queries"]:
                print(f"  - {q}")

        if result["sources"]:
            print("\nSources:")
            for i, source in enumerate(result["sources"], 1):
                print(f"  [{i}] {source['title']}")
                print(f"      {source['uri']}")

        if result["code_blocks"]:
            print("\nCode Executed:")
            for i, block in enumerate(result["code_blocks"], 1):
                print(f"\n--- Block {i} ---")
                # Show first 500 chars of code
                code = block["code"]
                if len(code) > 500:
                    print(code[:500] + "\n... (truncated)")
                else:
                    print(code)

        if result["charts"]:
            print(f"\nCharts Generated: {len(result['charts'])}")
            if saved_files:
                print("Saved to:")
                for f in saved_files:
                    print(f"  - {f}")
            else:
                print("(Use --save-charts DIR to save images)")


def main():
    parser = argparse.ArgumentParser(
        description="Multi-tool query combining search and code execution",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    python multi_tool_query.py "Research Tesla's 2024 revenue and create a visualization"
    python multi_tool_query.py "Find Bitcoin's price history and calculate volatility" --save-charts ./output
    python multi_tool_query.py "Compare top 5 programming languages by popularity and visualize" --json
    python multi_tool_query.py "Research S&P 500 performance and project next year" --model gemini-2.5-pro
        """
    )
    parser.add_argument("prompt", help="Research task requiring search and/or analysis")
    parser.add_argument(
        "--model", "-m",
        default="gemini-2.5-flash",
        help="Model to use (default: gemini-2.5-flash)"
    )
    parser.add_argument(
        "--json", "-j",
        action="store_true",
        help="Output as JSON"
    )
    parser.add_argument(
        "--save-charts", "-s",
        metavar="DIR",
        help="Save generated charts to directory"
    )

    args = parser.parse_args()

    multi_tool_query(
        prompt=args.prompt,
        model=args.model,
        output_json=args.json,
        save_charts_dir=args.save_charts
    )


if __name__ == "__main__":
    main()
