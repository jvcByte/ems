// src/lib/auth.ts
import type { AuthOptions } from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";
import axios from "axios";
import { AUTH_BASE_URL } from "@/lib/config";

/**
 * Authentication options for NextAuth.
 * 
 * This configuration defines the authentication providers and session strategy.
 */
export const authOptions: AuthOptions = {
  /**
   * List of authentication providers.
   * 
   * In this case, we're using the CredentialsProvider, which allows users to log in with a username and password.
   */
  providers: [
    CredentialsProvider({
      /**
       * Name of the provider.
       */
      name: "Credentials",
      /**
       * Credentials that the user needs to provide to log in.
       */
      credentials: {
        username: { label: "Username", type: "text" },
        password: { label: "Password", type: "password" },
      },
      /**
       * Function that checks the user's credentials and returns the user's data if they're valid.
       * 
       * In this case, we're making a GET request to a protected endpoint to test the credentials.
       */
      async authorize(credentials) {
        try {
          // You may want to POST to a custom login endpoint, or just check credentials here
          const response = await axios.get(
            `${AUTH_BASE_URL}/api/employees`, // Just a protected endpoint for test
            {
              auth: {
                username: credentials?.username || "",
                password: credentials?.password || "",
              },
            }
          );
          if (response.status === 200) {
            return { id: "1", name: credentials?.username };
          }
          return null;
        } catch {
          return null;
        }
      },
    }),
  ],
  /**
   * Session strategy.
   * 
   * In this case, we're using the JWT strategy, which stores the user's data in a JSON Web Token.
   */
  session: { strategy: "jwt" },
  /**
   * Custom pages for authentication.
   * 
   * In this case, we're defining a custom sign-in page.
   */
  pages: {
    signIn: "/login",
  },
};