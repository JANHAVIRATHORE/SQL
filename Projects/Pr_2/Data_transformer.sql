create database Data_transformer;

use Data_transformer;

create table customers(
customer_id int(10) primary key,
firstname varchar(50),
lastname varchar(50),
email varchar(50),
registration_date date
);

insert into customers(customer_id,firstname,lastname,email,registration_date)
values(1,"John","Doe","john.doe@gmail.com","2022-03-15"),
(2,"Jane","Smith","jane.smith@gmail.com","2021-11-02");

create table orders(
orderid int(10),
customer_id int(10),
order_date date,
total int,
foreign key (customer_id) references customers(customer_id)
);

insert into orders(orderid,customer_id,order_date,total)
values(101,1,"2023-07-01",150.50),
(102,2,"2023-07-01",200.75); 

create table employees(
employee_id int(10) primary key,
firstname varchar(50),
lastname varchar(50),
department varchar(100),
hiredate date,
salary int
); 

insert into employees(employee_id,firstname,lastname,department,hiredate,salary)
values(1,"Mark","Johnson","sales","2020-01-15",50000.00),
(2,"susan","Lee","hr","2021-03-20",55000.00);

-- 1. inner join
select orders.orderid,orders.order_date,orders.total,customers.customer_id,customers.firstname,customers.lastname,customers.email,customers.registration_date
from orders
inner join customers on orders.customer_id=customers.customer_id;

-- 2.
select orders.orderid,orders.order_date,orders.total,customers.customer_id,customers.firstname,customers.lastname,customers.email,customers.registration_date
from customers
left join orders on customers.customer_id=orders.customer_id;

-- 3. right join
select orders.orderid,orders.order_date,orders.total,customers.customer_id,customers.firstname,customers.lastname,customers.email,customers.registration_date
from customers
right join orders on customers.customer_id=orders.customer_id;

-- 4.full outer join
select orders.orderid,orders.order_date,orders.total,customers.customer_id,customers.firstname,customers.lastname,customers.email,customers.registration_date
from customers
left join orders on customers.customer_id=orders.customer_id

union

select orders.orderid,orders.order_date,orders.total,customers.customer_id,customers.firstname,customers.lastname,customers.email,customers.registration_date
from customers
right join orders on customers.customer_id=orders.customer_id;

-- 5. order greater than the average order amount
select distinct
customers.customer_id,customers.firstname,customers.lastname,customers.email,customers.registration_date
from customers
join orders on customers.customer_id=orders.customer_id
where orders.total > (select avg(total) from orders);

-- 6.salary is greater than average salary
select employee_id,firstname,lastname,department,hiredate,salary
from  employees
where salary > (select avg( salary) from employees); 

-- 7. Extract year and month from OrderDate
select orderid,order_date,
year(order_date) as OrderYear,
month(order_date) as OrderMonth
from orders;

-- 8. Difference in days
select orderid,order_date,
curdate() as CurrentDate,
datediff(curdate(),order_date) as DaysSinceOrder
from orders;

-- 9. Format OrderDate
select orderid,order_date,
date_format(order_date,'%d-%b-%Y') as FormattedOrderDate
from orders;

-- 10. Combine first and last name into FullName
select employee_id,
concat(firstname,' ',lastname) as FullName
from  employees;

-- 11.  Replace 'John' with 'Johnathan' 
select customer_id,
firstname,
replace(firstname,'john','johnathan') as Updated_FirstName
from customers;

-- 12. FirstName in uppercase and LastName in lowercase
select customer_id ,
upper(firstname) as  UpperFirstName,
lower(lastname) as LowerLastName
from customers;

-- 13. Remove extra spaces from the Email field
select customer_id,
email,
trim(email) as CleanEmail
from customers;

-- 14. Running total of TotalAmount for each order
select orderid,order_date,total,
sum(total) over(order by order_date,orderid rows between unbounded preceding and current row) as Total_Running
from orders;

-- 15.Rank orders by TotalAmount using RANK()
select orderid,total,
rank() over(order by total desc) as Order_Rank
from orders;

-- 16. Discount based on TotalAmount
select orderid,total,
case
	when total > 1000 then total*0.90
	when total > 500 then total*0.95
    else total
end as DiscountAmount,
case
	when total > 1000 then '10%'
	when total > 500 then '5%'
    else 'no discount'
end as AmountAfterDiscount
from orders;

-- 17  Categorize employee salaries as High, Medium, or Low
select employee_id,firstname,lastname,salary,
case
	when salary >= 55000 then 'high'
	when salary >= 50000 then 'medium'
    else 'low'
end as SalaryCategory
from  employees;

