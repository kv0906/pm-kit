# Debug Without Code - PM's Investigation Guide

A systematic approach for non-technical Product Managers to investigate bugs, identify root causes, and communicate effectively with engineers without reading code.

## Why PMs Should Debug

**Traditional Mindset**: "I'm not technical, I'll just report bugs to engineers"

**PM Debugging Mindset**: "I can investigate systematically and provide engineers with everything they need to fix this fast"

**Benefits**:
- **Faster fixes**: Engineers get actionable information, not just "it's broken"
- **Better prioritization**: Understand severity and user impact
- **Credibility**: Engineers respect PMs who do thorough investigation
- **Learning**: Build technical intuition over time

## The PM Debug Framework

```
┌──────────────────────────────────────────────┐
│  1. REPRODUCE   | Can you make it happen?    │
│  2. ISOLATE     | What's the minimum case?   │
│  3. DOCUMENT    | Capture all evidence       │
│  4. ANALYZE     | What changed recently?     │
│  5. HYPOTHESIZE | What might cause this?     │
│  6. COMMUNICATE | Write clear bug report     │
└──────────────────────────────────────────────┘
```

## Step 1: Reproduce the Bug

### The 5 Ws Framework

1. **What** happened?
   - Expected behavior: "User should see confirmation"
   - Actual behavior: "User sees blank screen"
   - Error messages: Screenshot or copy exact text

2. **When** does it happen?
   - Every time? Sometimes? Randomly?
   - Time of day? Day of week?
   - After specific actions?

3. **Where** does it happen?
   - Which page/screen/feature?
   - Which environment? (production, staging, dev)
   - URL or deep link

4. **Who** experiences it?
   - All users? Specific segment?
   - Free vs. paid users?
   - New vs. existing users?
   - Browser/device/OS specific?

5. **Why** might it matter?
   - How many users affected?
   - Business impact (revenue, conversions, churn)
   - Workaround available?

### Reproduction Checklist

```
□ Can reproduce on my machine/account
□ Tested in different browser (Chrome, Safari, Firefox)
□ Tested in incognito/private mode (no extensions)
□ Tested with different user account
□ Tested on different device (desktop, mobile, tablet)
□ Tested on different OS (Mac, Windows, iOS, Android)
□ Tested in different network (WiFi, cellular, VPN)
□ Documented exact steps (1, 2, 3...)
□ Captured screenshots/video of issue
□ Noted any error messages or unusual behavior
```

### Example: Payment Failure Bug

**Initial Report** (Vague):
> "Users can't check out"

**After Investigation** (Specific):
```
REPRODUCTION STEPS:
1. Add item to cart (any item)
2. Click "Checkout"
3. Enter shipping address (US only)
4. Select credit card payment
5. Click "Place Order"

EXPECTED: Order confirmation page
ACTUAL: Blank white screen after 5-second delay

FREQUENCY: 100% reproducible
AFFECTED: Only US users with credit cards
NOT AFFECTED: PayPal payments work fine
ENVIRONMENT: Production only (staging works)
STARTED: January 15, 2024 around 2pm PST

ERROR (in browser console):
"POST /api/payments/charge failed with 500 error"
```

## Step 2: Isolate the Problem

### Binary Search Method

Narrow down the issue by eliminating variables:

```
Full scenario: Login → Add to cart → Apply coupon → Checkout → Payment → Error

Test 1: Login → Add to cart → Checkout (no coupon) → Payment
Result: Still fails ✗

Test 2: Login → Add to cart → Checkout → PayPal
Result: Works ✓

Conclusion: Issue is specific to credit card payment, not related to coupons
```

### The Minimum Reproducible Case

Start complex, remove steps until it stops failing:

```
Complex case:
1. Login as premium user
2. Browse catalog (20 items)
3. Add 5 items to cart
4. Apply 20% discount code
5. Change quantity of item 3
6. Remove item 2
7. Proceed to checkout
8. Enter new shipping address
9. Select express shipping
10. Enter credit card
11. Click "Place Order"
Result: Error ✗

Simplified case:
1. Login (any user)
2. Add 1 item to cart
3. Checkout
4. Use saved address
5. Enter credit card
6. Click "Place Order"
Result: Error ✗

Minimum case:
1. Login
2. Add item
3. Enter card
4. Submit
Result: Error ✗

This is the minimum reproducible case!
```

### Variable Isolation Matrix

| Variable | Test 1 | Test 2 | Result |
|----------|--------|--------|--------|
| User type | Free | Premium | Both fail |
| Browser | Chrome | Safari | Both fail |
| Device | Desktop | Mobile | Both fail |
| Payment method | Card | PayPal | Only card fails |
| Cart value | $10 | $100 | Both fail |

**Conclusion**: Issue is isolated to credit card payments only.

## Step 3: Document Everything

### Essential Evidence

1. **Screenshots**
   - The error state
   - The expected state (if you have it)
   - Any error messages
   - Relevant UI elements

2. **Screen Recording**
   - Record reproduction steps
   - Show mouse clicks and keyboard input
   - Capture timing (delays, loading states)
   - Tools: Loom, CloudApp, QuickTime

3. **Browser Console Errors**
   - Open DevTools (F12 or Cmd+Opt+I)
   - Go to Console tab
   - Screenshot any red error messages
   - Copy full error text (click to expand)

4. **Network Activity**
   - Open DevTools → Network tab
   - Reproduce the issue
   - Find failed requests (red color)
   - Right-click → Copy as cURL (for engineers)
   - Note: Status code, response time

5. **System Information**
   - Browser: Chrome 120.0.6099.109
   - OS: macOS 14.1.2
   - Screen resolution: 1920×1080
   - Device: MacBook Pro M2
   - Timestamp: 2024-01-20 14:30 PST
   - User ID: usr_abc123xyz
   - Session ID: sess_789def456

### Browser Console Guide for PMs

**How to Open**:
- Mac: Cmd + Opt + I
- Windows: F12 or Ctrl + Shift + I

**What to Look For**:

```
Console Tab:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ Normal logs (gray/black) - Ignore these
⚠ Warnings (yellow) - Note these, might be related
✗ Errors (red) - CAPTURE THESE! Click to expand

Example error to screenshot:
  POST https://api.example.com/payments/charge 500
  {
    "error": "Payment gateway timeout",
    "code": "GATEWAY_TIMEOUT",
    "requestId": "req_abc123"
  }
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Network Tab**:
```
Filter by "XHR" to see API calls
Look for red status codes (400, 500)
Click request to see:
  - Headers (includes authorization info)
  - Payload (data sent)
  - Response (error message from server)
```

## Step 4: Analyze Context

### What Changed Recently?

**Questions to Ask**:
- [ ] Was there a recent deployment? (Check #engineering Slack)
- [ ] Was there a recent feature release?
- [ ] Did we change any third-party integrations?
- [ ] Did we update any dependencies/libraries?
- [ ] Did we migrate databases or infrastructure?
- [ ] Was there planned maintenance?

**Where to Look**:
- Git commit history (if you have access)
- Release notes / changelog
- Deployment logs
- Feature flag changes
- Monitoring dashboards (Datadog, New Relic, etc.)

### Timeline Analysis

```
TIMELINE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Jan 14, 2024 - 11:00 AM
  ✓ Payment system working normally

Jan 15, 2024 - 1:45 PM
  ⚙️ Deployed payment service v2.3.0
  - Added support for Apple Pay
  - Updated Stripe SDK from 10.x to 11.x

Jan 15, 2024 - 2:10 PM
  ✗ First payment failure reported

Jan 15, 2024 - 2:15 PM
  ✗ 5 more failures (all credit cards)

Jan 15, 2024 - 2:30 PM
  ⚠️ Monitoring shows 500 errors on /charge endpoint
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

CORRELATION:
  Payment failures started 25 minutes after deployment.
  Likely related to v2.3.0 release.
```

### Pattern Recognition

**Look for patterns in**:
- User attributes (location, plan, tenure)
- Request attributes (timing, size, content)
- System state (load, time of day, concurrent users)

**Example Pattern Discovery**:
```
AFFECTED USERS:
- All located in USA ✓
- Credit card payments ✓
- Cart value >$50 ✓

NOT AFFECTED:
- International users ✗
- PayPal payments ✗
- Cart value <$50 ✗

PATTERN IDENTIFIED:
Only USA users with credit cards on orders >$50 are affected.
```

## Step 5: Form Hypotheses

### Root Cause Hypothesis Framework

**Formula**: [Component] has [Problem] because [Reason], causing [Symptom]

**Examples**:

```
Hypothesis 1:
Payment service has timeout issue because Stripe API v11
requires different authentication format, causing 500 errors
on credit card charges.

Likelihood: High (matches deployment timing)
Evidence: Error message mentions "gateway timeout"
How to test: Rollback to Stripe SDK v10

Hypothesis 2:
Payment validation has bug because new $50 minimum was added
for fraud prevention, causing charges to fail silently.

Likelihood: Medium
Evidence: All failures are >$50
How to test: Test with cart value = $49

Hypothesis 3:
Database has connection issue because connection pool was
reduced during deployment, causing timeout under load.

Likelihood: Low (would affect all payments, not just cards)
Evidence: Only credit cards affected, not PayPal
How to test: Check database connection metrics
```

### The 5 Whys Technique

Keep asking "why?" to drill down to root cause:

```
Problem: Users can't complete credit card checkout

Why? → POST /charge API returns 500 error

Why? → Payment gateway times out after 30 seconds

Why? → New Stripe SDK waits for 3D Secure confirmation

Why? → 3D Secure redirect URL is incorrect

Why? → URL uses staging domain instead of production

ROOT CAUSE: Configuration error - wrong redirect URL
```

## Step 6: Communicate Findings

### The Perfect Bug Report

```
TITLE: Credit card payments failing with 500 error (USA only)

SEVERITY: P0 - Critical
  - Blocking all USA credit card revenue
  - ~50 failed transactions per hour
  - Estimated $5,000/hour revenue impact
  - Workaround: Users can use PayPal

REPRODUCTION:
1. Login to production as USA user
2. Add item to cart (>$50)
3. Proceed to checkout
4. Enter credit card: 4242 4242 4242 4242
5. Click "Place Order"
6. Expected: Confirmation page
7. Actual: Blank screen after 5-second delay

FREQUENCY: 100% reproducible
AFFECTED: USA users, credit cards only, cart >$50
STARTED: Jan 15, 2024 2:10 PM PST

EVIDENCE:
- Video: https://www.loom.com/share/abc123
- Browser console error: [screenshot attached]
- Network request failed: POST /api/payments/charge → 500
- Error message: "Payment gateway timeout" (request ID: req_xyz789)

ENVIRONMENT:
- Production only (staging works fine)
- Browser: Chrome 120.0.6099.109
- OS: macOS 14.1.2
- Test account: test-user-usa@example.com (user_123abc)

RECENT CHANGES:
- Deployed payment service v2.3.0 on Jan 15 at 1:45 PM
- Updated Stripe SDK 10.x → 11.x
- Added Apple Pay support

HYPOTHESIS:
Payment service times out because Stripe SDK v11 requires
different authentication for 3D Secure, and redirect URL
is using staging domain instead of production.

SUGGESTED FIX:
1. Check Stripe SDK configuration for redirect URLs
2. If not fixable quickly, rollback to v2.2.1
3. Add monitoring for payment gateway timeouts

IMPACT IF NOT FIXED:
- $5K/hour lost revenue
- Poor user experience (users abandoning checkout)
- Potential chargeback issues if some payments partially process

WORKAROUND FOR USERS:
"Use PayPal at checkout - we're aware of credit card issues"
```

### Severity Guidelines

**P0 - Critical** (Drop everything)
- Core functionality completely broken
- Significant revenue impact
- Security vulnerability
- Affects >50% of users

**P1 - High** (Fix today)
- Important feature broken
- Moderate revenue impact
- Affects 10-50% of users
- No workaround available

**P2 - Medium** (Fix this week)
- Minor feature broken
- Small revenue impact
- Affects <10% of users
- Workaround available

**P3 - Low** (Schedule for sprint)
- Edge case
- Minimal impact
- Easy workaround

## Real-World Debug Scenarios

### Scenario 1: "Search Stopped Working"

**Initial Report**: "Search doesn't work"

**PM Investigation**:

```
STEP 1 - REPRODUCE:
✓ Confirmed: Search returns 0 results for all queries

STEP 2 - ISOLATE:
Test different queries:
- "user" → 0 results (should return thousands)
- "product" → 0 results
- Single letter "a" → 0 results

Test different accounts:
- Free user → Same issue
- Premium user → Same issue
- Admin account → Same issue

Conclusion: Search is completely broken for everyone.

STEP 3 - DOCUMENT:
Browser console: "GET /api/search?q=user 500 Internal Server Error"
Error response: {"error": "Elasticsearch cluster unreachable"}

STEP 4 - ANALYZE CONTEXT:
Checked Slack #engineering:
"Elasticsearch maintenance scheduled for today 2-3 PM"
Current time: 2:45 PM - within maintenance window!

STEP 5 - HYPOTHESIS:
Elasticsearch is offline for maintenance.

STEP 6 - COMMUNICATE:
Not a bug! Planned maintenance running late.
Updated #general: "Search temporarily unavailable during
maintenance. ETA: 3:15 PM per engineering team."
```

### Scenario 2: "Dashboard Loads Slowly"

**Initial Report**: "Dashboard is slow"

**PM Investigation**:

```
STEP 1 - REPRODUCE:
✓ Confirmed: Dashboard takes 8 seconds to load (should be <2s)

STEP 2 - ISOLATE:
What's slow?
- Initial page load: 1 second (normal)
- API call /dashboard/metrics: 7 seconds (SLOW!)
- Other pages: Normal speed

Which users?
- Users with >1000 items: Slow
- Users with <100 items: Fast

Conclusion: Issue related to data volume.

STEP 3 - DOCUMENT:
Network tab:
  GET /api/dashboard/metrics
  Status: 200 OK
  Time: 7.2 seconds
  Response size: 2.4 MB (!)

STEP 4 - ANALYZE:
Recent changes:
- Yesterday: Added "all-time stats" to dashboard
- Previously: Only showed "last 30 days"

Hypothesis: Query now fetches all historical data (unbounded).

STEP 5 - COMMUNICATE:
BUG REPORT:
Title: Dashboard slow for users with large datasets
Severity: P1
Reproduction: Login as user with >1000 items
Root cause: /metrics endpoint fetches all-time data (not paginated)
Suggested fix: Add date range filter (default: last 30 days)
Impact: ~20% of users experiencing slow dashboards
```

### Scenario 3: "Mobile App Crashes"

**Initial Report**: "App crashes when uploading photo"

**PM Investigation**:

```
STEP 1 - REPRODUCE:
✓ Confirmed: App crashes when uploading large photos

STEP 2 - ISOLATE:
Test different photos:
- Small photo (1 MB) → Works ✓
- Medium photo (5 MB) → Works ✓
- Large photo (15 MB) → Crashes ✗
- Large photo (10 MB) → Crashes ✗

Test different actions:
- Upload from camera → Crashes
- Upload from library → Crashes
- Upload after editing → Crashes

Conclusion: Issue with photos >8MB.

STEP 3 - DOCUMENT:
iOS crash log (from TestFlight):
  Exception: "Memory warning level 2"
  Terminated: YES

Photos tested:
- 15 MB: iPhone 14 Pro (48MP) → Crash
- 10 MB: iPhone 13 (12MP) → Crash
- 5 MB: iPhone 11 → Works

STEP 4 - ANALYZE:
Recent changes:
- Added "HD upload" feature last release
- Previously: Auto-compressed to max 5MB

STEP 5 - HYPOTHESIS:
App tries to load full-resolution photo into memory,
causing memory overflow on device.

STEP 6 - COMMUNICATE:
BUG REPORT:
Title: App crashes on large photo upload (>8MB)
Severity: P1
Reproduction: Upload 15MB photo on iPhone 14 Pro
Root cause: HD upload feature doesn't compress before loading
Suggested fix: Stream upload or compress to 8MB max
Impact: iPhone 13/14 users with 48MP cameras affected
Workaround: Edit photo first (crops/reduces size)
```

## Tools for Non-Technical Debugging

### 1. Browser DevTools

**Essential tabs**:
- **Console**: See JavaScript errors
- **Network**: See API requests/responses
- **Elements**: Inspect HTML/CSS (for UI bugs)
- **Application**: Check cookies, local storage

### 2. Screen Recording

- **Loom**: Browser + screen recording with voice
- **CloudApp**: Quick GIFs for Slack
- **QuickTime**: Mac native screen recording

### 3. Network Inspection

- **Charles Proxy**: See all network traffic (advanced)
- **Requestly**: Modify requests in browser
- **Postman**: Test APIs manually

### 4. Monitoring Dashboards

- **Datadog / New Relic**: System health metrics
- **Sentry / Rollbar**: Error tracking
- **Mixpanel / Amplitude**: User behavior analytics
- **LogRocket / FullStory**: Session replay

### 5. User Feedback Tools

- **Intercom / Zendesk**: Support tickets
- **Hotjar**: Heatmaps, recordings
- **UserTesting**: Watch real users encounter bugs

## Collaboration with Engineers

### What Engineers Want

1. **Reproducible steps** (not vague descriptions)
2. **Evidence** (screenshots, console errors, logs)
3. **Context** (what changed, when, who's affected)
4. **Hypothesis** (your theory on root cause)
5. **Priority** (with business justification)

### What Engineers Don't Want

1. **Vague reports** ("It's broken")
2. **Feature requests disguised as bugs**
3. **Blame** ("Why did you deploy this?")
4. **Interruptions** (use async Slack threads first)
5. **Unrealistic urgency** (not everything is P0)

### Communication Templates

**Slack Thread**:
```
🐛 Bug Report: Credit card payments failing

Severity: P0 (blocking revenue)
Reproduction: [3-5 steps]
Evidence: [screenshot + console error]
Affected: USA users only (~50/hour)
Started: Today 2:10 PM (after payment service deploy)

My hypothesis: Stripe SDK config issue with redirect URL

Full details: [Link to Linear/Jira ticket]

@eng-team LMK if you need more info!
```

**Sprint Planning**:
```
Bug: Dashboard slow for enterprise users (P1)

User impact: 20% of users (large accounts) seeing 8s load times
Business impact: Support tickets increasing, churn risk
Root cause: Unbounded query fetching all-time data
Effort: ~2 days to add pagination + date filter
Priority: Higher than Feature X because affecting paid users
```

## Advanced: Reading Stack Traces (Without Reading Code)

When engineers share error logs, you can extract useful info:

```
STACK TRACE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Error: Payment gateway timeout
    at processPayment (payment-service.js:142)
    at handleCheckout (checkout-controller.js:89)
    at POST /api/checkout (routes.js:45)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

WHAT YOU CAN LEARN (without reading code):
1. Error type: "Payment gateway timeout"
2. Where it failed: payment-service.js, line 142
3. Call chain: routes.js → checkout-controller → payment-service
4. Endpoint: POST /api/checkout

PM INSIGHT:
"The timeout happens in the payment service when processing
the checkout. This suggests an issue with the external payment
gateway (Stripe, Braintree, etc.), not our code. Might be:
- Gateway API is down/slow
- Our API key is invalid
- Request format changed in gateway API update"
```

## Practice Exercises

### Exercise 1: Debug This Report

**User Report**:
> "I can't log in"

**Your task**: List 10 clarifying questions to ask.

<details>
<summary>Sample Questions</summary>

1. What happens when you try to log in? (Error message, blank screen, etc.)
2. Are you using email or social login (Google, Apple)?
3. Have you logged in successfully before?
4. When did you last successfully log in?
5. What browser/device are you using?
6. Have you tried resetting your password?
7. Do you see any error messages? Can you screenshot?
8. Does it work in a different browser?
9. Are you using a VPN or corporate network?
10. What's your account email? (for investigating on backend)
</details>

### Exercise 2: Prioritize These Bugs

Rank these bugs P0-P3 and justify:

1. Homepage loads slowly (5s instead of 2s)
2. Payment processing fails for 1% of transactions
3. Dark mode toggle doesn't work on settings page
4. Critical security vulnerability (SQL injection possible)
5. Mobile app crashes on iPhone X (discontinued device)

### Exercise 3: Write a Bug Report

You discovered: Clicking "Download Report" shows a blank PDF.

Write a complete bug report using the template from Step 6.

## Next Steps

Now that you understand non-technical debugging:

1. ✅ Practice with actual bugs in your product
2. ✅ Pair with an engineer to see their debugging process
3. ✅ Set up monitoring dashboards (ask engineer for access)
4. ✅ Join #engineering Slack to see how bugs are discussed
5. ✅ Use `/debug` command in ClaudeKit PM for guided investigation

## Quick Reference Card

```
PM Debug Checklist
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
□ Reproduced bug myself
□ Tested in incognito mode
□ Tested different browser/device
□ Captured screenshot + screen recording
□ Copied console errors (F12)
□ Noted network failures (DevTools)
□ Checked recent deployments
□ Identified affected user segment
□ Estimated business impact
□ Formed root cause hypothesis
□ Wrote clear bug report
□ Assigned proper priority
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Related Skills

- **Foundation**: API Basics - Understanding API errors
- **Foundation**: JSON Fundamentals - Reading error responses
- **Tools**: ASCII Diagrams - Visualizing user flows
- **Advanced**: Productivity Tools - Monitoring dashboards
