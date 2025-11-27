#!/usr/bin/env python3
"""
URL Context Analysis using Google's Gemini API.

Fetch and analyze specific URLs for documentation lookup, article analysis, etc.

Usage:
    python url_context.py "https://example.com/docs" "Summarize the API authentication"
    python url_context.py "https://blog.example.com/post" "Extract key points" --json

Environment:
    GEMINI_API_KEY: Your Google AI Studio API key

Best For:
    - Documentation analysis
    - Article summarization
    - Extracting specific information from URLs
    - Comparing multiple pages
"""

import argparse
import json
import os
import sys
from datetime import datetime

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


def analyze_url(url, prompt, model="gemini-2.5-flash", output_json=False):
    """Analyze a URL with a specific prompt."""
    client = get_client()

    # Combine URL and prompt
    full_prompt = f"""Analyze the following URL and respond to the request.

URL: {url}

Request: {prompt}

Please fetch and analyze the content at the URL, then provide a comprehensive response."""

    try:
        response = client.models.generate_content(
            model=model,
            contents=full_prompt,
        )
    except Exception as e:
        error_str = str(e).lower()
        if "quota" in error_str:
            print("Error: API quota exceeded. Try again later.")
        elif "invalid" in error_str or "api key" in error_str:
            print("Error: Invalid API key. Check your GEMINI_API_KEY.")
        elif "url" in error_str or "fetch" in error_str:
            print(f"Error: Could not fetch URL. The URL may be inaccessible.")
        else:
            print(f"Error: {e}")
        sys.exit(1)

    if output_json:
        output = {
            "url": url,
            "prompt": prompt,
            "model": model,
            "timestamp": datetime.now().isoformat(),
            "response": response.text
        }
        print(json.dumps(output, indent=2))
    else:
        print(response.text)
        print("\n" + "=" * 60)
        print(f"Source: {url}")


def analyze_multiple_urls(urls, prompt, model="gemini-2.5-flash", output_json=False):
    """Analyze multiple URLs with a single prompt."""
    client = get_client()

    # Build prompt with all URLs
    url_list = "\n".join([f"- {url}" for url in urls])
    full_prompt = f"""Analyze the following URLs and respond to the request.

URLs:
{url_list}

Request: {prompt}

Please fetch and analyze the content at each URL, then provide a comprehensive response that synthesizes information from all sources."""

    try:
        response = client.models.generate_content(
            model=model,
            contents=full_prompt,
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

    if output_json:
        output = {
            "urls": urls,
            "prompt": prompt,
            "model": model,
            "timestamp": datetime.now().isoformat(),
            "response": response.text
        }
        print(json.dumps(output, indent=2))
    else:
        print(response.text)
        print("\n" + "=" * 60)
        print("Sources:")
        for url in urls:
            print(f"  - {url}")


def main():
    parser = argparse.ArgumentParser(
        description="Analyze URLs using Gemini API",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    # Single URL analysis
    python url_context.py "https://docs.example.com/api" "Summarize the authentication methods"

    # Multiple URLs
    python url_context.py "https://site1.com" "https://site2.com" "Compare these two approaches"

    # JSON output
    python url_context.py "https://blog.example.com" "Extract key takeaways" --json
        """
    )
    parser.add_argument(
        "args",
        nargs="+",
        help="URL(s) followed by prompt. Last argument is the prompt."
    )
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

    args = parser.parse_args()

    # Parse arguments: all but last are URLs, last is prompt
    if len(args.args) < 2:
        print("Error: Need at least one URL and a prompt")
        print("Usage: python url_context.py URL [URL2 ...] PROMPT")
        sys.exit(1)

    urls = args.args[:-1]
    prompt = args.args[-1]

    # Validate URLs
    for url in urls:
        if not url.startswith(('http://', 'https://')):
            print(f"Warning: '{url}' doesn't look like a URL. Treating as URL anyway.")

    if len(urls) == 1:
        analyze_url(
            url=urls[0],
            prompt=prompt,
            model=args.model,
            output_json=args.json
        )
    else:
        analyze_multiple_urls(
            urls=urls,
            prompt=prompt,
            model=args.model,
            output_json=args.json
        )


if __name__ == "__main__":
    main()
