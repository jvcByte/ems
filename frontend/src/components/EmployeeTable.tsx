// src/components/EmployeeTable.tsx
import { Employee } from '@/api/employeeService';

export default function EmployeeTable({ employees }: { employees: Employee[] }) {
  return (
    <div className="bg-white rounded-lg shadow overflow-hidden">
      <table className="min-w-full divide-y divide-gray-200">
        <thead className="bg-gray-50">
          <tr>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">Name</th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">Email</th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">Department</th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">Position</th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">Salary</th>
          </tr>
        </thead>
        <tbody className="bg-white divide-y divide-gray-200">
          {employees.map((employee) => (
            <tr key={employee.id}>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700 font-medium">{employee.firstName} {employee.lastName}</td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">{employee.email}</td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">{employee.department}</td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">{employee.position}</td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">${employee.salary.toLocaleString()}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}