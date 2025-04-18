# Employee Management System

A comprehensive Spring Boot application for managing employee records, attendance, and payroll.

## Features

- **Employee Management**
  - Create, Read, Update, Delete employee records
  - Search employees by department
  - Store detailed employee information

- **Attendance Tracking**
  - Record check-in/check-out times
  - Track attendance status (Present, Late, Absent)
  - View attendance history by date range

- **Payroll Processing**
  - Generate payroll records
  - Calculate net salary based on attendance
  - View payroll history

## Technologies

- **Backend**: Spring Boot 3.2.2
- **Database**: PostgreSQL
- **Build Tool**: Maven
- **Security**: Spring Security (Basic Auth)

## Project Structure

```
employee-management-system/
├── src/
│   ├── main/
│   │   ├── java/com/employee/
│   │   │   ├── config/          # Spring configuration classes
│   │   │   ├── controller/      # REST API controllers
│   │   │   ├── model/           # Entity classes
│   │   │   ├── repository/      # JPA repositories
│   │   │   ├── service/         # Business logic services
│   │   │   └── EmployeeManagementApplication.java # Main class
│   │   └── resources/
│   │       ├── static/          # Frontend assets (if any)
│   │       ├── templates/       # Thymeleaf templates (if any)
│   │       └── application.properties # Configuration
│   └── test/                    # Test classes
├── target/                      # Compiled classes and jars
├── pom.xml                      # Maven configuration
└── README.md                    # This file
```

This structure follows standard Spring Boot conventions with clear separation of concerns between layers.

## Setup Instructions

### Prerequisites
- Java 17+
- Maven 3.8+
- PostgreSQL 15+

### Installation
1. Clone the repository
2. Create database:
   ```sql
   CREATE DATABASE employee_management;
   ```
3. Configure database credentials in `src/main/resources/application.properties`
4. Build and run:
   ```bash
   mvn spring-boot:run
   ```

## API Documentation

### Employee Endpoints
- `POST /api/employees` - Create new employee
- `GET /api/employees` - List all employees
- `GET /api/employees/{id}` - Get employee by ID
- `PUT /api/employees/{id}` - Update employee
- `DELETE /api/employees/{id}` - Delete employee
- `GET /api/employees/department/{department}` - Search by department

### Attendance Endpoints
- `POST /api/attendance` - Record attendance
- `GET /api/attendance/employee/{employeeId}` - Get employee attendance
- `GET /api/attendance/employee/{employeeId}/date-range` - Filter by date range

### Payroll Endpoints
- `POST /api/payroll` - Generate payroll
- `GET /api/payroll/employee/{employeeId}` - Get employee payrolls
- `GET /api/payroll/employee/{employeeId}/date-range` - Filter by date range

## Security
Default admin credentials:
- Username: `admin`
- Password: `admin123`

## Database Schema

The application uses JPA/Hibernate with automatic schema generation (`spring.jpa.hibernate.ddl-auto=update`). Main entities:

- **Employee**: Stores employee personal and professional details
- **Attendance**: Records employee attendance data
- **Payroll**: Manages salary and payment information

## Sample Requests

```bash
# Create employee
curl -X POST http://localhost:8080/api/employees \
  -H "Authorization: Basic YWRtaW46YWRtaW4xMjM=" \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@example.com",
    "department": "Engineering",
    "position": "Software Engineer",
    "salary": 50000.00,
    "dateOfJoining": "2025-04-18"
  }'
```

## Future Enhancements
- Frontend web interface
- Advanced reporting
- Email notifications
- Role-based access control




# Create API services
touch src/api/{employeeService,attendanceService,payrollService,authService}.ts
# Create components
touch src/components/{Sidebar,Navbar,EmployeeTable,AttendanceChart,PayrollSummary}.tsx
# Create hooks
touch src/hooks/{useEmployees,useAttendance,usePayroll}.ts
# Create pages
touch src/app/{login,dashboard,employees,attendance,payroll}/page.tsx
# Create types
touch src/types/{employee,attendance,payroll}.ts
