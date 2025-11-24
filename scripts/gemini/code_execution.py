#!/usr/bin/env python3
"""
Code Execution using Google's Gemini API.

Run Python code in Gemini's sandboxed environment with NumPy, Pandas, and Matplotlib.

Usage:
    python code_execution.py "Calculate the first 50 prime numbers"
    python code_execution.py "Plot a sine wave" --save-charts output/
    python code_execution.py "Analyze this CSV data" --file data.csv

Environment:
    GEMINI_API_KEY: Your Google AI Studio API key

Sandbox Limits:
    - 30 seconds per execution
    - Up to 5 executions per request
    - Libraries: NumPy, Pandas, Matplotlib
    - No network access
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


def extract_code_results(response):
    """Extract code execution results from response."""
    result = {
        "text": "",
        "code_blocks": [],
        "execution_results": [],
        "charts": []  # Base64 encoded images
    }

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
            # Chart/image output from Matplotlib
            data = part.inline_data
            result["charts"].append({
                "mime_type": data.mime_type,
                "data": base64.b64encode(data.data).decode() if isinstance(data.data, bytes) else data.data
            })

    result["text"] = result["text"].strip()
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


def code_execution(prompt, model="gemini-2.5-flash", output_json=False,
                   save_charts_dir=None, input_file=None):
    """Execute code using Gemini's sandbox."""
    client = get_client()

    # Build content with optional file input
    contents = []

    if input_file:
        file_path = Path(input_file)
        if not file_path.exists():
            print(f"Error: File not found: {input_file}")
            sys.exit(1)

        with open(file_path, 'r') as f:
            file_content = f.read()

        contents.append(f"Here is the content of {file_path.name}:\n```\n{file_content}\n```")

    contents.append(prompt)

    config = types.GenerateContentConfig(
        tools=[types.Tool(code_execution=types.ToolCodeExecution)]
    )

    try:
        response = client.models.generate_content(
            model=model,
            contents="\n\n".join(contents),
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

    result = extract_code_results(response)

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
            "code_executed": result["code_blocks"],
            "execution_results": result["execution_results"],
            "charts_generated": len(result["charts"]),
            "saved_files": saved_files
        }
        print(json.dumps(output, indent=2))
    else:
        # Human-readable output
        print(result["text"])

        if result["code_blocks"]:
            print("\n" + "=" * 60)
            print("Code Executed:")
            for i, block in enumerate(result["code_blocks"], 1):
                print(f"\n--- Block {i} ({block['language']}) ---")
                print(block["code"])

        if result["execution_results"]:
            print("\n" + "=" * 60)
            print("Execution Results:")
            for i, exec_result in enumerate(result["execution_results"], 1):
                print(f"\n--- Result {i} ({exec_result['outcome']}) ---")
                if exec_result["output"]:
                    print(exec_result["output"])

        if result["charts"]:
            print("\n" + "=" * 60)
            print(f"Charts Generated: {len(result['charts'])}")
            if saved_files:
                print("Saved to:")
                for f in saved_files:
                    print(f"  - {f}")
            else:
                print("(Use --save-charts DIR to save images)")


def main():
    parser = argparse.ArgumentParser(
        description="Execute code using Gemini's sandbox",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    python code_execution.py "Calculate the first 50 prime numbers"
    python code_execution.py "Plot a sine wave from 0 to 2pi" --save-charts ./output
    python code_execution.py "Analyze this data" --file sales.csv
    python code_execution.py "Create a bar chart of top 5 countries by GDP" --json
        """
    )
    parser.add_argument("prompt", help="Task for code execution")
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
    parser.add_argument(
        "--file", "-f",
        metavar="FILE",
        help="Input file to analyze (CSV, JSON, etc.)"
    )

    args = parser.parse_args()

    code_execution(
        prompt=args.prompt,
        model=args.model,
        output_json=args.json,
        save_charts_dir=args.save_charts,
        input_file=args.file
    )


if __name__ == "__main__":
    main()
