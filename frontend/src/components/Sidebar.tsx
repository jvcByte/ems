// src/components/Sidebar.tsx
import Link from "next/link";
import {
  BuildingOffice2Icon,
  CalendarIcon,
  CurrencyDollarIcon,
  ArrowLeftOnRectangleIcon,
} from "@heroicons/react/24/outline";
import { signOut } from "next-auth/react";

export default function Sidebar() {
  return (
    <div className="w-64 bg-blue-700 text-white border-r border-blue-800 min-h-screen flex flex-col">
      <div className="p-4 border-b border-blue-800">
        <h1 className="text-xl font-bold tracking-wide">Employee Portal</h1>
      </div>
      <nav className="p-4 space-y-1 flex-1">
        <Link
          href="/dashboard/employees"
          className="flex items-center gap-3 p-2 rounded hover:bg-blue-600 transition-colors"
        >
          <BuildingOffice2Icon className="w-5 h-5" />
          Employees
        </Link>
        <Link
          href="/dashboard/attendance"
          className="flex items-center gap-3 p-2 rounded hover:bg-blue-600 transition-colors"
        >
          <CalendarIcon className="w-5 h-5" />
          Attendance
        </Link>
        <Link
          href="/dashboard/payroll"
          className="flex items-center gap-3 p-2 rounded hover:bg-blue-600 transition-colors"
        >
          <CurrencyDollarIcon className="w-5 h-5" />
          Payroll
        </Link>
      </nav>
      <div className="p-4 border-t border-blue-800 mt-auto">
        <button
          onClick={() => signOut()}
          className="flex items-center gap-3 p-2 rounded hover:bg-blue-600 transition-colors w-full font-semibold"
        >
          <ArrowLeftOnRectangleIcon className="w-5 h-5" />
          Sign Out
        </button>
      </div>
    </div>
  );
}
