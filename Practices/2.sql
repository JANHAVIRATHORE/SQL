use schooldb;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10,2),
    Department VARCHAR(50)
);

insert into employees (EmpID,Name ,Salary,Department)
values
(1,'John Doe',50000.00,'HR'),
(2,'m Doe',50000.00,'HR'),
(3,"r Doe",50000.00,'IT'),
(4,"l Doe",50000.00,'HR');

select * from employees;

update employees set Salary=90000 where empid=1;

select * from employees;

delete from employees where empid=3;

select * from employees;

update employees set department="It" where empid=3;
#clause-1 where
select * from employees where empid=1;
#clause-2 order-by
select name,salary from employees order by salary asc;
#clause-3 group-by
select department, count(*) from employees group by department;
#clause-4 having(used with group by)
select department, avg(salary) from employees group by department having avg(Salary)>60000;


insert into employees (EmpID,Name ,Salary,Department)
values
(5,'John Doe',50000.00,'HR'),
(6,'m Doe',50000.00,'HR'),
(7,"r Doe",50000.00,'IT'),
(8,"l Doe",50000.00,'HR');

#clause-5 limit
select * from employees limit 5;
#clause-6 offset
select * from employees limit 5 offset 6;
#clause-7 distinct
select distinct department from employees;
