# Claim Submission Scenarios

## Common Submission Patterns

### Scenario 1: Mobile App Submission
**Context**: Policyholder submits claim via mobile app immediately after incident

**Typical Flow**:
1. Policyholder opens mobile app
2. Selects "File a Claim"
3. Enters policy number (auto-filled if available)
4. Selects loss type
5. Takes photos of damage
6. Enters incident details
7. Submits claim

**Data Quality**:
- ✅ Usually complete information
- ✅ Photos attached
- ✅ Real-time submission
- ⚠️ May need location verification

**Best Practices**:
- Auto-fill policy information when possible
- Use GPS for location
- Enable photo upload
- Provide clear guidance

### Scenario 2: Web Portal Submission
**Context**: Policyholder submits claim via web portal with detailed information

**Typical Flow**:
1. Policyholder logs into portal
2. Navigates to claims section
3. Fills out detailed form
4. Uploads documents
5. Reviews and submits

**Data Quality**:
- ✅ Usually very complete
- ✅ Documents attached
- ✅ Detailed descriptions
- ✅ All fields filled

**Best Practices**:
- Provide form validation
- Show progress indicators
- Allow save and resume
- Send confirmation email

### Scenario 3: Phone Submission
**Context**: Policyholder calls to report claim, agent enters data

**Typical Flow**:
1. Policyholder calls claims hotline
2. Agent collects information
3. Agent enters data into system
4. Agent confirms details
5. Claim submitted

**Data Quality**:
- ✅ Agent ensures completeness
- ✅ Real-time validation
- ⚠️ May have transcription errors
- ⚠️ Photos not immediately available

**Best Practices**:
- Use structured data entry
- Validate in real-time
- Request follow-up documentation
- Send confirmation

### Scenario 4: API Integration Submission
**Context**: Third-party system submits claim via API

**Typical Flow**:
1. External system collects claim data
2. Validates data format
3. Calls Claims API
4. Receives claim ID
5. Stores reference

**Data Quality**:
- ✅ Usually well-formatted
- ✅ Consistent structure
- ⚠️ May need data mapping
- ⚠️ Validation may differ

**Best Practices**:
- Provide clear API documentation
- Validate all inputs
- Return detailed errors
- Support webhooks for status updates

## Real-World Examples

### Example 1: Auto Accident - Rear-End Collision
```json
{
  "policyNumber": "POL-2023-12345",
  "lossType": "Auto",
  "claimAmount": 8500.00,
  "incidentDate": "2025-12-10T14:30:00Z",
  "reportedDate": "2025-12-10T15:00:00Z",
  "description": "Rear-end collision at traffic light intersection. Another vehicle failed to stop and rear-ended insured vehicle at approximately 35 mph. Significant damage to rear bumper, trunk, tailgate, and rear quarter panels. Whiplash injury reported, taken to emergency room for evaluation. Other driver cited for following too closely. Body shop estimate received.",
  "location": "Main Street & Oak Avenue, Springfield, IL 62701",
  "insuredName": "Robert Martinez",
  "insuredContactEmail": "robert.martinez@email.com",
  "insuredContactPhone": "+14155551234"
}
```

**Key Points**:
- Detailed description with speed, damage areas, injuries
- Includes police report reference
- Location is specific intersection
- All required fields present

### Example 2: Property Fire - Kitchen Fire
```json
{
  "policyNumber": "POL-2024-23456",
  "lossType": "Property",
  "claimAmount": 52000.00,
  "incidentDate": "2025-12-11T23:30:00Z",
  "reportedDate": "2025-12-12T08:00:00Z",
  "description": "Kitchen fire caused by electrical malfunction in refrigerator compressor. Fire spread to adjacent cabinets and caused extensive smoke damage throughout main floor. Fire department responded within 12 minutes. Structural damage to kitchen area, professional smoke remediation required. Temporary housing needed during repairs. Fire marshal report available.",
  "location": "4567 Pine Avenue, Phoenix, AZ 85001",
  "insuredName": "Sarah Johnson",
  "insuredContactEmail": "sarah.johnson@email.com",
  "insuredContactPhone": "+16025552345"
}
```

**Key Points**:
- Includes cause (electrical malfunction)
- Mentions fire department response
- Notes temporary housing need
- References fire marshal report

### Example 3: Health Claim - Slip and Fall
```json
{
  "policyNumber": "POL-2023-34567",
  "lossType": "Health",
  "claimAmount": 12000.00,
  "incidentDate": "2025-12-11T09:20:00Z",
  "reportedDate": "2025-12-11T10:00:00Z",
  "description": "Medical claim for emergency room visit following slip and fall on icy sidewalk at shopping center. X-rays revealed fractured wrist requiring cast. Doctor's visits, prescription medications, physical therapy sessions, and follow-up appointments required. Lost wages for 2 weeks due to inability to work. Medical records and bills available.",
  "location": "Shopping Center Parking Lot, 5678 Commerce Blvd, Chicago, IL 60601",
  "insuredName": "William Miller",
  "insuredContactEmail": "william.miller@email.com",
  "insuredContactPhone": "+14155557890"
}
```

**Key Points**:
- Includes injury details (fractured wrist)
- Lists treatment types
- Mentions lost wages
- References available documentation

## Validation Scenarios

### Valid Submission
✅ All required fields present
✅ Policy number format correct
✅ Dates are valid and consistent
✅ Amounts are positive numbers
✅ Contact information is valid
✅ Description is detailed

### Invalid Submission - Missing Field
❌ Missing `reportedDate`
**Error**: `required key [reportedDate] not found`
**Fix**: Add reportedDate field

### Invalid Submission - Wrong Policy Format
❌ Policy number: `POL-2023-123`
**Error**: `Invalid policy number format`
**Fix**: Use format `POL-YYYY-NNNNN` (5 digits)

### Invalid Submission - Future Date
❌ Incident date: `2026-01-01T00:00:00Z`
**Error**: `Incident date cannot be in the future`
**Fix**: Use past date

### Invalid Submission - Date Inconsistency
❌ Incident date: `2025-12-15`
❌ Reported date: `2025-12-10`
**Error**: `Reported date must be >= incident date`
**Fix**: Ensure reported date is after incident date

## Best Practices for Submission

### For Policyholders
1. **Submit Promptly**: File claim as soon as possible
2. **Be Detailed**: Provide comprehensive description
3. **Include Location**: Specify exact location
4. **Attach Photos**: Include photos when possible
5. **Keep Records**: Save claim confirmation

### For Developers
1. **Validate Early**: Validate before API call
2. **Provide Feedback**: Show validation errors immediately
3. **Auto-fill Data**: Pre-fill known information
4. **Guide Users**: Provide format examples
5. **Handle Errors**: Gracefully handle API errors

## Integration Patterns

### Mobile App Pattern
```javascript
// Validate before submission
const claim = {
    policyNumber: validatePolicyNumber(form.policyNumber),
    lossType: form.lossType,
    claimAmount: parseFloat(form.amount),
    incidentDate: form.incidentDate,
    reportedDate: new Date().toISOString(),
    description: form.description,
    location: getLocationFromGPS(),
    insuredName: userProfile.name,
    insuredContactEmail: userProfile.email,
    insuredContactPhone: userProfile.phone
};

// Submit via API
const response = await submitClaim(claim);
```

### API Integration Pattern
```javascript
// Transform external data format
const claim = transformToClaimFormat(externalData);

// Validate
validateClaim(claim);

// Submit
const response = await fetch('/api/v1/claims', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET
    },
    body: JSON.stringify(claim)
});
```

## Error Handling

### Common Errors and Solutions

#### Error: Invalid Policy Number Format
**Message**: `Policy number format is invalid`
**Solution**: Ensure format is POL-YYYY-NNNNN
**Example Fix**: Change `POL-2023-123` to `POL-2023-12345`

#### Error: Missing Required Field
**Message**: `required key [fieldName] not found`
**Solution**: Include all required fields
**Required Fields**: policyNumber, lossType, claimAmount, incidentDate, reportedDate, description, insuredName, insuredContactEmail, insuredContactPhone

#### Error: Date Validation Failed
**Message**: `Reported date must be >= incident date`
**Solution**: Ensure reportedDate is after or equal to incidentDate
**Best Practice**: Set reportedDate automatically to current time

#### Error: Invalid Loss Type
**Message**: `Invalid loss type. Must be one of: Auto, Property, Health`
**Solution**: Use valid loss type value
**Valid Values**: Auto, Property, Health

## Success Patterns

### Pattern 1: Complete Information
- All required fields present
- Detailed description
- Valid formats
- Consistent dates
- Realistic amounts

### Pattern 2: Quick Submission
- Minimal required fields
- Basic description
- Follow-up information later
- Fast initial submission

### Pattern 3: Documented Submission
- Complete information
- Photos attached
- Documents uploaded
- Witness information
- Police reports

## Related Documentation

- [Claims Data Model](../fundamentals/02-claims-data-model.md)
- [Policy Number Format](../fundamentals/03-policy-number-format.md)
- [Data Validation](../best-practices/01-data-validation.md)
- [Common Errors](../troubleshooting/01-common-errors.md)

