# API Basics for Product Managers

A comprehensive guide to understanding APIs for non-technical PMs who need to work with integrations, third-party services, and technical specifications.

## What is an API?

**API** = Application Programming Interface

Think of an API as a **restaurant menu**:
- The menu shows what you can order (available endpoints)
- You make a request (order food)
- The kitchen processes it (server logic)
- You receive a response (your meal)

### Why APIs Matter for PMs

- **Integrations**: Connecting your product to other services (Stripe, Slack, Google Analytics)
- **Mobile Apps**: Your iOS/Android apps use APIs to talk to your backend
- **Third-Party Data**: Getting data from external sources (weather, stock prices, social media)
- **Automation**: Building workflows between different tools

## Core API Concepts

### 1. HTTP Methods (Verbs)

APIs use HTTP methods to indicate what action you want to perform:

| Method | Purpose | Example |
|--------|---------|---------|
| **GET** | Retrieve data | Get list of users |
| **POST** | Create new data | Create a new user |
| **PUT** | Update entire resource | Update all user fields |
| **PATCH** | Update part of resource | Update just user email |
| **DELETE** | Remove data | Delete a user |

**PM Analogy**:
- GET = "Show me the menu"
- POST = "Place a new order"
- PUT = "Replace my entire order"
- PATCH = "Add fries to my order"
- DELETE = "Cancel my order"

### 2. Endpoints (URLs)

An endpoint is the specific URL where an API action happens:

```
https://api.example.com/v1/users
https://api.example.com/v1/users/12345
https://api.example.com/v1/products/search
```

**Structure Breakdown**:
- `https://` - Protocol (secure)
- `api.example.com` - Domain
- `/v1/` - API version
- `/users` - Resource type
- `/12345` - Specific resource ID

### 3. Request Structure

Every API request has three main parts:

```
REQUEST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. HTTP Method:  POST
2. Endpoint:     https://api.example.com/v1/users
3. Headers:      Content-Type: application/json
                 Authorization: Bearer abc123xyz
4. Body:         {
                   "name": "Sarah Chen",
                   "email": "sarah@example.com",
                   "role": "PM"
                 }
```

### 4. Response Structure

APIs return responses with:

```
RESPONSE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. Status Code:  201 Created
2. Headers:      Content-Type: application/json
3. Body:         {
                   "success": true,
                   "data": {
                     "userId": "usr_789",
                     "name": "Sarah Chen",
                     "createdAt": "2024-01-20T14:30:00Z"
                   }
                 }
```

## HTTP Status Codes

Status codes tell you what happened with your request:

### 2xx Success
- **200 OK** - Request succeeded
- **201 Created** - New resource created successfully
- **204 No Content** - Succeeded but no data to return

### 4xx Client Errors (Your Fault)
- **400 Bad Request** - Invalid data sent
- **401 Unauthorized** - Missing or invalid API key
- **403 Forbidden** - Don't have permission
- **404 Not Found** - Resource doesn't exist
- **429 Too Many Requests** - Rate limit exceeded

### 5xx Server Errors (Their Fault)
- **500 Internal Server Error** - Something broke on server
- **502 Bad Gateway** - Server is down
- **503 Service Unavailable** - Temporary outage

**PM Decision Framework**:
- **2xx**: Feature works, proceed with launch
- **4xx**: Check implementation, might need docs update
- **5xx**: Contact vendor, implement retry logic

## Real-World PM Examples

### Example 1: User Management API

**Create a New User**

```
POST https://api.example.com/v1/users
Authorization: Bearer sk_live_abc123xyz
Content-Type: application/json

{
  "email": "newuser@company.com",
  "name": "Alex Kim",
  "role": "product_manager",
  "department": "growth",
  "permissions": ["read", "write", "analytics"]
}

Response: 201 Created
{
  "success": true,
  "data": {
    "userId": "usr_456",
    "email": "newuser@company.com",
    "name": "Alex Kim",
    "role": "product_manager",
    "createdAt": "2024-01-20T10:30:00Z",
    "profileUrl": "https://app.example.com/users/usr_456"
  }
}
```

**Get User Details**

```
GET https://api.example.com/v1/users/usr_456
Authorization: Bearer sk_live_abc123xyz

Response: 200 OK
{
  "userId": "usr_456",
  "email": "newuser@company.com",
  "name": "Alex Kim",
  "role": "product_manager",
  "department": "growth",
  "permissions": ["read", "write", "analytics"],
  "lastLoginAt": "2024-01-20T14:22:00Z",
  "accountStatus": "active"
}
```

**Update User Role**

```
PATCH https://api.example.com/v1/users/usr_456
Authorization: Bearer sk_live_abc123xyz
Content-Type: application/json

{
  "role": "senior_product_manager",
  "permissions": ["read", "write", "analytics", "admin"]
}

Response: 200 OK
{
  "success": true,
  "data": {
    "userId": "usr_456",
    "role": "senior_product_manager",
    "permissions": ["read", "write", "analytics", "admin"],
    "updatedAt": "2024-01-20T15:00:00Z"
  }
}
```

**Delete User**

```
DELETE https://api.example.com/v1/users/usr_456
Authorization: Bearer sk_live_abc123xyz

Response: 204 No Content
```

### Example 2: Product Search API

```
GET https://api.example.com/v1/products/search?q=laptop&category=electronics&minPrice=500&maxPrice=2000&sort=price_asc&page=1&limit=20

Response: 200 OK
{
  "query": "laptop",
  "filters": {
    "category": "electronics",
    "priceRange": [500, 2000]
  },
  "results": [
    {
      "productId": "prod_123",
      "name": "UltraBook Pro 15",
      "price": 899.99,
      "rating": 4.5,
      "reviewCount": 234,
      "inStock": true,
      "imageUrl": "https://cdn.example.com/products/prod_123.jpg"
    },
    {
      "productId": "prod_456",
      "name": "PowerBook Air",
      "price": 1299.99,
      "rating": 4.8,
      "reviewCount": 567,
      "inStock": true,
      "imageUrl": "https://cdn.example.com/products/prod_456.jpg"
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 15,
    "totalResults": 289,
    "itemsPerPage": 20
  }
}
```

**PM Insights**:
- Query parameters in URL (after `?`)
- Multiple filters supported
- Pagination for large result sets
- Rich metadata (ratings, reviews, stock status)

### Example 3: Payment Processing API

```
POST https://api.stripe.com/v1/charges
Authorization: Bearer sk_live_your_stripe_key
Content-Type: application/json

{
  "amount": 4999,
  "currency": "usd",
  "source": "tok_visa",
  "description": "Premium Plan - Annual Subscription",
  "metadata": {
    "userId": "usr_789",
    "planId": "plan_premium_annual",
    "orderId": "order_2024_001"
  }
}

Response: 200 OK
{
  "id": "ch_3abc123",
  "object": "charge",
  "amount": 4999,
  "amount_captured": 4999,
  "currency": "usd",
  "paid": true,
  "status": "succeeded",
  "created": 1705756800,
  "metadata": {
    "userId": "usr_789",
    "planId": "plan_premium_annual",
    "orderId": "order_2024_001"
  },
  "receipt_url": "https://pay.stripe.com/receipts/abc123"
}
```

## Authentication Methods

### 1. API Keys

Simplest form - include key in request:

```
GET https://api.example.com/v1/data
Authorization: Bearer sk_live_abc123xyz456
```

**PM Considerations**:
- Where to store keys (environment variables, not in code)
- Key rotation policy
- Different keys for dev/staging/production

### 2. OAuth 2.0

More secure - user grants permission:

**Flow**:
1. User clicks "Connect with Google"
2. Redirected to Google login
3. User approves permissions
4. App receives access token
5. App uses token for API requests

**Common with**: Google, Facebook, GitHub, Slack

### 3. JWT (JSON Web Tokens)

Token-based auth for logged-in users:

```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

## API Rate Limits

APIs limit how many requests you can make:

```
Response Headers:
X-RateLimit-Limit: 1000        # Max requests per hour
X-RateLimit-Remaining: 847     # Requests left
X-RateLimit-Reset: 1705759200  # When limit resets
```

**PM Decision**: If you get `429 Too Many Requests`:
- Implement exponential backoff (retry with increasing delays)
- Request higher rate limit from vendor
- Cache responses to reduce API calls
- Implement request queuing

## Testing APIs (Non-Technical Way)

### Tool 1: Postman

1. **Download**: getpostman.com
2. **Create Collection**: Organize related requests
3. **Add Request**:
   - Method: GET
   - URL: https://api.github.com/users/octocat
   - Click "Send"
4. **View Response**: See JSON data returned

### Tool 2: curl (Command Line)

```bash
# Simple GET request
curl https://api.github.com/users/octocat

# POST with data
curl -X POST https://api.example.com/v1/users \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer abc123" \
  -d '{"name":"Sarah","email":"sarah@example.com"}'

# Save response to file
curl https://api.example.com/v1/data > response.json
```

### Tool 3: Browser DevTools

1. Open your product in browser
2. Press F12 (DevTools)
3. Go to **Network** tab
4. Perform action in your product
5. See all API requests made
6. Click request to see details

## Reading API Documentation

### Good API Docs Include:

1. **Base URL**: `https://api.example.com/v1`
2. **Authentication**: How to get and use API keys
3. **Endpoints**: List of all available URLs
4. **Request Examples**: Sample code in multiple languages
5. **Response Examples**: What you'll get back
6. **Error Codes**: What different errors mean
7. **Rate Limits**: How many requests allowed
8. **Webhooks**: How to receive real-time events

### Example: Reading Stripe Docs

**Task**: "Charge a customer $49.99"

**Documentation Shows**:
```
POST https://api.stripe.com/v1/charges

Parameters:
- amount (required): integer - Amount in cents
- currency (required): string - Three-letter ISO code
- source (required): string - Payment source token

Example:
curl https://api.stripe.com/v1/charges \
  -u sk_test_your_key: \
  -d amount=4999 \
  -d currency=usd \
  -d source=tok_visa
```

**PM Task**: Write acceptance criteria
```
Given a user completes checkout
When they click "Pay Now"
Then POST request to /v1/charges with:
  - amount: 4999 (in cents)
  - currency: "usd"
  - source: payment_method_token
And if status === "succeeded":
  - Show success message
  - Send confirmation email
  - Redirect to /thank-you
And if status === "failed":
  - Show error message from API response
  - Log error for debugging
  - Allow user to retry
```

## Common API Patterns

### 1. Pagination

```
GET /v1/users?page=2&limit=50

Response:
{
  "data": [...],
  "pagination": {
    "page": 2,
    "limit": 50,
    "total": 1234,
    "hasMore": true,
    "nextPage": 3
  }
}
```

### 2. Filtering & Sorting

```
GET /v1/products?category=electronics&minPrice=100&sort=price_desc

Response:
{
  "filters": {
    "category": "electronics",
    "minPrice": 100
  },
  "sort": "price_desc",
  "results": [...]
}
```

### 3. Batch Operations

```
POST /v1/users/batch
{
  "operations": [
    {"action": "create", "data": {"name": "User 1"}},
    {"action": "create", "data": {"name": "User 2"}},
    {"action": "delete", "userId": "usr_789"}
  ]
}
```

### 4. Webhooks (Reverse API)

Instead of polling, webhooks push data to you:

```
Your Server Receives:
POST https://your-app.com/webhooks/stripe
{
  "event": "payment.succeeded",
  "data": {
    "chargeId": "ch_abc123",
    "amount": 4999,
    "customerId": "cus_xyz789"
  },
  "timestamp": "2024-01-20T14:30:00Z"
}
```

**PM Use Case**:
- User pays on Stripe → Stripe sends webhook → Your app upgrades user account

## PM Decision Framework

### Evaluating Third-Party APIs

**Questions to Ask**:

1. **Reliability**
   - What's their uptime SLA? (aim for 99.9%+)
   - Do they have status page? (status.example.com)

2. **Documentation**
   - Is documentation clear and up-to-date?
   - Are there code examples?

3. **Rate Limits**
   - What are the limits? (1000/hour? 10,000/day?)
   - Can we request increase?

4. **Pricing**
   - Cost per request?
   - Free tier available?

5. **Support**
   - How do we get help?
   - Response time SLA?

6. **Data Privacy**
   - Where is data stored?
   - GDPR/CCPA compliant?

### Integration Complexity Estimate

| Factor | Simple (1 week) | Medium (2-4 weeks) | Complex (1-2 months) |
|--------|----------------|-------------------|---------------------|
| **Auth** | API key | OAuth | Custom auth flow |
| **Endpoints** | 1-3 | 4-10 | 10+ |
| **Data Volume** | <1000/day | 1000-10,000/day | 10,000+/day |
| **Error Handling** | Basic retry | Smart retry + logging | Complex fallbacks |
| **Testing** | Manual | Automated | Load testing |

## Practice Scenarios

### Scenario 1: Planning Slack Integration

**PM Task**: Your product needs to send notifications to Slack.

**API Research**:
1. Visit api.slack.com/messaging/webhooks
2. Find endpoint: `POST https://hooks.slack.com/services/T00/B00/XXX`
3. Sample payload:
```json
{
  "text": "New user signed up!",
  "attachments": [{
    "color": "good",
    "fields": [
      {"title": "User", "value": "sarah@example.com"},
      {"title": "Plan", "value": "Premium"}
    ]
  }]
}
```

**Write User Story**:
```
As a sales team member
I want to receive Slack notifications when users upgrade to Premium
So I can follow up quickly

Acceptance Criteria:
- POST to Slack webhook when user.plan === "premium"
- Include user email, plan name, and timestamp
- Format as Slack attachment with green color
- Handle webhook failures gracefully
- Log all notifications sent
```

### Scenario 2: Analytics Dashboard

**PM Task**: Display real-time user count from your API.

**API Endpoint**:
```
GET /v1/analytics/realtime
Response:
{
  "activeUsers": 1234,
  "newToday": 89,
  "revenue": 45000,
  "timestamp": "2024-01-20T14:30:00Z"
}
```

**Write Acceptance Criteria**:
```
- Fetch /v1/analytics/realtime every 30 seconds
- Display activeUsers in large number widget
- Show newToday with +/- change from yesterday
- If API returns 5xx error, show last known value
- If API returns 401, redirect to login
- Cache response for 30s to avoid rate limits
```

## Troubleshooting APIs

### Error: 401 Unauthorized

**Checklist**:
- [ ] Is API key correct?
- [ ] Is key in right header? (Authorization, X-API-Key, etc.)
- [ ] Has key expired?
- [ ] Right environment? (test vs. live key)

### Error: 429 Too Many Requests

**Actions**:
- Check rate limit headers
- Implement exponential backoff
- Cache responses
- Request limit increase

### Error: 500 Internal Server Error

**Actions**:
- Check API status page
- Try again with same request (might be temporary)
- Contact support with request ID
- Implement fallback behavior

## Next Steps

Now that you understand API basics:

1. ✅ Practice with public APIs (GitHub, JSONPlaceholder)
2. ✅ Use `/test-api` command in ClaudeKit PM
3. ✅ Read your product's API documentation
4. ✅ Try Postman to make test requests
5. ✅ Move on to **Debug Without Code** skill

## Quick Reference Card

```
API Request Cheat Sheet
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
HTTP Methods:
GET     | Retrieve data
POST    | Create new
PUT     | Update all
PATCH   | Update part
DELETE  | Remove

Status Codes:
2xx | Success
4xx | Your error
5xx | Their error

Common Headers:
Authorization: Bearer token
Content-Type: application/json
Accept: application/json
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Related Skills

- **Next**: Debug Without Code - Troubleshoot API issues
- **Foundation**: JSON Fundamentals - Understand API data
- **Advanced**: Frontend Prompts - Design API-driven UIs
