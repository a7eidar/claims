# Insurance Claims Management Documentation

Welcome to the Insurance Claims Management Documentation wiki. This comprehensive documentation provides context and guidance for insurance claims processing systems.

## 📚 Documentation Index

### Fundamentals
- [Insurance Claims Overview](./fundamentals/01-insurance-claims-overview.md)
- [Claims Data Model](./fundamentals/02-claims-data-model.md)
- [Policy Number Format](./fundamentals/03-policy-number-format.md)
- [Claim Status Workflow](./fundamentals/04-claim-status-workflow.md)

### Claim Types
- [Auto Claims](./types/01-auto-claims.md)
- [Property Claims](./types/02-property-claims.md)
- [Health Claims](./types/03-health-claims.md)

### Lifecycle Management
- [Claim Lifecycle Stages](./lifecycle/01-claim-lifecycle-stages.md)

### API Integration
- [Claims API Overview](./api-integration/01-claims-api-overview.md)

### Best Practices
- [Data Validation](./best-practices/01-data-validation.md)

### Common Scenarios
- [Claim Submission Scenarios](./scenarios/01-claim-submission-scenarios.md)

### Troubleshooting
- [Common Errors and Solutions](./troubleshooting/01-common-errors.md)

### Compliance
- [Regulatory Requirements](./compliance/01-regulatory-requirements.md)

### Quick Reference
- [Quick Reference Guide](./QUICK_REFERENCE.md)

## 🎯 Purpose

This documentation is designed to:
- Provide comprehensive context for AI agents working with claims management systems
- Enhance understanding of insurance domain concepts
- Support intelligent decision-making in claims processing workflows
- Enable better error handling and validation
- Improve API integration patterns

## 🔗 Integration with Claims MCP

This documentation complements the Claims MCP server by providing:
- Domain knowledge for better claim processing
- Context-aware suggestions for claim creation
- Validation rules and business logic
- Industry-standard practices
- Regulatory compliance guidance

## 📖 Quick Start

### Policy Number Format
```
POL-YYYY-NNNNN
```
- Year: 4 digits (2023, 2024, etc.)
- Sequence: Exactly 5 digits (10000-99999)
- Example: `POL-2023-12345`

### Valid Loss Types
- `Auto`
- `Property`
- `Health`

### Valid Claim Statuses
- `Open` - Newly submitted claim
- `Pending Review` - Under investigation
- `Approved` - Payment authorized
- `Closed` - Finalized
- `Denied` - Rejected

For detailed information, see the [Quick Reference Guide](./QUICK_REFERENCE.md).

