# Claims Management Quick Reference Guide

## Policy Number Format
```
POL-YYYY-NNNNN
```
- Year: 4 digits (2023, 2024, etc.)
- Sequence: Exactly 5 digits (10000-99999)
- Example: `POL-2023-12345`

## Claim ID Format
```
CLM-YYYY-NNNNNN
```
- Year: 4 digits
- Sequence: Exactly 6 digits
- Example: `CLM-2025-123456`

## Valid Loss Types
- `Auto`
- `Property`
- `Health`

## Valid Claim Statuses
- `Open` - Newly submitted claim
- `Pending Review` - Under investigation
- `Approved` - Payment authorized
- `Closed` - Finalized
- `Denied` - Rejected

## Status Transitions
```
Open → Pending Review → Approved → Closed
Open → Pending Review → Denied → Closed
Open → Approved → Closed (fast-track)
Open → Denied → Closed (immediate denial)
```

## Required Fields for Claim Creation
1. `policyNumber` - Format: POL-YYYY-NNNNN
2. `lossType` - Auto, Property, or Health
3. `claimAmount` - Positive number, 2 decimals
4. `incidentDate` - ISO 8601, must be in past
5. `reportedDate` - ISO 8601, >= incidentDate
6. `description` - Minimum 50 characters
7. `insuredName` - Full name
8. `insuredContactEmail` - Valid email format
9. `insuredContactPhone` - E.164 format (+15551234567)

## Optional but Recommended Fields
- `location` - Detailed address or landmark
- `adjusterName` - Assigned adjuster
- `adjusterEmail` - Adjuster contact

## Date Format
- **ISO 8601**: `YYYY-MM-DDTHH:mm:ssZ`
- **Example**: `2025-12-10T14:30:00Z`

## Amount Format
- **Currency**: 2 decimal places
- **Example**: `5000.00`
- **Range**: Typically $100 - $1,000,000+

## Common API Endpoints
- `GET /api/v1/claims` - List all claims (paginated)
- `POST /api/v1/claims` - Create new claim
- `GET /api/v1/claims/{claimId}` - Get claim details
- `PUT /api/v1/claims/{claimId}` - Update claim
- `DELETE /api/v1/claims/{claimId}` - Delete claim
- `GET /api/v1/claims/policy/{policyNumber}` - Get claims by policy
- `PATCH /api/v1/claims/{claimId}/status` - Update status

## Common Error Codes
- `INVALID_POLICY_FORMAT` - Policy number format wrong
- `POLICY_NOT_FOUND` - Policy doesn't exist
- `MISSING_REQUIRED_FIELD` - Required field missing
- `INVALID_DATE` - Date validation failed
- `INVALID_AMOUNT` - Amount validation failed
- `INVALID_STATUS` - Status value invalid
- `INVALID_LOSS_TYPE` - Loss type invalid

## Validation Rules Summary

### Policy Number
- Pattern: `^POL-[0-9]{4}-[0-9]{5}$`
- Must exist in policy system

### Dates
- Incident date: Must be in past
- Reported date: Must be >= incident date
- Both: ISO 8601 format

### Amounts
- Claim amount: Positive, 2 decimals
- Approved amount: <= claim amount, nullable

### Status
- Valid values only
- Follow transition rules
- Cannot move from Closed

### Contact Info
- Email: Valid email format
- Phone: E.164 format (+country code)

## Typical Processing Times
- **Auto Claims**: 12-21 days average
- **Property Claims**: 18-33 days average
- **Health Claims**: 18-34 days average

## Best Practices
1. ✅ Validate data before submission
2. ✅ Provide detailed descriptions
3. ✅ Include location information
4. ✅ Use correct date formats
5. ✅ Follow status transitions
6. ✅ Keep complete documentation
7. ✅ Respond promptly to requests
8. ✅ Maintain audit trails

## Quick Validation Checklist
- [ ] Policy number format correct (POL-YYYY-NNNNN)
- [ ] All required fields present
- [ ] Dates are valid and consistent
- [ ] Amounts are positive numbers
- [ ] Status transitions are valid
- [ ] Contact information is valid
- [ ] Description is detailed (50+ chars)
- [ ] Location provided (recommended)

## Related Documentation
- See [README.md](./README.md) for full documentation index
- See [Policy Number Format](./fundamentals/03-policy-number-format.md) for details
- See [Data Validation](./best-practices/01-data-validation.md) for validation rules
- See [Common Errors](./troubleshooting/01-common-errors.md) for troubleshooting

