end;-- Start transaction
BEGIN;

-- 1. First create Departments (parent table with no dependencies)
INSERT INTO public.Departments (department_id, department_name, location, description) VALUES
(1, 'Executive', 'Floor 10', 'Company leadership and strategy'),
(2, 'Human Resources', 'Floor 5', 'Employee relations and benefits'),
(3, 'Engineering', 'Floor 7', 'Product development'),
(4, 'Marketing', 'Floor 3', 'Brand management and advertising'),
(5, 'Finance', 'Floor 2', 'Accounting and financial operations'),
(6, 'Operations', 'Floor 1', 'Day-to-day business operations'),
(7, 'IT', 'Floor 6', 'Technology infrastructure');

-- 2. Now create Positions (depends on Departments)
INSERT INTO public.Positions (position_id, job_title, department_id, salary_grade, responsibilities) VALUES
(1, 'CEO', 1, 250000, 'Overall company leadership'),
(2, 'HR Director', 2, 120000, 'HR strategy and management'),
(3, 'Senior Software Engineer', 3, 110000, 'Technical leadership and development'),
(4, 'Marketing Manager', 4, 95000, 'Marketing campaigns and strategy'),
(5, 'Accountant', 5, 75000, 'Financial reporting and analysis'),
(6, 'Operations Manager', 6, 85000, 'Process optimization'),
(7, 'IT Support Specialist', 7, 60000, 'Technical support and maintenance'),
(8, 'Junior Software Engineer', 3, 70000, 'Feature development and testing'),
(9, 'HR Generalist', 2, 65000, 'Employee relations and benefits administration');

-- 3. Create Employees (depends on Positions)
-- First ensure position_id column exists
ALTER TABLE public.Employees ADD COLUMN IF NOT EXISTS position_id INTEGER REFERENCES public.Positions(position_id);

-- Insert CEO first (no manager)
INSERT INTO public.Employees (employee_id, first_name, last_name, email, phone, date_of_birth, address, hire_date, status, position_id) VALUES
(1, 'John', 'Smith', 'john.smith@company.com', '555-0101', '1975-03-15', '123 Executive Blvd, Suite 100', '2010-01-15', 'Active', 1);

-- Insert other managers (report to CEO)
INSERT INTO public.Employees (employee_id, first_name, last_name, email, phone, date_of_birth, address, hire_date, status, reporting_manager_id, position_id) VALUES
(2, 'Sarah', 'Johnson', 'sarah.johnson@company.com', '555-0102', '1980-07-22', '456 HR Lane', '2015-06-10', 'Active', 1, 2),
(3, 'Michael', 'Chen', 'michael.chen@company.com', '555-0103', '1982-11-05', '789 Engineer St', '2018-03-22', 'Active', 1, 3),
(4, 'Emily', 'Williams', 'emily.williams@company.com', '555-0104', '1985-09-18', '321 Marketing Ave', '2019-02-14', 'Active', 1, 4),
(5, 'David', 'Brown', 'david.brown@company.com', '555-0105', '1978-12-30', '654 Finance Rd', '2017-08-05', 'Active', 1, 5),
(6, 'Jessica', 'Lee', 'jessica.lee@company.com', '555-0106', '1983-04-25', '987 Operations Way', '2016-11-15', 'Active', 1, 6),
(7, 'Robert', 'Taylor', 'robert.taylor@company.com', '555-0107', '1987-06-12', '135 IT Circle', '2020-01-30', 'Active', 1, 7);

-- Now update department managers (after employees exist)
UPDATE public.Departments SET manager_id = 1 WHERE department_id = 1;
UPDATE public.Departments SET manager_id = 2 WHERE department_id = 2;
UPDATE public.Departments SET manager_id = 3 WHERE department_id = 3;
UPDATE public.Departments SET manager_id = 4 WHERE department_id = 4;
UPDATE public.Departments SET manager_id = 5 WHERE department_id = 5;
UPDATE public.Departments SET manager_id = 6 WHERE department_id = 6;
UPDATE public.Departments SET manager_id = 7 WHERE department_id = 7;

-- Insert remaining employees
INSERT INTO public.Employees (employee_id, first_name, last_name, email, phone, date_of_birth, address, hire_date, status, reporting_manager_id, position_id) VALUES
(8, 'James', 'Wilson', 'james.wilson@company.com', '555-0201', '1990-05-20', '246 Engineer St', '2021-04-10', 'Active', 3, 8),
(9, 'Jennifer', 'Davis', 'jennifer.davis@company.com', '555-0202', '1992-08-15', '357 HR Lane', '2021-07-22', 'Active', 2, 9),
(10, 'Daniel', 'Martinez', 'daniel.martinez@company.com', '555-0203', '1991-01-30', '468 Marketing Ave', '2022-01-05', 'Active', 4, 4),
(11, 'Lisa', 'Anderson', 'lisa.anderson@company.com', '555-0204', '1989-03-12', '579 Finance Rd', '2020-09-15', 'Active', 5, 5),
(12, 'Thomas', 'Thomas', 'thomas.thomas@company.com', '555-0205', '1993-07-08', '680 Operations Way', '2022-03-01', 'Active', 6, 6),
(13, 'Patricia', 'White', 'patricia.white@company.com', '555-0206', '1988-11-25', '791 IT Circle', '2021-10-18', 'Active', 7, 7),
(14, 'Christopher', 'Garcia', 'christopher.garcia@company.com', '555-0207', '1994-02-14', '802 Engineer St', '2023-02-28', 'Active', 3, 8),
(15, 'Amanda', 'Rodriguez', 'amanda.rodriguez@company.com', '555-0208', '1995-09-03', '913 HR Lane', '2023-05-15', 'Active', 2, 9);

-- 4. Seed Salaries (depends on Employees)
INSERT INTO public.Salaries (employee_id, base_salary, bonuses, effective_date, end_date, currency, payment_type) VALUES
(1, 250000, 50000, '2023-01-01', NULL, 'USD', 'Monthly'),
(2, 120000, 15000, '2023-01-01', NULL, 'USD', 'Monthly'),
(3, 110000, 20000, '2023-01-01', NULL, 'USD', 'Monthly'),
(4, 95000, 10000, '2023-01-01', NULL, 'USD', 'Monthly'),
(5, 75000, 5000, '2023-01-01', NULL, 'USD', 'Monthly'),
(6, 85000, 7000, '2023-01-01', NULL, 'USD', 'Monthly'),
(7, 60000, 3000, '2023-01-01', NULL, 'USD', 'Monthly'),
(8, 70000, 4000, '2023-01-01', NULL, 'USD', 'Monthly'),
(9, 65000, 3000, '2023-01-01', NULL, 'USD', 'Monthly'),
(10, 70000, 4000, '2023-01-01', NULL, 'USD', 'Monthly'),
(11, 65000, 3000, '2023-01-01', NULL, 'USD', 'Monthly'),
(12, 70000, 4000, '2023-01-01', NULL, 'USD', 'Monthly'),
(13, 75000, 5000, '2023-01-01', NULL, 'USD', 'Monthly'),
(14, 85000, 7000, '2023-01-01', NULL, 'USD', 'Monthly'),
(15, 60000, 3000, '2023-01-01', NULL, 'USD', 'Monthly');

-- 5. Seed Payroll (depends on Employees)
INSERT INTO public.Payroll (employee_id, period_start, period_end, basic_salary, deductions, bonuses, net_salary, payment_date) VALUES
(1, '2023-01-01', '2023-01-31', 20833.33, 4166.67, 4166.67, 20833.33, '2023-02-01'),
(2, '2023-01-01', '2023-01-31', 10000.00, 2000.00, 1250.00, 9250.00, '2023-02-01'),
(3, '2023-01-01', '2023-01-31', 9166.67, 1833.33, 1666.67, 9000.00, '2023-02-01'),
(4, '2023-01-01', '2023-01-31', 7916.67, 1583.33, 833.33, 7166.67, '2023-02-01'),
(5, '2023-01-01', '2023-01-31', 6250.00, 1250.00, 416.67, 5416.67, '2023-02-01'),
(6, '2023-01-01', '2023-01-31', 7083.33, 1416.67, 583.33, 6250.00, '2023-02-01'),
(7, '2023-01-01', '2023-01-31', 5000.00, 1000.00, 250.00, 4250.00, '2023-02-01'),
(8, '2023-01-01', '2023-01-31', 5833.33, 1166.67, 333.33, 5000.00, '2023-02-01'),
(9, '2023-01-01', '2023-01-31', 5416.67, 1083.33, 250.00, 4583.33, '2023-02-01');

-- 6. Seed Attendance (depends on Employees)
INSERT INTO public.Attendance (employee_id, check_in, check_out, status, attendance_date) VALUES
(1, '2023-01-02 09:00:00', '2023-01-02 17:00:00', 'Present', '2023-01-02'),
(2, '2023-01-02 08:45:00', '2023-01-02 17:15:00', 'Present', '2023-01-02'),
(3, '2023-01-02 09:15:00', '2023-01-02 18:00:00', 'Present', '2023-01-02'),
(4, '2023-01-02 09:00:00', '2023-01-02 17:30:00', 'Present', '2023-01-02'),
(5, '2023-01-02 08:30:00', '2023-01-02 17:00:00', 'Present', '2023-01-02'),
(6, '2023-01-02 09:00:00', '2023-01-02 17:00:00', 'Present', '2023-01-02'),
(7, '2023-01-02 08:00:00', '2023-01-02 16:00:00', 'Present', '2023-01-02'),
(8, '2023-01-02 09:00:00', '2023-01-02 17:00:00', 'Present', '2023-01-02'),
(9, '2023-01-02 08:45:00', '2023-01-02 17:15:00', 'Present', '2023-01-02'),
(1, '2023-01-03 09:00:00', '2023-01-03 17:00:00', 'Present', '2023-01-03'),
(2, '2023-01-03 08:45:00', '2023-01-03 17:15:00', 'Present', '2023-01-03'),
(3, '2023-01-03 09:15:00', '2023-01-03 18:00:00', 'Present', '2023-01-03'),
(4, '2023-01-03 09:00:00', '2023-01-03 17:30:00', 'Present', '2023-01-03'),
(5, '2023-01-03 08:30:00', '2023-01-03 17:00:00', 'Present', '2023-01-03'),
(6, '2023-01-03 09:00:00', '2023-01-03 17:00:00', 'Present', '2023-01-03'),
(7, '2023-01-03 08:00:00', '2023-01-03 16:00:00', 'Present', '2023-01-03'),
(8, '2023-01-03 09:00:00', '2023-01-03 17:00:00', 'Present', '2023-01-03'),
(9, '2023-01-03 08:45:00', '2023-01-03 17:15:00', 'Present', '2023-01-03');

-- 7. Seed Leaves (depends on Employees)
INSERT INTO public.Leaves (employee_id, start_date, end_date, leave_type, status, reason) VALUES
(3, '2023-01-04', '2023-01-04', 'Vacation', 'Approved', 'Personal day'),
(9, '2023-01-04', '2023-01-06', 'Sick', 'Approved', 'Flu'),
(5, '2023-01-15', '2023-01-20', 'Vacation', 'Approved', 'Family trip'),
(7, '2023-01-10', '2023-01-10', 'Personal', 'Pending', 'Doctor appointment');

-- 8. Seed Performance (depends on Employees)
INSERT INTO public.Performance (employee_id, review_date, reviewer_id, rating, comments, next_review_date) VALUES
(1, '2022-12-15', 1, 5, 'Exceptional leadership', '2023-12-15'),
(2, '2022-12-10', 1, 4, 'Strong HR management', '2023-12-10'),
(3, '2022-12-05', 1, 5, 'Technical excellence', '2023-12-05'),
(4, '2022-12-12', 1, 4, 'Creative marketing strategies', '2023-12-12'),
(5, '2022-12-08', 1, 3, 'Solid performance, could improve reporting speed', '2023-06-08'),
(6, '2022-12-20', 1, 4, 'Efficient operations management', '2023-12-20'),
(7, '2022-12-18', 1, 3, 'Good technical skills, needs to improve documentation', '2023-06-18'),
(8, '2022-12-22', 3, 4, 'Promising junior developer', '2023-06-22'),
(9, '2022-12-14', 2, 3, 'Good HR skills, needs more confidence in decision making', '2023-06-14');

-- 9. Seed Training (depends on Employees)
INSERT INTO public.Training (employee_id, training_name, start_date, end_date, provider, completed, certificate_id) VALUES
(3, 'Advanced Cloud Architecture', '2022-11-01', '2022-11-05', 'AWS', TRUE, 'AWS-ACA-12345'),
(4, 'Digital Marketing Certification', '2022-10-15', '2022-12-15', 'Google', TRUE, 'G-DMC-67890'),
(7, 'Cybersecurity Fundamentals', '2023-01-10', '2023-01-12', 'CompTIA', TRUE, 'COMPTIA-CSF-54321'),
(8, 'React Advanced Concepts', '2023-01-15', NULL, 'Udemy', FALSE, NULL),
(9, 'HR Compliance Training', '2022-09-01', '2022-09-30', 'SHRM', TRUE, 'SHRM-HRCT-98765');

-- 10. Seed Projects (depends on Employees for manager_id)
INSERT INTO public.Projects (project_id, project_name, start_date, end_date, status, description, manager_id, budget) VALUES
(1, 'Website Redesign', '2023-01-01', '2023-03-31', 'In Progress', 'Complete overhaul of company website', 3, 50000),
(2, 'HR System Implementation', '2022-12-01', '2023-02-28', 'In Progress', 'New HR management system rollout', 2, 75000),
(3, 'Q1 Marketing Campaign', '2023-01-15', '2023-03-15', 'Planning', 'Spring product launch campaign', 4, 100000),
(4, 'Financial System Upgrade', '2023-02-01', '2023-04-30', 'Planning', 'Migration to new accounting software', 5, 60000),
(5, 'Office Relocation', '2023-03-01', '2023-03-31', 'Planning', 'Move to new headquarters', 6, 150000);

-- 11. Seed EmployeeProjects (junction table)
INSERT INTO public.EmployeeProjects (project_id, employee_id, role, start_date, hours_allocated) VALUES
(1, 3, 'Lead Developer', '2023-01-01', 200),
(1, 8, 'Frontend Developer', '2023-01-01', 150),
(1, 10, 'Backend Developer', '2023-01-01', 150),
(2, 2, 'Project Manager', '2022-12-01', 100),
(2, 9, 'HR Analyst', '2022-12-01', 120),
(2, 11, 'Implementation Specialist', '2022-12-01', 180),
(3, 4, 'Campaign Manager', '2023-01-15', 160),
(3, 12, 'Content Creator', '2023-01-15', 120),
(4, 5, 'Finance Lead', '2023-02-01', 80),
(4, 13, 'Accountant', '2023-02-01', 100),
(5, 6, 'Move Coordinator', '2023-03-01', 120),
(5, 14, 'Logistics Manager', '2023-03-01', 100);

-- 12. Seed Documents (depends on Employees)
INSERT INTO public.Documents (employee_id, document_type, upload_date, file_path, description, expiry_date) VALUES
(1, 'Employment Contract', '2010-01-15', '/documents/1/contract.pdf', 'Original employment agreement', NULL),
(2, 'Employment Contract', '2015-06-10', '/documents/2/contract.pdf', 'Original employment agreement', NULL),
(3, 'Employment Contract', '2018-03-22', '/documents/3/contract.pdf', 'Original employment agreement', NULL),
(1, 'NDA', '2010-01-20', '/documents/1/nda.pdf', 'Non-disclosure agreement', '2025-01-20'),
(2, 'NDA', '2015-06-15', '/documents/2/nda.pdf', 'Non-disclosure agreement', '2025-06-15'),
(3, 'NDA', '2018-03-25', '/documents/3/nda.pdf', 'Non-disclosure agreement', '2026-03-25'),
(8, 'Resume', '2021-04-10', '/documents/8/resume.pdf', 'Most recent resume', NULL),
(9, 'Resume', '2021-07-22', '/documents/9/resume.pdf', 'Most recent resume', NULL),
(7, 'Certification', '2022-05-15', '/documents/7/cert_aws.pdf', 'AWS Certified Solutions Architect', '2025-05-15');

-- 13. Seed Roles (independent table)
INSERT INTO public.Roles (role_id, role_name, description, permissions) VALUES
(1, 'Admin', 'Full system access', '{"all": ["create", "read", "update", "delete"]}'),
(2, 'HR Manager', 'HR department access', '{"employees": ["create", "read", "update"], "documents": ["create", "read", "update"], "leaves": ["approve"]}'),
(3, 'Department Head', 'Department management', '{"employees": ["read", "update"], "projects": ["create", "read", "update"]}'),
(4, 'Employee', 'Basic employee access', '{"self": ["read", "update"], "leaves": ["create", "read"]}'),
(5, 'Finance', 'Financial data access', '{"payroll": ["create", "read", "update"], "salaries": ["read"]}');

-- 14. Seed Users (depends on Employees)
INSERT INTO public.Users (user_id, employee_id, username, password_hash, last_login, is_active, email) VALUES
(1, 1, 'jsmith', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '2023-01-15 09:30:00', TRUE, 'john.smith@company.com'),
(2, 2, 'sjohnson', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '2023-01-15 10:15:00', TRUE, 'sarah.johnson@company.com'),
(3, 3, 'mchen', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '2023-01-14 08:45:00', TRUE, 'michael.chen@company.com'),
(4, 4, 'ewilliams', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '2023-01-14 11:20:00', TRUE, 'emily.williams@company.com'),
(5, 5, 'dbrown', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '2023-01-13 14:10:00', TRUE, 'david.brown@company.com'),
(6, 6, 'jlee', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '2023-01-13 16:30:00', TRUE, 'jessica.lee@company.com'),
(7, 7, 'rtaylor', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '2023-01-12 09:15:00', TRUE, 'robert.taylor@company.com'),
(8, 8, 'jwilson', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '2023-01-12 10:45:00', TRUE, 'james.wilson@company.com'),
(9, 9, 'jdavis', '$2a$10$xJwL5v5Jz5UZJz5UZJz5Ue', '2023-01-11 13:20:00', TRUE, 'jennifer.davis@company.com');

-- 15. Seed User_Roles (junction table)
INSERT INTO public.User_Roles (user_id, role_id) VALUES
(1, 1), -- John Smith - Admin
(2, 2), -- Sarah Johnson - HR Manager
(2, 3), -- Sarah Johnson - Also Department Head
(3, 3), -- Michael Chen - Department Head
(4, 3), -- Emily Williams - Department Head
(5, 3), -- David Brown - Department Head
(5, 5), -- David Brown - Also Finance
(6, 3), -- Jessica Lee - Department Head
(7, 4), -- Robert Taylor - Employee
(8, 4), -- James Wilson - Employee
(9, 2); -- Jennifer Davis - HR Manager

-- 16. Seed AuditLogs (depends on Users)
INSERT INTO public.AuditLogs (user_id, action, table_affected, record_id, old_value, new_value, ip_address) VALUES
(1, 'CREATE', 'Employees', '15', NULL, '{"first_name":"Patricia","last_name":"White"}', '192.168.1.100'),
(2, 'UPDATE', 'Leaves', '3', '{"status":"Pending"}', '{"status":"Approved"}', '192.168.1.101'),
(3, 'CREATE', 'Projects', '1', NULL, '{"project_name":"Website Redesign"}', '192.168.1.102'),
(4, 'UPDATE', 'Employees', '12', '{"position_id":4}', '{"position_id":8}', '192.168.1.103'),
(5, 'CREATE', 'Payroll', '5', NULL, '{"employee_id":5,"net_salary":5416.67}', '192.168.1.104');

-- 17. Seed Shifts (depends on Employees)
INSERT INTO public.Shifts (employee_id, start_time, end_time, shift_type) VALUES
(1, '2023-01-02 09:00:00', '2023-01-02 17:00:00', 'Regular'),
(2, '2023-01-02 08:45:00', '2023-01-02 17:15:00', 'Regular'),
(3, '2023-01-02 09:15:00', '2023-01-02 18:00:00', 'Regular'),
(4, '2023-01-02 09:00:00', '2023-01-02 17:30:00', 'Regular'),
(5, '2023-01-02 08:30:00', '2023-01-02 17:00:00', 'Regular'),
(6, '2023-01-02 09:00:00', '2023-01-02 17:00:00', 'Regular'),
(7, '2023-01-02 08:00:00', '2023-01-02 16:00:00', 'Early'),
(8, '2023-01-02 09:00:00', '2023-01-02 17:00:00', 'Regular'),
(9, '2023-01-02 08:45:00', '2023-01-02 17:15:00', 'Regular');

-- 18. Seed Assets (depends on Employees)
INSERT INTO public.Assets (employee_id, asset_type, asset_name, serial_number, assignment_date, condition) VALUES
(1, 'Laptop', 'MacBook Pro 16"', 'MPB-001', '2020-01-15', 'Excellent'),
(2, 'Laptop', 'Dell XPS 15', 'DXP-002', '2015-06-10', 'Good'),
(3, 'Laptop', 'MacBook Pro 14"', 'MPB-003', '2018-03-22', 'Excellent'),
(7, 'Phone', 'iPhone 13', 'IPH-007', '2020-01-30', 'Good'),
(8, 'Laptop', 'MacBook Air M1', 'MBA-008', '2021-04-10', 'Excellent'),
(3, 'Monitor', 'Dell 27" 4K', 'DEL-003M', '2019-05-15', 'Good'),
(4, 'Laptop', 'HP Spectre x360', 'HPS-004', '2019-02-14', 'Fair');

-- 19. Seed Promotions (depends on Employees and Positions)
INSERT INTO public.Promotions (employee_id, from_position_id, to_position_id, promotion_date, salary_increase, reason) VALUES
(3, 8, 3, '2020-06-15', 20000, 'Exceptional performance as junior developer'),
(4, 9, 4, '2020-12-01', 15000, 'Successful marketing campaigns'),
(8, 8, 3, '2023-01-01', 10000, 'Ready for senior engineering role');

-- 20. Seed Resignations (depends on Employees)
INSERT INTO public.Resignations (employee_id, resignation_date, last_working_day, reason, rehireable) VALUES
(10, '2022-11-15', '2022-12-15', 'Relocating to another city', TRUE),
(12, '2022-12-01', '2023-01-01', 'Better career opportunity', FALSE);

-- Update status for resigned employees
UPDATE public.Employees SET status = 'Resigned' WHERE employee_id IN (10, 12);

-- Commit transaction
COMMIT;