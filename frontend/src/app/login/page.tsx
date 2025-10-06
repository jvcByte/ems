// src/app/login/page.tsx
"use client";
import { signIn } from "next-auth/react";

export default function LoginPage() {
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    const formData = new FormData(e.target as HTMLFormElement);
    await signIn("credentials", {
      username: formData.get("username"),
      password: formData.get("password"),
      redirect: true,
      callbackUrl: "/dashboard",
    });
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-blue-50">
      <form
        onSubmit={handleSubmit}
        className="bg-white p-8 rounded-lg shadow-md w-full max-w-md border border-blue-100"
      >
        <h2 className="text-2xl font-bold text-center mb-6 text-blue-900">
          Admin Login
        </h2>
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium mb-1 text-blue-700">
              Username
            </label>
            <input
              name="username"
              className="text-gray-600 w-full p-2 border rounded border-blue-300 focus:border-blue-600 focus:outline-none"
              defaultValue="admin"
              required
            />
          </div>
          <div>
            <label className="block text-sm font-medium mb-1 text-blue-700">
              Password
            </label>
            <input
              name="password"
              type="password"
              className=" text-gray-600 w-full p-2 border rounded border-blue-300 focus:border-blue-600 focus:outline-none"
              defaultValue="admin123"
              required
            />
          </div>
          <button
            type="submit"
            className="w-full bg-blue-600 text-white p-2 rounded hover:bg-blue-700 transition font-semibold"
          >
            Sign In
          </button>
        </div>
      </form>
    </div>
  );
}
