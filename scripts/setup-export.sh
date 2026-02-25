#!/bin/bash
# Install optional export dependencies for PM-Kit
# Run this once to enable --xlsx, --docx, --pdf, --pptx export flags

set -e

echo "PM-Kit Export Dependencies Setup"
echo "================================"
echo ""

# Python packages
echo "Installing Python packages..."
pip3 install openpyxl reportlab pypdf pdfplumber 2>/dev/null && \
  echo "  ✓ openpyxl, reportlab, pypdf, pdfplumber" || \
  echo "  ✗ Python packages failed — check pip3 is available"

# Node packages
echo ""
echo "Installing Node packages..."
npm install -g docx 2>/dev/null && \
  echo "  ✓ docx (Word generation)" || \
  echo "  ✗ docx failed — check npm is available"

npm install -g pptxgenjs 2>/dev/null && \
  echo "  ✓ pptxgenjs (PowerPoint generation)" || \
  echo "  ✗ pptxgenjs failed — check npm is available"

# Verify
echo ""
echo "Verification:"
python3 -c "import openpyxl" 2>/dev/null && echo "  ✓ xlsx export ready" || echo "  ✗ xlsx: missing openpyxl"
node -e "require('docx')" 2>/dev/null && echo "  ✓ docx export ready" || echo "  ✗ docx: missing docx"
python3 -c "from reportlab.lib.pagesizes import letter" 2>/dev/null && echo "  ✓ pdf export ready" || echo "  ✗ pdf: missing reportlab"
node -e "require('pptxgenjs')" 2>/dev/null && echo "  ✓ pptx export ready" || echo "  ✗ pptx: missing pptxgenjs"

echo ""
echo "Done. Use --xlsx, --docx, --pdf, or --pptx with any PM-Kit skill."
