# Claim Lifecycle Stages

## Overview

The claim lifecycle represents the journey of an insurance claim from initial submission through final resolution. Understanding each stage helps ensure proper processing and timely resolution.

## Lifecycle Stages

### 1. Submission (Open)
**Status**: `Open`

**Description**: Initial claim submission by policyholder

**Key Activities**:
- Claim submitted via mobile app, web portal, or phone
- Basic information collected
- Policy validated
- Claim ID assigned
- Initial acknowledgment sent

**Duration**: Immediate to 24 hours

**Next Stage**: Review or Pending Review

**Data Requirements**:
- Policy number (valid format)
- Loss type
- Claim amount
- Incident date
- Reported date
- Description
- Contact information

### 2. Initial Review
**Status**: `Open` or `Pending Review`

**Description**: Initial assessment of claim validity

**Key Activities**:
- Policy coverage verified
- Claim completeness checked
- Duplicate claim detection
- Initial risk assessment
- Adjuster assignment (if needed)

**Duration**: 1-3 business days

**Next Stage**: Investigation or Approval

**Decision Points**:
- Complete information → Proceed to investigation
- Missing information → Request additional details
- Clear-cut claim → May proceed directly to approval
- Suspicious claim → Enhanced investigation

### 3. Investigation (Pending Review)
**Status**: `Pending Review`

**Description**: Detailed investigation of claim

**Key Activities**:
- Adjuster contacts policyholder
- Damage/injury assessment
- Documentation review
- Witness interviews
- Expert consultations (if needed)
- Fraud detection checks

**Duration**: 5-20 business days (varies by claim type)

**Next Stage**: Evaluation or Approval/Denial

**Investigation Types**:
- **Auto Claims**: Vehicle inspection, police reports, witness statements
- **Property Claims**: Property inspection, contractor estimates, weather verification
- **Health Claims**: Medical records review, treatment verification, wage verification

### 4. Evaluation
**Status**: `Pending Review`

**Description**: Assessment of claim validity and amount

**Key Activities**:
- Coverage determination
- Fault assessment (if applicable)
- Damage/injury valuation
- Policy limit checks
- Deductible application
- Settlement calculation

**Duration**: 2-5 business days

**Next Stage**: Approval or Denial

**Evaluation Criteria**:
- Policy coverage for loss type
- Incident within coverage period
- Claim amount reasonableness
- Supporting documentation
- Policy exclusions check

### 5. Approval
**Status**: `Approved`

**Description**: Claim validated and payment authorized

**Key Activities**:
- Claim approved
- Approved amount set
- Payment authorized
- Adjuster assigned (if not already)
- Approval notification sent

**Duration**: 1-2 business days

**Next Stage**: Settlement

**Approval Conditions**:
- Valid policy coverage
- Covered loss type
- Reasonable claim amount
- Complete documentation
- No policy exclusions

### 6. Settlement
**Status**: `Approved` → `Closed`

**Description**: Payment processed and claim resolved

**Key Activities**:
- Payment processed
- Check issued or electronic transfer
- Payment confirmation sent
- Claim marked for closure
- Final documentation

**Duration**: 3-7 business days

**Next Stage**: Closure

**Payment Methods**:
- Direct deposit
- Check mailed
- Payment to repair shop
- Payment to healthcare provider

### 7. Closure
**Status**: `Closed`

**Description**: Claim finalized and archived

**Key Activities**:
- Claim closed
- Final status update
- Archive claim records
- Generate final reports
- Customer satisfaction survey

**Duration**: Immediate

**Final State**: No further changes allowed

**Closure Conditions**:
- Payment processed
- All documentation complete
- No outstanding issues
- Customer notified

### 8. Denial (Alternative Path)
**Status**: `Denied`

**Description**: Claim rejected, no payment

**Key Activities**:
- Claim denied
- Denial reason documented
- Denial letter sent
- Appeal process explained (if applicable)
- Claim marked for closure

**Duration**: 1-3 business days

**Next Stage**: Closure or Appeal

**Denial Reasons**:
- Not covered by policy
- Policy exclusion applies
- Fraud detected
- Insufficient documentation
- Outside coverage period

## Status Transition Rules

### Valid Transitions

```
Open → Pending Review → Approved → Closed
Open → Pending Review → Denied → Closed
Open → Approved → Closed (fast-track)
Open → Denied → Closed (immediate denial)
```

### Invalid Transitions

```
❌ Closed → Any other status (final state)
❌ Approved → Denied (without appeal process)
❌ Denied → Approved (without appeal)
❌ Any status → Open (cannot revert)
```

## Stage Duration Guidelines

### Auto Claims
- Submission: Immediate
- Review: 1-2 days
- Investigation: 5-10 days
- Evaluation: 2-3 days
- Approval: 1 day
- Settlement: 3-5 days
- **Total**: 12-21 days average

### Property Claims
- Submission: Immediate
- Review: 1-3 days
- Investigation: 7-15 days
- Evaluation: 3-5 days
- Approval: 1-2 days
- Settlement: 5-7 days
- **Total**: 18-33 days average

### Health Claims
- Submission: Immediate
- Review: 1-2 days
- Investigation: 10-20 days
- Evaluation: 3-5 days
- Approval: 1-2 days
- Settlement: 3-5 days
- **Total**: 18-34 days average

## Factors Affecting Processing Time

### Accelerating Factors
- Complete information at submission
- Clear-cut claim scenarios
- Good documentation
- Responsive policyholder
- Simple claim types

### Delaying Factors
- Missing information
- Complex investigations
- Multiple parties involved
- Fraud indicators
- Large claim amounts
- Disputed liability
- Multiple adjusters involved

## Status Update Notifications

### Automated Notifications
- Claim submitted → Confirmation email/SMS
- Status changed → Update notification
- Payment processed → Payment confirmation
- Claim closed → Final notification

### Manual Notifications
- Adjuster assignment → Phone call or email
- Additional information needed → Request notification
- Claim denied → Denial letter with explanation

## Metrics and KPIs

### Key Performance Indicators
- **Average Processing Time**: Target < 20 days
- **First Contact Resolution**: Target > 80%
- **Customer Satisfaction**: Target > 90%
- **Approval Rate**: Industry average 85-90%
- **Fraud Detection Rate**: Target < 5%

### Stage-Specific Metrics
- Time in each stage
- Stage transition rates
- Bottleneck identification
- Adjuster workload
- Claim complexity scores

## Best Practices

1. **Fast Initial Response**: Acknowledge claims within 24 hours
2. **Clear Communication**: Keep policyholders informed
3. **Efficient Investigation**: Complete investigation promptly
4. **Fair Evaluation**: Consistent evaluation criteria
5. **Timely Payment**: Process payments quickly
6. **Documentation**: Maintain complete records

## Integration with Claims MCP

When working with Claims MCP:
- Monitor claim status transitions
- Update status appropriately
- Provide status update reasons
- Track time in each stage
- Generate status reports

## Related Documentation

- [Claim Creation Process](./02-claim-creation-process.md)
- [Claim Review and Approval](./03-claim-review-approval.md)
- [Claim Settlement](./04-claim-settlement.md)
- [Claims Data Model](../fundamentals/02-claims-data-model.md)

