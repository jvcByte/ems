// src/app/dashboard/attendance/page.tsx
"use client";

// Dummy data for illustration; replace with real API call
const dummyAttendance = [
  { id: 1, name: "Alice Smith", date: "2025-04-18", status: "Present" },
  { id: 2, name: "Bob Johnson", date: "2025-04-18", status: "Absent" },
  { id: 3, name: "Carol Lee", date: "2025-04-18", status: "Present" },
];

export default function AttendancePage() {
  // Replace with useQuery for real API
  const attendance = dummyAttendance;

  return (
    <div className="bg-white rounded-lg shadow p-8">
      <h1 className="text-2xl font-bold text-blue-900 mb-6">Attendance</h1>
      <table className="w-full text-left border border-blue-100 rounded">
        <thead>
          <tr className="bg-blue-50 text-blue-700">
            <th className="p-2">Name</th>
            <th className="p-2">Date</th>
            <th className="p-2">Status</th>
          </tr>
        </thead>
        <tbody>
          {attendance.map((rec) => (
            <tr key={rec.id} className="border-t border-blue-100 hover:bg-blue-50">
              <td className="p-2 text-blue-700 font-medium">{rec.name}</td>
              <td className="p-2 text-blue-700">{rec.date}</td>
              <td className={`p-2 font-semibold ${rec.status === "Present" ? "text-green-600" : "text-red-600"}`}>{rec.status}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
