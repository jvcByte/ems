// src/app/dashboard/layout.tsx
"use client";
import Sidebar from "@/components/Sidebar";
import AuthCheck from "@/components/AuthCheck";

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <AuthCheck>
      <div className="flex min-h-screen">
        <Sidebar />
        <main className="flex-1 p-6 bg-gray-50">{children}</main>
      </div>
    </AuthCheck>
  );
}
