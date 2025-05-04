--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Ubuntu 17.4-1.pgdg24.04+2)
-- Dumped by pg_dump version 17.4 (Ubuntu 17.4-1.pgdg24.04+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    date timestamp(6) without time zone NOT NULL,
    check_in_time timestamp without time zone,
    check_out_time timestamp without time zone,
    status character varying(20) NOT NULL
);


ALTER TABLE public.attendance OWNER TO postgres;

--
-- Name: attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attendance_id_seq OWNER TO postgres;

--
-- Name: attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attendance_id_seq OWNED BY public.attendance.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    department character varying(50) NOT NULL,
    "position" character varying(50) NOT NULL,
    salary numeric(10,2) NOT NULL,
    date_of_joining date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_id_seq OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employees.id;


--
-- Name: payroll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payroll (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    period_start date NOT NULL,
    period_end date NOT NULL,
    basic_salary numeric(38,2) NOT NULL,
    deductions numeric(38,2) DEFAULT 0,
    bonuses numeric(10,2) DEFAULT 0,
    net_salary numeric(38,2) NOT NULL,
    payment_date timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.payroll OWNER TO postgres;

--
-- Name: payroll_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payroll_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payroll_id_seq OWNER TO postgres;

--
-- Name: payroll_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payroll_id_seq OWNED BY public.payroll.id;


--
-- Name: attendance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance ALTER COLUMN id SET DEFAULT nextval('public.attendance_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: payroll id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll ALTER COLUMN id SET DEFAULT nextval('public.payroll_id_seq'::regclass);


-- Insert data for attendance
INSERT INTO public.attendance (id, employee_id, date, check_in_time, check_out_time, status) VALUES
(1, 1, '2025-04-01 00:00:00', '2025-04-01 08:58:00', '2025-04-01 17:05:00', 'Present'),
(2, 1, '2025-04-02 00:00:00', '2025-04-02 09:15:00', '2025-04-02 17:10:00', 'Late'),
(3, 2, '2025-04-01 00:00:00', '2025-04-01 08:45:00', '2025-04-01 16:50:00', 'Present'),
(4, 3, '2025-04-01 00:00:00', NULL, NULL, 'Absent');

-- Reset the attendance sequence to continue after the last inserted id
SELECT pg_catalog.setval('public.attendance_id_seq', 4, true);

-- Insert data for employees
INSERT INTO public.employees (id, first_name, last_name, email, department, "position", salary, date_of_joining) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'Engineering', 'Software Engineer', 75000.00, '2024-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'HR', 'HR Manager', 65000.00, '2023-11-20'),
(3, 'Mike', 'Johnson', 'mike.johnson@example.com', 'Sales', 'Sales Executive', 55000.00, '2024-02-10');

-- Reset the employee sequence to continue after the last inserted id
SELECT pg_catalog.setval('public.employee_id_seq', 3, true);

-- Insert data for payroll
INSERT INTO public.payroll (id, employee_id, period_start, period_end, basic_salary, deductions, bonuses, net_salary, payment_date) VALUES
(1, 1, '2025-03-01', '2025-03-31', 75000.00, 1250.00, 1000.00, 74750.00, '2025-04-05 00:00:00'),
(2, 2, '2025-03-01', '2025-03-31', 65000.00, 850.00, 500.00, 64650.00, '2025-04-05 00:00:00'),
(3, 3, '2025-03-01', '2025-03-31', 55000.00, 750.00, 300.00, 54550.00, '2025-04-05 00:00:00');

-- Reset the payroll sequence to continue after the last inserted id
SELECT pg_catalog.setval('public.payroll_id_seq', 3, true);

--
-- Name: attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attendance_id_seq', 4, true);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 3, true);


--
-- Name: payroll_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payroll_id_seq', 3, true);


--
-- Name: attendance attendance_employee_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_employee_id_date_key UNIQUE (employee_id, date);


--
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);


--
-- Name: employees employee_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_email_key UNIQUE (email);


--
-- Name: employees employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: payroll payroll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll
    ADD CONSTRAINT payroll_pkey PRIMARY KEY (id);


--
-- Name: attendance attendance_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- Name: payroll payroll_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll
    ADD CONSTRAINT payroll_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- PostgreSQL database dump complete
--

