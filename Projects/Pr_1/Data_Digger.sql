create database cafe;

use cafe;

-- customers table
create table customers(
customerid int primary key,
name varchar(100),
email varchar(100),
address varchar(100)
);

-- insert 5 sample records
insert into customers (customerid,name,email,address)
values
(101,"John","john@gmail.com","rajkot"),
(102,"Alice","alice@gmail.com","surat"),
(103,"Bob","bob@gmail.com","ahmedabad"),
(104,"David","david@gmail.com","mumbai"),
(105,"Eva","eva@gmail.com","rajkot");

-- retrieve all records
select * from customers;

-- update address
update customers
set address="delhi" 
where customerid=101;

select * from customers;

-- delete record using customer_id
delete from customers where customerid=105;

select * from customers;

-- retrieve all records name is alice
select * from customers where name="Alice";

-- orders table
create table orders (
orderid int primary key,
customerid int,
order_date varchar(20),
total_amount int(100),
foreign key (customerid) references customers(customerid)
);

-- insert 5 sample records in orders table
insert into orders (orderid,customerid,order_date,total_amount)
values
(1,101,"29-9-2026",2500),
(2,102,"22-8-2026",1000),
(3,103,"07-10-2026",400),
(4,104,"01-9-2026",500),
(5,101,"15-8-2026",1500);

select * from orders;

-- retrieve all order by specific customer
select * from orders where customerid=101;

-- update order total amount
update orders 
set total_amount=1440 
where orderid=3;

select * from orders;

-- delete order by orderid
delete from orders where orderid=2;

select * from orders;

-- retrieve order placed in last 30 days
select * from orders where order_date >= "07-09-2026";

-- highest order amount
select max(total_amount) from orders;

-- lowest order amount
select min(total_amount) from orders;

-- average order amount
select avg(total_amount) from orders;

-- products table
create table products(
product_id int primary key,
product_name varchar(100),
price int,
stock int
);

-- insert 5 sample records in products table
insert into products(product_id,product_name,price,stock)
values
(101,"coffee",500,10),
(102,"sandwich",550,7),
(103,"cake",1000,0),
(104,"tea",300,20),
(105,"bubble_tea",900,6);

select * from products;

-- retrieve all product sort by price descending order
select * from products
order by price desc;

-- update price of product
update products 
set price=450
where product_name="tea";

select * from products;

-- delete product if its out of stock
delete from products 
where stock=0;

select * from products;

-- retrieve product price inbetween 500 and 2000
select * from products where price between 500 And 2000;

-- retrieve expensive product
select max(price) from products;

-- retrieve cheapest product 
select min(price) from products;

-- orderdetail table
create table order_detail (
order_detail_id int primary key,
orderid int,
product_id int,
quantity int,
sub_total int,
foreign key (orderid) references orders(orderid),
foreign key (product_id) references products(product_id)
);

-- insert 5 sample records in orderdetail table
insert into order_detail (order_detail_id,orderid,product_id,quantity,sub_total)
values
(1, 5, 104, 2, 600),
(2, 1, 101, 3, 1500),
(3, 3, 102, 2, 1100),
(4, 4, 105, 1, 900),
(5, 5, 102, 1, 550);

select * from order_detail;

 -- retrieve all order for specific order
select * from order_detail where orderid=5;

-- retrieve total revenue generated from all order
select sum(sub_total) from order_detail;

-- retrieve top 3 most order products
select product_id,sum(quantity) as total_quantity 
from order_detail 
group by product_id 
order by total_quantity desc limit 3;

-- count specific product has been sold how many times
select product_id,count(product_id) as total_sold
from order_detail
group by product_id;