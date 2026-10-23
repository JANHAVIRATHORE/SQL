-- 1: DATABASE INITIALIZATION
CREATE DATABASE student_tracker_db;
USE student_tracker_db;

-- STEP 2: TABLES

-- 1. Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Faculty Table
CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20),
    department_id INT,
    years_of_experience INT DEFAULT 0,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- 3. Students Table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100) NULL,
    phone_number VARCHAR(20),
    address VARCHAR(255),
    admission_date DATE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- 4. Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    faculty_id INT NULL,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- 5. Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
    UNIQUE (student_id, course_id)
);

-- 6. Attendance Table
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Late') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- 7. Grades Table
CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    marks_obtained DECIMAL(5, 2) NOT NULL,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- STEP 3: DATA SEEDING (SYLLABUS SAMPLE RECORDS)
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Electronics & Communication'),
(4, 'Mechanical Engineering');

INSERT INTO Faculty (faculty_id, name, email, phone_number, department_id, years_of_experience) VALUES
(1, 'Dr. Rajesh Khanna', 'rajesh.khanna@college.edu', '9876543210', 1, 12),
(2, 'Prof. Sunita Sharma', 'sunita.sharma@college.edu', '9876543211', 1, 8),
(3, 'Dr. Anil Deshmukh', 'anil.deshmukh@college.edu', '9876543212', 2, 3),
(4, 'Prof. Kavita Rao', 'kavita.rao@college.edu', '9876543213', 3, 6),
(5, 'Prof. Suresh Menon', 'suresh.menon@college.edu', '9876543214', 4, 2);

INSERT INTO Courses (course_id, course_name, faculty_id) VALUES
(101, 'Database Management Systems', 1),
(102, 'Data Structures & Algorithms', 2),
(103, 'Web Technologies', 3),
(104, 'Digital Signal Processing', 4),
(105, 'Artificial Intelligence', NULL);

INSERT INTO Students (student_id, name, dob, gender, email, phone_number, address, admission_date, department_id) VALUES
(1, '  Rahul Sharma  ', '2003-05-14', 'Male', 'rahul.s@example.com', '9123456780', '12 MG Road, Bangalore', '2021-08-01', 1),
(2, 'Priya Patel', '2004-02-18', 'Female', 'priya.patel@example.com', '9123456781', '45 Ring Road, Ahmedabad', '2022-08-15', 1),
(3, 'Amit Verma', '2003-11-20', 'Male', NULL, '9123456782', '89 Park Street, Kolkata', '2021-07-20', 2),
(4, 'Sneha Iyer', '2004-09-05', 'Female', 'sneha.iyer@example.com', '9123456783', '14 Lake View, Chennai', '2022-09-01', 1),
(5, 'Rohan Gupta', '2003-03-22', 'Male', 'rohan.g@example.com', '9123456784', '77 Civil Lines, Jaipur', '2021-08-10', 3),
(6, 'Ananya Roy', '2004-07-11', 'Female', 'ananya.roy@example.com', '9123456785', '34 Salt Lake, Kolkata', '2022-08-20', 2),
(7, 'Vikram Singh', '2003-12-01', 'Male', 'vikram.singh@example.com', '9123456786', '56 Model Town, Delhi', '2021-08-05', 4),
(8, 'Pooja Nair', '2004-04-30', 'Female', 'pooja.nair@example.com', '9123456787', '23 Marine Drive, Kochi', '2022-08-12', 3),
(9, 'Karan Mehta', '2003-08-19', 'Male', 'karan.mehta@example.com', '9123456788', '90 Bandra West, Mumbai', '2021-09-15', 1),
(10, 'Neha Joshi', '2004-01-25', 'Female', 'neha.joshi@example.com', '9123456789', '67 FC Road, Pune', '2023-01-10', 2),
(11, 'Deepak Kumar', '2003-10-10', 'Male', 'deepak.k@example.com', '9123456790', '11 Station Road, Patna', '2022-02-01', 1),
(12, 'Simran Kaur', '2003-06-15', 'Female', 'simran.kaur@example.com', '9123456791', '88 Sector 17, Chandigarh', '2021-08-01', 1),
(13, 'Arjun Reddy', '2004-03-08', 'Male', 'arjun.reddy@example.com', '9123456792', '10 Jubilee Hills, Hyderabad', '2022-08-01', 1);

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 101, '2024-01-10'),
(1, 102, '2024-01-12'),
(2, 101, '2024-01-10'),
(2, 102, '2024-02-05'),
(3, 103, '2024-01-15'),
(4, 101, '2024-02-10'),
(4, 102, '2024-02-11'),
(5, 104, '2024-01-20'),
(6, 103, '2024-02-15'),
(7, 101, '2024-03-01'),
(8, 104, '2024-03-05'),
(9, 101, '2024-01-15'),
(11, 101, '2024-01-12'),
(12, 101, '2024-01-10'),
(13, 101, '2024-01-10'),
(13, 102, '2024-02-01');

INSERT INTO Attendance (student_id, course_id, attendance_date, status) VALUES
-- Student 1 (Rahul)
(1, 101, '2024-01-15', 'Present'),
(1, 101, '2024-01-22', 'Present'),
(1, 101, '2024-01-29', 'Absent'),
(1, 101, '2024-02-05', 'Present'),
(1, 101, '2024-02-12', 'Present'),
(1, 101, '2024-02-19', 'Present'),
(1, 101, '2024-02-26', 'Late'),
(1, 101, '2024-03-04', 'Present'),
(1, 101, '2024-03-11', 'Present'),
(1, 101, '2024-03-18', 'Present'),

-- Student 2 (Priya)
(2, 101, '2024-01-15', 'Present'),
(2, 101, '2024-01-22', 'Present'),
(2, 101, '2024-01-29', 'Present'),
(2, 101, '2024-02-05', 'Present'),
(2, 101, '2024-02-12', 'Present'),
(2, 101, '2024-02-19', 'Present'),
(2, 101, '2024-02-26', 'Present'),
(2, 101, '2024-03-04', 'Present'),
(2, 101, '2024-03-11', 'Present'),
(2, 101, '2024-03-18', 'Present'),

-- Student 12 (Simran Kaur) 
(12, 101, '2024-01-15', 'Absent'),
(12, 101, '2024-01-18', 'Absent'),
(12, 101, '2024-01-22', 'Absent'),
(12, 101, '2024-01-25', 'Absent'),
(12, 101, '2024-01-29', 'Absent'),
(12, 101, '2024-02-01', 'Present'),
(12, 101, '2024-02-05', 'Absent'),
(12, 101, '2024-02-08', 'Absent'),
(12, 101, '2024-02-12', 'Absent'),
(12, 101, '2024-02-15', 'Absent'),
(12, 101, '2024-02-19', 'Absent'),
(12, 101, '2024-02-22', 'Absent'),
(12, 101, '2024-02-26', 'Present'),
(12, 101, '2024-03-01', 'Present'),

-- Student 13 (Arjun Reddy)
(13, 101, '2024-01-15', 'Present'),
(13, 101, '2024-01-22', 'Present'),
(13, 101, '2024-01-29', 'Present'),
(13, 101, '2024-02-05', 'Present'),
(13, 101, '2024-02-12', 'Present'),
(13, 101, '2024-02-19', 'Present'),
(13, 101, '2024-02-26', 'Present'),
(13, 101, '2024-03-04', 'Present'),
(13, 101, '2024-03-11', 'Present'),
(13, 101, '2024-03-18', 'Present'),

-- Remaining Attendance Logs
(3, 103, '2024-01-16', 'Present'),
(3, 103, '2024-01-23', 'Absent'),
(3, 103, '2024-01-30', 'Present'),
(3, 103, '2024-02-06', 'Present'),
(4, 101, '2024-02-12', 'Present'),
(4, 101, '2024-02-19', 'Absent'),
(4, 101, '2024-02-26', 'Present'),
(4, 101, '2024-03-04', 'Present'),
(5, 104, '2024-01-21', 'Present'),
(5, 104, '2024-01-28', 'Present'),
(5, 104, '2024-02-04', 'Late'),
(6, 103, '2024-02-16', 'Present'),
(6, 103, '2024-02-23', 'Present'),
(7, 101, '2024-03-04', 'Absent'),
(7, 101, '2024-03-11', 'Absent'),
(7, 101, '2024-03-18', 'Present');

-- Insert Grades
INSERT INTO Grades (student_id, course_id, marks_obtained, grade) VALUES
(1, 101, 84.50, 'A'),
(1, 102, 78.00, 'B'),
(2, 101, 94.00, 'A+'),
(2, 102, 91.50, 'A+'),
(3, 103, 72.00, 'B'),
(4, 101, 88.00, 'A'),
(4, 102, 82.50, 'A'),
(5, 104, 68.00, 'C'),
(6, 103, 76.50, 'B'),
(7, 101, 55.00, 'D'),
(8, 104, 89.00, 'A'),
(9, 101, 45.00, 'E'),
(12, 101, 32.00, 'F'), 
(13, 101, 96.50, 'A+'), 
(13, 102, 95.00, 'A+');

-- TASK 1: IMPLEMENT CRUD OPERATIONS (Low Weightage)

-- 1.1 INSERT
INSERT INTO Students (name, dob, gender, email, phone_number, address, admission_date, department_id)
VALUES ('Manish Tiwari', '2004-06-12', 'Male', 'manish.t@example.com', '9123456799', '21 Nehru Nagar, Bhopal', '2024-01-05', 1);

INSERT INTO Faculty (name, email, phone_number, department_id, years_of_experience)
VALUES ('Dr. Meenakshi Sundaram', 'meenakshi.s@college.edu', '9876543299', 1, 9);

INSERT INTO Courses (course_name, faculty_id)
VALUES ('Cloud Computing Architecture', 1);

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (14, 101, '2024-01-10');

-- 1.2 UPDATE 
UPDATE Students
SET phone_number = '9988776655',
    email = 'rahul.sharma.updated@example.com'
WHERE student_id = 1;

-- 1.3 DELETE
DELETE FROM Students
WHERE student_id = 9;

-- TASK 2: USE SQL CLAUSES (WHERE, HAVING, LIMIT) (Low Weightage)

-- 2.1 WHERE Clause
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    s.email,
    d.department_name
FROM Students s
INNER JOIN Departments d ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

-- 2.2 ORDER BY & LIMIT Clause
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    ROUND(AVG(g.marks_obtained), 2) AS average_marks
FROM Students s
INNER JOIN Grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.name
ORDER BY average_marks DESC
LIMIT 10;

-- 2.3 GROUP BY & HAVING Clause
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    COUNT(a.attendance_id) AS total_classes,
    SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS attended_classes,
    ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.attendance_id), 2) AS attendance_percentage
FROM Students s
INNER JOIN Attendance a ON s.student_id = a.student_id
GROUP BY s.student_id, s.name
HAVING attendance_percentage < 75.00;

-- TASK 3: APPLY SQL OPERATORS (AND, OR, NOT) (Medium Weightage)

-- 3.1 AND Operator
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    att.attendance_percentage,
    grd.avg_marks
FROM Students s
INNER JOIN (
    SELECT 
        student_id,
        ROUND((SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS attendance_percentage
    FROM Attendance
    GROUP BY student_id
) att ON s.student_id = att.student_id
INNER JOIN (
    SELECT 
        student_id,
        ROUND(AVG(marks_obtained), 2) AS avg_marks
    FROM Grades
    GROUP BY student_id
) grd ON s.student_id = grd.student_id
WHERE att.attendance_percentage < 50.00 AND grd.avg_marks < 40.00;

-- 3.2 OR Operator
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    grd.avg_marks,
    att.attendance_percentage
FROM Students s
LEFT JOIN (
    SELECT 
        student_id,
        ROUND(AVG(marks_obtained), 2) AS avg_marks
    FROM Grades
    GROUP BY student_id
) grd ON s.student_id = grd.student_id
LEFT JOIN (
    SELECT 
        student_id,
        ROUND((SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS attendance_percentage
    FROM Attendance
    GROUP BY student_id
) att ON s.student_id = att.student_id
WHERE grd.avg_marks > 90.00 OR att.attendance_percentage = 100.00;

-- 3.3 NOT Operator 
SELECT 
    f.faculty_id,
    f.name AS faculty_name,
    f.email,
    d.department_name
FROM Faculty f
LEFT JOIN Departments d ON f.department_id = d.department_id
WHERE f.faculty_id NOT IN (
    SELECT DISTINCT faculty_id 
    FROM Courses 
    WHERE faculty_id IS NOT NULL
);

-- TASK 4: SORTING & GROUPING DATA (ORDER BY, GROUP BY) (Medium Weightage)

-- 4.1 ORDER BY
SELECT 
    student_id,
    TRIM(name) AS student_name,
    gender,
    email,
    admission_date
FROM Students
ORDER BY TRIM(name) ASC;

-- 4.2 GROUP BY + COUNT
SELECT 
    d.department_id,
    d.department_name,
    COUNT(s.student_id) AS total_enrolled_students
FROM Departments d
LEFT JOIN Students s ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_enrolled_students DESC;

-- 4.3 GROUP BY + AVG
SELECT 
    c.course_id,
    c.course_name,
    COUNT(g.grade_id) AS total_evaluations,
    ROUND(AVG(g.marks_obtained), 2) AS average_marks
FROM Courses c
INNER JOIN Grades g ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name
ORDER BY average_marks DESC;

-- TASK 5: USE AGGREGATE FUNCTIONS (SUM, AVG, MAX, MIN, COUNT) (High Weightage)

-- 5.1 AVG & SUM
SELECT 
    ROUND(AVG(att_summary.attendance_pct), 2) AS institutional_average_attendance_percentage
FROM (
    SELECT 
        student_id,
        (SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS attendance_pct
    FROM Attendance
    GROUP BY student_id
) AS att_summary;

-- 5.2 MAX, MIN & AVG
SELECT 
    c.course_id,
    c.course_name,
    MAX(g.marks_obtained) AS highest_marks,
    MIN(g.marks_obtained) AS lowest_marks,
    ROUND(AVG(g.marks_obtained), 2) AS average_marks,
    COUNT(g.grade_id) AS total_students_graded
FROM Courses c
INNER JOIN Grades g ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name;

-- 5.3 COUNT
SELECT 
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM Departments d
LEFT JOIN Students s ON d.department_id = s.department_id
GROUP BY d.department_name
ORDER BY total_students DESC;

-- TASK 6: ESTABLISH PRIMARY & FOREIGN KEY RELATIONSHIPS (High Weightage)

-- 6.1 Composite UNIQUE Constraint check:
-- Table Enrollments have UNIQUE key on (student_id, course_id).
-- insert statement error occur:
-- INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES (1, 101, '2024-04-01');

-- 6.2 Linking faculty members to the courses they teach via Foreign Key
SELECT 
    c.course_id,
    c.course_name,
    f.faculty_id,
    f.name AS faculty_name,
    f.email AS faculty_email,
    d.department_name
FROM Courses c
INNER JOIN Faculty f ON c.faculty_id = f.faculty_id
LEFT JOIN Departments d ON f.department_id = d.department_id;

-- TASK 7: IMPLEMENT JOINS (High Weightage)

-- 7.1 INNER JOIN
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    s.email,
    s.phone_number,
    d.department_name
FROM Students s
INNER JOIN Departments d ON s.department_id = d.department_id;

-- 7.2 LEFT JOIN
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    s.email,
    d.department_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Departments d ON s.department_id = d.department_id
WHERE e.enrollment_id IS NULL;

-- 7.3 RIGHT JOIN
SELECT 
    c.course_id,
    c.course_name,
    f.faculty_id,
    f.name AS faculty_name
FROM Faculty f
RIGHT JOIN Courses c ON f.faculty_id = c.faculty_id
WHERE f.faculty_id IS NULL;

-- 7.4 FULL OUTER JOIN
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    g.course_id,
    g.marks_obtained
FROM Students s
LEFT JOIN Grades g ON s.student_id = g.student_id
WHERE g.grade_id IS NULL

UNION

SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    g.course_id,
    g.marks_obtained
FROM Students s
RIGHT JOIN Grades g ON s.student_id = g.student_id
WHERE s.student_id IS NULL;

-- TASK 8: USE SUBQUERIES (High Weightage)

-- 8.1 Single-Row Subquery
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    c.course_name,
    g.marks_obtained
FROM Grades g
INNER JOIN Students s ON g.student_id = s.student_id
INNER JOIN Courses c ON g.course_id = c.course_id
WHERE g.marks_obtained > (
    SELECT AVG(marks_obtained) 
    FROM Grades
)
ORDER BY g.marks_obtained DESC;

-- 8.2 Subquery with IN
SELECT 
    course_id,
    course_name,
    faculty_id
FROM Courses
WHERE faculty_id IN (
    SELECT faculty_id
    FROM Faculty
    WHERE years_of_experience >= 5
);

-- 8.3 Subquery with IN & GROUP BY HAVING
SELECT 
    student_id,
    TRIM(name) AS student_name,
    email
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Attendance
    WHERE status = 'Absent'
    GROUP BY student_id
    HAVING COUNT(*) > 10
);

-- TASK 9: IMPLEMENT DATE & TIME FUNCTIONS (High Weightage)

-- 9.1 Extract Month & Trends
SELECT 
    MONTH(attendance_date) AS month_number,
    MONTHNAME(attendance_date) AS month_name,
    COUNT(attendance_id) AS total_attendance_logs,
    SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) AS total_present,
    ROUND((SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) * 100.0) / COUNT(attendance_id), 2) AS attendance_trend_pct
FROM Attendance
GROUP BY MONTH(attendance_date), MONTHNAME(attendance_date)
ORDER BY month_number ASC;

-- 9.2 Difference in Years
SELECT 
    student_id,
    TRIM(name) AS student_name,
    admission_date,
    TIMESTAMPDIFF(YEAR, admission_date, CURDATE()) AS years_since_admission
FROM Students
ORDER BY admission_date ASC;

-- 9.3 Date Formatting: DATE_FORMAT(date, '%d-%m-%Y')
SELECT 
    attendance_id,
    student_id,
    course_id,
    DATE_FORMAT(attendance_date, '%d-%m-%Y') AS formatted_attendance_date,
    status
FROM Attendance
ORDER BY attendance_date DESC
LIMIT 15;

-- TASK 10: USE STRING MANIPULATION FUNCTIONS (High Weightage)

-- 10.1 UPPER
SELECT 
    faculty_id,
    UPPER(name) AS uppercase_faculty_name,
    email,
    years_of_experience
FROM Faculty;

-- 10.2 TRIM
SELECT 
    student_id,
    name AS original_name,
    TRIM(name) AS cleaned_name,
    LENGTH(name) AS original_length,
    LENGTH(TRIM(name)) AS cleaned_length
FROM Students;

-- 10.3 COALESCE
SELECT 
    student_id,
    TRIM(name) AS student_name,
    COALESCE(email, 'Email Not Provided') AS contact_email,
    phone_number
FROM Students;

-- TASK 11: IMPLEMENT WINDOW FUNCTIONS (Very High Weightage)

-- 11.1 DENSE_RANK()
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    ROUND(AVG(g.marks_obtained), 2) AS overall_marks,
    DENSE_RANK() OVER(ORDER BY AVG(g.marks_obtained) DESC) AS rank_position
FROM Students s
INNER JOIN Grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.name
ORDER BY rank_position;

-- 11.2 Cumulative Attendance % per course
SELECT 
    a.attendance_id,
    c.course_name,
    a.student_id,
    a.attendance_date,
    a.status,
    COUNT(CASE WHEN a.status = 'Present' THEN 1 END) OVER (
        PARTITION BY a.course_id 
        ORDER BY a.attendance_date, a.attendance_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_presents,
    COUNT(*) OVER (
        PARTITION BY a.course_id 
        ORDER BY a.attendance_date, a.attendance_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_sessions,
    ROUND(
        (COUNT(CASE WHEN a.status = 'Present' THEN 1 END) OVER (
            PARTITION BY a.course_id 
            ORDER BY a.attendance_date, a.attendance_id
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) * 100.0) / 
        COUNT(*) OVER (
            PARTITION BY a.course_id 
            ORDER BY a.attendance_date, a.attendance_id
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ), 
        2
    ) AS cumulative_attendance_percentage
FROM Attendance a
INNER JOIN Courses c ON a.course_id = c.course_id
ORDER BY a.course_id, a.attendance_date, a.attendance_id;

-- 11.3 Running Total of Enrolled Students per Month
SELECT 
    DATE_FORMAT(enrollment_date, '%Y-%m') AS enrollment_month,
    COUNT(enrollment_id) AS monthly_enrolled,
    SUM(COUNT(enrollment_id)) OVER (ORDER BY DATE_FORMAT(enrollment_date, '%Y-%m') ASC) AS running_total_enrolled
FROM Enrollments
GROUP BY DATE_FORMAT(enrollment_date, '%Y-%m')
ORDER BY enrollment_month ASC;

-- TASK 12: APPLY SQL CASE EXPRESSIONS (Very High Weightage)

-- 12.1 Student Performance Levels via CASE:
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    c.course_name,
    g.marks_obtained,
    CASE 
        WHEN g.marks_obtained > 90.00 THEN 'Excellent'
        WHEN g.marks_obtained BETWEEN 75.00 AND 90.00 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance_level
FROM Grades g
INNER JOIN Students s ON g.student_id = s.student_id
INNER JOIN Courses c ON g.course_id = c.course_id
ORDER BY g.marks_obtained DESC;

-- 12.2 Categorize Attendance Records via CASE:
SELECT 
    s.student_id,
    TRIM(s.name) AS student_name,
    COUNT(a.attendance_id) AS total_sessions,
    SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS attended_sessions,
    ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.attendance_id), 2) AS attendance_percentage,
    CASE 
        WHEN (SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.attendance_id) > 80.00 THEN 'Regular'
        WHEN (SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.attendance_id) BETWEEN 50.00 AND 80.00 THEN 'Irregular'
        ELSE 'Defaulter'
    END AS attendance_category
FROM Students s
INNER JOIN Attendance a ON s.student_id = a.student_id
GROUP BY s.student_id, s.name
ORDER BY attendance_percentage DESC;
