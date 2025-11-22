# 🚀 Quick Deploy Guide

This directory contains everything needed for the ClaudeKit PM Framework repository.

## ⚡ Quick Start (10 minutes)

### Prerequisites
- GitHub CLI installed: `brew install gh` (macOS) or visit https://cli.github.com/
- Authenticated: `gh auth login`

### Deploy Now

```bash
# 1. Navigate here
cd framework-repo-setup

# 2. Initialize git
git init
git add .
git commit -m "Initial commit: ClaudeKit PM Framework v0.1.0

- Add CLAUDE.md routing file
- Add .claude/ framework directory
- Add version.json for version tracking
- Add README.md documentation
- Add .gitignore and LICENSE"

# 3. Create repository on GitHub
# For PRIVATE repository:
gh repo create vanlumberworks/claudekit-pm-framework \
  --private \
  --source=. \
  --description="ClaudeKit PM framework files - workflows, agents, and templates for AI-enhanced product management" \
  --push

# For PUBLIC repository:
gh repo create vanlumberworks/claudekit-pm-framework \
  --public \
  --source=. \
  --description="ClaudeKit PM framework files - workflows, agents, and templates for AI-enhanced product management" \
  --push

# 4. Create release
git tag -a v0.1.0 -m "Release v0.1.0: Initial framework release"
git push origin v0.1.0

gh release create v0.1.0 \
  --title "v0.1.0 - Initial Release" \
  --notes "## ClaudeKit PM Framework v0.1.0

Initial release with:
- 18 comprehensive PM workflows
- 10 specialized agents
- 16 slash commands
- 4 document templates
- 5 technical literacy modules

Compatible with pm-kit-cli v0.1.0+"

# 5. Update CLI constants
cd ..
# Edit lib/constants.js line 10:
# Change: KIT_REPOSITORY: process.env.PMKIT_REPO || 'your-org/claude-kit-pm-files',
# To:     KIT_REPOSITORY: process.env.PMKIT_REPO || 'vanlumberworks/claudekit-pm-framework',

# 6. Test installation
mkdir -p /tmp/test-pm-kit
cd /tmp/test-pm-kit
pm-kit init
pm-kit doctor

# Should show all green checkmarks with:
# Workflows: 18/18 files
# Agents: 10/10 files
# Commands: 16/16 files
# Templates: 4/4 files
# Skills: 5/5 files

# 7. Test with Claude
claude
# Try: /prd, /research, /decide

# 8. Cleanup
cd ..
rm -rf /tmp/test-pm-kit
```

## 📁 What's Included

```
framework-repo-setup/
├── CLAUDE.md                    # Main routing file (11 KB)
├── .claude/                     # Framework directory
│   ├── workflows/               # 18 PM workflow files
│   ├── agents/                  # 10 specialized agents
│   ├── commands/                # 16 slash commands
│   ├── templates/               # 4 document templates
│   └── skills/                  # 5 technical literacy modules
├── version.json                 # Version tracking
├── README.md                    # Repository documentation
├── LICENSE                      # MIT license
├── .gitignore                   # Git exclusions
├── SETUP_INSTRUCTIONS.md        # Detailed deployment guide
└── README_DEPLOY.md            # This file
```

## ✅ Success Checklist

After running the commands above, verify:

- [ ] Repository created: https://github.com/vanlumberworks/claudekit-pm-framework
- [ ] Release exists: https://github.com/vanlumberworks/claudekit-pm-framework/releases/tag/v0.1.0
- [ ] `lib/constants.js` updated with repository path
- [ ] Test installation completed without errors
- [ ] `pm-kit doctor` shows all green checkmarks
- [ ] File counts match: 18/10/16/4/5
- [ ] Claude Code loads slash commands successfully

## 🔧 Troubleshooting

### "Repository already exists"
```bash
# Use existing repository
cd framework-repo-setup
git init
git remote add origin https://github.com/vanlumberworks/claudekit-pm-framework.git
git branch -M main
git add .
git commit -m "Initial commit: ClaudeKit PM Framework v0.1.0"
git push -u origin main
```

### "Authentication failed"
```bash
# Re-authenticate
gh auth logout
gh auth login
# Choose: GitHub.com, HTTPS, Login with web browser
```

### "Permission denied"
For private repositories, ensure your GitHub token has `repo` scope:
```bash
gh auth refresh -s repo
```

## 📚 Documentation

- **Quick Deploy:** This file (you are here)
- **Detailed Guide:** `SETUP_INSTRUCTIONS.md`
- **Repository Docs:** `README.md` (will be shown on GitHub)
- **Production Guide:** `../PRODUCTION_READINESS.md`
- **Implementation Status:** `../IMPLEMENTATION_COMPLETE.md`

## 🎯 After Deployment

Once the repository is created and tested:

1. Update `../lib/constants.js` with the repository path
2. Run end-to-end test to verify
3. Publish to npm: `npm publish`
4. Share with community

## ⏱️ Time Estimate

- Repository creation: 5 minutes
- Testing: 5 minutes
- Documentation review: 5 minutes
- **Total: 15 minutes**

## 🆘 Need Help?

1. Read `SETUP_INSTRUCTIONS.md` for detailed steps
2. Check `../docs/FIX_CRITICAL_BLOCKERS.md` for troubleshooting
3. Verify GitHub CLI is working: `gh --version`
4. Check authentication: `gh auth status`

---

**Ready to deploy?** Run the commands in the "Deploy Now" section above! 🚀
