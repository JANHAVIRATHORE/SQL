use schooldb;

CREATE TABLE emp1 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10,2),
    Department VARCHAR(50)
);

INSERT INTO emp1 (EmpID, Name, Salary, Department) 
VALUES (1, 'John Doe', 50000.00, 'HR'),
(2, 'Alice Smith', 60000.00, 'IT'),
(3, 'Bob Johnson', 55000.00, 'Finance'),
(4, 'John Doe', 50000.00, 'HR'),
(5, 'John Doe', 50000.00, 'HR');

select* from emp1 where salary <> 50000.009;#not equal too <>,!=

select* from emp1 where salary < 50000.00;

select* from emp1 where salary > 50000.00;

select* from emp1 where salary != 50000.00;#not equal too <>,!=

select* from emp1 where salary >= 50000.00;

select* from emp1 where salary <= 50000.00;

select* from emp1 where salary > 50000.00 and empid=3;

select* from emp1 where salary > 40000.00 or empid=1; 

select* from emp1 where not salary = 50000.00;

select* from emp1 where salary between 3400.00 and 7600.00;

select* from emp1 where salary between  50000.00;

select* from emp1 where name like "m%";#start with

select* from emp1 where name like "%e";#end with

select * from emp1 where department in ('it','hr');

CREATE TABLE emp2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

INSERT INTO emp2 (name, email, phone_number) VALUES
('Alice', 'alice@gmail.com', '9876543210'),
('Andrew', 'andrew@gmail.com', '9871234567'),
('Mark', 'mark@yahoo.com', '8796543210'),
('Carl', 'carl@hotmail.com', '9123456789'),
('John', 'john@gmail.com', '9998887776'),
('Megan', 'megan@gmail.com', '8001234567'),
('Ryan', 'ryan@yahoo.com', '7564321098'),
('Jordan', 'jordan@outlook.com', '8907654321'),
('Sarah', 'sarah@gmail.com', '7896541230'),
('David', 'david@yahoo.com', '6789054321'),
('Peter', 'peter@gmail.com', '9993332221'),
('James', 'james@outlook.com', '8887776665'),
('Linda', 'linda@gmail.com', '9876547890'),
('Tom', 'tom@gmail.com', '8900987654'),
('Jaison', 'jaison@gmail.com', '9878901234');

select * from emp2;

select * from emp2 where name like '%a';#end with a

select * from emp2 where name like 'a%';#start with a

select * from emp2 where name like '_a%';

select * from emp2 where name like 'j%n';

select * from emp2 where name like '____';

select * from emp2 where name like '__a%';

SELECT * FROM emp2 
WHERE email LIKE 'a%@gmail.com';

SELECT * FROM emp2 
WHERE name NOT LIKE '%a%';

select * from emp2 where name like 'j%n';

-- unique constraint

CREATE TABLE Emp3 (
    emp_id INT UNIQUE,       -- Unique Constraint (No duplicate ids allowed)
    emp_email VARCHAR(100) UNIQUE, -- Unique Constraint (No duplicate emails allowed)
    emp_name VARCHAR(50)
);

INSERT INTO Emp3 (emp_id, emp_email, emp_name) VALUES (1, 'alice@example.com', 'Alice');
INSERT INTO Emp3 (emp_id, emp_email, emp_name) VALUES (2, 'bob@example.com', 'Bob');

INSERT INTO Emp3 (emp_id, emp_email, emp_name) VALUES (4, NULL, 'David');
INSERT INTO Emp3 (emp_id, emp_email, emp_name) VALUES (5, NULL, 'Eve'); -- No error

select * from emp3;

