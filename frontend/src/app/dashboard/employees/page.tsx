// src/app/dashboard/employees/page.tsx
"use client";
import { useQuery } from "@tanstack/react-query";
import { getEmployees } from "@/api/employeeService";
import EmployeeTable from "@/components/EmployeeTable";

export default function EmployeesPage() {
  const { data: employees, isLoading, error } = useQuery({
    queryKey: ["employees"],
    queryFn: getEmployees
  });

  if (isLoading) return <div className="text-blue-700">Loading employees...</div>;
  // if (error) return <div className="text-red-600">Error loading employees</div>;
  if(error) console.log(error);
  console.log(employees);

  // Show fallback if EmployeeTable fails or employees is not an array
  const showFallback = !Array.isArray(employees) || employees.length === 0;

  return (
    <div className="bg-white rounded-lg shadow p-8">
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-2xl font-bold text-blue-900">Employee Management</h1>
        <button className="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition font-semibold shadow">
          Add Employee
        </button>
      </div>
      {!showFallback ? (
        <EmployeeTable employees={employees} />
      ) : (
        <div>
          <p className="text-blue-700 mb-2">No employees found or data format issue.</p>
          <pre className="bg-blue-50 p-2 rounded text-xs text-blue-900 overflow-x-auto max-w-full">{JSON.stringify(employees, null, 2)}</pre>
        </div>
      )}
    </div>
  );
}