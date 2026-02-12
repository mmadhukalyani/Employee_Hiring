-- Create database
CREATE DATABASE IF NOT EXISTS employee_hiring;
USE employee_hiring;

-- Users table
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    role ENUM('CANDIDATE', 'INTERVIEWER', 'HR', 'MANAGER', 'ADMIN') NOT NULL,
    status ENUM('ACTIVE', 'INACTIVE', 'REJECTED', 'ONBOARDED') NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_role (role)
);

-- Applications table
CREATE TABLE applications (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    candidate_id BIGINT NOT NULL,
    position VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    status ENUM('APPLIED', 'ONLINE_TEST_SCHEDULED', 'ONLINE_TEST_COMPLETED', 
                'L1_SCHEDULED', 'L1_COMPLETED', 'L1_FAILED',
                'L2_SCHEDULED', 'L2_COMPLETED', 'L2_FAILED',
                'HR_INTERVIEW_SCHEDULED', 'HR_INTERVIEW_COMPLETED', 'HR_FAILED',
                'OFFER_GENERATED', 'OFFER_ACCEPTED', 'OFFER_REJECTED',
                'ONBOARDING_IN_PROGRESS', 'ONBOARDED', 'REJECTED') NOT NULL DEFAULT 'APPLIED',
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_candidate_id (candidate_id),
    INDEX idx_status (status)
);

-- Online Tests table
CREATE TABLE online_tests (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    application_id BIGINT NOT NULL,
    scheduled_date TIMESTAMP NOT NULL,
    test_url VARCHAR(500),
    status ENUM('SCHEDULED', 'IN_PROGRESS', 'COMPLETED', 'PASSED', 'FAILED') NOT NULL DEFAULT 'SCHEDULED',
    score INT,
    total_marks INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES applications(id) ON DELETE CASCADE,
    INDEX idx_application_id (application_id)
);

-- Interviews table
CREATE TABLE interviews (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    application_id BIGINT NOT NULL,
    interviewer_id BIGINT NOT NULL,
    round ENUM('L1', 'L2', 'HR') NOT NULL,
    scheduled_date TIMESTAMP NOT NULL,
    interview_url VARCHAR(500),
    status ENUM('SCHEDULED', 'IN_PROGRESS', 'COMPLETED', 'PASSED', 'FAILED') NOT NULL DEFAULT 'SCHEDULED',
    feedback TEXT,
    rating INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES applications(id) ON DELETE CASCADE,
    FOREIGN KEY (interviewer_id) REFERENCES users(id),
    INDEX idx_application_id (application_id),
    INDEX idx_interviewer_id (interviewer_id)
);

-- Offers table
CREATE TABLE offers (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    application_id BIGINT NOT NULL,
    offer_date TIMESTAMP NOT NULL,
    position VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2),
    start_date DATE,
    offer_status ENUM('GENERATED', 'SENT', 'ACCEPTED', 'REJECTED', 'EXPIRED') NOT NULL DEFAULT 'GENERATED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES applications(id) ON DELETE CASCADE,
    INDEX idx_application_id (application_id)
);

-- Onboarding Forms table
CREATE TABLE onboarding_forms (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    candidate_id BIGINT NOT NULL,
    form_url VARCHAR(500),
    submission_date TIMESTAMP,
    status ENUM('PENDING', 'SUBMITTED', 'VERIFIED', 'REJECTED') NOT NULL DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_candidate_id (candidate_id)
);

-- College Verification table
CREATE TABLE college_verifications (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    candidate_id BIGINT NOT NULL,
    college_email VARCHAR(255),
    college_name VARCHAR(255),
    verification_status ENUM('PENDING', 'VERIFIED', 'REJECTED') NOT NULL DEFAULT 'PENDING',
    verified_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_candidate_id (candidate_id)
);

-- Document Verification table
CREATE TABLE document_verifications (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    candidate_id BIGINT NOT NULL,
    document_type VARCHAR(100),
    document_url VARCHAR(500),
    verification_status ENUM('PENDING', 'VERIFIED', 'REJECTED') NOT NULL DEFAULT 'PENDING',
    verified_by BIGINT,
    verified_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (verified_by) REFERENCES users(id),
    INDEX idx_candidate_id (candidate_id)
);

-- Onboarding Progress table
CREATE TABLE onboarding_progress (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    candidate_id BIGINT NOT NULL,
    form_submitted BIT DEFAULT 0,
    college_verified BIT DEFAULT 0,
    documents_verified BIT DEFAULT 0,
    offer_accepted BIT DEFAULT 0,
    onboarding_completed BIT DEFAULT 0,
    manager_id BIGINT,
    team_name VARCHAR(100),
    office_location VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (manager_id) REFERENCES users(id),
    INDEX idx_candidate_id (candidate_id)
);

-- Learning Resources table
CREATE TABLE learning_resources (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    candidate_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    resource_type ENUM('LINK', 'DOCUMENT', 'VIDEO') NOT NULL,
    resource_url VARCHAR(500),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_candidate_id (candidate_id)
);

-- Prerequisite Checklist table
CREATE TABLE prerequisite_checklist (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    candidate_id BIGINT NOT NULL,
    requirement VARCHAR(255) NOT NULL,
    is_completed BIT DEFAULT 0,
    completed_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_candidate_id (candidate_id)
);
