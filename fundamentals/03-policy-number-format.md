# Policy Number Format Specification

## Format Definition

### Standard Format
```
POL-YYYY-NNNNN
```

Where:
- `POL-` is the literal prefix
- `YYYY` is a 4-digit year (e.g., 2023, 2024)
- `-` is a literal hyphen separator
- `NNNNN` is exactly 5 digits (10000-99999)

### Regular Expression Pattern
```regex
^POL-[0-9]{4}-[0-9]{5}$
```

## Validation Rules

### Year Component (YYYY)
- **Length**: Exactly 4 digits
- **Range**: Typically 2020-2099 (business-dependent)
- **Format**: Numeric only
- **Examples**:
  - ✅ Valid: `2023`, `2024`, `2025`
  - ❌ Invalid: `23` (only 2 digits)
  - ❌ Invalid: `20234` (5 digits)

### Sequence Component (NNNNN)
- **Length**: Exactly 5 digits
- **Range**: 10000 to 99999
- **Format**: Numeric only, no leading zeros required
- **Examples**:
  - ✅ Valid: `12345`, `67890`, `10000`, `99999`
  - ❌ Invalid: `123` (only 3 digits)
  - ❌ Invalid: `123456` (6 digits)
  - ❌ Invalid: `01234` (leading zero, but 5 digits total - actually valid if treated as string)

## Valid Examples

```
POL-2023-12345
POL-2024-67890
POL-2023-10000
POL-2024-99999
POL-2025-45678
POL-2023-98765
```

## Invalid Examples

```
POL-2023-123        ❌ Only 3 digits in sequence
POL-23-12345        ❌ Year only 2 digits
POL-2023-123456     ❌ Sequence has 6 digits
POL-20234-12345     ❌ Year has 5 digits
POL-2023-1234       ❌ Sequence only 4 digits
POL2023-12345       ❌ Missing hyphen after POL
POL-2023 12345      ❌ Missing hyphen before sequence
pol-2023-12345      ❌ Lowercase prefix (case-sensitive)
```

## Implementation Guidelines

### JavaScript/TypeScript Validation
```javascript
function isValidPolicyNumber(policyNumber) {
    const pattern = /^POL-[0-9]{4}-[0-9]{5}$/;
    return pattern.test(policyNumber);
}

// Generate valid policy number
function generatePolicyNumber(year = new Date().getFullYear()) {
    const sequence = Math.floor(Math.random() * 90000) + 10000;
    return `POL-${year}-${sequence}`;
}
```

### Python Validation
```python
import re

def is_valid_policy_number(policy_number):
    pattern = r'^POL-[0-9]{4}-[0-9]{5}$'
    return bool(re.match(pattern, policy_number))

def generate_policy_number(year=None):
    if year is None:
        year = datetime.now().year
    sequence = random.randint(10000, 99999)
    return f"POL-{year}-{sequence:05d}"
```

### Java Validation
```java
import java.util.regex.Pattern;

public class PolicyNumberValidator {
    private static final Pattern POLICY_PATTERN = 
        Pattern.compile("^POL-[0-9]{4}-[0-9]{5}$");
    
    public static boolean isValid(String policyNumber) {
        return POLICY_PATTERN.matcher(policyNumber).matches();
    }
}
```

### DataWeave Validation
```dataweave
%dw 2.0
output application/json

fun isValidPolicyNumber(policyNumber: String): Boolean = 
    policyNumber matches /^POL-[0-9]{4}-[0-9]{5}$/
```

## Postman Pre-request Script

```javascript
// Generate year (2023 or 2024)
const year = Math.random() > 0.5 ? "2023" : "2024";

// Generate 5-digit policy sequence number (10000-99999)
const randomSeq = Math.floor(Math.random() * 90000) + 10000;

// Set complete policy number
pm.environment.set("policyNumber", `POL-${year}-${randomSeq}`);
```

## Business Rules

### Policy Number Assignment
- Policy numbers are assigned when a policy is created
- Year component typically matches policy inception year
- Sequence numbers are unique within the year
- Policy numbers are immutable (cannot be changed)

### Policy Number Lookup
- Policy numbers must exist in the policy system before claim creation
- Claims reference policies by policy number
- Policy validation occurs during claim submission

### Year Component Logic
- Typically represents policy inception year
- May represent policy renewal year
- Business logic determines year assignment rules

### Sequence Component Logic
- Sequential numbering within year
- May include gaps for deleted policies
- Range ensures sufficient capacity (90,000 policies per year)

## Common Validation Errors

### Error: "Invalid policy number format"
- **Cause**: Policy number doesn't match pattern
- **Solution**: Ensure format is POL-YYYY-NNNNN
- **Check**: Year is 4 digits, sequence is 5 digits

### Error: "Policy number not found"
- **Cause**: Policy doesn't exist in system
- **Solution**: Verify policy number is correct
- **Check**: Policy may have been cancelled or expired

### Error: "Policy number already in use"
- **Cause**: Duplicate policy number assignment
- **Solution**: Generate new unique sequence number
- **Check**: Verify uniqueness within year

## Integration Considerations

### API Validation
- Validate policy number format before processing
- Return clear error messages for invalid formats
- Provide examples in error responses

### Database Storage
- Store as VARCHAR with length 15 (POL-YYYY-NNNNN = 13 chars)
- Index policy number for fast lookups
- Consider partitioning by year for large datasets

### External System Integration
- Policy numbers may come from external policy systems
- Validate format before accepting external data
- Map between different policy number formats if needed

## Testing Scenarios

### Valid Policy Numbers
- Test with various years (2020-2099)
- Test with sequence ranges (10000-99999)
- Test edge cases (10000, 99999)

### Invalid Policy Numbers
- Test with wrong prefix (pol-, POL, pol)
- Test with wrong year length (2, 3, 5 digits)
- Test with wrong sequence length (1-4, 6+ digits)
- Test with missing hyphens
- Test with special characters

## Best Practices

1. **Always Validate**: Validate format before processing
2. **Clear Error Messages**: Provide specific format requirements in errors
3. **Consistent Formatting**: Use consistent format across all systems
4. **Documentation**: Document format requirements clearly
5. **Testing**: Test validation with edge cases
6. **User Guidance**: Provide format examples in UI/API docs

## Related Documentation

- [Claims Data Model](./02-claims-data-model.md)
- [Data Validation](./best-practices/01-data-validation.md)
- [Common Errors](./troubleshooting/01-common-errors.md)

