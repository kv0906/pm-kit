# GWS Setup & Troubleshooting

## Prerequisites

### gcloud CLI

Required for OAuth authentication with Google Cloud.

```bash
# macOS
brew install --cask google-cloud-sdk

# Verify
gcloud --version
```

### Node.js / npm

```bash
# Check version
node --version  # v18+ recommended
npm --version
```

## Setup Walkthrough

### Step 1: Install gws

```bash
npm install -g @googleworkspace/cli
gws --version
```

### Step 2: Auth Setup

```bash
gws auth setup
```

This interactive command handles:

1. **GCP Project**: Create new or select existing project
2. **API Enablement**: Select which Google Workspace APIs to enable
   - Start with: Gmail, Calendar, Drive, Sheets, Docs
   - Add more later as needed
3. **OAuth Client**: Configure OAuth 2.0 credentials
   - May require manual OAuth client creation in GCP Console
   - Copy Client ID and Client Secret when prompted

### Step 3: Login

```bash
gws auth login
```

Choose access level:
- **Full Access**: For dedicated agent accounts (YOLO mode)
- **Limited Access**: For personal/work accounts (recommended to start)

### Step 4: Verify

```bash
# Test with a simple query
gws gmail users messages list --params '{"userId": "me", "maxResults": 1}'
```

## Common Issues

### "gws: command not found"

```bash
# Check if npm global bin is in PATH
npm config get prefix
# Add to PATH if needed: export PATH="$(npm config get prefix)/bin:$PATH"

# Or use npx
npx @googleworkspace/cli --version
```

### OAuth Consent Screen Issues

If the consent screen shows "unverified app":
1. This is normal for personal/development use
2. Click "Advanced" > "Go to [app name]" to proceed
3. For production, submit app for Google verification

### "Access Not Configured" (403)

API not enabled for the GCP project:

```bash
# Re-run setup to enable additional APIs
gws auth setup
# Select the APIs that need enabling
```

### Token Expired (401)

```bash
# Re-authenticate
gws auth login
```

### Rate Limiting (429)

Google Workspace APIs have per-user and per-project quotas:
- Gmail: 250 quota units/second/user
- Drive: 12,000 requests/minute
- Calendar: 500 requests/100 seconds/user

Wait and retry, or implement exponential backoff in scripts.

### Multiple Accounts

```bash
# Add another account
gws auth login
# Select different account or add new one

# List configured accounts
gws auth list

# Switch active account
gws auth switch
```

### MCP Server Won't Start

```bash
# Verify gws is accessible
which gws

# Test MCP server manually
gws mcp -s gmail

# Check service names are valid
gws mcp -s drive,gmail,calendar  # comma-separated, no spaces
```

### Proxy / Corporate Network

If behind a proxy:

```bash
# Set proxy environment variables
export HTTPS_PROXY=http://proxy.company.com:8080
export HTTP_PROXY=http://proxy.company.com:8080
```

## Security Best Practices

1. **Principle of least privilege**: Start with Limited Access, expand as needed
2. **Dedicated agent account**: Use a separate Google account for automated agents
3. **Review OAuth scopes**: Only enable APIs actually needed
4. **Model Armor**: Enable sanitization for content from untrusted sources
5. **Audit logs**: Monitor agent activity through Google Workspace admin console
6. **Token storage**: gws stores tokens locally - protect the machine accordingly
