# Database - Employee Management System

This folder contains the database schema and initialization scripts for the Employee Management System (EMS).

## File Structure

```
Database/
│
├── ems_db.sql      # SQL script to create and initialize the EMS database
├── README.md       # This file
```

## ems_db.sql
- Defines the schema for employees, attendance, and payroll tables.
- Includes table creation, relationships, and sample seed data if present.
- Compatible with common relational databases (e.g., MySQL, PostgreSQL).

## Usage
1. Open your SQL client (e.g., MySQL Workbench, psql, DBeaver).
2. Create a new database (e.g., `ems`).
3. Run the contents of `ems_db.sql` to set up all required tables and initial data.

## Integration
- The backend Spring Boot application connects to this database to persist and retrieve EMS data.
- Ensure your backend configuration matches the database credentials and name.

## Purpose
This schema provides reliable storage for all EMS features, including employee records, attendance tracking, and payroll management.
