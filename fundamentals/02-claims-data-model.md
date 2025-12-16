# Claims Data Model

## Core Claim Entity

### Claim Object Structure

```json
{
  "claimId": "CLM-2025-123456",
  "claimNumber": "CLM-2025-123456",
  "policyNumber": "POL-2023-12345",
  "claimStatus": "Open",
  "lossType": "Auto",
  "claimAmount": 5000.00,
  "approvedAmount": null,
  "incidentDate": "2025-12-10T14:30:00Z",
  "reportedDate": "2025-12-10T15:00:00Z",
  "description": "Rear-end collision at traffic light",
  "location": "Main Street & Oak Avenue, Springfield, IL",
  "insuredName": "John Doe",
  "insuredContactEmail": "john.doe@email.com",
  "insuredContactPhone": "+15551234567",
  "adjusterName": null,
  "adjusterEmail": null,
  "createdDate": "2025-12-10T15:00:00Z",
  "lastModifiedDate": "2025-12-10T15:00:00Z",
  "notes": []
}
```

## Field Definitions

### Identification Fields

#### claimId
- **Type**: String
- **Format**: `CLM-YYYY-NNNNNN`
- **Pattern**: `^CLM-[0-9]{4}-[0-9]{6}$`
- **Description**: Unique system-generated claim identifier
- **Example**: `CLM-2025-123456`
- **Immutable**: Yes, cannot be changed after creation

#### claimNumber
- **Type**: String
- **Format**: Same as claimId
- **Description**: Human-readable claim reference number
- **Usage**: Displayed to customers and used in communications

#### policyNumber
- **Type**: String
- **Format**: `POL-YYYY-NNNNN`
- **Pattern**: `^POL-[0-9]{4}-[0-9]{5}$`
- **Description**: Associated insurance policy number
- **Validation**: Must exist in policy system
- **Examples**:
  - ✅ Valid: `POL-2023-12345`
  - ✅ Valid: `POL-2024-67890`
  - ❌ Invalid: `POL-2023-123` (only 3 digits)
  - ❌ Invalid: `POL-23-12345` (year not 4 digits)

### Status Fields

#### claimStatus
- **Type**: Enumeration
- **Valid Values**:
  - `Open`: Claim submitted, awaiting review
  - `Pending Review`: Under investigation
  - `Approved`: Claim validated, payment authorized
  - `Closed`: Claim resolved and finalized
  - `Denied`: Claim rejected, no payment
- **State Transitions**:
  ```
  Open → Pending Review → Approved → Closed
  Open → Pending Review → Denied → Closed
  ```
- **Business Rules**:
  - Cannot move from Closed to any other state
  - Cannot move from Denied to Approved without appeal
  - Approved claims can be closed after payment

#### lossType
- **Type**: Enumeration
- **Valid Values**:
  - `Auto`: Vehicle-related claims
  - `Property`: Property damage claims
  - `Health`: Medical and health-related claims
- **Description**: Category of loss or damage
- **Impact**: Determines processing workflow and adjuster assignment

### Financial Fields

#### claimAmount
- **Type**: Decimal/Number
- **Format**: Currency amount with 2 decimal places
- **Range**: Typically $100.00 to $1,000,000.00+
- **Validation**: Must be positive number
- **Description**: Total amount being claimed
- **Example**: `5000.00`

#### approvedAmount
- **Type**: Decimal/Number (nullable)
- **Format**: Currency amount with 2 decimal places
- **Description**: Amount approved for payment
- **Business Rules**:
  - Cannot exceed claimAmount
  - Set during approval process
  - Null until claim is approved
- **Example**: `4800.00`

### Date Fields

#### incidentDate
- **Type**: DateTime (ISO 8601)
- **Format**: `YYYY-MM-DDTHH:mm:ssZ`
- **Validation**: Must be in the past
- **Description**: Date and time when the loss occurred
- **Example**: `2025-12-10T14:30:00Z`
- **Business Rules**: Cannot be in the future

#### reportedDate
- **Type**: DateTime (ISO 8601)
- **Format**: `YYYY-MM-DDTHH:mm:ssZ`
- **Validation**: Must be >= incidentDate
- **Description**: Date and time when claim was submitted
- **Example**: `2025-12-10T15:00:00Z`
- **Business Rules**: Typically set automatically on submission

#### createdDate
- **Type**: DateTime (ISO 8601)
- **Description**: System timestamp when claim record was created
- **Immutable**: Yes, set automatically

#### lastModifiedDate
- **Type**: DateTime (ISO 8601)
- **Description**: System timestamp when claim was last updated
- **Auto-updated**: Yes, updated on every modification

### Descriptive Fields

#### description
- **Type**: String
- **Length**: Typically 50-5000 characters
- **Required**: Yes
- **Description**: Detailed narrative of the incident
- **Best Practices**:
  - Include what happened, when, where, and why
  - Be factual and objective
  - Include relevant details (weather, witnesses, etc.)
  - Avoid speculation or assumptions

#### location
- **Type**: String
- **Length**: Typically 10-200 characters
- **Required**: No, but highly recommended
- **Description**: Geographic location of the incident
- **Format**: Address, intersection, or landmark
- **Example**: `Main Street & Oak Avenue, Springfield, IL 62701`

### Contact Fields

#### insuredName
- **Type**: String
- **Length**: Typically 2-100 characters
- **Required**: Yes
- **Description**: Full name of the policyholder
- **Validation**: Should match policy records

#### insuredContactEmail
- **Type**: String (Email format)
- **Format**: Valid email address
- **Required**: Yes
- **Description**: Email address for claim communications
- **Validation**: Must be valid email format
- **Example**: `john.doe@email.com`

#### insuredContactPhone
- **Type**: String
- **Format**: E.164 international format recommended
- **Required**: Yes
- **Description**: Phone number for claim communications
- **Format**: `+[country code][number]`
- **Example**: `+15551234567`

### Adjuster Fields

#### adjusterName
- **Type**: String (nullable)
- **Description**: Name of assigned claims adjuster
- **Business Rules**: Assigned during review process
- **Null until**: Claim moves to "Pending Review" or "Approved"

#### adjusterEmail
- **Type**: String (Email format, nullable)
- **Description**: Email address of assigned adjuster
- **Business Rules**: Set when adjuster is assigned

### Notes Field

#### notes
- **Type**: Array of Note objects
- **Description**: Collection of notes and comments
- **Structure**:
  ```json
  {
    "noteId": "NOTE-001",
    "content": "Initial review completed",
    "author": "Jane Smith",
    "timestamp": "2025-12-10T16:00:00Z"
  }
  ```
- **Usage**: Track claim history, communications, and decisions

## Data Relationships

### Claim → Policy
- **Relationship**: Many-to-One
- **Foreign Key**: policyNumber
- **Constraint**: Policy must exist before claim creation

### Claim → Adjuster
- **Relationship**: Many-to-One (optional)
- **Foreign Key**: adjusterEmail
- **Constraint**: Adjuster must exist in system

### Claim → Notes
- **Relationship**: One-to-Many
- **Description**: Claim can have multiple notes
- **Cascade**: Notes deleted when claim is deleted

## Data Validation Rules

### Policy Number Validation
```regex
^POL-[0-9]{4}-[0-9]{5}$
```
- Year: Exactly 4 digits (2020-2099)
- Sequence: Exactly 5 digits (10000-99999)

### Claim ID Validation
```regex
^CLM-[0-9]{4}-[0-9]{6}$
```
- Year: Exactly 4 digits
- Sequence: Exactly 6 digits

### Date Validation Rules
1. incidentDate must be in the past
2. reportedDate must be >= incidentDate
3. createdDate is set automatically
4. lastModifiedDate is updated automatically

### Amount Validation Rules
1. claimAmount must be > 0
2. approvedAmount must be <= claimAmount
3. Both amounts use 2 decimal places
4. Currency format: USD

## Data Quality Standards

### Completeness
- All required fields must be present
- Optional fields should be populated when available
- Location field highly recommended for accurate processing

### Accuracy
- Policy numbers must match existing policies
- Dates must be chronologically consistent
- Contact information must be valid and reachable

### Consistency
- Status transitions must follow business rules
- Amounts must be consistent across updates
- Dates must be in correct timezone (UTC)

### Timeliness
- Claims should be reported promptly
- Status updates should occur in real-time
- Modifications should be tracked with timestamps

## API Data Exchange

### Request Format (Claim Creation)
```json
{
  "policyNumber": "POL-2023-12345",
  "lossType": "Auto",
  "claimAmount": 5000.00,
  "incidentDate": "2025-12-10T14:30:00Z",
  "reportedDate": "2025-12-10T15:00:00Z",
  "description": "Rear-end collision at traffic light",
  "location": "Main Street & Oak Avenue, Springfield, IL",
  "insuredName": "John Doe",
  "insuredContactEmail": "john.doe@email.com",
  "insuredContactPhone": "+15551234567"
}
```

### Response Format (Claim Created)
```json
{
  "message": "Claim created successfully",
  "claimId": "CLM-2025-123456",
  "claimNumber": "CLM-2025-123456",
  "status": "Open",
  "submittedDate": "2025-12-10T15:00:00Z"
}
```

## Data Retention

### Active Claims
- Retained indefinitely while claim is open
- Archived after closure based on retention policy

### Closed Claims
- Typically retained for 7-10 years
- May vary by jurisdiction and claim type
- Archived but accessible for audit purposes

### Deleted Claims
- Soft delete: Marked as deleted, data retained
- Hard delete: Physical removal after retention period
- Audit trail maintained for compliance

