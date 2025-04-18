// src/api/employeeService.ts
import axios from 'axios';
import { API_BASE_URL } from '@/lib/config';

export type Employee = {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  department: string;
  position: string;
  salary: number;
  dateOfJoining: string;
};

export const getEmployees = async (): Promise<Employee[]> => {
  const response = await axios.get(`${API_BASE_URL}/employees`, {
    auth: { username: 'admin', password: 'admin123' }
  });
  return response.data;
};