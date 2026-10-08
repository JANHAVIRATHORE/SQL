use schooldb;
-- perator = in , exists, any , all 
show tables;

create table emp6(
emp_id int ,
name varchar(50),
department_id int,
salary int
);

insert into emp6 (emp_id,name,department_id,salary)
values
(1,"Alice",101,50000),
(2,"Bob",102,70000),
(3,"John",103,60000),
(4,"carol",104,90000),
(5,"eva",105,80000);

select * from emp6;

SELECT name, department_id, salary 
FROM emp6 
WHERE department_id IN (SELECT department_id FROM emp6 WHERE salary > 60000);
-- in = check if the salary is in present in the list.

select * from department;

SELECT dept_name 
FROM department d
WHERE EXISTS (SELECT 1 FROM emp6 e WHERE e.department_id = d.dept_id);
-- exists = check if subquery return atleast 1 row.
-- SELECT 1 FROM emp6 e WHERE e.department_id=101; in place of one any number can be taken

SELECT name, salary 
FROM emp6 
WHERE salary > ANY (SELECT salary FROM emp6 WHERE department_id = 101);
-- any = check if condition true for 1 condition

SELECT name, salary 
FROM emp6 
WHERE salary > ANY (50000);

SELECT name, salary 
FROM emp6 
WHERE salary > all (SELECT salary FROM emp6 WHERE department_id = 101);
-- all = check that both the condition are true

SELECT 
    YEAR('2025-02-24') AS year_value, 
    MONTH('2025-02-24') AS month_value, 
    DAY('2025-02-24') AS day_value;
    
SELECT 
    DAYNAME('2025-02-24') AS day_name, 
    MONTHNAME('2025-02-24') AS month_name;    
    
SELECT 
    DATE_ADD('2025-02-24', INTERVAL 10 DAY) AS date_after_10_days, 
    DATE_SUB('2025-02-24', INTERVAL 5 DAY) AS date_before_5_days;    