# Frontend - Employee Management System

This is the frontend for the Employee Management System (EMS), built with Next.js, React, TypeScript, and Tailwind CSS.

## Structure

```
frontend/
│
├── .env.local              # Environment variables
├── .gitignore              # Git ignore rules
├── .next/                  # Build output (auto-generated)
├── README.md               # This file
├── eslint.config.mjs       # ESLint config
├── next-env.d.ts           # Next.js TypeScript types
├── next.config.ts          # Next.js config
├── node_modules/           # Dependencies
├── package.json            # Project dependencies and scripts
├── package-lock.json       # Dependency lock file
├── postcss.config.mjs      # PostCSS config
├── public/                 # Static assets
├── src/                    # Main source code
├── tailwind.config.js      # Tailwind CSS config
└── tsconfig.json           # TypeScript config
```

## Key Folders in `src/`

- `api/`: API utilities for fetching data from the backend.
- `app/`: Next.js app directory, contains pages and features like:
  - `api/`: Route handlers
  - `attendance/`, `payroll/`, `dashboard/`, `login/`: Feature pages
  - `globals.css`: Global styles
  - `layout.tsx`: Root layout component
  - `page.tsx`: Main landing page
- `components/`: Shared React components (Navbar, Sidebar, EmployeeTable, AttendanceChart, PayrollSummary, AuthCheck, ReactQueryProvider, NextAuthProvider).
- `hooks/`: Custom React hooks for business/data logic (useAttendance, useEmployees, usePayroll).
- `lib/`: Shared utilities and configuration (auth.ts, config.ts).
- `types/`: TypeScript type definitions for attendance, employee, and payroll data.

## Technologies Used
- Next.js
- React
- TypeScript
- Tailwind CSS

## Usage
1. Install dependencies: `npm install`
2. Start development server: `npm run dev`
3. The app runs on `http://localhost:3000` by default.

## Purpose
This frontend provides a modern, responsive UI for managing employees, attendance, and payroll. It communicates with the backend via RESTful APIs.
