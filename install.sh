#!/bin/bash
#
# PM-Kit Installation Script
# Usage: curl -fsSL https://raw.githubusercontent.com/kv0906/cc-pmkt/main/install.sh | bash
#

set -e

# Sunset Color Palette (256-color mode)
ORANGE='\033[38;5;208m'
CORAL='\033[38;5;209m'
PINK='\033[38;5;205m'
MAGENTA='\033[38;5;170m'
PURPLE='\033[38;5;134m'
DEEP_PURPLE='\033[38;5;99m'
NC='\033[0m' # No Color
BOLD='\033[1m'
DIM='\033[2m'

# Status colors
GREEN='\033[38;5;114m'
RED='\033[38;5;196m'
YELLOW='\033[38;5;220m'

# Configuration
REPO_URL="https://github.com/kv0906/cc-pmkt"
PLUGIN_NAME="cc-pmkt"
CLAUDE_PLUGINS_DIR="${HOME}/.claude/plugins"
INSTALL_DIR="${CLAUDE_PLUGINS_DIR}/${PLUGIN_NAME}"

# Spinner characters
SPINNER_CHARS="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"

# Spinner function with sunset colors
spinner() {
    local pid=$1
    local message=$2
    local colors=("$ORANGE" "$CORAL" "$PINK" "$MAGENTA" "$PURPLE")
    local i=0
    local color_idx=0

    while kill -0 $pid 2>/dev/null; do
        local char="${SPINNER_CHARS:$i:1}"
        local color="${colors[$color_idx]}"
        printf "\r${color}${char}${NC} ${DIM}${message}${NC}"
        i=$(( (i + 1) % 10 ))
        color_idx=$(( (color_idx + 1) % 5 ))
        sleep 0.1
    done
    printf "\r"
}

# Print step with sunset checkmark
print_step() {
    local status=$1
    local message=$2

    if [ "$status" = "done" ]; then
        echo -e "${CORAL}✓${NC} ${message}"
    elif [ "$status" = "skip" ]; then
        echo -e "${YELLOW}○${NC} ${DIM}${message}${NC}"
    elif [ "$status" = "fail" ]; then
        echo -e "${RED}✗${NC} ${message}"
    fi
}

# Print sunset gradient logo
print_logo() {
    echo ""
    echo -e "${ORANGE}  ██████╗ ███╗   ███╗    ██╗  ██╗██╗████████╗${NC}"
    echo -e "${CORAL}  ██╔══██╗████╗ ████║    ██║ ██╔╝██║╚══██╔══╝${NC}"
    echo -e "${PINK}  ██████╔╝██╔████╔██║    █████╔╝ ██║   ██║   ${NC}"
    echo -e "${MAGENTA}  ██╔═══╝ ██║╚██╔╝██║    ██╔═██╗ ██║   ██║   ${NC}"
    echo -e "${PURPLE}  ██║     ██║ ╚═╝ ██║    ██║  ██╗██║   ██║   ${NC}"
    echo -e "${DEEP_PURPLE}  ╚═╝     ╚═╝     ╚═╝    ╚═╝  ╚═╝╚═╝   ╚═╝   ${NC}"
    echo ""
    echo -e "${DIM}  Product Management Framework for Claude Code${NC}"
    echo ""
}

# Print sunset divider
print_divider() {
    echo -e "${ORANGE}━${CORAL}━${PINK}━${MAGENTA}━${PURPLE}━${DEEP_PURPLE}━${PURPLE}━${MAGENTA}━${PINK}━${CORAL}━${ORANGE}━${CORAL}━${PINK}━${MAGENTA}━${PURPLE}━${DEEP_PURPLE}━${PURPLE}━${MAGENTA}━${PINK}━${CORAL}━${ORANGE}━${CORAL}━${PINK}━${MAGENTA}━${PURPLE}━${DEEP_PURPLE}━${PURPLE}━${MAGENTA}━${PINK}━${CORAL}━${ORANGE}━${CORAL}━${PINK}━${MAGENTA}━${PURPLE}━${DEEP_PURPLE}━${NC}"
}

# Check for required commands
check_requirements() {
    local has_error=false

    if ! command -v git &> /dev/null; then
        print_step "fail" "git is required but not installed"
        has_error=true
    else
        print_step "done" "git found"
    fi

    if [ "$has_error" = true ]; then
        echo ""
        echo -e "${RED}Please install missing dependencies and try again.${NC}"
        exit 1
    fi
}

# Create plugins directory if it doesn't exist
setup_directories() {
    if [ ! -d "${CLAUDE_PLUGINS_DIR}" ]; then
        mkdir -p "${CLAUDE_PLUGINS_DIR}"
        print_step "done" "Created plugins directory"
    else
        print_step "done" "Plugins directory exists"
    fi

    # Remove existing installation if present
    if [ -d "${INSTALL_DIR}" ]; then
        rm -rf "${INSTALL_DIR}"
        print_step "done" "Removed previous installation"
    fi
}

# Clone the repository with spinner
install_plugin() {
    (git clone --depth 1 "${REPO_URL}.git" "${INSTALL_DIR}" 2>/dev/null) &
    local pid=$!
    spinner $pid "Downloading PM-Kit..."
    wait $pid

    # Remove git directory to save space
    rm -rf "${INSTALL_DIR}/.git"
    print_step "done" "Downloaded PM-Kit"
}

# Validate installation
validate_installation() {
    local required_files=(
        ".claude-plugin/plugin.json"
        "commands/prd.md"
        "agents/prd-writer.md"
    )

    local valid=true
    for file in "${required_files[@]}"; do
        if [ ! -f "${INSTALL_DIR}/${file}" ]; then
            valid=false
            break
        fi
    done

    if [ "$valid" = true ]; then
        print_step "done" "Validated installation"
    else
        print_step "fail" "Installation validation failed"
        exit 1
    fi
}

# Print success message with sunset theme
print_success() {
    local version=$(grep '"version"' "${INSTALL_DIR}/.claude-plugin/plugin.json" | head -1 | sed 's/.*: *"\([^"]*\)".*/\1/')

    echo ""
    print_divider
    echo ""
    echo -e "${BOLD}${CORAL}  Installation Complete!${NC}"
    echo ""
    echo -e "  ${DIM}Version${NC}   ${ORANGE}${version}${NC}"
    echo -e "  ${DIM}Location${NC}  ${PINK}${INSTALL_DIR}${NC}"
    echo ""
    print_divider
    echo ""
    echo -e "${BOLD}${MAGENTA}  Next Steps${NC}"
    echo ""
    echo -e "  ${ORANGE}1.${NC} Restart Claude Code to activate"
    echo -e "  ${CORAL}2.${NC} Type ${PINK}/pm${NC} to see available commands"
    echo ""
    echo -e "${BOLD}${PURPLE}  Quick Commands${NC}"
    echo ""
    echo -e "  ${ORANGE}/prd${NC}        Generate PRDs"
    echo -e "  ${CORAL}/decompose${NC}  Break down problems"
    echo -e "  ${PINK}/research${NC}   Research synthesis"
    echo -e "  ${MAGENTA}/prioritize${NC} RICE/ICE/Kano frameworks"
    echo ""
    print_divider
    echo ""
    echo -e "  ${DIM}Docs: ${PURPLE}https://github.com/kv0906/cc-pmkt${NC}"
    echo ""
}

# Main installation flow
main() {
    clear 2>/dev/null || true
    print_logo
    print_divider
    echo ""

    echo -e "${BOLD}${PINK}  Checking Requirements${NC}"
    echo ""
    check_requirements
    echo ""

    echo -e "${BOLD}${MAGENTA}  Installing${NC}"
    echo ""
    setup_directories
    install_plugin
    validate_installation

    print_success
}

# Run main function
main "$@"
