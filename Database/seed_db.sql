   
    -- Seed Script for PostgreSQL HR Database

-- Insert data into Employees table (with self-referencing foreign key)
-- First insert managers with NULL reporting_manager_id
INSERT INTO Employees (first_name, last_name, email, phone, date_of_birth, address, hire_date, status, emergency_contact)
VALUES 
('John', 'Smith', 'john.smith@company.com', '555-123-4567', '1975-05-15', '123 Main St, City, State 12345', '2010-01-10', 'Active', 'Jane Smith (Wife): 555-123-4568'),
('Sarah', 'Johnson', 'sarah.johnson@company.com', '555-234-5678', '1980-08-21', '456 Oak Ave, City, State 12345', '2012-03-15', 'Active', 'Michael Johnson (Husband): 555-234-5679'),
('Michael', 'Williams', 'michael.williams@company.com', '555-345-6789', '1978-11-30', '789 Pine Rd, City, State 12345', '2011-07-20', 'Active', 'Emily Williams (Wife): 555-345-6780');

-- Now insert employees with manager references
INSERT INTO Employees (first_name, last_name, email, phone, date_of_birth, address, hire_date, status, emergency_contact, reporting_manager_id)
VALUES 
('Robert', 'Jones', 'robert.jones@company.com', '555-456-7890', '1985-04-12', '321 Elm St, City, State 12345', '2015-02-15', 'Active', 'Lisa Jones (Wife): 555-456-7891', 1),
('Jennifer', 'Brown', 'jennifer.brown@company.com', '555-567-8901', '1990-07-23', '654 Maple Dr, City, State 12345', '2017-05-10', 'Active', 'David Brown (Husband): 555-567-8902', 1),
('David', 'Miller', 'david.miller@company.com', '555-678-9012', '1983-09-05', '987 Cedar Ln, City, State 12345', '2014-11-05', 'Active', 'Karen Miller (Wife): 555-678-9013', 2),
('Emily', 'Davis', 'emily.davis@company.com', '555-789-0123', '1988-12-15', '741 Birch Blvd, City, State 12345', '2016-08-20', 'Active', 'Thomas Davis (Husband): 555-789-0124', 2),
('James', 'Wilson', 'james.wilson@company.com', '555-890-1234', '1982-03-25', '852 Willow Way, City, State 12345', '2013-06-12', 'Active', 'Mary Wilson (Wife): 555-890-1235', 3),
('Jessica', 'Taylor', 'jessica.taylor@company.com', '555-901-2345', '1987-06-30', '963 Spruce St, City, State 12345', '2018-04-18', 'On Leave', 'Mark Taylor (Husband): 555-901-2346', 3),
('Daniel', 'Anderson', 'daniel.anderson@company.com', '555-012-3456', '1992-01-20', '159 Aspen Ave, City, State 12345', '2019-10-05', 'Active', 'Laura Anderson (Wife): 555-012-3457', 1);

-- Insert data into Departments table
INSERT INTO Departments (department_name, location, manager_id, description)
VALUES 
('Human Resources', 'Floor 2, East Wing', 1, 'Responsible for recruitment, employee relations, and organizational development'),
('Engineering', 'Floor 3, North Wing', 2, 'Designs, develops, and maintains company software and hardware systems'),
('Marketing', 'Floor 2, West Wing', 3, 'Develops and implements marketing strategies to promote products and services');

-- Insert data into Positions table
INSERT INTO Positions (job_title, description, department_id, salary_grade, responsibilities)
VALUES 
('HR Director', 'Leads the HR department and develops HR strategies', 1, 8.5, 'Strategic planning, policy development, leadership'),
('HR Manager', 'Manages HR operations and staff', 1, 7.0, 'Employee relations, performance management, recruitment'),
('HR Specialist', 'Handles specific HR functions', 1, 5.5, 'Benefits administration, onboarding, compliance'),
('Engineering Director', 'Leads the engineering team and technical initiatives', 2, 9.0, 'Technical leadership, product roadmap, architecture decisions'),
('Senior Software Engineer', 'Develops advanced software solutions', 2, 7.5, 'Software architecture, code reviews, mentoring'),
('Software Engineer', 'Develops and maintains software', 2, 6.0, 'Coding, testing, debugging, documentation'),
('Marketing Director', 'Leads marketing strategies and campaigns', 3, 8.5, 'Brand strategy, market research, campaign planning'),
('Marketing Manager', 'Manages marketing projects and team', 3, 7.0, 'Project management, content strategy, analytics'),
('Marketing Specialist', 'Executes marketing initiatives', 3, 5.5, 'Content creation, social media management, event coordination');

-- Insert data into Salaries table
INSERT INTO Salaries (employee_id, base_salary, bonuses, deductions, effective_date, currency, payment_type)
VALUES 
(1, 120000.00, 15000.00, 2000.00, '2023-01-01', 'USD', 'Monthly'),
(2, 115000.00, 12000.00, 1900.00, '2023-01-01', 'USD', 'Monthly'),
(3, 110000.00, 11000.00, 1800.00, '2023-01-01', 'USD', 'Monthly'),
(4, 85000.00, 8000.00, 1500.00, '2023-01-01', 'USD', 'Monthly'),
(5, 75000.00, 7000.00, 1300.00, '2023-01-01', 'USD', 'Bi-weekly'),
(6, 90000.00, 9000.00, 1600.00, '2023-01-01', 'USD', 'Bi-weekly'),
(7, 80000.00, 7500.00, 1400.00, '2023-01-01', 'USD', 'Bi-weekly'),
(8, 95000.00, 9500.00, 1700.00, '2023-01-01', 'USD', 'Monthly'),
(9, 70000.00, 6500.00, 1200.00, '2023-01-01', 'USD', 'Bi-weekly'),
(10, 65000.00, 6000.00, 1100.00, '2023-01-01', 'USD', 'Bi-weekly');

-- Insert data into Attendance table
INSERT INTO Attendance (employee_id, check_in, check_out, status, attendance_date, notes)
VALUES 
(4, '2023-05-01 09:00:00', '2023-05-01 17:30:00', 'Present', '2023-05-01', NULL),
(5, '2023-05-01 08:45:00', '2023-05-01 17:15:00', 'Present', '2023-05-01', NULL),
(6, '2023-05-01 09:15:00', '2023-05-01 17:45:00', 'Late', '2023-05-01', 'Traffic delay'),
(7, '2023-05-01 08:30:00', '2023-05-01 16:30:00', 'Present', '2023-05-01', NULL),
(8, '2023-05-01 09:00:00', '2023-05-01 17:00:00', 'Present', '2023-05-01', NULL),
(9, NULL, NULL, 'Absent', '2023-05-01', 'Sick leave'),
(10, NULL, NULL, 'Work from home', '2023-05-01', 'Approved remote work');

-- Insert data into Leaves table
INSERT INTO Leaves (employee_id, start_date, end_date, leave_type, status, reason, approver_id)
VALUES 
(5, '2023-05-10', '2023-05-12', 'Vacation', 'Approved', 'Family trip', 1),
(6, '2023-05-15', '2023-05-15', 'Personal', 'Approved', 'Personal appointment', 2),
(7, '2023-05-20', '2023-05-21', 'Sick', 'Approved', 'Doctor advised rest', 2),
(9, '2023-05-01', '2023-05-02', 'Sick', 'Approved', 'Flu', 3),
(10, '2023-05-25', '2023-05-26', 'Vacation', 'Pending', 'Weekend getaway', 1);

-- Insert data into Performance table
INSERT INTO Performance (employee_id, review_date, reviewer_id, rating, comments, goals, next_review_date)
VALUES 
(4, '2022-12-15', 1, 4, 'Excellent team player, consistently meets deadlines', 'Focus on leadership skills development', '2023-12-15'),
(5, '2022-12-15', 1, 3, 'Good performance, needs improvement in communication', 'Enhance communication skills', '2023-12-15'),
(6, '2022-12-15', 2, 5, 'Outstanding performance, exceeds expectations', 'Work on advanced technical skills', '2023-12-15'),
(7, '2022-12-15', 2, 4, 'Strong performer, reliable team member', 'Develop project management skills', '2023-12-15'),
(8, '2022-12-15', 3, 3, 'Meets expectations, room for growth', 'Improve analytical thinking', '2023-12-15'),
(9, '2022-12-15', 3, 4, 'Creative and innovative approach', 'Enhance collaboration with other departments', '2023-12-15'),
(10, '2022-12-15', 1, 3, 'Satisfactory performance, on track for growth', 'Develop technical expertise', '2023-12-15');

-- Insert data into Training table
INSERT INTO Training (employee_id, training_name, start_date, end_date, provider, completed, certificate_id)
VALUES 
(4, 'Leadership Development', '2023-03-01', '2023-03-05', 'Leadership Institute', TRUE, 'CERT-LD-2023-1234'),
(5, 'Communication Skills', '2023-03-15', '2023-03-16', 'Professional Development Center', TRUE, 'CERT-CS-2023-5678'),
(6, 'Advanced Java Programming', '2023-04-10', '2023-04-14', 'Tech Academy', TRUE, 'CERT-AJP-2023-9012'),
(7, 'Project Management Fundamentals', '2023-04-20', '2023-04-22', 'PM Institute', TRUE, 'CERT-PMF-2023-3456'),
(8, 'Data Analysis Techniques', '2023-05-05', '2023-05-07', 'Data Science School', FALSE, NULL),
(9, 'Digital Marketing Strategies', '2023-05-15', '2023-05-17', 'Marketing Academy', FALSE, NULL),
(10, 'Cloud Computing Basics', '2023-05-10', '2023-05-12', 'Tech Institute', TRUE, 'CERT-CCB-2023-7890');

-- Insert data into Projects table
INSERT INTO Projects (project_name, start_date, end_date, status, description, manager_id, budget)
VALUES 
('HR System Upgrade', '2023-01-15', '2023-06-30', 'In Progress', 'Upgrading the current HR management system', 1, 50000.00),
('Mobile App Development', '2023-02-01', '2023-08-31', 'In Progress', 'Developing a new customer-facing mobile application', 2, 75000.00),
('Q2 Marketing Campaign', '2023-04-01', '2023-06-30', 'In Progress', 'Marketing campaign for Q2 product launch', 3, 35000.00);

-- Insert data into EmployeeProjects table
INSERT INTO EmployeeProjects (project_id, employee_id, role, start_date, end_date, hours_allocated)
VALUES 
(1, 1, 'Project Lead', '2023-01-15', '2023-06-30', 20),
(1, 4, 'Team Member', '2023-01-15', '2023-06-30', 15),
(1, 5, 'Team Member', '2023-01-15', '2023-06-30', 10),
(2, 2, 'Project Lead', '2023-02-01', '2023-08-31', 25),
(2, 6, 'Senior Developer', '2023-02-01', '2023-08-31', 30),
(2, 7, 'Developer', '2023-02-01', '2023-08-31', 30),
(2, 10, 'QA Tester', '2023-02-01', '2023-08-31', 20),
(3, 3, 'Project Lead', '2023-04-01', '2023-06-30', 15),
(3, 8, 'Team Member', '2023-04-01', '2023-06-30', 25),
(3, 9, 'Team Member', '2023-04-01', '2023-06-30', 25);

-- Insert data into Documents table
INSERT INTO Documents (employee_id, document_type, upload_date, file_path, description, expiry_date)
VALUES 
(1, 'ID Proof', '2022-01-10', '/documents/employees/1/id_proof.pdf', 'National ID card', '2032-01-10'),
(1, 'Resume', '2022-01-10', '/documents/employees/1/resume.pdf', 'Professional resume', NULL),
(2, 'ID Proof', '2022-03-15', '/documents/employees/2/id_proof.pdf', 'National ID card', '2030-03-15'),
(2, 'Resume', '2022-03-15', '/documents/employees/2/resume.pdf', 'Professional resume', NULL),
(3, 'ID Proof', '2022-07-20', '/documents/employees/3/id_proof.pdf', 'National ID card', '2031-07-20'),
(3, 'Resume', '2022-07-20', '/documents/employees/3/resume.pdf', 'Professional resume', NULL),
(4, 'ID Proof', '2022-02-15', '/documents/employees/4/id_proof.pdf', 'National ID card', '2032-02-15'),
(5, 'ID Proof', '2022-05-10', '/documents/employees/5/id_proof.pdf', 'National ID card', '2032-05-10');

-- Insert data into Users table
INSERT INTO Users (employee_id, username, password_hash, last_login, is_active, email)
VALUES 
(1, 'john.smith', '$2a$12$1234567890abcdefghijkl', '2023-05-01 08:45:12', TRUE, 'john.smith@company.com'),
(2, 'sarah.johnson', '$2a$12$abcdefghijkl1234567890', '2023-05-01 08:30:45', TRUE, 'sarah.johnson@company.com'),
(3, 'michael.williams', '$2a$12$ghijkl1234567890abcdef', '2023-05-01 08:55:23', TRUE, 'michael.williams@company.com'),
(4, 'robert.jones', '$2a$12$jkl1234567890abcdefghi', '2023-05-01 09:05:10', TRUE, 'robert.jones@company.com'),
(5, 'jennifer.brown', '$2a$12$567890abcdefghijkl1234', '2023-05-01 08:40:36', TRUE, 'jennifer.brown@company.com');

-- Insert data into Roles table
INSERT INTO Roles (role_name, description, permissions)
VALUES 
('Admin', 'Full system access', '{"all": true}'),
('HR Manager', 'Access to HR functions', '{"employees": {"read": true, "write": true}, "attendance": {"read": true, "write": true}, "leaves": {"read": true, "write": true}, "performance": {"read": true, "write": true}}'),
('Department Manager', 'Access to department data', '{"employees": {"read": true, "write": false}, "attendance": {"read": true, "write": false}, "leaves": {"read": true, "write": true}, "projects": {"read": true, "write": true}}'),
('Employee', 'Basic access', '{"profile": {"read": true, "write": false}, "attendance": {"read": true, "write": false}, "leaves": {"read": true, "write": true}}');

-- Insert data into User_Roles table
INSERT INTO User_Roles (user_id, role_id, assigned_date)
VALUES 
(1, 1, '2023-01-01 00:00:00'),
(1, 2, '2023-01-01 00:00:00'),
(2, 3, '2023-01-01 00:00:00'),
(3, 3, '2023-01-01 00:00:00'),
(4, 4, '2023-01-01 00:00:00'),
(5, 4, '2023-01-01 00:00:00');

-- Insert data into AuditLogs table
INSERT INTO AuditLogs (user_id, timestamp, action, table_affected, record_id, old_value, new_value, ip_address)
VALUES 
(1, '2023-05-01 10:15:23', 'UPDATE', 'Employees', '5', '{"status": "Active"}', '{"status": "On Leave"}', '192.168.1.100'),
(2, '2023-05-01 11:30:45', 'INSERT', 'Leaves', '3', NULL, '{"employee_id": 7, "start_date": "2023-05-20", "end_date": "2023-05-21", "leave_type": "Sick"}', '192.168.1.101'),
(3, '2023-05-01 14:20:10', 'UPDATE', 'Projects', '3', '{"status": "Planning"}', '{"status": "In Progress"}', '192.168.1.102');

-- Insert data into Shifts table
INSERT INTO Shifts (employee_id, start_time, end_time, shift_type, notes)
VALUES 
(4, '2023-05-02 09:00:00', '2023-05-02 17:00:00', 'Regular', NULL),
(5, '2023-05-02 09:00:00', '2023-05-02 17:00:00', 'Regular', NULL),
(6, '2023-05-02 09:00:00', '2023-05-02 17:00:00', 'Regular', NULL),
(7, '2023-05-02 09:00:00', '2023-05-02 17:00:00', 'Regular', NULL),
(8, '2023-05-02 09:00:00', '2023-05-02 17:00:00', 'Regular', NULL);

-- Insert data into Assets table
INSERT INTO Assets (employee_id, asset_type, asset_name, serial_number, assignment_date, condition)
VALUES 
(1, 'Laptop', 'Dell XPS 15', 'DX15-78901', '2022-01-15', 'Excellent'),
(1, 'Phone', 'iPhone 13', 'IP13-56789', '2022-01-15', 'Good'),
(2, 'Laptop', 'MacBook Pro', 'MP16-23456', '2022-03-20', 'Excellent'),
(2, 'Phone', 'iPhone 13', 'IP13-67890', '2022-03-20', 'Excellent'),
(3, 'Laptop', 'Dell XPS 13', 'DX13-34567', '2022-07-25', 'Good'),
(4, 'Laptop', 'Lenovo ThinkPad', 'LT14-45678', '2022-02-20', 'Good'),
(5, 'Laptop', 'HP Spectre', 'HS13-56789', '2022-05-15', 'Excellent');

-- Insert data into Promotions table
INSERT INTO Promotions (employee_id, from_position_id, to_position_id, promotion_date, salary_increase, reason, recommended_by)
VALUES 
(4, 3, 2, '2023-01-01', 10000.00, 'Outstanding performance and leadership qualities', 1),
(6, 6, 5, '2023-01-01', 15000.00, 'Exceptional technical skills and project contributions', 2),
(8, 9, 8, '2023-01-01', 12000.00, 'Demonstrated creativity and campaign success', 3);

-- Insert data into Resignations table
INSERT INTO Resignations (employee_id, resignation_date, last_working_day, reason, exit_interview_notes, rehireable)
VALUES 
(9, '2023-04-15', '2023-05-15', 'Career advancement opportunity', 'Positive experience with the company, leaving for better role', TRUE);

