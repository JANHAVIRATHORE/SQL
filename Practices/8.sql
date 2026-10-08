use schooldb;

select * from department;

insert into department(dept_name,dept_id)
values
("developer",104);


SELECT Employee.empid, Employee.name, Department.dept_name
FROM Employee
RIGHT JOIN Department
ON Employee.dept_id = Department.dept_id;

SELECT Employee.empid, Employee.name, Department.dept_name
FROM Employee
RIGHT JOIN Department
ON Employee.dept_id = Department.dept_id ANd employee.empid>1;

SELECT Department.dept_name, COUNT(employee.empid) AS total_employee
FROM Employee
RIGHT JOIN Department
ON Employee.dept_id = Department.dept_id
group by department.dept_name;

-- full outer join = combination of left join and right join
-- union - combine , innersection = match

SELECT Employee.empid, Employee.name, Department.dept_name
FROM Employee
LEFT JOIN Department
ON Employee.dept_id = Department.dept_id

UNION

SELECT Employee.empid, Employee.name, Department.dept_name
FROM Employee
RIGHT JOIN Department
ON Employee.dept_id = Department.dept_id;

select * from employee
left join department
on employee.empid=department.dept_id
union
select * from employee
right join department
on employee.dept_id=department.dept_id;

-- self join finding content/rows from same table

CREATE TABLE Emp_loyees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    manager_id INT  -- Refers to emp_id of another employee
);

INSERT INTO Emp_loyees (emp_id, name, dept_id, manager_id) VALUES
(1, 'John', 101, NULL), 
(2, 'Alice', 102, 1),  
(3, 'Bob', 103, 1),   
(4, 'Mike', 102, 2),  
(5, 'Emma', 103, 3);

select * from emp_loyees;

SELECT e1.name AS Employee, e2.name AS Manager
FROM Emp_loyees e1
JOIN Emp_loyees e2 
ON e1.manager_id = e2.emp_id;

SELECT e1.name AS Employee1, e2.name AS Employee2, e1.dept_id
FROM Emp_loyees e1
JOIN Emp_loyees e2 
ON e1.dept_id = e2.dept_id AND e1.emp_id < e2.emp_id;

-- cross join = single value multiply with everyvalue 
-- dot join = single value multiply with single value(out of syllabus)

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO Products (product_id, product_name) VALUES
(1, 'Laptop'),
(2, 'Phone'),
(3, 'Tablet');

INSERT INTO Customers (customer_id, customer_name) VALUES
(101, 'Alice'),
(102, 'Bob');

SELECT Products.product_name, Customers.customer_name
FROM Products
CROSS JOIN Customers;