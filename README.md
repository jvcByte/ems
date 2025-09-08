# Employee Management System (EMS)

## 📋 Overview

The Employee Management System (EMS) is a full-stack web application designed to streamline HR processes including employee data management, attendance tracking, and payroll processing. The system provides a modern, responsive interface for administrators and HR personnel to efficiently manage organizational resources.

## 🚀 Features

- **Employee Management**: Add, view, update, and deactivate employee records
- **Attendance Tracking**: Record and monitor employee attendance and time tracking
- **Payroll Processing**: Generate and manage employee payrolls
- **User Authentication**: Secure login and role-based access control
- **Dashboard**: Overview of key metrics and statistics
- **Responsive Design**: Works on desktop and mobile devices

## 🏗️ System Architecture

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│    Frontend     │◄───►│    Backend      │◄───►|   Database     |
│  (Next.js)      │     |  (Spring Boot)  |     |  (PostgreSQL)  |
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

## 🛠️ Tech Stack

### Frontend
- **Framework**: Next.js 14
- **Language**: TypeScript
- **Styling**: Tailwind CSS
- **State Management**: React Query
- **Authentication**: NextAuth.js
- **UI Components**: Headless UI
- **Form Handling**: React Hook Form
- **Data Visualization**: Recharts

### Backend
- **Framework**: Spring Boot 3.2.x
- **Language**: Java 17+
- **Build Tool**: Maven
- **Database**: PostgreSQL 15+
- **API Documentation**: SpringDoc OpenAPI
- **Authentication**: JWT (JSON Web Tokens)
- **Validation**: Hibernate Validator

### Database
- **RDBMS**: PostgreSQL
- **ORM**: Hibernate/JPA
- **Migrations**: Flyway (or manual SQL scripts)

## 📂 Project Structure

```
ems/
│
├── backend/          # Java Spring Boot backend API
│   ├── src/
│   │   ├── main/java/com/example/ems/
│   │   │   ├── config/        # Configuration classes
│   │   │   ├── controller/    # REST controllers
│   │   │   ├── model/         # Entity classes
│   │   │   ├── repository/    # Data access layer
│   │   │   ├── service/       # Business logic
│   │   │   ├── security/      # Security configuration
│   │   │   └── util/          # Utility classes
│   │   └── resources/
│   │       └── application.properties  # Application config
│   └── pom.xml                # Maven configuration
│
├── frontend/         # Next.js frontend application
│   ├── public/       # Static files
│   └── src/
│       ├── app/      # Next.js app directory
│       │   ├── api/          # API route handlers
│       │   ├── dashboard/    # Dashboard page
│       │   ├── employees/    # Employee management
│       │   ├── attendance/   # Attendance tracking
│       │   ├── payroll/      # Payroll management
│       │   └── login/        # Authentication
│       ├── components/       # Reusable components
│       ├── hooks/            # Custom React hooks
│       ├── lib/              # Utilities and config
│       └── types/            # TypeScript type definitions
│
└── Database/         # Database scripts
    ├── ems_db.sql   # Database schema
    └── seed_db.sql  # Initial data population
```

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ and npm 9+
- Java 17 or higher
- Maven 3.8+
- PostgreSQL 15+
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/jvcByte/ems.git
   cd ems
   ```

2. **Set up the database**
   - Create a new PostgreSQL database named `ems`
   - Run the `Database/ems_db.sql` script to create the database schema
   - Run the `Database/seed_db.sql` script to populate the database with initial data
   - you can use pgAdmin or any other PostgreSQL client to connect to the database and run the scripts

3. **Configure the backend**
   - Navigate to the backend directory: `cd backend`
   - Update the database connection in `src/main/resources/application.properties`, make sure to update the username and password
   - Build the project: `mvn clean install`
   - Run the application: `mvn spring-boot:run`
   - The backend will be available at `http://localhost:8080`

4. **Configure the frontend**
   - Open a new terminal and navigate to the frontend directory: `cd ../frontend`
   - Install dependencies: `npm install`
   - Navigat to `frontend/src/lib/config.ts` and make sure the API_BASE_URL and AUTH_BASE_URL are configured like this:
   ```
   export const API_BASE_URL = 'http://localhost:8080/api';
   export const AUTH_BASE_URL = 'http://localhost:8080';
   ```
   - Start the development server: `npm run dev`
   - The frontend will be available at `http://localhost:3000`

## 📚 API Documentation

Once the backend is running, you can access the API documentation at [API Documentation](API_DOCUMENTATION.md).

## 🔒 Authentication

The system uses JWT (JSON Web Tokens) for session management. The frontend will handle the authentication process and store the token in the browser's local storage. The token will be automatically included in the Authorization header for subsequent requests. Please note that user verification is not implemented yet, so the login process is not secure. Just session management is implemented.

## 🧪 Testing

### Backend Tests
```bash
cd backend
mvn test
```

### Frontend Tests
```bash
cd frontend
npm run build
```

## 🧩 Environment Variables

### Backend (application.properties)
```properties
# Server Configuration
server.port=8080

# Database Configuration
spring.datasource.url=jdbc:postgresql://localhost:5432/ems
spring.datasource.username=your_db_username
spring.datasource.password=your_db_password
spring.jpa.hibernate.ddl-auto=validate
spring.jpa.show-sql=true
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📫 Contact

Project Link: [https://github.com/jvcByte/ems](https://github.com/jvcByte/ems)

## 🙏 Acknowledgments

- [Next.js Documentation](https://nextjs.org/docs)
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [maven documentation](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)
- [Java Documentation](https://docs.oracle.com/en/java/)
- [NextAuth Documentation](https://next-auth.js.org)
- [axios documentation](https://axios-http.com/docs/intro)
- [OpenJDK Documentation](https://openjdk.org/)

---

<div align="center">
  Made with ❤️ by jvcByte
</div>
