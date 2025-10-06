// src/components/EmployeeTable.tsx
import { Employee } from "@/api/employeeService";

export default function EmployeeTable({
  employees,
}: {
  employees: Employee[];
}) {
  return (
    <div className="bg-white rounded-lg shadow overflow-hidden">
      <table className="min-w-full divide-y divide-gray-200">
        <thead className="bg-gray-50">
          <tr>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Name
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Email
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Phone
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Date of Birth
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Address
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Hire Date
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Status
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Emergency Contact
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Reporting Manager ID
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Department
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Position
            </th>
            <th className="px-6 text-blue-700 py-3 text-left uppercase tracking-wider">
              Salary
            </th>
          </tr>
        </thead>
        <tbody className="bg-white divide-y divide-gray-200">
          {employees.map((employee) => (
            <tr key={employee.employee_id}>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700 font-medium">
                {employee.first_name} {employee.last_name}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {employee.email}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {employee.phone || "-"}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {employee.date_of_birth
                  ? new Date(employee.date_of_birth).toLocaleDateString()
                  : "-"}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {employee.address || "-"}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {employee.hire_date
                  ? new Date(employee.hire_date).toLocaleDateString()
                  : "-"}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {employee.status}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {employee.emergency_contact || "-"}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {employee.reporting_manager_id || "-"}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {employee.department || "-"}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {employee.position || "-"}
              </td>
              <td className="px-6 py-4 whitespace-nowrap text-blue-700">
                {typeof employee.salary === "number"
                  ? `$${employee.salary.toLocaleString()}`
                  : "-"}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
