# University Course Management System

## 📌 Project Overview

The **University Course Management System** is a relational database project developed using MySQL to manage university departments, students, courses, instructors, and student enrollments.

The project demonstrates practical SQL operations for maintaining academic records, retrieving related information, analyzing course enrollments, and generating useful reports.

It covers fundamental and advanced SQL concepts, including CRUD operations, filtering, grouping, aggregate functions, joins, subqueries, date functions, string manipulation, window functions, and conditional expressions.

## 🎯 Project Objectives

- Design and implement a relational university database.
- Manage student, department, course, instructor, and enrollment records.
- Perform INSERT, UPDATE, DELETE, and SELECT operations.
- Retrieve information using SQL clauses and operators.
- Analyze student enrollment patterns and course popularity.
- Calculate average course credits and maximum instructor salaries.
- Retrieve related records using SQL joins.
- Apply subqueries to filter records based on aggregate conditions.
- Use date and string functions to transform information.
- Calculate running totals using window functions.
- Classify students based on their enrollment dates using conditional logic.

## 🛠️ Technologies Used

| Component | Technology |
|---|---|
| Database Management System | MySQL |
| Query Language | SQL |
| Database Tools | MySQL Workbench / phpMyAdmin |
| Database Type | Relational Database |
| Project Category | University Database Management |

## 🗄️ Database Information

**Database Name:** `UniversityCourseDB`

The database contains five main tables:

1. Departments
2. Students
3. Courses
4. Instructors
5. Enrollments

These tables are connected using primary keys and foreign keys to maintain relationships and data integrity.

## 📂 Database Structure

### 1. Departments Table

Stores information about university departments.

| Column | Data Type | Description |
|---|---|---|
| DepartmentID | INT | Unique department identifier and Primary Key |
| DepartmentName | VARCHAR(100) | Department name; must be unique |

**Purpose:** Organizes courses and instructors by academic department.

### 2. Students Table

Stores student personal and enrollment information.

| Column | Data Type | Description |
|---|---|---|
| StudentID | INT | Unique student identifier and Primary Key |
| FirstName | VARCHAR(50) | Student's first name |
| LastName | VARCHAR(50) | Student's last name |
| Email | VARCHAR(100) | Unique student email address |
| BirthDate | DATE | Student's date of birth |
| EnrollmentDate | DATE | Date the student enrolled at the university |

**Purpose:** Maintains student records and supports enrollment-based analysis.

### 3. Courses Table

Stores information about university courses.

| Column | Data Type | Description |
|---|---|---|
| CourseID | INT | Unique course identifier and Primary Key |
| CourseName | VARCHAR(100) | Name of the course |
| DepartmentID | INT | Associated department and Foreign Key |
| Credits | INT | Number of course credits |

**Purpose:** Organizes available courses and connects them to their respective departments.

### 4. Instructors Table

Stores instructor information and department assignments.

| Column | Data Type | Description |
|---|---|---|
| InstructorID | INT | Unique instructor identifier and Primary Key |
| FirstName | VARCHAR(50) | Instructor's first name |
| LastName | VARCHAR(50) | Instructor's last name |
| Email | VARCHAR(100) | Unique instructor email address |
| DepartmentID | INT | Associated department and Foreign Key |
| Salary | DECIMAL(10,2) | Instructor salary, added in Task 8 |

**Purpose:** Maintains instructor details and supports department-wise salary analysis.

**Note:** The `Salary` column is added using `ALTER TABLE` in Task 8 rather than being included in the initial table definition.

### 5. Enrollments Table

Records student registrations for individual courses.

| Column | Data Type | Description |
|---|---|---|
| EnrollmentID | INT | Unique enrollment identifier and Primary Key |
| StudentID | INT | Associated student and Foreign Key |
| CourseID | INT | Associated course and Foreign Key |
| EnrollmentDate | DATE | Date of course enrollment |

**Purpose:** Connects students and courses through a many-to-many relationship.

**Key Constraint:** The combination of `StudentID` and `CourseID` must be unique, preventing the same student from enrolling in the same course more than once.

## 🔗 Database Relationships

The database uses the following relationships:

- **Departments → Courses:** One department can offer multiple courses.
- **Departments → Instructors:** One department can have multiple instructors.
- **Students → Enrollments:** One student can have multiple enrollment records.
- **Courses → Enrollments:** One course can have multiple enrolled students.

The `Enrollments` table connects the `Students` and `Courses` tables, implementing a many-to-many relationship.

### Referential Integrity

Foreign key constraints ensure that course and instructor department references point to existing departments and that enrollment records reference existing students and courses.

Unique constraints prevent duplicate department names, student email addresses, instructor email addresses, and student-course enrollment combinations.

## 📋 SQL Tasks Implemented

The project includes 16 tasks covering database management, data retrieval, and analytical queries.

### Task 1: CRUD Operations

Demonstrates basic data manipulation across all five tables.

**Operations covered:**
- SELECT — Retrieve records from all tables.
- UPDATE — Modify student emails, course credits, instructor names, enrollment dates, and department names.
- DELETE — Remove enrollment, instructor, course, student, and department records.
- INSERT — Add new departments, students, courses, instructors, and enrollments.

**SQL Concepts:** `SELECT`, `INSERT`, `UPDATE`, `DELETE`

### Task 2: Find Students Enrolled After 2022

Retrieves students whose university enrollment date is January 1, 2023, or later.

**SQL Concepts:** `WHERE`, Date Filtering

### Task 3: Retrieve Mathematics Courses

Displays a maximum of five courses offered by the Mathematics department.

**SQL Concepts:** `JOIN`, `WHERE`, `LIMIT`

### Task 4: Count Students Enrolled in Each Course

Groups enrollment records by course and identifies courses with more than five enrollment records.

**SQL Concepts:** `COUNT()`, `GROUP BY`, `HAVING`

### Task 5: Find Students Enrolled in Both SQL and Data Structures

Identifies students enrolled in both *Introduction to SQL* and *Data Structures*.

**SQL Concepts:** `JOIN`, `IN`, `GROUP BY`, `HAVING`, `COUNT(DISTINCT)`

### Task 6: Find Students Enrolled in SQL or Data Structures

Retrieves students enrolled in either of the two specified courses.

**SQL Concepts:** `JOIN`, `IN`, `DISTINCT`, `ORDER BY`

### Task 7: Calculate Average Course Credits

Calculates the average credit value across all courses.

**SQL Function:** `AVG()`

### Task 8: Find the Maximum Instructor Salary in Computer Science

Adds a salary column to the Instructors table, assigns sample salaries, and retrieves the highest salary among instructors in the Computer Science department.

**SQL Concepts:** `ALTER TABLE`, `UPDATE`, `MAX()`, `JOIN`, `WHERE`

### Task 9: Count Students in Each Department

Calculates the number of distinct students enrolled in courses offered by each department.

**SQL Concepts:** `JOIN`, `COUNT(DISTINCT)`, `GROUP BY`, `ORDER BY`

### Task 10: INNER JOIN Students With Their Courses

Displays student names alongside the courses in which they are enrolled.

**SQL Concepts:** `INNER JOIN`, `ORDER BY`

### Task 11: LEFT JOIN All Students With Their Courses

Displays all students, including those who do not have course enrollment records.

**SQL Concepts:** `LEFT JOIN`

### Task 12: Find Students Enrolled in Courses With More Than 10 Students

Uses a subquery to identify courses with more than 10 enrollment records and retrieves the students enrolled in those courses.

**SQL Concepts:** Subqueries, `IN`, `GROUP BY`, `HAVING`, `COUNT()`

### Task 13: Extract Enrollment Year

Extracts the year from each student's university enrollment date.

**SQL Function:** `YEAR()`

### Task 14: Combine Instructor Names

Combines instructor first and last names into a single full-name column.

**SQL Function:** `CONCAT()`

### Task 15: Calculate a Running Total of Enrollments

Calculates the cumulative number of enrollment records ordered by enrollment date and enrollment ID.

**SQL Concepts:** `COUNT() OVER()`, Window Functions, `ORDER BY`

### Task 16: Classify Students as Senior or Junior

Classifies students based on their university enrollment date.

- **Senior:** Enrollment date is earlier than the date four years before the current date.
- **Junior:** Enrollment date does not meet the Senior condition.

**SQL Concepts:** `CASE`, `DATE_SUB()`, `CURDATE()`

The classification is calculated dynamically using the current date.

## 📊 Key Features

### Student Record Management
Stores student details, email addresses, birth dates, and university enrollment dates.

### Course Management
Organizes courses by department and tracks their credit values.

### Instructor Management
Maintains instructor information and supports salary analysis.

### Enrollment Tracking
Records which students enroll in which courses and when enrollment occurs.

### Course Popularity Analysis
Counts course enrollments and identifies courses that meet specified enrollment thresholds.

### Department-Wise Analysis
Analyzes courses, instructors, and student enrollments across departments.

### Academic Data Retrieval
Uses joins and subqueries to retrieve connected information efficiently.

### Enrollment Trend Analysis
Calculates cumulative enrollment totals and classifies students based on enrollment dates.

## 🚀 How to Run the Project

Follow these steps to execute the SQL project.

### Step 1: Open MySQL

Launch MySQL Workbench, phpMyAdmin, or another compatible MySQL database tool.

### Step 2: Create the Database

Execute the following SQL statements:

```sql
CREATE DATABASE IF NOT EXISTS UniversityCourseDB;
USE UniversityCourseDB;
```

### Step 3: Create the Tables

Execute the five `CREATE TABLE` statements in the following order:

1. Departments
2. Students
3. Courses
4. Instructors
5. Enrollments

This order ensures that the referenced tables exist before their foreign key relationships are created.

### Step 4: Insert Sample Data

Execute the `INSERT INTO` statements to populate the tables with sample records.

Ensure that departments, students, and courses exist before inserting the enrollment records that reference them.

### Step 5: Execute the SQL Tasks

Run Tasks 1–16 individually to test the database operations and retrieve the required results.

**Important:** Some queries modify or delete existing records. For consistent results, execute the complete project on a fresh database or restore the original sample data before rerunning the queries.

### Step 6: Review Query Results

Verify that the outputs match the conditions specified in each task.

Pay particular attention to the joins, aggregate calculations, enrollment counts, and running totals.

## 📚 SQL Concepts Covered

This project demonstrates the following SQL concepts:

- Database creation and selection
- Table creation and data insertion
- CRUD operations
- Primary keys and foreign keys
- Unique constraints
- Referential integrity
- ALTER TABLE
- WHERE and LIMIT clauses
- GROUP BY and HAVING clauses
- INNER JOIN and LEFT JOIN
- Aggregate functions
- Subqueries
- IN and DISTINCT
- Date and time functions
- String manipulation functions
- Window functions
- Running totals
- Conditional expressions using CASE

## 🎓 Learning Outcomes

After completing this project, learners should be able to:

1. Design and implement a relational database.
2. Create tables with primary keys, foreign keys, and unique constraints.
3. Perform CRUD operations using SQL.
4. Retrieve related information using joins.
5. Apply filtering, sorting, and grouping operations.
6. Calculate aggregate statistics for courses and departments.
7. Use subqueries to solve data retrieval problems.
8. Manipulate dates and combine text values.
9. Calculate running totals using window functions.
10. Apply conditional expressions to classify records.
11. Maintain relational data integrity.
12. Develop practical SQL queries for university data management.

## 🔮 Future Enhancements

The project can be extended with the following features:

- Add student grades and examination results.
- Introduce course prerequisites.
- Assign instructors directly to courses.
- Add semester-wise course scheduling.
- Generate student transcripts.
- Develop department-wise enrollment reports.
- Create views for frequently used queries.
- Add indexes to improve query performance.
- Build a web-based university management dashboard.
- Connect the database to a Python application for data analysis.

# 👩‍💻 Author

**Janhavi Rathore**

A SQL/MySQL practice project demonstrating relational database design
and basic data analysis.
