# Claims API Overview

## API Architecture

The Claims Management API provides a RESTful interface for insurance claim operations. It follows industry-standard patterns and integrates with Guidewire ClaimCenter and other insurance systems.

## Base URL Structure

```
https://{host}/api/v1
```

### Endpoints

#### Claims Management
- `GET /claims` - Retrieve all claims (with filters and pagination)
- `POST /claims` - Create a new claim
- `GET /claims/{claimId}` - Get specific claim details
- `PUT /claims/{claimId}` - Update an existing claim
- `DELETE /claims/{claimId}` - Delete a claim (soft delete)
- `GET /claims/policy/{policyNumber}` - Get claims by policy number
- `PATCH /claims/{claimId}/status` - Update claim status

#### Health & Monitoring
- `GET /health` - Health check endpoint

## Authentication

### OAuth 2.0 Client Credentials Flow

**Headers Required**:
```
client_id: {your_client_id}
client_secret: {your_client_secret}
```

**Example**:
```bash
curl -X GET "https://api.example.com/api/v1/claims" \
  -H "client_id: e37bfbb433a447d29532a635ceaa7f28" \
  -H "client_secret: 2BF37b3E97E541C5B89B10372873FC77" \
  -H "Accept: application/json"
```

## Request/Response Formats

### Content-Type
- **Request**: `application/json`
- **Response**: `application/json`

### Date Format
- **ISO 8601**: `YYYY-MM-DDTHH:mm:ssZ`
- **Example**: `2025-12-10T14:30:00Z`

### Currency Format
- **Decimal**: 2 decimal places
- **Example**: `5000.00`

## Common Request Patterns

### Create Claim Request
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

### Create Claim Response
```json
{
  "message": "Claim created successfully",
  "claimId": "CLM-2025-123456",
  "claimNumber": "CLM-2025-123456",
  "status": "Open",
  "submittedDate": "2025-12-10T15:00:00Z"
}
```

### Get Claims Response (Paginated)
```json
{
  "content": [
    {
      "claimId": "CLM-2025-123456",
      "policyNumber": "POL-2023-12345",
      "claimStatus": "Open",
      "lossType": "Auto",
      "claimAmount": 5000.00,
      "incidentDate": "2025-12-10T14:30:00Z"
    }
  ],
  "page": 1,
  "pageSize": 10,
  "totalElements": 25,
  "totalPages": 3
}
```

## Error Handling

### Standard Error Response
```json
{
  "error": "Bad Request",
  "message": "required key [reportedDate] not found",
  "timestamp": "2025-12-16T05:15:16.650345932Z",
  "path": "/api/v1/claims"
}
```

### Common HTTP Status Codes
- `200 OK` - Successful GET, PUT, PATCH
- `201 Created` - Successful POST
- `204 No Content` - Successful DELETE
- `400 Bad Request` - Invalid request data
- `401 Unauthorized` - Authentication failed
- `404 Not Found` - Resource not found
- `405 Method Not Allowed` - HTTP method not supported
- `415 Unsupported Media Type` - Invalid Content-Type
- `500 Internal Server Error` - Server error

## Pagination

### Query Parameters
- `page` - Page number (default: 1)
- `pageSize` - Items per page (default: 10, max: 100)

### Example
```
GET /api/v1/claims?page=1&pageSize=20&status=Open
```

### Response Fields
- `page` - Current page number
- `pageSize` - Items per page
- `totalElements` - Total number of items
- `totalPages` - Total number of pages
- `content` - Array of claim objects

## Filtering

### Available Filters
- `status` - Filter by claim status (Open, Approved, Closed, Denied, Pending Review)
- `policyNumber` - Filter by policy number
- `lossType` - Filter by loss type (Auto, Property, Health)

### Example
```
GET /api/v1/claims?status=Open&lossType=Auto&page=1&pageSize=10
```

## Rate Limiting

### Limits
- **Standard**: 100 requests per minute
- **Burst**: 200 requests per minute
- **Daily**: 10,000 requests per day

### Headers
- `X-RateLimit-Limit` - Request limit
- `X-RateLimit-Remaining` - Remaining requests
- `X-RateLimit-Reset` - Reset timestamp

### Rate Limit Exceeded Response
```json
{
  "error": "Too Many Requests",
  "message": "Rate limit exceeded. Please try again later.",
  "retryAfter": 60
}
```

## Versioning

### API Version
- Current version: `v1`
- Version in URL: `/api/v1/`
- Backward compatibility maintained within major version

### Version Headers
- `API-Version: v1` (optional)
- Version in URL path is primary method

## Integration Patterns

### Synchronous Operations
- Claim creation
- Claim retrieval
- Claim updates
- Status changes

### Asynchronous Operations
- Bulk claim processing
- Report generation
- Email notifications

## Best Practices

1. **Use Pagination**: Always paginate large result sets
2. **Handle Errors**: Implement proper error handling
3. **Validate Input**: Validate data before sending requests
4. **Cache Responses**: Cache GET requests when appropriate
5. **Rate Limiting**: Respect rate limits
6. **Retry Logic**: Implement retry for transient failures
7. **Logging**: Log all API interactions
8. **Monitoring**: Monitor API performance and errors

## Security Considerations

### Authentication
- Always use HTTPS
- Secure credential storage
- Rotate credentials regularly
- Use environment variables for secrets

### Data Protection
- Encrypt sensitive data in transit
- Validate input data
- Sanitize output data
- Implement access controls

### Compliance
- Follow data privacy regulations
- Maintain audit logs
- Implement data retention policies
- Regular security audits

## Testing

### Test Environments
- **Development**: Testing and development
- **Staging**: Pre-production testing
- **Production**: Live environment

### Test Data
- Use test policy numbers
- Use realistic claim amounts
- Use valid date formats
- Clean up test data after testing

## Integration with Claims MCP

The Claims MCP server provides a standardized interface to the Claims API:
- Tool-based operations
- Consistent error handling
- Automatic authentication
- Response transformation
- Context-aware processing

## Related Documentation

- [REST API Patterns](./02-rest-api-patterns.md)
- [Error Handling](./03-error-handling.md)
- [Pagination Strategies](./04-pagination-strategies.md)
- [Data Validation](../best-practices/01-data-validation.md)

