# Health Insurance Claims

## Overview

Health insurance claims cover medical expenses, disability benefits, and personal injury costs. These claims involve medical documentation, treatment records, and often require coordination with healthcare providers.

## Types of Health Claims

### Medical Expense Claims
- **Description**: Reimbursement for medical treatment costs
- **Common Scenarios**:
  - Emergency room visits
  - Doctor visits
  - Prescription medications
  - Physical therapy
  - Diagnostic tests
- **Typical Claim Amounts**: $500 - $50,000+
- **Processing Time**: 7-21 business days

### Personal Injury Claims
- **Description**: Medical expenses from accidents or injuries
- **Common Scenarios**:
  - Slip and fall injuries
  - Workplace accidents
  - Motor vehicle accident injuries
  - Sports injuries
- **Typical Claim Amounts**: $1,000 - $100,000+
- **Processing Time**: 14-45 business days
- **Special Considerations**: Liability determination, third-party claims

### Disability Claims
- **Description**: Income replacement during disability
- **Common Scenarios**:
  - Temporary disability
  - Long-term disability
  - Work-related disability
- **Typical Claim Amounts**: $2,000 - $200,000+
- **Processing Time**: 30-90 business days
- **Special Considerations**: Medical certification, return-to-work dates

### Lost Wages Claims
- **Description**: Compensation for lost income due to injury
- **Common Scenarios**:
  - Time off work for treatment
  - Recovery period
  - Disability period
- **Typical Claim Amounts**: $500 - $50,000+
- **Processing Time**: 14-30 business days
- **Special Considerations**: Employment verification, wage documentation

## Required Information for Health Claims

### Medical Information
- Date of injury/illness
- Description of injury/illness
- Treatment received
- Healthcare provider information
- Medical records and bills

### Employment Information
- Employer name and contact
- Job title and duties
- Wage/salary information
- Time off work dates
- Return-to-work date

### Incident Information
- How injury occurred
- Where injury occurred
- Witnesses (if applicable)
- Police report (if applicable)
- Weather/conditions (if applicable)

### Documentation
- Medical bills and receipts
- Doctor's notes and reports
- Prescription receipts
- Physical therapy records
- Employment verification
- Wage statements

## Common Health Claim Scenarios

### Scenario 1: Slip and Fall Injury
**Description**: Fractured wrist from slip and fall on icy sidewalk

**Key Details**:
- Location of fall
- Weather conditions
- Injury type and severity
- Emergency room visit
- Follow-up treatment needed
- Lost wages

**Typical Amount**: $5,000 - $15,000

**Processing Steps**:
1. Verify incident occurred
2. Review medical records
3. Assess injury severity
4. Calculate medical expenses
5. Calculate lost wages
6. Process claim payment

### Scenario 2: Emergency Room Visit
**Description**: Emergency room visit following vehicle accident

**Key Details**:
- Reason for ER visit
- Treatment received
- Diagnostic tests performed
- Follow-up care needed
- Prescription medications

**Typical Amount**: $2,000 - $10,000

**Processing Steps**:
1. Verify ER visit occurred
2. Review medical records
3. Verify treatment was necessary
4. Process medical bills
5. Process claim payment

### Scenario 3: Physical Therapy
**Description**: Physical therapy sessions following injury

**Key Details**:
- Number of sessions
- Type of therapy
- Progress reports
- Doctor's prescription
- Treatment duration

**Typical Amount**: $1,500 - $5,000

**Processing Steps**:
1. Verify doctor's prescription
2. Review therapy records
3. Assess treatment necessity
4. Process therapy bills
5. Process claim payment

## Health Claim Data Model

### Specific Fields for Health Claims
```json
{
  "lossType": "Health",
  "injuryType": "Fracture",
  "injuryLocation": "Wrist",
  "incidentType": "Slip and Fall",
  "medicalProviders": [
    {
      "name": "Springfield General Hospital",
      "type": "Emergency Room",
      "date": "2025-12-10",
      "amount": 3500.00
    },
    {
      "name": "Dr. Smith Orthopedics",
      "type": "Specialist",
      "date": "2025-12-15",
      "amount": 500.00
    }
  ],
  "prescriptions": [
    {
      "medication": "Pain Reliever",
      "cost": 50.00
    }
  ],
  "lostWages": {
    "startDate": "2025-12-10",
    "endDate": "2025-12-24",
    "weeklyWage": 1000.00,
    "totalLost": 2000.00
  },
  "totalMedicalExpenses": 4050.00,
  "totalClaimAmount": 6050.00
}
```

## Validation Rules for Health Claims

### Medical Documentation
- Must include medical bills
- Doctor's notes required
- Treatment must be related to incident
- Dates must be consistent

### Lost Wages
- Employment verification required
- Wage statements needed
- Time off must be medically necessary
- Doctor's note required for extended time off

### Claim Amount
- Must match medical bills
- Should include all related expenses
- Lost wages must be documented
- Prescription costs included

## Processing Workflow

### Step 1: Claim Submission
- Policyholder submits claim
- Medical bills attached
- Incident description provided

### Step 2: Medical Review
- Medical records reviewed
- Treatment necessity assessed
- Bills verified
- Coverage determined

### Step 3: Wage Verification
- Employment verified
- Wages confirmed
- Time off verified
- Lost wages calculated

### Step 4: Coverage Determination
- Policy coverage checked
- Deductible applied
- Co-pays calculated
- Covered amount determined

### Step 5: Settlement
- Medical expenses paid
- Lost wages paid (if covered)
- Claim closed
- Explanation of benefits sent

## Common Issues and Solutions

### Issue: Missing Medical Bills
**Problem**: Medical bills not provided
**Solution**: Request:
- Itemized medical bills
- Explanation of benefits
- Receipts for prescriptions
- Physical therapy bills

### Issue: Incomplete Medical Records
**Problem**: Missing doctor's notes
**Solution**: Request:
- Doctor's diagnosis
- Treatment plan
- Progress notes
- Return-to-work clearance

### Issue: Unclear Injury Cause
**Problem**: How injury occurred unclear
**Solution**: Request:
- Detailed incident description
- Witness statements
- Police report (if applicable)
- Photos of injury location

## Best Practices

1. **Keep All Receipts**: Save all medical bills and receipts
2. **Document Everything**: Keep detailed records of treatment
3. **Submit Promptly**: Submit claims as soon as possible
4. **Follow Treatment**: Complete recommended treatment
5. **Communicate**: Keep insurer informed of treatment progress
6. **Organize Documents**: Keep all medical records organized

## Industry Statistics

- Average health claim amount: $3,000 - $8,000
- Most common claim type: Emergency room visits (35%)
- Processing time: 10-20 days average
- Fraud rate: ~3-5% of claims
- Mobile submission: Increasing trend

## Integration with Claims MCP

When creating health claims via Claims MCP:
- Use valid policy number format: POL-YYYY-NNNNN
- Provide detailed incident description
- Include medical expense breakdown
- Set realistic claim amounts
- Use appropriate loss type: "Health"
- Include lost wages if applicable

## Related Documentation

- [Claims Data Model](../fundamentals/02-claims-data-model.md)
- [Auto Claims](./01-auto-claims.md)
- [Property Claims](./02-property-claims.md)
- [Claim Lifecycle Stages](../lifecycle/01-claim-lifecycle-stages.md)

