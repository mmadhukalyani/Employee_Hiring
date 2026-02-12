# Employee Hiring and Onboarding System

A comprehensive Spring Boot, React, and MySQL-based system for managing the entire employee hiring and onboarding process.

## Project Structure

```
Employee_hiring/
├── backend/                 # Spring Boot API
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/hiringsystem/
│   │   │   │   ├── controller/
│   │   │   │   ├── service/
│   │   │   │   ├── repository/
│   │   │   │   ├── entity/
│   │   │   │   └── EmployeeHiringApplication.java
│   │   │   └── resources/
│   │   │       └── application.yml
│   │   └── test/
│   └── pom.xml
├── frontend/                # React Application
│   ├── src/
│   │   ├── pages/
│   │   ├── components/
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── vite.config.js
│   └── package.json
├── database/                # MySQL Schema
│   └── schema.sql
└── README.md
```

## Features

1. **Candidate Application** - Online application for internship/fresher roles
2. **Online Assessment** - Automated online tests with automatic evaluation
3. **Interview Management** - Multi-round interview scheduling (L1, L2, HR)
4. **Offer Generation** - Automated offer letter generation
5. **Onboarding Process** - Complete onboarding form and verification workflow
6. **College Verification** - College credential verification
7. **Document Verification** - HR document verification
8. **Learning Resources** - Pre-joining learning materials and resources
9. **Email Notifications** - Automated email updates at each stage
10. **Dashboard** - Candidate and HR dashboards

## Prerequisites

- Java 17 or higher
- Node.js 16+ and npm
- MySQL 8.0+
- Maven 3.8+

## Backend Setup

### 1. Configure MySQL
```bash
cd database
mysql -u root -p < schema.sql
```

### 2. Update application.yml
Edit `backend/src/main/resources/application.yml` with your:
- MySQL credentials
- Email configuration (Gmail/SMTP)
- JWT secret key

### 3. Build and Run
```bash
cd backend
mvn clean install
mvn spring-boot:run
```

The backend will start on `http://localhost:8080`

## Frontend Setup

### 1. Install Dependencies
```bash
cd frontend
npm install
```

### 2. Run Development Server
```bash
npm run dev
```

The frontend will start on `http://localhost:3000`

### 3. Build for Production
```bash
npm run build
```

## API Endpoints (To be implemented)

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration

### Applications
- `GET /api/applications` - Get all applications
- `POST /api/applications` - Create application
- `GET /api/applications/{id}` - Get application details
- `PUT /api/applications/{id}` - Update application

## Database Schema

The system includes the following main tables:
- `users` - User accounts
- `applications` - Job applications
- `online_tests` - Test schedules and results
- `interviews` - Interview schedules and feedback
- `offers` - Offer letters
- `onboarding_forms` - Candidate onboarding data
- `college_verifications` - College verification status
- `document_verifications` - Document verification status
- `onboarding_progress` - Onboarding completion tracking
- `learning_resources` - Pre-joining resources
- `prerequisite_checklist` - Prerequisite completion tracking

## Workflow

1. **Application Phase**
   - Candidate logs in and applies for position
   - System schedules online test

2. **Assessment Phase**
   - Candidate takes online test
   - System auto-evaluates

3. **Interview Phase**
   - L1 Interview scheduled
   - L2 Interview scheduled (if L1 passed)
   - HR Interview (if L2 passed)

4. **Offer Phase**
   - Offer generated if all interviews passed
   - Candidate accepts/rejects offer

5. **Onboarding Phase**
   - Onboarding form submission
   - College verification
   - Document verification
   - Offer letter generation
   - Welcome email with credentials
   - Pre-joining learning resources

## Extensions Installed

- Extension Pack for Java
- Spring Boot Extension Pack
- ES7+ React/Redux snippets
- Prettier (Code Formatter)
- ESLint
- MySQL
- REST Client
- Git Graph

## Contributing

1. Create a feature branch
2. Make your changes
3. Test thoroughly
4. Create a pull request

## License

Proprietary - All rights reserved
