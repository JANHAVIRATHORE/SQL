
CREATE DATABASE IF NOT EXISTS UniversityCourseDB;
USE UniversityCourseDB;

-- 1. Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    BirthDate DATE,
    EnrollmentDate DATE NOT NULL
);

-- 3. Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    Credits INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 4. Instructors
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 5. Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    UNIQUE (StudentID, CourseID)
);

-- Sample data 
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1, 'John', 'Doe', 'john.doe@gmail.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@gmail.com', '1999-05-25', '2021-08-01'),
(3, 'Aarav', 'Patel', 'aarav.patel@gmail.com', '2002-03-12', '2023-07-15'),
(4, 'Mia', 'Shah', 'mia.shah@gmail.com', '2001-11-08', '2022-06-10'),
(5, 'Noah', 'Mehta', 'noah.mehta@gmail.com', '2000-09-19', '2020-08-01'),
(6, 'Sara', 'Khan', 'sara.khan@gmail.com', '2003-02-04', '2024-07-01'),
(7, 'Riya', 'Joshi', 'riya.joshi@gmail.com', '2002-06-17', '2023-08-01');

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Python Programming', 1, 4),
(104, 'Database Design', 1, 3),
(105, 'Calculus', 2, 5),
(106, 'Statistics', 2, 3);

INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2),
(3, 'Neha', 'Sharma', 'neha.sharma@univ.com', 1);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 1, 102, '2022-08-02'),
(4, 2, 101, '2021-08-02'),
(5, 3, 101, '2023-07-15'),
(6, 4, 101, '2022-06-10'),
(7, 5, 101, '2020-08-01'),
(8, 6, 101, '2024-07-01'),
(9, 7, 101, '2023-08-01'),
(10, 3, 103, '2023-07-16'),
(11, 4, 103, '2022-06-11'),
(12, 5, 104, '2020-08-02'),
(13, 6, 105, '2024-07-02'),
(14, 7, 106, '2023-08-02');

-- TASK 1: CRUD operations on all tables

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;
SELECT * FROM Departments;

UPDATE Students SET Email = 'john.doe.new@gmail.com' WHERE StudentID = 1;
UPDATE Courses SET Credits = 4 WHERE CourseID = 101;
UPDATE Instructors SET LastName = 'Johnston' WHERE InstructorID = 1;
UPDATE Enrollments SET EnrollmentDate = '2022-08-03' WHERE EnrollmentID = 1;
UPDATE Departments SET DepartmentName = 'Computer Science Department' WHERE DepartmentID = 1;


DELETE FROM Enrollments WHERE EnrollmentID = 14;
DELETE FROM Instructors WHERE InstructorID = 3;
DELETE FROM Courses WHERE CourseID = 106;
DELETE FROM Students WHERE StudentID = 7;
DELETE FROM Departments WHERE DepartmentID = 2;

INSERT INTO Students VALUES (8, 'Dev', 'Patel', 'dev.patel@gmail.com', '2002-01-01', '2024-08-01');
INSERT INTO Courses VALUES (107, 'Web Development', 1, 3);
INSERT INTO Instructors VALUES (4, 'Amit', 'Verma', 'amit.verma@univ.com', 1);
INSERT INTO Enrollments VALUES (15, 1, 103, '2022-08-04');
INSERT INTO Departments VALUES (3, 'Physics');

-- TASK 2: Students enrolled after 2022
SELECT *
FROM Students
WHERE EnrollmentDate >= '2023-01-01';

-- TASK 3: Courses offered by Mathematics, maximum 5 courses

SELECT C.CourseID, C.CourseName, C.DepartmentID, C.Credits
FROM Courses AS C
JOIN Departments AS D ON C.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Mathematics'
LIMIT 5;

-- TASK 4: Number of students enrolled in each course,

SELECT C.CourseID, C.CourseName, COUNT(E.StudentID) AS NumberOfStudents
FROM Courses AS C
JOIN Enrollments AS E ON C.CourseID = E.CourseID
GROUP BY C.CourseID, C.CourseName
HAVING COUNT(E.StudentID) > 5;

-- TASK 5: Students enrolled in BOTH SQL and Data Structures

SELECT S.StudentID, S.FirstName, S.LastName
FROM Students AS S
JOIN Enrollments AS E ON S.StudentID = E.StudentID
JOIN Courses AS C ON E.CourseID = C.CourseID
WHERE C.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY S.StudentID, S.FirstName, S.LastName
HAVING COUNT(DISTINCT C.CourseName) = 2;

-- TASK 6: Students enrolled in SQL OR Data Structures
SELECT DISTINCT S.StudentID, S.FirstName, S.LastName, C.CourseName
FROM Students AS S
JOIN Enrollments AS E ON S.StudentID = E.StudentID
JOIN Courses AS C ON E.CourseID = C.CourseID
WHERE C.CourseName IN ('Introduction to SQL', 'Data Structures')
ORDER BY S.StudentID;

-- TASK 7: Average number of credits for all courses
SELECT AVG(Credits) AS AverageCredits
FROM Courses;

-- TASK 8: Maximum instructor salary in Computer Science

ALTER TABLE Instructors ADD Salary DECIMAL(10,2);
UPDATE Instructors SET Salary = 60000 WHERE InstructorID = 1;
UPDATE Instructors SET Salary = 55000 WHERE InstructorID = 2;
UPDATE Instructors SET Salary = 65000 WHERE InstructorID = 3;

SELECT MAX(I.Salary) AS MaximumSalary
FROM Instructors AS I
JOIN Departments AS D ON I.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Computer Science';

-- TASK 9: Count students in each department

SELECT D.DepartmentName, COUNT(DISTINCT E.StudentID) AS NumberOfStudents
FROM Departments AS D
JOIN Courses AS C ON D.DepartmentID = C.DepartmentID
JOIN Enrollments AS E ON C.CourseID = E.CourseID
GROUP BY D.DepartmentID, D.DepartmentName
ORDER BY D.DepartmentName;

-- TASK 10: INNER JOIN students with their corresponding courses

SELECT S.StudentID, S.FirstName, S.LastName, C.CourseName
FROM Students AS S
INNER JOIN Enrollments AS E ON S.StudentID = E.StudentID
INNER JOIN Courses AS C ON E.CourseID = C.CourseID
ORDER BY S.StudentID, C.CourseName;

-- TASK 11: LEFT JOIN all students and their courses, if any

SELECT S.StudentID, S.FirstName, S.LastName, C.CourseName
FROM Students AS S
LEFT JOIN Enrollments AS E ON S.StudentID = E.StudentID
LEFT JOIN Courses AS C ON E.CourseID = C.CourseID
ORDER BY S.StudentID, C.CourseName;

-- TASK 12: Students enrolled in courses with more than 10 students

SELECT DISTINCT S.StudentID, S.FirstName, S.LastName, C.CourseName
FROM Students AS S
JOIN Enrollments AS E ON S.StudentID = E.StudentID
JOIN Courses AS C ON E.CourseID = C.CourseID
WHERE C.CourseID IN (
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 10
);

-- TASK 13: Extract the year from each student's enrollment date
SELECT StudentID, FirstName, LastName,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

-- TASK 14: Concatenate instructor first and last names
SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS InstructorFullName
FROM Instructors;

-- TASK 15: Running total of students enrolled in courses
SELECT EnrollmentID, StudentID, CourseID, EnrollmentDate,
       COUNT(*) OVER (
           ORDER BY EnrollmentDate, EnrollmentID
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RunningTotal
FROM Enrollments
ORDER BY EnrollmentDate, EnrollmentID;

-- TASK 16: Label students Senior if enrollment was more than

SELECT StudentID, FirstName, LastName, EnrollmentDate,
       CASE
           WHEN EnrollmentDate < DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
               THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLevel
FROM Students
ORDER BY StudentID;

