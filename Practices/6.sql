-- foreign key is a col in one table that references the PRIMARY KEY of another table
-- foreign key have duplicate + null value, used when a column consist multiple user 
-- cannot insert values that do not exist in the referenced table(department here)
use schooldb;
-- parent table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
-- child table
CREATE TABLE Employees1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments (dept_id, dept_name) VALUES (1, 'HR');

INSERT INTO Departments (dept_id, dept_name) VALUES (2, 'IT');
INSERT INTO Departments (dept_id, dept_name) VALUES (3, 'HR');

INSERT INTO Employees1 (emp_id, emp_name, dept_id) VALUES (101, 'Alice', 1);

INSERT INTO Employees1 (emp_id, emp_name, dept_id) VALUES (102, 'david', 2);
INSERT INTO Employees1 (emp_id, emp_name, dept_id) VALUES (103, 'john', 1);

select * from departments;
select * from employees1;

CREATE TABLE dept (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE emp5 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(dept_id) 
    ON DELETE CASCADE
);
-- cascade = automatically delete child record
-- set null = delete and give null value
-- default = delete and give default value
-- restrict = not deleted
-- no action = no  action occur
INSERT INTO Dept (dept_id, dept_name) VALUES (1, 'HR');
INSERT INTO Dept (dept_id, dept_name) VALUES (2, 'IT');
INSERT INTO Dept (dept_id, dept_name) VALUES (3, 'Acc');

INSERT INTO emp5 (emp_id, emp_name, dept_id) VALUES (101, 'Alice', 1);
INSERT INTO emp5 (emp_id, emp_name, dept_id) VALUES (102, 'david', 2);
INSERT INTO emp5 (emp_id, emp_name, dept_id) VALUES (103, 'john', 3);

select * from dept;
select * from emp5;

delete from dept where dept_id = 3;