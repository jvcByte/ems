-- Start with a transaction
BEGIN;

-- Drop any existing objects that might be causing conflicts
DROP TABLE IF EXISTS public.Resignations CASCADE;
DROP TABLE IF EXISTS public.Promotions CASCADE;
DROP TABLE IF EXISTS public.Assets CASCADE;
DROP TABLE IF EXISTS public.Shifts CASCADE;
DROP TABLE IF EXISTS public.Audit_Logs CASCADE;
DROP TABLE IF EXISTS public.User_Roles CASCADE;
DROP TABLE IF EXISTS public.Roles CASCADE;
DROP TABLE IF EXISTS public.Users CASCADE;
DROP TABLE IF EXISTS public.Documents CASCADE;
DROP TABLE IF EXISTS public.Employee_Projects CASCADE;
DROP TABLE IF EXISTS public.Projects CASCADE;
DROP TABLE IF EXISTS public.Training CASCADE;
DROP TABLE IF EXISTS public.Performance CASCADE;
DROP TABLE IF EXISTS public.Leaves CASCADE;
DROP TABLE IF EXISTS public.Payroll CASCADE;
DROP TABLE IF EXISTS public.Attendance CASCADE;
DROP TABLE IF EXISTS public.Salaries CASCADE;
DROP TABLE IF EXISTS public.Positions CASCADE;
DROP TABLE IF EXISTS public.Departments CASCADE;
DROP TABLE IF EXISTS public.Employees CASCADE;

-- Drop existing ENUM types if they exist
DROP TYPE IF EXISTS public.employee_status CASCADE;
DROP TYPE IF EXISTS public.payment_type CASCADE;
DROP TYPE IF EXISTS public.attendance_status CASCADE;
DROP TYPE IF EXISTS public.leave_type CASCADE;
DROP TYPE IF EXISTS public.leave_status CASCADE;
DROP TYPE IF EXISTS public.project_status CASCADE;

-- Create custom ENUM types first
CREATE TYPE public.employee_status AS ENUM ('Active', 'On Leave', 'Terminated', 'Resigned');
CREATE TYPE public.payment_type AS ENUM ('Monthly', 'Bi-weekly', 'Weekly');
CREATE TYPE public.attendance_status AS ENUM ('Present', 'Absent', 'Half-day', 'Late', 'Work from home');
CREATE TYPE public.leave_type AS ENUM ('Vacation', 'Sick', 'Personal', 'Maternity', 'Paternity', 'Bereavement', 'Unpaid');
CREATE TYPE public.leave_status AS ENUM ('Pending', 'Approved', 'Rejected', 'Cancelled');
CREATE TYPE public.project_status AS ENUM ('Planning', 'In Progress', 'On Hold', 'Completed', 'Cancelled');

-- Employees Table
CREATE TABLE public.Employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    date_of_birth DATE,
    address TEXT,
    hire_date DATE NOT NULL,
    status employee_status DEFAULT 'Active',
    emergency_contact TEXT,
    reporting_manager_id INTEGER,
    FOREIGN KEY (reporting_manager_id) REFERENCES public.Employees(employee_id)
);

-- Departments Table
CREATE TABLE public.Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    manager_id INTEGER,
    description TEXT,
    FOREIGN KEY (manager_id) REFERENCES public.Employees(employee_id)
);

-- Positions/Job Titles Table
CREATE TABLE public.Positions (
    position_id SERIAL PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL,
    description TEXT,
    department_id INTEGER,
    salary_grade DECIMAL(10,2),
    responsibilities TEXT,
    FOREIGN KEY (department_id) REFERENCES public.Departments(department_id)
);

-- Salaries Table
CREATE TABLE public.Salaries (
    salary_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    base_salary DECIMAL(10,2) NOT NULL,
    bonuses DECIMAL(10,2) DEFAULT 0,
    deductions DECIMAL(10,2) DEFAULT 0,
    effective_date DATE NOT NULL,
    end_date DATE,
    currency VARCHAR(10) DEFAULT 'USD',
    payment_type payment_type DEFAULT 'Monthly',
    FOREIGN KEY (employee_id) REFERENCES public.Employees(employee_id)
);

-- Attendance Table
CREATE TABLE public.Attendance (
    attendance_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    check_in TIMESTAMP,
    check_out TIMESTAMP,
    status attendance_status NOT NULL,
    attendance_date DATE NOT NULL,
    notes TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Payroll Table
CREATE TABLE public.Payroll (
    payroll_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    basic_salary NUMERIC(38,2) NOT NULL,
    deductions NUMERIC(38,2) DEFAULT 0,
    bonuses NUMERIC(10,2) DEFAULT 0,
    net_salary NUMERIC(38,2) NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Leaves Table
CREATE TABLE public.Leaves (
    leave_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    leave_type leave_type NOT NULL,
    status leave_status DEFAULT 'Pending',
    reason TEXT,
    approver_id INTEGER,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (approver_id) REFERENCES Employees(employee_id)
);

-- Performance Table
CREATE TABLE public.Performance (
    review_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    review_date DATE NOT NULL,
    reviewer_id INTEGER NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    goals TEXT,
    next_review_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (reviewer_id) REFERENCES Employees(employee_id)
);

-- Training Table
CREATE TABLE public.Training (
    training_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    training_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    provider VARCHAR(100),
    completed BOOLEAN DEFAULT FALSE,
    certificate_id VARCHAR(50),
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Projects Table
CREATE TABLE public.Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status project_status DEFAULT 'Planning',
    description TEXT,
    manager_id INTEGER,
    budget DECIMAL(15,2),
    FOREIGN KEY (manager_id) REFERENCES Employees(employee_id)
);

-- EmployeeProjects (Junction Table)
CREATE TABLE public.Employee_Projects (
    id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    role VARCHAR(50),
    start_date DATE NOT NULL,
    end_date DATE,
    hours_allocated INTEGER,
    FOREIGN KEY (project_id) REFERENCES public.Projects(project_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Documents Table
CREATE TABLE public.Documents (
    document_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    document_type VARCHAR(50) NOT NULL,
    upload_date DATE NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    description TEXT,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Users Table
CREATE TABLE public.Users (
    user_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    last_login TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    email VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Roles Table
CREATE TABLE public.Roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    permissions JSONB
);

-- User Roles Table (Junction Table)
CREATE TABLE public.User_Roles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    assigned_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES public.Users(user_id),
    FOREIGN KEY (role_id) REFERENCES public.Roles(role_id)
);

-- Audit Logs Table
CREATE TABLE public.Audit_Logs (
    log_id SERIAL PRIMARY KEY,
    user_id INTEGER,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action VARCHAR(50) NOT NULL,
    table_affected VARCHAR(50),
    record_id VARCHAR(50),
    old_value TEXT,
    new_value TEXT,
    ip_address VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES public.Users(user_id)
);

-- Shifts/Schedules Table
CREATE TABLE public.Shifts (
    shift_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    shift_type VARCHAR(50),
    notes TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Assets/Equipment Table
CREATE TABLE public.Assets (
    asset_id SERIAL PRIMARY KEY,
    employee_id INTEGER,
    asset_type VARCHAR(50) NOT NULL,
    asset_name VARCHAR(100) NOT NULL,
    serial_number VARCHAR(100) UNIQUE,
    assignment_date DATE,
    return_date DATE,
    condition VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Promotions Table
CREATE TABLE public.Promotions (
    promotion_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    from_position_id INTEGER NOT NULL,
    to_position_id INTEGER NOT NULL,
    promotion_date DATE NOT NULL,
    salary_increase DECIMAL(10,2),
    reason TEXT,
    recommended_by INTEGER,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (from_position_id) REFERENCES public.Positions(position_id),
    FOREIGN KEY (to_position_id) REFERENCES public.Positions(position_id),
    FOREIGN KEY (recommended_by) REFERENCES public.Employees(employee_id)
);

-- Resignations Table
CREATE TABLE public.Resignations (
    resignation_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    resignation_date DATE NOT NULL,
    last_working_day DATE NOT NULL,
    reason TEXT,
    exit_interview_notes TEXT,
    rehireable BOOLEAN DEFAULT TRUE,
    handover_notes TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
-- Commit the transaction
COMMIT;
END;