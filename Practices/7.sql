use schooldb;

-- join use when there are multiple data and to return matching data from it
-- inner join only match data found
create table employee(
empid int primary key,
name varchar(100),
dept_id int
);

create table department(
dept_name varchar(50),
dept_id int
);

insert into employee(empid,name,dept_id)
values
(1,"john",101),
(2,"david",102),
(3,"allen",103);

insert into department(dept_name,dept_id)
values
("hr",101),
("it",102),
("finance",103);

select * from employee;
select * from department;

select * from employee
inner join department on employee.dept_id = department.dept_id;

insert into employee(empid,name,dept_id)
values
(4,"josh",103);


insert into employee(empid,name,dept_id)
values
(5,"josh",103);

select * from employee
inner join department on employee.dept_id = department.dept_id;

select employee.empid,employee.name,department.dept_name from employee
inner join department on employee.dept_id = department.dept_id;

create table salary(
empid int ,
sal int(30)
);

insert into salary (empid,sal)
values
(1,45000),
(2,55000),
(3,35000),
(4,25000); 

insert into salary (empid,sal)
values
(5,45000);

-- 4th record is not shown as one condition is not fulfilled
select employee.empid,employee.name,department.dept_name, salary.sal from employee
inner join department on employee.dept_id = department.dept_id
inner join salary on employee.empid = salary.empid;

SELECT e.empid, e.name, d.dept_name
FROM Employee AS e
INNER JOIN Department AS d
ON e.dept_id = d.dept_id;

SELECT Employee.name, Salary.sal
FROM Employee
INNER JOIN Salary
ON Employee.empid = Salary.empid AND Salary.sal > 50000;

-- result same as above
SELECT E.name, S.sal
FROM Employee E
INNER JOIN Salary S
ON E.empid = S.empid AND S.sal > 50000;

SELECT d.dept_name, SUM(s.sal) AS total_salary
FROM Employee e
INNER JOIN Department d ON e.dept_id = d.dept_id
INNER JOIN Salary s ON e.empid = s.empid
GROUP BY d.dept_name;


-- left join means record from left(all record came) table match with right(only matching record came) table records from table_name is left table and join table_name is right table

SELECT Employee.empid, Employee.name, Department.dept_name
FROM Employee
LEFT JOIN Department
ON Employee.dept_id = Department.dept_id;

SELECT Employee.empid, Employee.name, Department.dept_name
FROM Employee
LEFT JOIN Department
ON Employee.dept_id = Department.dept_id
and employee.empid>1;

