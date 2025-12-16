# Data Validation Best Practices

## Overview

Proper data validation is critical for insurance claims systems. Invalid data can cause processing delays, errors, and compliance issues. This guide covers validation rules and best practices.

## Policy Number Validation

### Format Validation
```regex
^POL-[0-9]{4}-[0-9]{5}$
```

### Rules
1. **Prefix**: Must be exactly "POL-"
2. **Year**: Exactly 4 digits (2020-2099)
3. **Separator**: Hyphen required
4. **Sequence**: Exactly 5 digits (10000-99999)

### Validation Examples
```javascript
// Valid
"POL-2023-12345" ✅
"POL-2024-67890" ✅
"POL-2023-10000" ✅

// Invalid
"POL-2023-123" ❌ (only 3 digits)
"POL-23-12345" ❌ (year not 4 digits)
"POL-2023-123456" ❌ (6 digits)
"pol-2023-12345" ❌ (lowercase)
```

### Implementation
```javascript
function validatePolicyNumber(policyNumber) {
    const pattern = /^POL-[0-9]{4}-[0-9]{5}$/;
    if (!pattern.test(policyNumber)) {
        throw new Error(`Invalid policy number format. Expected POL-YYYY-NNNNN, got ${policyNumber}`);
    }
    return true;
}
```

## Date Validation

### Incident Date Rules
1. Must be in the past
2. Cannot be more than 1 year old (typically)
3. Must be valid date
4. ISO 8601 format required

### Reported Date Rules
1. Must be >= incident date
2. Cannot be in the future
3. Typically set automatically on submission

### Implementation
```javascript
function validateDates(incidentDate, reportedDate) {
    const incident = new Date(incidentDate);
    const reported = new Date(reportedDate);
    const now = new Date();
    
    if (incident > now) {
        throw new Error("Incident date cannot be in the future");
    }
    
    if (reported < incident) {
        throw new Error("Reported date must be >= incident date");
    }
    
    if (reported > now) {
        throw new Error("Reported date cannot be in the future");
    }
    
    return true;
}
```

## Amount Validation

### Claim Amount Rules
1. Must be positive number
2. Typically ranges: $100 - $1,000,000+
3. 2 decimal places precision
4. Cannot be zero

### Approved Amount Rules
1. Must be <= claim amount
2. Can be null until approved
3. 2 decimal places precision

### Implementation
```javascript
function validateAmounts(claimAmount, approvedAmount) {
    if (claimAmount <= 0) {
        throw new Error("Claim amount must be positive");
    }
    
    if (claimAmount > 1000000) {
        throw new Error("Claim amount exceeds maximum limit");
    }
    
    if (approvedAmount !== null && approvedAmount > claimAmount) {
        throw new Error("Approved amount cannot exceed claim amount");
    }
    
    return true;
}
```

## Status Validation

### Valid Status Values
- `Open`
- `Pending Review`
- `Approved`
- `Closed`
- `Denied`

### Status Transition Rules
```javascript
const validTransitions = {
    "Open": ["Pending Review", "Approved", "Denied"],
    "Pending Review": ["Approved", "Denied"],
    "Approved": ["Closed"],
    "Denied": ["Closed"],
    "Closed": [] // Final state
};

function validateStatusTransition(currentStatus, newStatus) {
    const allowed = validTransitions[currentStatus] || [];
    if (!allowed.includes(newStatus)) {
        throw new Error(`Invalid status transition from ${currentStatus} to ${newStatus}`);
    }
    return true;
}
```

## Loss Type Validation

### Valid Loss Types
- `Auto`
- `Property`
- `Health`

### Implementation
```javascript
const validLossTypes = ["Auto", "Property", "Health"];

function validateLossType(lossType) {
    if (!validLossTypes.includes(lossType)) {
        throw new Error(`Invalid loss type. Must be one of: ${validLossTypes.join(", ")}`);
    }
    return true;
}
```

## Email Validation

### Format Validation
```regex
^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$
```

### Implementation
```javascript
function validateEmail(email) {
    const pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!pattern.test(email)) {
        throw new Error(`Invalid email format: ${email}`);
    }
    return true;
}
```

## Phone Number Validation

### Format Validation
- E.164 international format recommended
- Pattern: `+[country code][number]`
- Example: `+15551234567`

### Implementation
```javascript
function validatePhone(phone) {
    const pattern = /^\+[1-9]\d{1,14}$/;
    if (!pattern.test(phone)) {
        throw new Error(`Invalid phone format. Expected E.164 format (e.g., +15551234567)`);
    }
    return true;
}
```

## Description Validation

### Rules
1. Minimum length: 50 characters
2. Maximum length: 5000 characters
3. Must contain meaningful content
4. Cannot be only whitespace

### Implementation
```javascript
function validateDescription(description) {
    const trimmed = description.trim();
    
    if (trimmed.length < 50) {
        throw new Error("Description must be at least 50 characters");
    }
    
    if (trimmed.length > 5000) {
        throw new Error("Description exceeds maximum length of 5000 characters");
    }
    
    return true;
}
```

## Location Validation

### Rules
1. Should include address or landmark
2. Should include city and state
3. Optional but highly recommended
4. Maximum length: 200 characters

### Implementation
```javascript
function validateLocation(location) {
    if (location && location.length > 200) {
        throw new Error("Location exceeds maximum length of 200 characters");
    }
    // Location is optional but recommended
    return true;
}
```

## Complete Validation Function

### Example Implementation
```javascript
function validateClaim(claim) {
    // Policy number
    validatePolicyNumber(claim.policyNumber);
    
    // Loss type
    validateLossType(claim.lossType);
    
    // Dates
    validateDates(claim.incidentDate, claim.reportedDate);
    
    // Amounts
    validateAmounts(claim.claimAmount, claim.approvedAmount);
    
    // Contact information
    validateEmail(claim.insuredContactEmail);
    validatePhone(claim.insuredContactPhone);
    
    // Description
    validateDescription(claim.description);
    
    // Location (optional)
    validateLocation(claim.location);
    
    return true;
}
```

## API-Level Validation

### Request Validation
- Validate all required fields present
- Validate field formats
- Validate business rules
- Return clear error messages

### Response Validation
- Ensure consistent response format
- Include all required fields
- Validate data before returning

## Error Messages

### Best Practices
1. **Be Specific**: Identify exact field and issue
2. **Provide Examples**: Show correct format
3. **Be Actionable**: Tell user how to fix
4. **Be Consistent**: Use same format across API

### Example Error Messages
```json
{
  "error": "Validation Error",
  "message": "Policy number format is invalid",
  "field": "policyNumber",
  "received": "POL-2023-123",
  "expected": "POL-YYYY-NNNNN (e.g., POL-2023-12345)",
  "code": "INVALID_POLICY_FORMAT"
}
```

## Validation in Claims MCP

When using Claims MCP:
- MCP server validates input before API call
- Provides clear error messages
- Handles validation errors gracefully
- Returns actionable feedback

## Testing Validation

### Test Cases
1. Valid data → Should pass
2. Invalid policy format → Should fail with clear message
3. Future dates → Should fail
4. Invalid amounts → Should fail
5. Missing required fields → Should fail
6. Invalid status transitions → Should fail

## Related Documentation

- [Policy Number Format](../fundamentals/03-policy-number-format.md)
- [Claims Data Model](../fundamentals/02-claims-data-model.md)
- [Common Errors](../troubleshooting/01-common-errors.md)
- [API Integration](../api-integration/01-claims-api-overview.md)

