# Student Tracker Database Management System

## 📌 Project Overview

**Student Tracker Database Management System** is a MySQL-based database project designed to manage student records, faculty information, departments, courses, enrollments, attendance, and academic grades.

The project demonstrates practical applications of SQL through CRUD operations, database relationships, joins, subqueries, aggregate functions, date and string manipulation, window functions, and conditional expressions.

It also supports academic data analysis by identifying student performance levels, calculating attendance percentages, ranking students, and tracking enrollment trends.

## 🎯 Project Objectives

- Create a relational database for managing academic information.
- Store and organize student, faculty, department, and course records.
- Perform INSERT, UPDATE, and DELETE operations.
- Retrieve information using SQL clauses and operators.
- Establish primary key and foreign key relationships.
- Analyze attendance records and academic performance.
- Calculate aggregate statistics using SQL functions.
- Apply window functions to rank students and calculate cumulative values.
- Categorize student performance and attendance using conditional expressions.
- Generate meaningful reports to support academic analysis.

## 🛠️ Technologies Used

| Component | Technology |
|---|---|
| Database Management System | MySQL |
| Query Language | SQL |
| Database Tools | MySQL Workbench / phpMyAdmin |
| Database Type | Relational Database |
| Project Category | Database Management and Academic Data Analysis |

## 🗄️ Database Information

**Database Name:** `student_tracker_db`

The database contains seven tables connected through primary keys and foreign keys.

### 1. Departments

Stores information about academic departments.

| Column | Description |
|---|---|
| department_id | Unique department identifier |
| department_name | Name of the department |

**Key Features:**
- Primary key on `department_id`
- Unique department names

### 2. Faculty

Stores faculty details, contact information, department assignments, and professional experience.

| Column | Description |
|---|---|
| faculty_id | Unique faculty identifier |
| name | Faculty member's name |
| email | Faculty email address |
| phone_number | Contact number |
| department_id | Associated department |
| years_of_experience | Years of professional experience |

**Key Features:**
- Primary key on `faculty_id`
- Unique email addresses
- Foreign key referencing `Departments`
- Default experience value of zero

### 3. Students

Stores student personal and admission information.

| Column | Description |
|---|---|
| student_id | Unique student identifier |
| name | Student's name |
| dob | Date of birth |
| gender | Student's gender |
| email | Email address |
| phone_number | Contact number |
| address | Residential address |
| admission_date | Date of admission |
| department_id | Associated department |

**Key Features:**
- Primary key on `student_id`
- Foreign key referencing `Departments`
- Optional email and department fields
- Gender validation using `ENUM`

### 4. Courses

Stores course information and faculty assignments.

| Column | Description |
|---|---|
| course_id | Unique course identifier |
| course_name | Name of the course |
| faculty_id | Assigned faculty member |

**Key Features:**
- Primary key on `course_id`
- Foreign key referencing `Faculty`
- Allows courses without an assigned faculty member

### 5. Enrollments

Records student registrations for courses.

| Column | Description |
|---|---|
| enrollment_id | Unique enrollment identifier |
| student_id | Enrolled student |
| course_id | Selected course |
| enrollment_date | Date of enrollment |

**Key Features:**
- Primary key on `enrollment_id`
- Foreign keys referencing `Students` and `Courses`
- Composite `UNIQUE` constraint on `(student_id, course_id)` to prevent duplicate enrollment in the same course

### 6. Attendance

Stores student attendance records for individual courses and dates.

| Column | Description |
|---|---|
| attendance_id | Unique attendance record identifier |
| student_id | Student identifier |
| course_id | Course identifier |
| attendance_date | Date of attendance |
| status | Attendance status |

**Supported Attendance Statuses:**
- `Present`
- `Absent`
- `Late`

**Key Features:**
- Primary key on `attendance_id`
- Foreign keys referencing `Students` and `Courses`
- Attendance status validation using `ENUM`

### 7. Grades

Stores students' marks and grades for different courses.

| Column | Description |
|---|---|
| grade_id | Unique grade record identifier |
| student_id | Student identifier |
| course_id | Course identifier |
| marks_obtained | Marks obtained by the student |
| grade | Academic grade |

**Key Features:**
- Primary key on `grade_id`
- Foreign keys referencing `Students` and `Courses`
- Decimal values supported for marks

## 🔗 Database Relationships

The database uses relational constraints to maintain data consistency.

- **Departments → Students:** One department can have multiple students.
- **Departments → Faculty:** One department can have multiple faculty members.
- **Faculty → Courses:** A faculty member can be assigned to multiple courses.
- **Students → Enrollments:** A student can enroll in multiple courses.
- **Courses → Enrollments:** A course can have multiple enrolled students.
- **Students → Attendance:** A student can have multiple attendance records.
- **Courses → Attendance:** A course can have multiple attendance records.
- **Students → Grades:** A student can have multiple grade records.
- **Courses → Grades:** A course can have multiple grade records.

### Referential Integrity

The project uses foreign key constraints with appropriate deletion and update rules.

- `ON DELETE CASCADE` removes related enrollment, attendance, or grade records when their referenced student or course is deleted.
- `ON DELETE SET NULL` preserves faculty or student records when their associated department is deleted, where applicable.
- `ON UPDATE CASCADE` updates related department references when a department ID changes.

These constraints help maintain consistency across related tables.

## 📋 SQL Tasks Implemented

The project contains 12 major tasks covering fundamental and advanced SQL concepts.

### Task 1: Implement CRUD Operations

Demonstrates basic database modification operations.

**Operations covered:**
- INSERT — Add student, faculty, course, and enrollment records.
- UPDATE — Modify student contact information.
- DELETE — Remove a student record.

**SQL Concepts:** `INSERT`, `UPDATE`, `DELETE`

### Task 2: Use SQL Clauses

Retrieves and filters records based on specified conditions.

**Operations covered:**
- Find students belonging to the Computer Science department.
- Display the top 10 students based on average marks.
- Identify students whose attendance percentage is below 75%.

**SQL Concepts:** `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`, `LIMIT`

### Task 3: Apply SQL Operators

Demonstrates logical operators for filtering records.

**Operations covered:**
- Find students with attendance below 50% and average marks below 40.
- Find students with average marks above 90 or attendance of 100%.
- Identify faculty members who are not assigned to any course.

**SQL Concepts:** `AND`, `OR`, `NOT`, `IN`

### Task 4: Sorting and Grouping Data

Organizes student and academic records for reporting.

**Operations covered:**
- Sort students alphabetically.
- Count students in each department.
- Calculate average marks for each course.

**SQL Concepts:** `ORDER BY`, `GROUP BY`, `COUNT()`, `AVG()`

### Task 5: Use Aggregate Functions

Performs statistical calculations on academic data.

**Operations covered:**
- Calculate the institutional average attendance percentage.
- Find the highest, lowest, and average marks for each course.
- Count students in each department.

**SQL Functions:** `SUM()`, `AVG()`, `MAX()`, `MIN()`, `COUNT()`

### Task 6: Establish Primary and Foreign Key Relationships

Demonstrates relational integrity and constraints.

**Operations covered:**
- Prevent duplicate student-course enrollments.
- Retrieve courses with their assigned faculty members and departments.

**SQL Concepts:** `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `JOIN`

### Task 7: Implement SQL Joins

Retrieves related records from multiple tables.

**Operations covered:**
- INNER JOIN — Retrieve students with matching department records.
- LEFT JOIN — Identify students without enrollments.
- RIGHT JOIN — Identify courses without assigned faculty.
- FULL OUTER JOIN — Combine unmatched student and grade records using MySQL-compatible syntax.

**SQL Concepts:** `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `UNION`

**Note:** MySQL does not directly support `FULL OUTER JOIN`. The project demonstrates a simulated full outer join using left and right joins with `UNION`.

### Task 8: Use Subqueries

Uses nested queries to identify records that satisfy specific conditions.

**Operations covered:**
- Find grades greater than the overall average marks.
- Identify courses assigned to experienced faculty members.
- Find students with more than 10 absent attendance records.

**SQL Concepts:** Subqueries, `IN`, `AVG()`, `GROUP BY`, `HAVING`

### Task 9: Implement Date and Time Functions

Analyzes academic records using date-related functions.

**Operations covered:**
- Analyze monthly attendance trends.
- Calculate years since student admission.
- Format attendance dates for reporting.

**SQL Functions:** `MONTH()`, `MONTHNAME()`, `TIMESTAMPDIFF()`, `CURDATE()`, `DATE_FORMAT()`

### Task 10: Use String Manipulation Functions

Cleans and transforms text-based data.

**Operations covered:**
- Convert faculty names to uppercase.
- Remove leading and trailing spaces from student names.
- Display a default message when an email address is missing.

**SQL Functions:** `UPPER()`, `TRIM()`, `LENGTH()`, `COALESCE()`

### Task 11: Implement Window Functions

Performs advanced analytical calculations without losing individual record details.

**Operations covered:**
- Rank students using their average marks.
- Calculate cumulative attendance percentages for each course.
- Calculate running totals of student enrollments by month.

**SQL Concepts:** `DENSE_RANK()`, `COUNT() OVER()`, `SUM() OVER()`, Window Functions

### Task 12: Apply SQL CASE Expressions

Categorizes student performance and attendance.

**Operations covered:**
- Classify academic performance as Excellent, Good, or Needs Improvement.
- Categorize attendance as Regular, Irregular, or Defaulter.

**SQL Concepts:** `CASE`, Conditional Expressions, Aggregate Functions

## 📊 Key Analytical Features

### Student Performance Analysis

Calculates average marks and ranks students based on their academic performance.

### Attendance Monitoring

Calculates attendance percentages and identifies students with low attendance.

### Department Analysis

Counts students in each department to understand the distribution of students across academic programs.

### Course Performance Analysis

Calculates the highest, lowest, and average marks for each course.

### Enrollment Trend Analysis

Tracks monthly enrollment activity and calculates cumulative enrollment totals.

### Faculty Assignment Analysis

Identifies courses without assigned faculty members and faculty members who are not assigned to any course.

### Data Cleaning

Uses string functions to clean student names and handle missing email addresses in query results.

## 🚀 How to Run the Project

Follow these steps to execute the project in MySQL Workbench or phpMyAdmin.

### Step 1: Open MySQL

Launch MySQL Workbench or open phpMyAdmin through your local MySQL environment.

### Step 2: Create the Database

Execute:

```sql
CREATE DATABASE student_tracker_db;
USE student_tracker_db;
```

### Step 3: Create the Tables

Execute the seven `CREATE TABLE` statements in the correct order:

1. Departments
2. Faculty
3. Students
4. Courses
5. Enrollments
6. Attendance
7. Grades

This order ensures that referenced tables exist before dependent tables are created.

### Step 4: Insert Sample Data

Execute the `INSERT INTO` statements to populate the database with sample departments, faculty members, courses, students, enrollments, attendance records, and grades.

Insert records in an order that respects the foreign key relationships.

### Step 5: Execute the SQL Tasks

Run the queries under Tasks 1–12 individually.

For modification operations, verify the affected records before executing subsequent queries that depend on those changes.

### Step 6: Verify the Results

Review the query outputs to confirm that the database relationships, filtering conditions, calculations, and analytical operations work as expected.

## 📚 Key SQL Concepts Covered

This project covers the following concepts:

- Database creation and selection
- Table creation and data insertion
- CRUD operations
- Primary and foreign keys
- Unique constraints and referential integrity
- WHERE, HAVING, ORDER BY, and LIMIT
- AND, OR, NOT, and IN operators
- INNER, LEFT, and RIGHT joins
- UNION and full outer join simulation
- Single-row and multi-row subqueries
- Aggregate functions
- Date and time functions
- String manipulation functions
- NULL handling using COALESCE
- Window functions
- Student ranking using DENSE_RANK
- Running totals and cumulative percentages
- Conditional expressions using CASE

## 🎓 Learning Outcomes

After completing this project, learners should be able to:

1. Design and implement a relational database using MySQL.
2. Create tables with appropriate primary and foreign keys.
3. Perform CRUD operations on academic records.
4. Retrieve data using SQL clauses, operators, and joins.
5. Write subqueries to solve data retrieval problems.
6. Calculate attendance statistics and academic performance.
7. Apply aggregate functions to summarize data.
8. Manipulate and format dates and strings.
9. Use window functions for ranking and cumulative calculations.
10. Apply conditional logic to classify students.
11. Maintain data integrity through relational constraints.
12. Develop SQL queries for practical academic data analysis.

# 👩‍💻 Author

**Janhavi Rathore**

A SQL/MySQL practice project demonstrating relational database design
and basic data analysis.
