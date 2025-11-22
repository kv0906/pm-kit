# Framework Repository Setup Instructions

This guide will help you create and publish the ClaudeKit PM framework repository on GitHub.

## Prerequisites

- GitHub account
- Git installed
- GitHub CLI (`gh`) installed (recommended) OR access to GitHub.com

## Quick Setup (Recommended - Using GitHub CLI)

### Step 1: Authenticate with GitHub

```bash
gh auth login
```

Follow the prompts to authenticate.

### Step 2: Create and Push Repository

From the `framework-repo-setup` directory, run:

```bash
# Navigate to the setup directory
cd framework-repo-setup

# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: ClaudeKit PM Framework v0.1.0

- Add CLAUDE.md routing file
- Add .claude/ framework directory with 14 workflows, 8 agents, 10 commands
- Add version.json for version tracking
- Add README.md documentation
- Add .gitignore and LICENSE"

# Create GitHub repository (choose one):

# For PRIVATE repository:
gh repo create vanlumberworks/claudekit-pm-framework \
  --private \
  --source=. \
  --description="ClaudeKit PM framework files - workflows, agents, and templates for AI-enhanced product management" \
  --push

# OR for PUBLIC repository:
gh repo create vanlumberworks/claudekit-pm-framework \
  --public \
  --source=. \
  --description="ClaudeKit PM framework files - workflows, agents, and templates for AI-enhanced product management" \
  --push
```

### Step 3: Create Release

```bash
# Create version tag
git tag -a v0.1.0 -m "Release v0.1.0: Initial framework release

This is the first release of ClaudeKit PM Framework.

Contents:
- CLAUDE.md routing file
- 18 PM workflows
- 10 specialized agents
- 16 slash commands
- 4 templates
- 5 skills

Compatible with pm-kit-cli v0.1.0+"

# Push tag
git push origin v0.1.0

# Create GitHub release
gh release create v0.1.0 \
  --title "v0.1.0 - Initial Release" \
  --notes "## ClaudeKit PM Framework v0.1.0

This is the first official release of the ClaudeKit PM Framework.

### What's Included

- **CLAUDE.md** - Main routing file
- **18 Workflows** - Complete PM processes
- **10 Specialized Agents** - Problem decomposer, PRD writer, etc.
- **16 Slash Commands** - Quick access to workflows
- **4 Templates** - PRD, decision logs, etc.
- **5 Skills** - Technical literacy modules

### Installation

\`\`\`bash
npm install -g pm-kit-cli
cd your-project
pm-kit init
\`\`\`

### Requirements

- pm-kit-cli v0.1.0+
- Node.js 16+
- Claude Code CLI

### Documentation

See the main [ClaudeKit PM repository](https://github.com/vanlumberworks/claude-kit-pm) for complete documentation and guides."
```

## Alternative Setup (Using GitHub Web Interface)

### Step 1: Create Repository on GitHub

1. Go to https://github.com/new
2. Repository name: `claudekit-pm-framework`
3. Description: `ClaudeKit PM framework files - workflows, agents, and templates for AI-enhanced product management`
4. Choose Public or Private
5. **Do NOT** initialize with README, .gitignore, or license (we already have these)
6. Click "Create repository"

### Step 2: Push Local Files

```bash
# Navigate to the setup directory
cd framework-repo-setup

# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: ClaudeKit PM Framework v0.1.0"

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/claudekit-pm-framework.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 3: Create Release on GitHub

1. Go to your repository on GitHub
2. Click "Releases" → "Create a new release"
3. Click "Choose a tag"
4. Type: `v0.1.0` and click "Create new tag: v0.1.0 on publish"
5. Release title: `v0.1.0 - Initial Release`
6. Description: Copy from release notes above
7. Click "Publish release"

## Step 4: Update pm-kit-cli Configuration

After creating the repository, update the pm-kit-cli to point to it:

### Edit `lib/constants.js`

```bash
# Navigate back to pm-kit-cli directory
cd ..

# Open constants.js in your editor
# Update line 10:
```

**Before:**
```javascript
KIT_REPOSITORY: process.env.PMKIT_REPO || 'your-org/claude-kit-pm-files',
```

**After:**
```javascript
KIT_REPOSITORY: process.env.PMKIT_REPO || 'vanlumberworks/claudekit-pm-framework',
```

Or if you used a different username/org:
```javascript
KIT_REPOSITORY: process.env.PMKIT_REPO || 'YOUR_USERNAME/claudekit-pm-framework',
```

## Step 5: Test the Setup

```bash
# Create a test directory
mkdir -p /tmp/test-pm-kit
cd /tmp/test-pm-kit

# Run pm-kit init
pm-kit init

# You should see:
# ✓ Downloading CLAUDE.md
# ✓ Downloading .claude/ directory
# ✓ All files downloaded successfully

# Verify with doctor command
pm-kit doctor

# Expected output:
# File Structure
# ✓ CLAUDE.md: Present
# ✓ .claude/ directory: Present
# ✓ Workflows: 18/18 files
# ✓ Agents: 10/10 files
# ✓ Commands: 16/16 files
# ✓ Templates: 4/4 files
# ✓ Skills: 5/5 files
```

## Troubleshooting

### Error: "Repository not found"

**Solution:** Make sure you've pushed the repository and the name matches exactly in `constants.js`.

For private repositories, ensure your GitHub token has `repo` scope:
```bash
# Check token scopes
gh auth status

# If needed, refresh authentication
gh auth refresh -s repo
```

### Error: "Release not found"

**Solution:** Verify the release was created:
```bash
gh release list --repo YOUR_USERNAME/claudekit-pm-framework
```

Should show:
```
v0.1.0  v0.1.0 - Initial Release  Latest  2024-11-21
```

### Files not downloading

**Solution:** Check the repository structure:
```bash
gh repo view YOUR_USERNAME/claudekit-pm-framework
```

Verify these files/directories exist:
- CLAUDE.md
- .claude/
- version.json

## Success Checklist

- [ ] Repository created on GitHub
- [ ] All files pushed to main branch
- [ ] Release v0.1.0 created with tag
- [ ] lib/constants.js updated with correct repository
- [ ] Test installation completed successfully
- [ ] pm-kit doctor shows all green checkmarks

## Repository URLs

After setup, your repository will be at:
- **Repository:** https://github.com/YOUR_USERNAME/claudekit-pm-framework
- **Release:** https://github.com/YOUR_USERNAME/claudekit-pm-framework/releases/tag/v0.1.0

## Next Steps

Once the framework repository is set up and pm-kit-cli is configured:

1. **Publish pm-kit-cli to npm** (if you haven't already):
   ```bash
   npm publish
   ```

2. **Test end-to-end installation**:
   ```bash
   npm install -g pm-kit-cli
   cd ~/Projects/my-test-project
   pm-kit init
   claude
   /prd
   ```

3. **Update documentation** with actual repository URL

4. **Create walkthrough video/GIF** showing the installation process

5. **Announce to community** and gather feedback

## Support

If you encounter any issues:
1. Check repository permissions (especially for private repos)
2. Verify GitHub token has `repo` scope
3. Confirm all files are present in the repository
4. Test with a fresh directory

---

**Questions?** Create an issue in the main repository or consult the troubleshooting guide.
