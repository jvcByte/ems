// src/app/dashboard/payroll/page.tsx
"use client";

// Dummy data for illustration; replace with real API call
const dummyPayroll = [
  {
    id: 1,
    name: "Alice Smith",
    month: "April 2025",
    amount: "$3,000",
    status: "Paid",
  },
  {
    id: 2,
    name: "Bob Johnson",
    month: "April 2025",
    amount: "$2,800",
    status: "Pending",
  },
  {
    id: 3,
    name: "Carol Lee",
    month: "April 2025",
    amount: "$3,200",
    status: "Paid",
  },
];

export default function PayrollPage() {
  // Replace with useQuery for real API
  const payroll = dummyPayroll;

  return (
    <div className="bg-white rounded-lg shadow p-8">
      <h1 className="text-2xl font-bold text-blue-900 mb-6">Payroll</h1>
      <table className="w-full text-left border border-blue-100 rounded">
        <thead>
          <tr className="bg-blue-50 text-blue-700">
            <th className="p-2">Name</th>
            <th className="p-2">Month</th>
            <th className="p-2">Amount</th>
            <th className="p-2">Status</th>
          </tr>
        </thead>
        <tbody>
          {payroll.map((rec) => (
            <tr
              key={rec.id}
              className="border-t border-blue-100 hover:bg-blue-50"
            >
              <td className="p-2 text-blue-700 font-medium">{rec.name}</td>
              <td className="p-2 text-blue-700">{rec.month}</td>
              <td className="p-2 text-blue-700">{rec.amount}</td>
              <td
                className={`p-2 font-semibold ${rec.status === "Paid" ? "text-green-600" : "text-yellow-600"}`}
              >
                {rec.status}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
