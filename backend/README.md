# Backend - Employee Management System

This is the backend for the Employee Management System (EMS), built with Java, Spring Boot, and Maven.

## Structure

```
backend/
│
├── README.md               # This file
├── pom.xml                 # Maven build config
├── src/                    # Main source code
│   └── main/
│       ├── java/
│       │   └── com/employee/
│       │       ├── EmployeeManagementSystemApplication.java  # App entry point
│       │       ├── WebConfig.java                           # Web configuration
│       │       ├── controller/                              # REST controllers
│       │       │   ├── AttendanceController.java
│       │       │   ├── EmployeeController.java
│       │       │   └── PayrollController.java
│       │       ├── model/                                   # Entity classes
│       │       │   ├── Attendance.java
│       │       │   ├── Employee.java
│       │       │   └── Payroll.java
│       │       ├── repository/                              # JPA repositories
│       │       │   ├── AttendanceRepository.java
│       │       │   ├── EmployeeRepository.java
│       │       │   └── PayrollRepository.java
│       │       └── service/                                 # Business logic
│       │           ├── AttendanceService.java
│       │           ├── EmployeeService.java
│       │           └── PayrollService.java
│       └── resources/                                       # Config files
└── target/                                                  # Build output
```

## Technologies Used
- Java
- Spring Boot
- Spring Data JPA
- Maven

## Purpose
The backend exposes RESTful APIs for employee, attendance, and payroll management. It handles business logic, data validation, and database interactions.

## Usage
1. Ensure Java and Maven are installed.
2. Build: `mvn clean install`
3. Run: `mvn spring-boot:run`

## API Endpoints
- `/api/employees` - Manage employee data
- `/api/attendance` - Manage attendance records
- `/api/payroll` - Manage payroll data

## Database
See the `Database/ems_db.sql` file for schema setup.
