# Common Errors and Solutions

## Policy Number Errors

### Error: Invalid Policy Number Format
**Error Message**: 
```
Policy number format is invalid. Expected POL-YYYY-NNNNN
```

**Cause**: Policy number doesn't match required format

**Solution**:
- Ensure format is exactly: `POL-YYYY-NNNNN`
- Year must be 4 digits (e.g., 2023, 2024)
- Sequence must be exactly 5 digits (e.g., 12345, 67890)

**Examples**:
- ❌ `POL-2023-123` → ✅ `POL-2023-12345`
- ❌ `POL-23-12345` → ✅ `POL-2023-12345`
- ❌ `POL-2023-123456` → ✅ `POL-2023-12345`

**Prevention**:
- Use validation function before submission
- Provide format examples in UI
- Auto-format user input

### Error: Policy Number Not Found
**Error Message**:
```
Policy number POL-2023-12345 not found in system
```

**Cause**: Policy doesn't exist or has been cancelled

**Solution**:
- Verify policy number is correct
- Check if policy is active
- Contact policy administration if needed

**Prevention**:
- Validate policy exists before claim creation
- Provide policy lookup functionality
- Show policy status in UI

## Date Validation Errors

### Error: Missing Required Date Field
**Error Message**:
```
required key [reportedDate] not found
```

**Cause**: Required date field missing from request

**Solution**:
- Include `reportedDate` in request
- Set to current timestamp if not provided
- Ensure both `incidentDate` and `reportedDate` are present

**Example Fix**:
```json
{
  "incidentDate": "2025-12-10T14:30:00Z",
  "reportedDate": "2025-12-10T15:00:00Z"  // Add this field
}
```

### Error: Future Incident Date
**Error Message**:
```
Incident date cannot be in the future
```

**Cause**: Incident date is set to future date

**Solution**:
- Use past date for incident
- Verify date is correct
- Check timezone settings

**Example Fix**:
- ❌ `"incidentDate": "2026-01-01T00:00:00Z"`
- ✅ `"incidentDate": "2025-12-10T14:30:00Z"`

### Error: Date Inconsistency
**Error Message**:
```
Reported date must be >= incident date
```

**Cause**: Reported date is before incident date

**Solution**:
- Ensure reportedDate is after or equal to incidentDate
- Set reportedDate automatically to current time
- Verify both dates are correct

**Example Fix**:
```json
{
  "incidentDate": "2025-12-10T14:30:00Z",
  "reportedDate": "2025-12-10T15:00:00Z"  // After incident date
}
```

## Amount Validation Errors

### Error: Invalid Claim Amount
**Error Message**:
```
Claim amount must be a positive number
```

**Cause**: Claim amount is zero, negative, or invalid format

**Solution**:
- Ensure amount is positive number
- Use 2 decimal places
- Verify numeric format

**Example Fix**:
- ❌ `"claimAmount": -1000` → ✅ `"claimAmount": 1000.00`
- ❌ `"claimAmount": 0` → ✅ `"claimAmount": 5000.00`
- ❌ `"claimAmount": "five thousand"` → ✅ `"claimAmount": 5000.00`

### Error: Approved Amount Exceeds Claim Amount
**Error Message**:
```
Approved amount cannot exceed claim amount
```

**Cause**: Approved amount is greater than original claim amount

**Solution**:
- Ensure approvedAmount <= claimAmount
- Verify both amounts are correct
- Check calculation logic

**Example Fix**:
```json
{
  "claimAmount": 5000.00,
  "approvedAmount": 4800.00  // Must be <= claimAmount
}
```

## Status Validation Errors

### Error: Invalid Status Value
**Error Message**:
```
Invalid status value. Must be one of: Open, Pending Review, Approved, Closed, Denied
```

**Cause**: Status value doesn't match allowed values

**Solution**:
- Use exact status values (case-sensitive)
- Check spelling and capitalization
- Use valid status transitions

**Valid Values**:
- `Open`
- `Pending Review`
- `Approved`
- `Closed`
- `Denied`

### Error: Invalid Status Transition
**Error Message**:
```
Invalid status transition from Closed to Open
```

**Cause**: Attempting invalid status change

**Solution**:
- Follow valid status transitions
- Cannot move from Closed to any other status
- Check current status before updating

**Valid Transitions**:
- Open → Pending Review → Approved → Closed
- Open → Pending Review → Denied → Closed
- Open → Approved → Closed (fast-track)

## Loss Type Errors

### Error: Invalid Loss Type
**Error Message**:
```
Invalid loss type. Must be one of: Auto, Property, Health
```

**Cause**: Loss type value is invalid

**Solution**:
- Use exact values: Auto, Property, or Health
- Check spelling and capitalization
- Match loss type to actual incident

**Valid Values**:
- `Auto`
- `Property`
- `Health`

## Contact Information Errors

### Error: Invalid Email Format
**Error Message**:
```
Invalid email format: john.doe@
```

**Cause**: Email address format is invalid

**Solution**:
- Use valid email format: `user@domain.com`
- Include domain and TLD
- Verify email is correct

**Example Fix**:
- ❌ `"john.doe@"` → ✅ `"john.doe@email.com"`
- ❌ `"john.doe"` → ✅ `"john.doe@email.com"`

### Error: Invalid Phone Format
**Error Message**:
```
Invalid phone format. Expected E.164 format
```

**Cause**: Phone number format is invalid

**Solution**:
- Use E.164 international format
- Include country code with +
- Format: `+[country code][number]`

**Example Fix**:
- ❌ `"5551234567"` → ✅ `"+15551234567"`
- ❌ `"1-555-123-4567"` → ✅ `"+15551234567"`

## API Integration Errors

### Error: 400 Bad Request
**Error Message**:
```
HTTP POST failed: bad request (400)
```

**Cause**: Request data is invalid

**Solution**:
- Check all required fields are present
- Validate data formats
- Verify JSON syntax
- Check field names match API spec

### Error: 401 Unauthorized
**Error Message**:
```
HTTP GET failed: unauthorized (401)
```

**Cause**: Authentication credentials invalid or missing

**Solution**:
- Verify client_id and client_secret are correct
- Check credentials are included in headers
- Ensure credentials haven't expired
- Verify API endpoint is correct

### Error: 404 Not Found
**Error Message**:
```
HTTP GET failed: not found (404)
```

**Cause**: Resource doesn't exist or URL is incorrect

**Solution**:
- Verify claim ID is correct
- Check API endpoint URL
- Ensure resource exists
- Verify API version in URL

### Error: 405 Method Not Allowed
**Error Message**:
```
HTTP POST failed: method not allowed (405)
```

**Cause**: HTTP method not supported for endpoint

**Solution**:
- Use correct HTTP method (GET, POST, PUT, DELETE)
- Check API documentation
- Verify endpoint supports method

## Data Quality Errors

### Error: Description Too Short
**Error Message**:
```
Description must be at least 50 characters
```

**Cause**: Description field is too brief

**Solution**:
- Provide detailed description (minimum 50 characters)
- Include what, when, where, why
- Add relevant details

**Example Fix**:
- ❌ `"Car accident"` (too short)
- ✅ `"Rear-end collision at traffic light intersection. Another vehicle failed to stop and rear-ended insured vehicle at approximately 35 mph. Significant damage to rear bumper and trunk."`

### Error: Missing Location
**Warning Message**:
```
Location field is empty. Location is highly recommended for accurate processing.
```

**Cause**: Location field not provided

**Solution**:
- Provide detailed location
- Include address, intersection, or landmark
- Add city, state, zip code

**Example Fix**:
- ❌ `""` (empty)
- ✅ `"Main Street & Oak Avenue, Springfield, IL 62701"`

## Prevention Strategies

### 1. Client-Side Validation
- Validate before API call
- Show errors immediately
- Prevent invalid submissions

### 2. Clear Error Messages
- Be specific about the issue
- Provide examples of correct format
- Tell user how to fix

### 3. Documentation
- Document all required fields
- Provide format examples
- Include validation rules

### 4. Testing
- Test with invalid data
- Test edge cases
- Test error scenarios

## Error Response Format

### Standard Error Response
```json
{
  "error": "Bad Request",
  "message": "required key [reportedDate] not found",
  "timestamp": "2025-12-16T05:15:16.650345932Z",
  "path": "/api/v1/claims",
  "field": "reportedDate",
  "code": "MISSING_REQUIRED_FIELD"
}
```

### Error Codes
- `INVALID_POLICY_FORMAT` - Policy number format invalid
- `POLICY_NOT_FOUND` - Policy doesn't exist
- `MISSING_REQUIRED_FIELD` - Required field missing
- `INVALID_DATE` - Date validation failed
- `INVALID_AMOUNT` - Amount validation failed
- `INVALID_STATUS` - Status value invalid
- `INVALID_LOSS_TYPE` - Loss type invalid
- `AUTHENTICATION_FAILED` - Authentication error
- `RESOURCE_NOT_FOUND` - Resource doesn't exist

## Related Documentation

- [Data Validation](../best-practices/01-data-validation.md)
- [Policy Number Format](../fundamentals/03-policy-number-format.md)
- [Claims API Overview](../api-integration/01-claims-api-overview.md)
- [Error Handling](../api-integration/03-error-handling.md)

