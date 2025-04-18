# Employee Management System (EMS)

## Overview

The Employee Management System (EMS) is a full-stack web application designed to manage employee data, attendance, and payroll processes efficiently. The system is divided into three main components:

- **Frontend**: A modern web interface for users to interact with the system.
- **Backend**: A RESTful API server handling business logic and data processing.
- **Database**: Stores persistent data for employees, attendance, and payroll.

---

## Project Structure

```
ems/
│
├── backend/          # Java Spring Boot backend API
├── frontend/         # Next.js React frontend
├── Database/         # SQL scripts for database schema and seed data
├── README.md         # Project overview and instructions
└── .git/             # Git version control
```

---

## Frontend

**Path:** `frontend/`  
**Tech Stack:** Next.js, React, TypeScript, Tailwind CSS

### Key Files & Folders

- `.env.local`: Environment variables for frontend.
- `.gitignore`: Files/folders ignored by Git.
- `.next/`: Build output (auto-generated).
- `README.md`: Frontend-specific documentation.
- `eslint.config.mjs`: ESLint configuration.
- `next-env.d.ts`: TypeScript Next.js types.
- `next.config.ts`: Next.js configuration.
- `node_modules/`: Installed dependencies.
- `package.json`, `package-lock.json`: Project dependencies and scripts.
- `postcss.config.mjs`: PostCSS configuration.
- `public/`: Static assets (e.g., images, favicon).
- `src/`: Main source code.
- `tailwind.config.js`: Tailwind CSS configuration.
- `tsconfig.json`: TypeScript configuration.

### `src/` Folder Details

- `api/`: API utilities for frontend data fetching.
- `app/`: Next.js app directory, contains:
  - `api/`: Route handlers.
  - `attendance/`, `payroll/`, `dashboard/`, `login/`: Pages and features.
  - `globals.css`: Global styles.
  - `layout.tsx`: Root layout component.
  - `page.tsx`: Main landing page.
- `components/`: Reusable React components (e.g., `Navbar`, `Sidebar`, `EmployeeTable`, `AttendanceChart`, `PayrollSummary`, `AuthCheck`, `ReactQueryProvider`, `NextAuthProvider`).
- `hooks/`: Custom React hooks (`useAttendance.ts`, `useEmployees.ts`, `usePayroll.ts`) for data logic.
- `lib/`: Shared utilities and configuration (`auth.ts`, `config.ts`).
- `styles/`: (Not listed, but typically for custom CSS).
- `types/`: TypeScript type definitions for attendance, employee, and payroll data.

---

## Backend

**Path:** `backend/`  
**Tech Stack:** Java, Spring Boot, Maven

### Key Files & Folders

- `README.md`: Backend-specific documentation.
- `pom.xml`: Maven build configuration.
- `src/`: Main source code.
- `target/`: Build output (auto-generated).

### `src/main/java/com/employee/` Structure

- `EmployeeManagementSystemApplication.java`: Application entry point.
- `WebConfig.java`: Web configuration (e.g., CORS, interceptors).
- `controller/`: REST controllers for handling HTTP requests:
  - `AttendanceController.java`
  - `EmployeeController.java`
  - `PayrollController.java`
- `model/`: Entity classes representing database tables:
  - `Attendance.java`
  - `Employee.java`
  - `Payroll.java`
- `repository/`: Spring Data JPA repositories for database access:
  - `AttendanceRepository.java`
  - `EmployeeRepository.java`
  - `PayrollRepository.java`
- `service/`: Business logic/services:
  - `AttendanceService.java`
  - `EmployeeService.java`
  - `PayrollService.java`

### `src/main/resources/`

- Contains application configuration files (not listed in detail).

---

## Database

**Path:** `Database/`  
**File:** `ems_db.sql`

- Contains SQL scripts for creating and initializing the database schema, including tables for employees, attendance, and payroll.
- Used to set up the underlying relational database (e.g., MySQL, PostgreSQL).

---

## Summary

- The **frontend** provides a user-friendly interface for managing employees, attendance, and payroll, built with Next.js and React.
- The **backend** exposes RESTful APIs, handles business logic, and interacts with the database, built using Java Spring Boot.
- The **database** schema is defined in SQL scripts, supporting persistent storage for all EMS data.

---

For more details, see the `frontend/README.md` and `backend/README.md` files.
