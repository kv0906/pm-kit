---
name: json-fundamentals
description: This skill should be used when the user asks about "JSON", "reading JSON", "JSON format", "data structures", "key-value pairs", or needs to understand JSON for API responses, configurations, and data analysis.
---

# JSON Fundamentals for Product Managers

A practical guide to understanding JSON for non-technical PMs who need to work with APIs, configurations, and data structures.

## What is JSON?

JSON (JavaScript Object Notation) is a lightweight format for storing and exchanging data. Think of it as a universal language that computers use to share information.

### Why Should PMs Care About JSON?

- **API Communication**: When your product talks to third-party services, it uses JSON
- **Configuration Files**: Many tools (like MCP servers) use JSON for settings
- **Data Analysis**: Analytics tools often export data in JSON format
- **Developer Communication**: Understanding JSON helps you communicate better with engineers

## Core Concepts

### 1. Key-Value Pairs

The fundamental building block of JSON is the key-value pair:

```json
{
  "productName": "ClaudeKit PM",
  "version": "1.0.0",
  "isActive": true,
  "userCount": 150
}
```

Think of it like a labeled box system:
- **Key** = The label on the box ("productName")
- **Value** = What's inside the box ("ClaudeKit PM")

### 2. Data Types

JSON supports six data types:

#### String (Text)
```json
{
  "userName": "Sarah Chen",
  "email": "sarah@example.com",
  "status": "active"
}
```
Always wrapped in quotes.

#### Number
```json
{
  "userCount": 150,
  "revenue": 45000.50,
  "growthRate": -2.3
}
```
No quotes. Can be positive, negative, decimal.

#### Boolean (True/False)
```json
{
  "isPremium": true,
  "hasAccess": false,
  "emailVerified": true
}
```
Only two values: `true` or `false` (lowercase, no quotes).

#### Array (List)
```json
{
  "features": ["analytics", "reporting", "export"],
  "priorities": [1, 2, 3, 4, 5],
  "tags": []
}
```
Square brackets `[]` contain multiple items separated by commas.

#### Object (Nested Structure)
```json
{
  "user": {
    "name": "Alex Kim",
    "role": "Product Manager",
    "department": "Growth"
  }
}
```
Curly braces `{}` contain more key-value pairs.

#### Null (Empty/Unknown)
```json
{
  "lastLogin": null,
  "phoneNumber": null
}
```
Represents "no value" or "unknown".

## Real-World PM Examples

### Example 1: User Profile API Response

When you request user data from an API, you might receive:

```json
{
  "userId": "pm_12345",
  "profile": {
    "firstName": "Jordan",
    "lastName": "Taylor",
    "email": "jordan.taylor@company.com",
    "joinedDate": "2024-01-15"
  },
  "subscription": {
    "plan": "enterprise",
    "status": "active",
    "seats": 25,
    "renewalDate": "2025-01-15"
  },
  "features": ["analytics", "api_access", "priority_support"],
  "usage": {
    "apiCallsThisMonth": 1250,
    "storageUsedGB": 45.7,
    "activeUsers": 18
  }
}
```

**PM Interpretation**:
- This user "Jordan Taylor" has an enterprise subscription
- They're using 18 out of 25 seats
- Usage is at 1,250 API calls and 45.7GB storage
- They have access to 3 premium features

### Example 2: Feature Flag Configuration

```json
{
  "features": {
    "newDashboard": {
      "enabled": true,
      "rolloutPercentage": 25,
      "targetSegments": ["beta_users", "enterprise"]
    },
    "aiAssistant": {
      "enabled": false,
      "plannedLaunch": "2024-12-01",
      "requiredPlan": "premium"
    },
    "exportToExcel": {
      "enabled": true,
      "rolloutPercentage": 100,
      "targetSegments": ["all"]
    }
  }
}
```

**PM Interpretation**:
- New dashboard is live for 25% of beta and enterprise users
- AI assistant is not yet enabled, planned for December
- Excel export is live for all users

### Example 3: MCP Server Configuration

```json
{
  "mcpServers": {
    "brave-search": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-brave-search"],
      "env": {
        "BRAVE_API_KEY": "your_key_here"
      }
    },
    "perplexity": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-perplexity"],
      "env": {
        "PERPLEXITY_API_KEY": "your_key_here"
      },
      "disabled": false
    }
  }
}
```

**PM Interpretation**:
- Two search services configured: Brave Search and Perplexity
- Each needs its own API key stored in the `env` section
- Perplexity is currently disabled (not being used)

## Common JSON Patterns for PMs

### 1. Pagination

```json
{
  "data": [
    {"id": 1, "name": "Item 1"},
    {"id": 2, "name": "Item 2"}
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 10,
    "itemsPerPage": 20,
    "totalItems": 195
  }
}
```

### 2. Error Responses

```json
{
  "error": {
    "code": "INVALID_API_KEY",
    "message": "The provided API key is invalid or expired",
    "statusCode": 401,
    "details": {
      "keyExpiredAt": "2024-01-15T10:30:00Z",
      "renewalUrl": "https://api.example.com/renew"
    }
  }
}
```

### 3. Success/Failure Status

```json
{
  "success": true,
  "message": "User created successfully",
  "data": {
    "userId": "usr_789",
    "createdAt": "2024-01-20T14:22:00Z"
  }
}
```

## Reading JSON Like a PM

### Exercise 1: Interpret This Analytics Response

```json
{
  "period": "2024-01",
  "metrics": {
    "activeUsers": 12450,
    "newSignups": 890,
    "churnRate": 3.2,
    "revenueUSD": 145000
  },
  "topFeatures": [
    {"name": "Dashboard", "usagePercentage": 95},
    {"name": "Reports", "usagePercentage": 78},
    {"name": "Exports", "usagePercentage": 45}
  ],
  "goals": {
    "targetActiveUsers": 15000,
    "achievementPercentage": 83
  }
}
```

**Questions to Ask**:
1. What time period does this data cover? (January 2024)
2. How many new users signed up? (890)
3. What's the churn rate? (3.2%)
4. Which feature is most popular? (Dashboard at 95%)
5. Are we hitting our user growth target? (83% of goal, need 2,550 more users)

## Common Mistakes to Avoid

### ❌ Missing Comma
```json
{
  "name": "Product"
  "version": "1.0"  // Missing comma after "Product"
}
```

### ✅ Correct
```json
{
  "name": "Product",
  "version": "1.0"
}
```

### ❌ Trailing Comma
```json
{
  "name": "Product",
  "version": "1.0",  // Extra comma at the end
}
```

### ✅ Correct
```json
{
  "name": "Product",
  "version": "1.0"
}
```

### ❌ Single Quotes
```json
{
  'name': 'Product'  // Must use double quotes
}
```

### ✅ Correct
```json
{
  "name": "Product"
}
```

## Tools for Working with JSON

### 1. JSON Validators
- **jsonlint.com** - Paste JSON to check for errors
- **Visual Studio Code** - Built-in JSON validation

### 2. JSON Formatters
- **jsonformatter.org** - Makes messy JSON readable
- **Browser DevTools** - Right-click → Format JSON

### 3. JSON to Table Converters
- **convertcsv.com/json-to-csv** - Convert JSON to Excel-friendly CSV
- **tableconvert.com** - Convert to Markdown tables

## Practice Scenarios

### Scenario 1: Reading API Documentation

Your engineer shares this API endpoint response:

```json
{
  "status": "success",
  "data": {
    "users": [
      {
        "id": "u_001",
        "email": "user@example.com",
        "plan": "premium",
        "mrr": 99
      }
    ]
  },
  "meta": {
    "total": 1,
    "page": 1,
    "limit": 50
  }
}
```

**Your PM Task**: Write a user story referencing this data structure.

**Example**:
```
As a PM, I need to see the total number of premium users
So I can track our premium conversion rate

Acceptance Criteria:
- Display meta.total count
- Filter users array where plan === "premium"
- Calculate total MRR from mrr field
```

### Scenario 2: Configuring Feature Flags

You want to enable a new feature for 10% of users. Write the JSON:

```json
{
  "featureName": "aiRecommendations",
  "enabled": true,
  "rolloutPercentage": 10,
  "targetSegments": ["beta_testers"],
  "startDate": "2024-02-01",
  "config": {
    "maxRecommendations": 5,
    "refreshIntervalMinutes": 60
  }
}
```

## Next Steps

Now that you understand JSON fundamentals:

1. ✅ Try reading your product's API documentation
2. ✅ Ask your engineers to share a sample API response
3. ✅ Practice with `/test-api` command in ClaudeKit PM
4. ✅ Move on to **API Basics** skill to learn HTTP requests

## Quick Reference Card

```
JSON Syntax Cheat Sheet
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
String    | "text"              | Text in quotes
Number    | 42 or 3.14          | No quotes
Boolean   | true or false       | Lowercase
Array     | [1, 2, 3]           | Square brackets
Object    | {"key": "value"}    | Curly braces
Null      | null                | Empty value
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Common Structures:
- Object in array:    [{"id": 1}, {"id": 2}]
- Nested objects:     {"user": {"name": "Alex"}}
- Array of strings:   ["red", "blue", "green"]
```

## Related Skills

- **Next**: API Basics - Learn to make HTTP requests
- **Advanced**: Debug Without Code - Troubleshoot API issues
- **Tools**: Productivity Tools - JSON-aware CLI tools
