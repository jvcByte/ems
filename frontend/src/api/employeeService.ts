// src/api/employeeService.ts
import axios from 'axios';
import { API_BASE_URL } from '@/lib/config';

export type Employee = {
  employee_id: number;
  first_name: string;
  last_name: string;
  email: string;
  phone?: string;
  date_of_birth?: string;
  address?: string;
  hire_date: string;
  status: string;
  emergency_contact?: string;
  reporting_manager_id?: number;
  department?: string;
  position?: string;
  salary?: number;
};

export const getEmployees = async (): Promise<Employee[]> => {
  const response = await axios.get(`${API_BASE_URL}/employees`);
  return response.data;
};