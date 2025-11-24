#!/usr/bin/env python3
"""
Grounded Web Search using Google's Gemini API.

Performs real-time web search with citations and source attribution.

Usage:
    python grounded_search.py "Your search query here"
    python grounded_search.py "What are the latest AI trends in 2025?" --json
    python grounded_search.py "Compare React vs Vue" --model gemini-2.5-pro

Environment:
    GEMINI_API_KEY: Your Google AI Studio API key
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


def extract_citations(response):
    """Extract sources and citations from grounded response."""
    result = {
        "text": response.text,
        "search_queries": [],
        "sources": [],
        "grounded": False
    }

    candidate = response.candidates[0]
    if not hasattr(candidate, 'grounding_metadata') or not candidate.grounding_metadata:
        return result

    metadata = candidate.grounding_metadata
    result["grounded"] = True

    # Extract search queries used
    if hasattr(metadata, 'web_search_queries') and metadata.web_search_queries:
        result["search_queries"] = list(metadata.web_search_queries)

    # Extract source chunks
    if hasattr(metadata, 'grounding_chunks') and metadata.grounding_chunks:
        for chunk in metadata.grounding_chunks:
            if hasattr(chunk, 'web') and chunk.web:
                result["sources"].append({
                    "title": getattr(chunk.web, 'title', 'Unknown'),
                    "uri": getattr(chunk.web, 'uri', '')
                })

    return result


def format_with_citations(response):
    """Format response text with inline citation links."""
    text = response.text
    candidate = response.candidates[0]

    if not hasattr(candidate, 'grounding_metadata') or not candidate.grounding_metadata:
        return text

    metadata = candidate.grounding_metadata

    if not hasattr(metadata, 'grounding_supports') or not metadata.grounding_supports:
        return text

    supports = metadata.grounding_supports
    chunks = metadata.grounding_chunks if hasattr(metadata, 'grounding_chunks') else []

    # Sort by end index (reverse) to insert citations without breaking indices
    sorted_supports = sorted(
        supports,
        key=lambda s: s.segment.end_index if hasattr(s, 'segment') else 0,
        reverse=True
    )

    for support in sorted_supports:
        if not hasattr(support, 'segment'):
            continue
        end_index = support.segment.end_index
        if hasattr(support, 'grounding_chunk_indices') and support.grounding_chunk_indices:
            citations = []
            for i in support.grounding_chunk_indices:
                if i < len(chunks) and hasattr(chunks[i], 'web'):
                    uri = chunks[i].web.uri
                    citations.append(f"[{i + 1}]")

            if citations:
                citation_str = " " + ",".join(citations)
                text = text[:end_index] + citation_str + text[end_index:]

    return text


def grounded_search(query, model="gemini-2.5-flash", output_json=False, show_citations=True):
    """Perform grounded web search."""
    client = get_client()

    config = types.GenerateContentConfig(
        tools=[types.Tool(google_search=types.GoogleSearch())]
    )

    try:
        response = client.models.generate_content(
            model=model,
            contents=query,
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

    result = extract_citations(response)

    if output_json:
        output = {
            "query": query,
            "model": model,
            "timestamp": datetime.now().isoformat(),
            "response": result["text"],
            "grounded": result["grounded"],
            "search_queries_used": result["search_queries"],
            "sources": result["sources"]
        }
        print(json.dumps(output, indent=2))
    else:
        # Human-readable output
        if show_citations:
            formatted_text = format_with_citations(response)
        else:
            formatted_text = result["text"]

        print(formatted_text)

        if result["grounded"]:
            print("\n" + "=" * 60)

            if result["search_queries"]:
                print("\nSearch queries used:")
                for q in result["search_queries"]:
                    print(f"  - {q}")

            if result["sources"]:
                print("\nSources:")
                for i, source in enumerate(result["sources"], 1):
                    print(f"  [{i}] {source['title']}")
                    print(f"      {source['uri']}")
        else:
            print("\n(Response was not grounded with web search)")


def main():
    parser = argparse.ArgumentParser(
        description="Grounded web search using Gemini API",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    python grounded_search.py "What are the latest AI trends?"
    python grounded_search.py "Compare AWS vs Azure pricing" --json
    python grounded_search.py "Tesla stock news" --model gemini-2.5-pro
        """
    )
    parser.add_argument("query", help="Search query")
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
        "--no-citations",
        action="store_true",
        help="Don't show inline citations"
    )

    args = parser.parse_args()

    grounded_search(
        query=args.query,
        model=args.model,
        output_json=args.json,
        show_citations=not args.no_citations
    )


if __name__ == "__main__":
    main()
