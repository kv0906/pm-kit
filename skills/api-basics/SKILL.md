---
name: api-basics
description: This skill should be used when the user asks about "API concepts", "HTTP methods", "REST APIs", "status codes", "API documentation", "endpoints", or needs to understand API integration and evaluation for Product Managers.
---

You help Product Managers understand APIs well enough to write clear requirements, evaluate integrations, and communicate effectively with engineering—without becoming developers themselves.

---

## THE MENTAL MODEL

**API = Application Programming Interface**

Think of an API as a **restaurant**:
- **Menu** = Available endpoints (what you can request)
- **Order** = Your request (method + data)
- **Kitchen** = Server processing
- **Meal** = Response (data returned)

**Why PMs Care:**
- Integrations (Stripe, Slack, analytics tools)
- Mobile apps talking to your backend
- Third-party data (weather, payments, social)
- Automation between tools

---

## CORE CONCEPTS (The Vocabulary)

**HTTP Methods** — What action you want:
- **GET**: Retrieve data ("Show me users")
- **POST**: Create new ("Add this user")
- **PUT/PATCH**: Update ("Change this user's email")
- **DELETE**: Remove ("Delete this user")

**Endpoints** — Where to send requests:
```
https://api.example.com/v1/users          ← All users
https://api.example.com/v1/users/12345    ← Specific user
https://api.example.com/v1/users?role=pm  ← Filtered users
```

**Request Components:**
1. Method (GET, POST, etc.)
2. Endpoint (URL)
3. Headers (authentication, content type)
4. Body (data you're sending, for POST/PUT/PATCH)

**Response Components:**
1. Status code (did it work?)
2. Headers (metadata)
3. Body (data returned)

**Status Codes** — What happened:
- **2xx**: Success (200 OK, 201 Created)
- **4xx**: Your error (400 Bad Request, 401 Unauthorized, 404 Not Found, 429 Rate Limited)
- **5xx**: Their error (500 Server Error, 503 Unavailable)

**PM Rule of Thumb:**
- 2xx → Feature works, ship it
- 4xx → Check implementation, update docs
- 5xx → Contact vendor, implement retry logic

---

## READING API DOCUMENTATION

This is your critical PM skill. When evaluating or speccing an integration:

**1. Find the Base URL**
```
https://api.stripe.com/v1
https://api.slack.com
```

**2. Understand Authentication**
- API Key: Simple, include in header
- OAuth: User grants permission (Google, Slack)
- JWT: Token-based for logged-in users

**3. Identify Required Endpoints**
For a payment integration, you likely need:
- Create charge
- Get charge status
- Handle refunds
- List transactions

**4. Note Rate Limits**
Most APIs limit requests (e.g., 1000/hour). Plan for:
- Caching responses
- Retry with backoff on 429
- Requesting limit increases if needed

**5. Check Webhooks**
Instead of polling ("Is payment done yet? Is it done yet?"), webhooks push events to you:
```
Stripe sends → Your server receives "payment.succeeded"
→ Your app upgrades user account
```

---

## WRITING API-AWARE ACCEPTANCE CRITERIA

**Pattern:**
```
Given [context]
When [API request happens]
Then [handle success case]
And if [error case]:
  [handle gracefully]
```

**Example: Payment Processing**
```
Given user completes checkout with valid card
When POST to /v1/charges with amount, currency, source
Then if status 2xx:
  - Show success message
  - Send confirmation email
  - Redirect to /thank-you
And if status 4xx:
  - Show user-friendly error from response
  - Allow retry
And if status 5xx:
  - Show "temporarily unavailable" message
  - Queue for retry
  - Alert ops team
```

**Example: Slack Notification**
```
Given user upgrades to Premium plan
When POST to Slack webhook with user email, plan, timestamp
Then notification appears in #sales channel
And if webhook fails:
  - Log failure for debugging
  - Don't block user flow
  - Retry 3x with exponential backoff
```

---

## EVALUATING THIRD-PARTY APIs

When choosing between vendors or assessing integration feasibility:

**Reliability**
- Uptime SLA? (Target: 99.9%+)
- Status page available?
- What happens during outage?

**Documentation Quality**
- Clear examples?
- Up-to-date?
- Multiple language samples?

**Rate Limits & Pricing**
- Requests per hour/day?
- Cost per request?
- Free tier for development?

**Data & Compliance**
- Where is data stored?
- GDPR/CCPA compliant?
- Data retention policy?

**Support**
- Response time SLA?
- Dedicated support tier?

---

## INTEGRATION COMPLEXITY ESTIMATION

| Factor | Simple (1 week) | Medium (2-4 weeks) | Complex (1-2 months) |
|--------|-----------------|--------------------|-----------------------|
| Auth | API key | OAuth flow | Custom/multi-step |
| Endpoints | 1-3 | 4-10 | 10+ with dependencies |
| Data volume | Low (<1K/day) | Medium (1-10K/day) | High (10K+/day) |
| Error handling | Basic retry | Smart retry + logging | Circuit breakers, fallbacks |

---

## COMMON PATTERNS TO RECOGNIZE

**Pagination** — Large datasets split into pages:
```
GET /users?page=2&limit=50
Response includes: totalPages, hasMore, nextPage
```
*PM implication: Design UI for "load more" or infinite scroll*

**Filtering & Sorting** — Query parameters narrow results:
```
GET /products?category=electronics&minPrice=100&sort=price_desc
```
*PM implication: Decide which filters to expose in UI*

**Batch Operations** — Multiple actions in one request:
```
POST /users/batch with array of create/update/delete operations
```
*PM implication: Bulk actions feature, import/export flows*

**Webhooks** — Real-time event notifications:
```
Payment succeeds → Stripe POSTs to your /webhooks/stripe endpoint
```
*PM implication: Real-time features without polling, but need failure handling*

---

## COMMUNICATING WITH ENGINEERS

**Instead of:** "Make it work with Stripe"
**Say:** "We need POST /v1/charges for checkout, GET /v1/charges/{id} for order history, and webhook handler for payment.succeeded to update user status"

**Instead of:** "The API is broken"
**Say:** "We're getting 429s during peak hours—should we implement caching, request limit increase, or queue requests?"

**Instead of:** "Add error handling"
**Say:** "For 4xx errors, show the error message from response.error.message. For 5xx, show generic 'try again' and log for debugging."

---

## TESTING APIs (Quick Methods)

**Browser DevTools:**
1. F12 → Network tab
2. Perform action in your product
3. See all API requests/responses
4. Check status codes, response times, payloads

**Postman/Insomnia:**
GUI tools for making test requests without code. Create collections to share with team.

**curl (command line):**
```bash
curl https://api.github.com/users/octocat
```
Engineers use this; you don't need to master it, but recognize it in docs.

---

## PM DECISION FRAMEWORK

**When API returns errors consistently:**
1. Is it 4xx? → Implementation issue, check with engineering
2. Is it 5xx? → Vendor issue, check status page, contact support
3. Is it 429? → Rate limit, need caching/backoff/limit increase

**When evaluating build vs. buy:**
- API exists with good docs + reasonable pricing → Integrate
- API exists but poor reliability/docs → Consider alternatives
- No API exists → Build or find different solution

**When writing requirements:**
- Specify expected request/response structure
- Define all error cases and handling
- Include rate limit considerations
- Specify webhook events needed

---

## QUICK REFERENCE
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
HTTP METHODS        STATUS CODES
GET    = Read       2xx = Success
POST   = Create     4xx = Your error  
PUT    = Replace    5xx = Their error
PATCH  = Update     
DELETE = Remove     

COMMON HEADERS
Authorization: Bearer <token>
Content-Type: application/json

QUESTIONS FOR API EVALUATION
□ Uptime SLA?
□ Rate limits?
□ Pricing model?
□ Documentation quality?
□ Webhook support?
□ Compliance (GDPR/CCPA)?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```