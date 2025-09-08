# Employee Management System - API Documentation

## Base URL
All API endpoints are relative to: `http://localhost:8080/api`

## Authentication
All endpoints (except login) require authentication via JWT token. Include the token in the `Authorization` header:
```
Authorization: Bearer <your-jwt-token>
```

## API Endpoints

### 1. Authentication

#### Login
- **URL**: `/auth/login`
- **Method**: `POST`
- **Request Body**:
  ```json
  {
    "username": "string",
    "password": "string"
  }
  ```
- **Response**: JWT token

### 2. Employee Management

#### Employees
- `GET /employees` - Get all employees
- `GET /employees/{id}` - Get employee by ID
- `POST /employees` - Create new employee
- `PUT /employees/{id}` - Update employee
- `DELETE /employees/{id}` - Delete employee

#### Departments
- `GET /departments` - Get all departments
- `GET /departments/{id}` - Get department by ID
- `POST /departments` - Create new department
- `PUT /departments/{id}` - Update department
- `DELETE /departments/{id}` - Delete department

#### Positions
- `GET /positions` - Get all positions
- `GET /positions/{id}` - Get position by ID
- `POST /positions` - Create new position
- `PUT /positions/{id}` - Update position
- `DELETE /positions/{id}` - Delete position

### 3. Project Management

#### Projects
- `GET /projects` - Get all projects
- `GET /projects/{id}` - Get project by ID
- `POST /projects` - Create new project
- `PUT /projects/{id}` - Update project
- `DELETE /projects/{id}` - Delete project

#### Employee Projects
- `GET /employee-projects` - Get all employee-project assignments
- `GET /employee-projects/{id}` - Get assignment by ID
- `POST /employee-projects` - Assign employee to project
- `PUT /employee-projects/{id}` - Update assignment
- `DELETE /employee-projects/{id}` - Remove assignment

### 4. Attendance & Time Management

#### Attendances
- `GET /attendances` - Get all attendance records
- `GET /attendances/{id}` - Get attendance by ID
- `POST /attendances` - Create attendance record
- `PUT /attendances/{id}` - Update attendance
- `DELETE /attendances/{id}` - Delete attendance

#### Shifts
- `GET /shifts` - Get all shifts
- `GET /shifts/{id}` - Get shift by ID
- `POST /shifts` - Create new shift
- `PUT /shifts/{id}` - Update shift
- `DELETE /shifts/{id}` - Delete shift

### 5. Payroll & Benefits

#### Payrolls
- `GET /payrolls` - Get all payroll records
- `GET /payrolls/{id}` - Get payroll by ID
- `POST /payrolls` - Create payroll record
- `PUT /payrolls/{id}` - Update payroll
- `DELETE /payrolls/{id}` - Delete payroll

#### Promotions
- `GET /promotions` - Get all promotions
- `GET /promotions/{id}` - Get promotion by ID
- `POST /promotions` - Create promotion
- `PUT /promotions/{id}` - Update promotion
- `DELETE /promotions/{id}` - Delete promotion

### 6. Training & Development

#### Trainings
- `GET /trainings` - Get all training programs
- `GET /trainings/{id}` - Get training by ID
- `POST /trainings` - Create training program
- `PUT /trainings/{id}` - Update training
- `DELETE /trainings/{id}` - Delete training

### 7. System Administration

#### Users
- `GET /users` - Get all users
- `GET /users/{id}` - Get user by ID
- `POST /users` - Create user
- `PUT /users/{id}` - Update user
- `DELETE /users/{id}` - Delete user

#### Roles
- `GET /roles` - Get all roles
- `GET /roles/{id}` - Get role by ID
- `POST /roles` - Create role
- `PUT /roles/{id}` - Update role
- `DELETE /roles/{id}` - Delete role

#### User Roles
- `GET /user-roles` - Get all user-role assignments
- `GET /user-roles/{id}` - Get assignment by ID
- `POST /user-roles` - Assign role to user
- `PUT /user-roles/{id}` - Update assignment
- `DELETE /user-roles/{id}` - Remove role from user

### 8. Document Management

#### Documents
- `GET /documents` - Get all documents
- `GET /documents/{id}` - Get document by ID
- `POST /documents` - Upload document
- `PUT /documents/{id}` - Update document
- `DELETE /documents/{id}` - Delete document

### 9. Audit & Compliance

#### Audit Logs
- `GET /audit-logs` - Get all audit logs
- `GET /audit-logs/{id}` - Get audit log by ID
- `POST /audit-logs` - Create audit log (system use only)
- `PUT /audit-logs/{id}` - Update audit log (restricted)
- `DELETE /audit-logs/{id}` - Delete audit log (restricted)

#### Resignations
- `GET /resignations` - Get all resignation records
- `GET /resignations/{id}` - Get resignation by ID
- `POST /resignations` - Submit resignation
- `PUT /resignations/{id}` - Update resignation
- `DELETE /resignations/{id}` - Delete resignation

## Common Response Formats

### Success Response
```json
{
  "data": {},
  "message": "Success message",
  "status": 200
}
```

### Error Response
```json
{
  "error": "Error message",
  "status": 400,
  "timestamp": "2025-09-08T20:31:14.000+00:00",
  "path": "/api/endpoint"
}
```

## Status Codes
- `200 OK`: Request successful
- `201 Created`: Resource created successfully
- `400 Bad Request`: Invalid request format
- `401 Unauthorized`: Authentication required
- `403 Forbidden`: Insufficient permissions
- `404 Not Found`: Resource not found
- `500 Internal Server Error`: Server error

## Rate Limiting
API is rate limited to 1000 requests per hour per IP address.

## Versioning
Current API version: `v1`

## Support
For support, please contact support@ems.example.com
