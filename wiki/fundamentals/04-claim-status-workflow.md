# Claim Status Workflow

## Status Definitions

### Open
**Description**: Claim has been submitted and is awaiting initial review

**Characteristics**:
- Newly submitted claim
- Basic information collected
- Not yet assigned to adjuster
- Initial validation completed

**Typical Duration**: 1-3 business days

**Next Actions**:
- Initial review by claim handler
- Policy verification
- Completeness check
- Adjuster assignment (if needed)

**Can Transition To**:
- Pending Review
- Approved (fast-track)
- Denied (immediate denial)

### Pending Review
**Description**: Claim is under investigation and review

**Characteristics**:
- Assigned to adjuster
- Investigation in progress
- Documentation being collected
- Evaluation underway

**Typical Duration**: 5-20 business days

**Next Actions**:
- Adjuster investigation
- Damage/injury assessment
- Documentation review
- Coverage determination

**Can Transition To**:
- Approved
- Denied

### Approved
**Description**: Claim has been validated and payment authorized

**Characteristics**:
- Claim approved for payment
- Approved amount set
- Payment authorized
- Ready for settlement

**Typical Duration**: 1-2 business days

**Next Actions**:
- Process payment
- Issue check or transfer
- Send payment confirmation
- Prepare for closure

**Can Transition To**:
- Closed

### Closed
**Description**: Claim has been resolved and finalized

**Characteristics**:
- Payment processed (if approved)
- All documentation complete
- Final status
- No further changes allowed

**Typical Duration**: Final state

**Next Actions**:
- Archive claim records
- Generate final reports
- Customer satisfaction survey

**Can Transition To**:
- None (final state)

### Denied
**Description**: Claim has been rejected, no payment authorized

**Characteristics**:
- Claim rejected
- Denial reason documented
- No payment made
- May be appealed

**Typical Duration**: 1-3 business days

**Next Actions**:
- Send denial letter
- Explain appeal process (if applicable)
- Close claim

**Can Transition To**:
- Closed
- Appeal process (external)

## Status Transition Diagram

```
                    ┌─────────┐
                    │  Open   │
                    └────┬────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
        ▼                ▼                ▼
┌───────────────┐  ┌──────────┐  ┌──────────┐
│Pending Review │  │ Approved │  │  Denied  │
└───────┬───────┘  └────┬─────┘  └────┬─────┘
        │               │              │
        │               │              │
        └───────┬───────┴──────┬───────┘
                │              │
                ▼              ▼
           ┌─────────┐    ┌─────────┐
           │ Closed  │    │ Closed  │
           └─────────┘    └─────────┘
```

## Business Rules

### Rule 1: Open Status
- All new claims start as "Open"
- Can move to Pending Review, Approved, or Denied
- Cannot move back to Open from any other status

### Rule 2: Pending Review Status
- Assigned during investigation
- Can move to Approved or Denied
- Cannot skip to Closed without approval/denial

### Rule 3: Approved Status
- Payment must be authorized
- Approved amount must be set
- Can only move to Closed
- Cannot move back to any other status

### Rule 4: Closed Status
- Final state, no further changes
- Cannot transition to any other status
- Represents completed claim lifecycle

### Rule 5: Denied Status
- Claim rejected, no payment
- Denial reason must be documented
- Can move to Closed
- May have external appeal process

## Status Update Requirements

### Updating to Pending Review
**Required**:
- Adjuster assignment
- Investigation start date
- Initial assessment

**Optional**:
- Notes about investigation
- Additional documentation requests

### Updating to Approved
**Required**:
- Approved amount
- Approval date
- Approver information

**Optional**:
- Approval notes
- Payment method
- Payment schedule

### Updating to Denied
**Required**:
- Denial reason
- Denial date
- Denier information

**Optional**:
- Appeal information
- Additional explanation

### Updating to Closed
**Required**:
- Closure date
- Final status
- Closure reason

**Optional**:
- Payment confirmation
- Customer feedback

## Status Update API

### Update Status Endpoint
```
PATCH /api/v1/claims/{claimId}/status
```

### Request Body
```json
{
  "newStatus": "Approved",
  "updatedBy": "Jane Smith",
  "reason": "All documents verified and approved",
  "approvedAmount": 4800.00
}
```

### Response
```json
{
  "message": "Claim status updated successfully",
  "claimId": "CLM-2025-123456",
  "previousStatus": "Pending Review",
  "newStatus": "Approved",
  "updatedBy": "Jane Smith",
  "updatedDate": "2025-12-16T10:00:00Z"
}
```

## Status History Tracking

### Status History Record
```json
{
  "status": "Approved",
  "changedBy": "Jane Smith",
  "changedDate": "2025-12-16T10:00:00Z",
  "reason": "All documents verified",
  "notes": "Approved amount: $4,800.00"
}
```

### Complete Status History
```json
{
  "claimId": "CLM-2025-123456",
  "statusHistory": [
    {
      "status": "Open",
      "changedDate": "2025-12-10T15:00:00Z",
      "changedBy": "System"
    },
    {
      "status": "Pending Review",
      "changedDate": "2025-12-11T09:00:00Z",
      "changedBy": "John Doe"
    },
    {
      "status": "Approved",
      "changedDate": "2025-12-16T10:00:00Z",
      "changedBy": "Jane Smith"
    },
    {
      "status": "Closed",
      "changedDate": "2025-12-20T14:00:00Z",
      "changedBy": "System"
    }
  ]
}
```

## Automated Status Updates

### System-Initiated Updates
- **Open → Pending Review**: Auto-assign after 24 hours
- **Approved → Closed**: Auto-close after payment processed
- **Status Reminders**: Notify if status unchanged for extended period

### User-Initiated Updates
- Adjuster updates status during investigation
- Claim handler approves/denies
- System closes after completion

## Status Notifications

### Email Notifications
- Status change notifications
- Approval notifications
- Denial notifications
- Payment confirmations

### SMS Notifications
- Status change alerts
- Important updates
- Payment confirmations

### In-App Notifications
- Real-time status updates
- Action required alerts
- Document requests

## Best Practices

1. **Update Promptly**: Change status as soon as action occurs
2. **Document Reasons**: Always include reason for status change
3. **Notify Stakeholders**: Keep policyholder informed
4. **Track History**: Maintain complete status history
5. **Follow Workflow**: Don't skip status transitions
6. **Audit Trail**: Log all status changes

## Integration with Claims MCP

When updating claim status via Claims MCP:
- Validate status transition is allowed
- Provide reason for status change
- Update all related fields
- Send notifications
- Log status change

## Related Documentation

- [Claim Lifecycle Stages](../lifecycle/01-claim-lifecycle-stages.md)
- [Claim Review and Approval](../lifecycle/03-claim-review-approval.md)
- [Status Update Scenarios](../scenarios/02-status-update-scenarios.md)
- [Audit Trails](../compliance/03-audit-trails.md)

