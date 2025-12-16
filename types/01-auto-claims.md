# Auto Insurance Claims

## Overview

Auto insurance claims cover losses related to vehicles, including accidents, theft, vandalism, and weather-related damage. These claims represent a significant portion of insurance claims and require specific handling procedures.

## Types of Auto Claims

### Collision Claims
- **Description**: Damage from vehicle-to-vehicle or vehicle-to-object collisions
- **Common Scenarios**:
  - Rear-end collisions
  - Side-swipe accidents
  - Head-on collisions
  - Parking lot incidents
  - Intersection accidents
- **Typical Claim Amounts**: $1,000 - $50,000+
- **Processing Time**: 5-15 business days

### Comprehensive Claims
- **Description**: Non-collision damage to vehicle
- **Common Scenarios**:
  - Theft of vehicle or parts
  - Vandalism (keying, broken windows)
  - Weather damage (hail, flood, wind)
  - Animal collisions
  - Fire damage
  - Falling objects
- **Typical Claim Amounts**: $500 - $30,000+
- **Processing Time**: 7-20 business days

### Liability Claims
- **Description**: Claims against policyholder for damage to others
- **Common Scenarios**:
  - Property damage to other vehicles
  - Bodily injury to other parties
  - Property damage to structures
- **Typical Claim Amounts**: $500 - $100,000+
- **Processing Time**: 10-30 business days

## Required Information for Auto Claims

### Basic Information
- Policy number (format: POL-YYYY-NNNNN)
- Incident date and time
- Location of incident
- Description of what happened
- Contact information

### Vehicle Information
- Vehicle make, model, year
- VIN (Vehicle Identification Number)
- License plate number
- Vehicle condition before incident

### Incident Details
- Type of collision or damage
- Weather conditions
- Road conditions
- Traffic conditions
- Speed at time of incident
- Direction of travel

### Other Parties
- Other driver information (if applicable)
- Witness contact information
- Police report number
- Officer name and badge number

## Common Auto Claim Scenarios

### Scenario 1: Rear-End Collision
**Description**: Vehicle stopped at traffic light, rear-ended by another vehicle

**Key Details**:
- Speed of impact
- Damage to rear bumper, trunk, tailgate
- Whiplash injuries
- Other driver cited for following too closely

**Typical Amount**: $3,000 - $8,000

**Processing Steps**:
1. Verify policy coverage
2. Obtain police report
3. Inspect vehicle damage
4. Review medical records (if injuries)
5. Approve or deny claim
6. Process payment

### Scenario 2: Hail Damage
**Description**: Severe hailstorm caused multiple dents and paint damage

**Key Details**:
- Size of hail stones
- Extent of damage (hood, roof, trunk, panels)
- Paint damage assessment
- Professional paintless dent removal estimate

**Typical Amount**: $2,000 - $15,000

**Processing Steps**:
1. Verify weather event occurred
2. Inspect vehicle for damage
3. Obtain repair estimates
4. Determine if total loss threshold met
5. Approve repair or total loss settlement

### Scenario 3: Vehicle Theft
**Description**: Vehicle stolen from parking garage

**Key Details**:
- Location where vehicle was parked
- Security footage availability
- Vehicle recovery status
- Personal items stolen
- Damage to ignition/steering column

**Typical Amount**: $5,000 - $50,000+ (vehicle value)

**Processing Steps**:
1. Verify theft with police report
2. Check security footage
3. Wait for recovery period (typically 30 days)
4. If not recovered, process total loss
5. If recovered, assess damage and repair

### Scenario 4: Vandalism
**Description**: Vehicle spray-painted and tires slashed

**Key Details**:
- Type of vandalism (graffiti, keying, tire damage)
- Security camera footage
- Police report filed
- Extent of damage requiring repair

**Typical Amount**: $1,500 - $6,000

**Processing Steps**:
1. Verify vandalism occurred
2. Review security footage
3. Obtain police report
4. Inspect damage
5. Approve repair estimate
6. Process payment

## Auto Claim Data Model

### Specific Fields for Auto Claims
```json
{
  "lossType": "Auto",
  "vehicleMake": "Toyota",
  "vehicleModel": "Camry",
  "vehicleYear": 2020,
  "vin": "4T1BF1FK5CU123456",
  "licensePlate": "ABC-1234",
  "incidentType": "Collision",
  "damageDescription": "Front bumper and headlight damage",
  "otherDriverInfo": {
    "name": "Jane Smith",
    "insurance": "State Farm",
    "policyNumber": "POL-2023-54321"
  },
  "policeReportNumber": "2025-12-10-0892",
  "witnesses": [
    {
      "name": "John Doe",
      "contact": "+15559876543"
    }
  ]
}
```

## Validation Rules for Auto Claims

### Policy Number
- Must follow format: POL-YYYY-NNNNN
- Must exist in policy system
- Policy must be active at time of incident

### Incident Date
- Must be in the past
- Cannot be more than 1 year old (typically)
- Must be within policy coverage period

### Claim Amount
- Must be positive number
- Typically ranges from $500 to $100,000+
- Should match repair estimates

### Location
- Should include street address or intersection
- Include city, state, zip code
- GPS coordinates helpful but not required

## Processing Workflow

### Step 1: Claim Submission
- Policyholder submits claim via mobile app, web portal, or phone
- System validates policy number format
- System checks policy is active
- Claim assigned unique claim ID

### Step 2: Initial Review
- Claim handler reviews submitted information
- Verifies policy coverage
- Checks for duplicate claims
- Assigns adjuster if needed

### Step 3: Investigation
- Adjuster contacts policyholder
- Reviews police reports
- Inspects vehicle damage
- Obtains repair estimates
- Interviews witnesses if applicable

### Step 4: Evaluation
- Determines fault (if applicable)
- Calculates claim amount
- Reviews policy coverage limits
- Checks for exclusions

### Step 5: Decision
- Approve claim and authorize payment
- Deny claim with explanation
- Request additional information

### Step 6: Settlement
- Process payment to policyholder or repair shop
- Close claim
- Update claim status

## Common Issues and Solutions

### Issue: Invalid Policy Number Format
**Error**: Policy number doesn't match required format
**Solution**: Ensure format is POL-YYYY-NNNNN (4-digit year, 5-digit sequence)
**Example Fix**: Change `POL-2023-123` to `POL-2023-12345`

### Issue: Missing Location Information
**Error**: Location field is empty
**Solution**: Provide detailed location (address, intersection, or landmark)
**Best Practice**: Include street address, city, state, and zip code

### Issue: Future Incident Date
**Error**: Incident date is in the future
**Solution**: Verify incident date is correct and in the past
**Validation**: System should reject future dates

### Issue: Insufficient Description
**Error**: Description too brief or missing details
**Solution**: Provide comprehensive description including:
- What happened
- When it happened
- Where it happened
- Who was involved
- Weather/road conditions

## Best Practices

1. **Complete Information**: Provide all required fields at submission
2. **Accurate Descriptions**: Be detailed and factual
3. **Timely Reporting**: Submit claims promptly after incident
4. **Documentation**: Attach photos, police reports, estimates
5. **Follow Up**: Respond promptly to adjuster inquiries
6. **Keep Records**: Maintain copies of all claim documents

## Industry Statistics

- Average auto claim amount: $3,000 - $5,000
- Most common claim type: Collision (40%)
- Processing time: 7-14 days average
- Fraud rate: ~10% of claims
- Mobile submission: Increasing trend

## Integration with Claims MCP

When creating auto claims via Claims MCP:
- Use valid policy number format: POL-YYYY-NNNNN
- Provide detailed incident description
- Include location information
- Set realistic claim amounts
- Use appropriate loss type: "Auto"

## Related Documentation

- [Claims Data Model](../fundamentals/02-claims-data-model.md)
- [Policy Number Format](../fundamentals/03-policy-number-format.md)
- [Claim Lifecycle Stages](../lifecycle/01-claim-lifecycle-stages.md)
- [Data Validation](../best-practices/01-data-validation.md)

