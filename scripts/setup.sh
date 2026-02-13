#!/bin/bash

# MindLoom Setup Script
# Sets up your AI-augmented knowledge vault for PM + Engineering workflows

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Banner
echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════╗"
echo "║   MindLoom Setup Wizard                          ║"
echo "║   AI-Augmented Knowledge Vault v3.0              ║"
echo "╚═══════════════════════════════════════════════════╝"
echo -e "${NC}"

print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_info() { echo -e "${BLUE}ℹ${NC} $1"; }

command_exists() { command -v "$1" >/dev/null 2>&1; }

# Step 1: Prerequisites
echo -e "\n${BLUE}Step 1: Checking Prerequisites${NC}"
echo "================================"

if command_exists git; then
    print_success "Git is installed ($(git --version))"
else
    print_error "Git is not installed"
    echo "Please install Git from: https://git-scm.com/"
    exit 1
fi

if command_exists claude; then
    print_success "Claude Code is installed"
else
    print_warning "Claude Code CLI not found"
    echo "Install from: https://claude.ai/code"
    read -p "Continue without Claude Code? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then exit 1; fi
fi

# Step 2: Vault Location
echo -e "\n${BLUE}Step 2: Choose Vault Location${NC}"
echo "================================"

DEFAULT_VAULT="$HOME/Documents/MindLoom"
read -p "Where should we create your vault? [$DEFAULT_VAULT]: " VAULT_PATH
VAULT_PATH=${VAULT_PATH:-$DEFAULT_VAULT}
VAULT_PATH="${VAULT_PATH/#\~/$HOME}"

if [[ "$VAULT_PATH" != /* ]]; then
    VAULT_PATH="$(pwd)/$VAULT_PATH"
fi

# Get script and source directories
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE_DIR="$SCRIPT_DIR/.."

if [ -d "$VAULT_PATH" ]; then
    print_warning "Directory already exists: $VAULT_PATH"
    read -p "Use existing directory? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then exit 1; fi
else
    mkdir -p "$VAULT_PATH"
    print_success "Created vault directory: $VAULT_PATH"
fi

# Step 3: Copy Vault Structure
echo -e "\n${BLUE}Step 3: Setting Up Vault Structure${NC}"
echo "====================================="

print_info "Copying vault files..."

# Copy core structure
for item in CLAUDE.md CLAUDE.local.md.template _core _templates .claude .claude-plugin; do
    if [ -e "$SOURCE_DIR/$item" ]; then
        cp -r "$SOURCE_DIR/$item" "$VAULT_PATH/"
    fi
done

# Create vault directories
for dir in inbox index daily docs decisions blockers meetings adrs roadmap research reports _archive; do
    mkdir -p "$VAULT_PATH/$dir"
done

# Copy roadmap files
if [ -d "$SOURCE_DIR/roadmap" ]; then
    cp -r "$SOURCE_DIR/roadmap/"* "$VAULT_PATH/roadmap/" 2>/dev/null || true
fi

# Make hooks executable
chmod +x "$VAULT_PATH/.claude/hooks/"*.sh 2>/dev/null || true

print_success "Vault structure created"

# Step 4: Configure Projects
echo -e "\n${BLUE}Step 4: Configure Your Projects${NC}"
echo "=================================="

echo "Let's set up your first project."
read -p "Project ID (lowercase, e.g., 'xmarket'): " PROJECT_ID
read -p "Project name (display name, e.g., 'xMarket'): " PROJECT_NAME
read -p "Brief description: " PROJECT_DESC

if [ -n "$PROJECT_ID" ] && [ -n "$PROJECT_NAME" ]; then
    # Update config.yaml
    CONFIG="$VAULT_PATH/_core/config.yaml"
    if [ -f "$CONFIG" ]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s/id: project-a/id: $PROJECT_ID/" "$CONFIG"
            sed -i '' "s/name: Project A/name: $PROJECT_NAME/" "$CONFIG"
            sed -i '' "s/description: Your first project/description: $PROJECT_DESC/" "$CONFIG"
        else
            sed -i "s/id: project-a/id: $PROJECT_ID/" "$CONFIG"
            sed -i "s/name: Project A/name: $PROJECT_NAME/" "$CONFIG"
            sed -i "s/description: Your first project/description: $PROJECT_DESC/" "$CONFIG"
        fi
    fi

    # Create project directories
    mkdir -p "$VAULT_PATH/docs/$PROJECT_ID"
    mkdir -p "$VAULT_PATH/decisions/$PROJECT_ID"
    mkdir -p "$VAULT_PATH/blockers/$PROJECT_ID"

    # Create project index
    cat > "$VAULT_PATH/index/$PROJECT_ID.md" << EOF
---
type: index
project: $PROJECT_ID
status: active
---

# $PROJECT_NAME

> $PROJECT_DESC

---

## Open Blockers

*No open blockers*

---

## Active Docs

*No active docs*

---

## Recent Dailies (7 days)

*No dailies yet*

---

## Recent Decisions (30 days)

*No decisions yet*

---

## Manual Notes

%% Add your own notes below — this section is preserved during updates %%
EOF

    print_success "Project '$PROJECT_NAME' configured"
fi

# Add second project?
read -p "Add another project? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Project ID: " PROJECT_ID2
    read -p "Project name: " PROJECT_NAME2
    read -p "Brief description: " PROJECT_DESC2

    if [ -n "$PROJECT_ID2" ]; then
        CONFIG="$VAULT_PATH/_core/config.yaml"
        if [ -f "$CONFIG" ]; then
            if [[ "$OSTYPE" == "darwin"* ]]; then
                sed -i '' "s/id: project-b/id: $PROJECT_ID2/" "$CONFIG"
                sed -i '' "s/name: Project B/name: $PROJECT_NAME2/" "$CONFIG"
                sed -i '' "s/description: Your second project/description: $PROJECT_DESC2/" "$CONFIG"
            else
                sed -i "s/id: project-b/id: $PROJECT_ID2/" "$CONFIG"
                sed -i "s/name: Project B/name: $PROJECT_NAME2/" "$CONFIG"
                sed -i "s/description: Your second project/description: $PROJECT_DESC2/" "$CONFIG"
            fi
        fi

        mkdir -p "$VAULT_PATH/docs/$PROJECT_ID2"
        mkdir -p "$VAULT_PATH/decisions/$PROJECT_ID2"
        mkdir -p "$VAULT_PATH/blockers/$PROJECT_ID2"

        cat > "$VAULT_PATH/index/$PROJECT_ID2.md" << EOF
---
type: index
project: $PROJECT_ID2
status: active
---

# $PROJECT_NAME2

> $PROJECT_DESC2

---

## Open Blockers

*No open blockers*

---

## Active Docs

*No active docs*

---

## Recent Dailies (7 days)

*No dailies yet*

---

## Recent Decisions (30 days)

*No decisions yet*

---

## Manual Notes

%% Add your own notes below %%
EOF

        print_success "Project '$PROJECT_NAME2' configured"
    fi
fi

# Step 5: Git Setup
echo -e "\n${BLUE}Step 5: Git Repository Setup${NC}"
echo "==============================="

cd "$VAULT_PATH"

# Create .gitignore
cat > "$VAULT_PATH/.gitignore" << 'EOF'
.obsidian/workspace*
.obsidian/cache
.trash/
.DS_Store
CLAUDE.local.md
.setup_complete
*.swp
*~
EOF

if [ ! -d .git ]; then
    git init
    print_success "Git repository initialized"
else
    print_warning "Git repository already exists"
fi

git add .
git commit -m "Initial MindLoom setup" 2>/dev/null || print_warning "Nothing to commit"

# Step 6: GitHub (Optional)
echo -e "\n${BLUE}Step 6: GitHub Integration (Optional)${NC}"
echo "========================================="

read -p "Set up GitHub remote? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "GitHub repository URL: " GITHUB_URL
    if [ -n "$GITHUB_URL" ]; then
        git remote add origin "$GITHUB_URL" 2>/dev/null || git remote set-url origin "$GITHUB_URL"
        print_success "GitHub remote configured"

        read -p "Push now? (y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            CURRENT_BRANCH=$(git branch --show-current)
            git push -u origin "$CURRENT_BRANCH" 2>&1 && print_success "Pushed to GitHub" || print_warning "Push failed — push manually later"
        fi
    fi
fi

# Done
echo -e "\n${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✨ MindLoom Setup Complete!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

echo "Your vault is ready at: $VAULT_PATH"
echo ""
echo "Quick start:"
echo "  cd \"$VAULT_PATH\""
echo "  claude"
echo "  /onboard                    # Load vault context"
echo "  /daily $PROJECT_ID: shipped X, wip Y     # Log standup"
echo "  /progress $PROJECT_ID       # View status"
echo "  /push                       # Save changes"
echo ""
echo "All skills: /daily /progress /block /decide /doc /meet"
echo "            /inbox /ask /health /adr /weekly /push /onboard"
echo ""
print_info "Read docs/SETUP_GUIDE.md for detailed guidance"
