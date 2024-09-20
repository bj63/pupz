# Pupz Project

<img alt="Pupz Logo" height="500" src="./assets/img/pupzlogo.png" width="500" title="PUPZ"/>

Pupz is a web-based application for dog lovers, particularly those who own or are fans of specific dog breeds like the American Bully. The app allows users to create dog profiles, manage dog-related data, and more. Administrators can also manage users and their dogs.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup](#setup)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Overview

Pupz is a platform that allows users to create profiles for their dogs, browse other dog profiles, and upload pictures. Admins can manage the system, view dashboards, and ensure proper use of the platform. The application supports CRUD operations for dogs and users and features role-based access for admin functionalities.

## Features

- User authentication and authorization (Admin vs. regular users)
- CRUD operations for managing dog profiles and owner information
- Dog image upload functionality
- Search functionality to filter dogs by breed
- Admin dashboard to view and manage users and their dogs
- Validation for form inputs (e.g., unique dog names, required fields)

## Technologies Used

- **Backend:**
    - Java Spring Boot
    - JPA (Java Persistence API)
    - Hibernate
    - Spring Security for user authentication and role management
    - MySQL for database management
- **Frontend:**
    - HTML5, CSS3, JavaScript
    - Thymeleaf for server-side rendering
    - Bootstrap for styling
- **Other Tools:**
    - Lombok for reducing boilerplate code
    - Logback for logging
    - MultipartFile for file uploads

## Setup

### Prerequisites

To run this project, ensure you have the following installed:

- Java 17+
- Maven 3.8+
- MySQL 8.x
- Git

### Database Configuration

Create a MySQL database for the application. You can use the following script to create the required database:

```sql
CREATE DATABASE pupz_db;
USE pupz_db;
