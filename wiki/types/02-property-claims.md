# Property Insurance Claims

## Overview

Property insurance claims cover damage to buildings, structures, and personal property. These claims can result from various perils including fire, water damage, theft, windstorms, and natural disasters.

## Types of Property Claims

### Fire Damage Claims
- **Description**: Damage from fire, smoke, and heat
- **Common Causes**:
  - Electrical malfunctions
  - Cooking accidents
  - Heating system failures
  - Arson (investigated separately)
- **Typical Claim Amounts**: $5,000 - $500,000+
- **Processing Time**: 10-30 business days
- **Special Considerations**: Fire marshal reports, arson investigation

### Water Damage Claims
- **Description**: Damage from water intrusion
- **Common Causes**:
  - Burst pipes
  - Appliance leaks (water heater, washing machine)
  - Roof leaks
  - Basement flooding
  - Sump pump failures
- **Typical Claim Amounts**: $2,000 - $50,000+
- **Processing Time**: 7-21 business days
- **Special Considerations**: Mold remediation, water extraction urgency

### Windstorm and Hail Claims
- **Description**: Damage from severe weather
- **Common Causes**:
  - Tornadoes
  - Hurricanes
  - Hailstorms
  - High winds
  - Falling trees
- **Typical Claim Amounts**: $3,000 - $100,000+
- **Processing Time**: 7-20 business days
- **Special Considerations**: Weather service verification, widespread damage

### Theft and Burglary Claims
- **Description**: Stolen property or forced entry damage
- **Common Scenarios**:
  - Residential break-ins
  - Stolen electronics and jewelry
  - Forced entry damage
  - Vandalism during break-in
- **Typical Claim Amounts**: $1,000 - $25,000+
- **Processing Time**: 10-25 business days
- **Special Considerations**: Police reports, security system records

### Structural Damage Claims
- **Description**: Damage to building structure
- **Common Causes**:
  - Foundation issues
  - Roof damage
  - Wall cracks
  - Structural settling
- **Typical Claim Amounts**: $5,000 - $200,000+
- **Processing Time**: 14-45 business days
- **Special Considerations**: Engineering reports, structural assessments

## Required Information for Property Claims

### Property Information
- Property address
- Property type (residential, commercial)
- Square footage
- Year built
- Construction type

### Incident Details
- Date and time of incident
- Cause of damage
- Extent of damage
- Affected areas
- Weather conditions (if applicable)

### Damage Assessment
- Description of damage
- Photos of damage
- Repair estimates
- Replacement cost estimates
- Temporary housing needs (if applicable)

### Supporting Documentation
- Police reports (for theft)
- Fire marshal reports (for fire)
- Weather service reports (for weather damage)
- Contractor estimates
- Receipts for temporary expenses

## Common Property Claim Scenarios

### Scenario 1: Kitchen Fire
**Description**: Electrical fire in kitchen caused by refrigerator compressor malfunction

**Key Details**:
- Fire started in kitchen
- Spread to adjacent cabinets
- Smoke damage throughout main floor
- Fire department response time
- Temporary housing needed

**Typical Amount**: $20,000 - $50,000

**Processing Steps**:
1. Verify fire occurred (fire marshal report)
2. Assess structural damage
3. Evaluate smoke damage extent
4. Determine temporary housing needs
5. Obtain repair estimates
6. Process claim payment

### Scenario 2: Basement Flooding
**Description**: Sump pump failure during heavy rainfall

**Key Details**:
- Water level reached (inches)
- Finished vs unfinished basement
- Damage to appliances (water heater, furnace)
- Damage to flooring and drywall
- Mold remediation needed

**Typical Amount**: $10,000 - $35,000

**Processing Steps**:
1. Verify weather event occurred
2. Assess water damage extent
3. Check for mold growth
4. Evaluate appliance damage
5. Obtain restoration estimates
6. Process claim payment

### Scenario 3: Residential Break-In
**Description**: Forced entry through rear sliding glass door

**Key Details**:
- Entry point and method
- Stolen items inventory
- Damage to property
- Security system status
- Police report number

**Typical Amount**: $5,000 - $20,000

**Processing Steps**:
1. Verify break-in occurred (police report)
2. Review security footage
3. Inventory stolen items
4. Assess property damage
5. Verify item values
6. Process claim payment

### Scenario 4: Hail Damage to Roof
**Description**: Severe hailstorm damaged entire roof system

**Key Details**:
- Hail size (golf ball, tennis ball, etc.)
- Roof age and material
- Extent of damage (shingles, gutters, skylights)
- Neighbor damage reports
- Roofing contractor assessment

**Typical Amount**: $15,000 - $45,000

**Processing Steps**:
1. Verify weather event (weather service)
2. Inspect roof damage
3. Obtain roofing estimates
4. Determine if full replacement needed
5. Process claim payment

## Property Claim Data Model

### Specific Fields for Property Claims
```json
{
  "lossType": "Property",
  "propertyAddress": "1234 Main Street, Springfield, IL 62701",
  "propertyType": "Residential",
  "squareFootage": 2500,
  "yearBuilt": 2010,
  "incidentType": "Fire",
  "damageAreas": ["Kitchen", "Main Floor", "Second Floor"],
  "affectedRooms": ["Kitchen", "Living Room", "Master Bedroom"],
  "temporaryHousingNeeded": true,
  "policeReportNumber": "2025-12-12-1456",
  "fireMarshalReport": "Available",
  "contractorEstimates": [
    {
      "contractor": "ABC Restoration",
      "amount": 35000.00,
      "scope": "Full kitchen rebuild and smoke remediation"
    }
  ]
}
```

## Validation Rules for Property Claims

### Property Address
- Must be complete address
- Include street, city, state, zip
- Verify address matches policy

### Damage Description
- Must be detailed and specific
- Include affected areas
- Describe extent of damage
- Mention any safety concerns

### Claim Amount
- Must match repair estimates
- Should include all affected areas
- Consider temporary housing costs
- Include contents replacement if applicable

## Processing Workflow

### Step 1: Claim Submission
- Policyholder reports damage
- System validates policy coverage
- Initial damage assessment scheduled

### Step 2: Inspection
- Adjuster visits property
- Documents damage with photos
- Assesses repair needs
- Checks for safety hazards

### Step 3: Estimate Review
- Reviews contractor estimates
- Verifies estimate reasonableness
- Checks for duplicate work
- Negotiates if needed

### Step 4: Coverage Determination
- Verifies policy covers loss type
- Checks policy limits
- Applies deductible
- Determines covered amount

### Step 5: Settlement
- Authorizes payment
- Coordinates repairs
- Arranges temporary housing if needed
- Closes claim after completion

## Common Issues and Solutions

### Issue: Incomplete Damage Description
**Problem**: Description lacks detail
**Solution**: Include:
- What was damaged
- Where damage occurred
- Extent of damage
- Cause of damage

### Issue: Missing Documentation
**Problem**: No police reports or estimates
**Solution**: Request:
- Police reports for theft/fire
- Contractor estimates
- Weather service reports
- Photos of damage

### Issue: Underestimated Claim Amount
**Problem**: Initial estimate too low
**Solution**: 
- Obtain multiple estimates
- Include all affected areas
- Consider hidden damage
- Include temporary expenses

## Best Practices

1. **Document Everything**: Take photos immediately
2. **Prevent Further Damage**: Take reasonable steps to mitigate
3. **Keep Receipts**: Save all temporary expense receipts
4. **Multiple Estimates**: Get 2-3 contractor estimates
5. **Stay Organized**: Keep all documents together
6. **Communicate Promptly**: Respond to adjuster quickly

## Industry Statistics

- Average property claim amount: $10,000 - $15,000
- Most common claim type: Water damage (40%)
- Processing time: 10-20 days average
- Fraud rate: ~5-8% of claims
- Mobile submission: Growing trend

## Integration with Claims MCP

When creating property claims via Claims MCP:
- Use valid policy number format: POL-YYYY-NNNNN
- Provide detailed property address
- Include comprehensive damage description
- Set realistic claim amounts based on damage type
- Use appropriate loss type: "Property"

## Related Documentation

- [Claims Data Model](../fundamentals/02-claims-data-model.md)
- [Auto Claims](./01-auto-claims.md)
- [Health Claims](./03-health-claims.md)
- [Claim Lifecycle Stages](../lifecycle/01-claim-lifecycle-stages.md)

