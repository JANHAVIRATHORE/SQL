use schooldb;

-- Subquery = is a query written inside another query.

create table employ (
emp_id int unique,
name varchar(50),
dept varchar(50),
sal int 
);

insert into employ (emp_id,name,dept,sal)
values 
(1,"Alice","Hr",50000),
(2,"Bob","It",70000),
(3,"Carol","Hr",60000),
(4,"David","It",80000),
(5,"Eva","Sales",45000);

select * from employ;

SELECT * FROM employ -- outer query
WHERE sal = (SELECT MAX(sal) FROM employ); -- inner query first run, first condition check

SELECT name, dept, sal FROM employ e1
WHERE sal > (SELECT AVG(sal) FROM employ e2 WHERE e1.dept = e2.dept);

SELECT * FROM employ e1
WHERE sal = (SELECT MAX(sal) FROM employ e2 WHERE e1.dept = e2.dept);

SELECT e.name, e.dept, e.sal, avg_dept_salary
FROM employ e
JOIN (SELECT dept, AVG(sal) AS avg_dept_salary FROM employ GROUP BY dept) sub -- sub us output table name
ON e.dept = sub.dept
WHERE e.sal > sub.avg_dept_salary;-- from, join , where 