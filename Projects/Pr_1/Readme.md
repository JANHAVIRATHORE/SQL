# ☕ Cafe Management System --- SQL

A beginner-friendly **Cafe Management System database project** built
with SQL/MySQL.\
This project demonstrates core SQL concepts including **database
creation, table relationships, CRUD operations, filtering, sorting,
aggregate functions, grouping, foreign keys, and sales analysis**.

------------------------------------------------------------------------

## 📌 Project Overview

The **Cafe Management System** stores and manages:

-   Customer information
-   Customer orders
-   Cafe products and inventory
-   Order details
-   Product sales and revenue analysis

The project uses a relational database structure where customers place
orders, and each order contains one or more products.

------------------------------------------------------------------------

## 🛠️ Technologies Used

  -----------------------------------------------------------------------
  Technology                          Purpose
  ----------------------------------- -----------------------------------
  **MySQL / SQL**                     Database management

  **DDL**                             Database and table creation

  **DML**                             Insert, update, and delete records

  **DQL**                             Retrieve and analyze data

  **Primary Key**                     Uniquely identifies records

  **Foreign Key**                     Establishes relationships between
                                      tables

  **Aggregate Functions**             `SUM()`, `MAX()`, `MIN()`, `AVG()`,
                                      `COUNT()`

  **GROUP BY**                        Groups records for analysis

  **ORDER BY**                        Sorts query results

  **LIMIT**                           Restricts the number of returned
                                      records
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 🗂️ Database Structure

Database name:

``` sql
cafe
```

The project contains four tables:

``` text
cafe
│
├── customers
│   └── Customer information
│
├── orders
│   └── Customer order information
│
├── products
│   └── Product and inventory information
│
└── order_detail
    └── Products included in each order
```

### 🔗 Table Relationships

``` text
customers
    │
    │ customerid
    ▼
 orders
    │
    │ orderid
    ▼
order_detail
    │
    │ product_id
    ▼
products
```

-   `customers.customerid` → `orders.customerid`
-   `orders.orderid` → `order_detail.orderid`
-   `products.product_id` → `order_detail.product_id`

------------------------------------------------------------------------

# 📋 Table Details

## 1. Customers Table

Stores customer information.

  Column         Data Type      Key
  -------------- -------------- -------------
  `customerid`   INT            Primary Key
  `name`         VARCHAR(100)   ---
  `email`        VARCHAR(100)   ---
  `address`      VARCHAR(100)   ---

### Operations Demonstrated

-   Create customer table
-   Insert sample customers
-   Retrieve all customers
-   Update customer address
-   Delete a customer
-   Search customer by name

Example:

``` sql
SELECT * FROM customers
WHERE name = 'Alice';
```

------------------------------------------------------------------------

## 2. Orders Table

Stores information about customer orders.

  Column           Data Type     Key
  ---------------- ------------- -------------
  `orderid`        INT           Primary Key
  `customerid`     INT           Foreign Key
  `order_date`     VARCHAR(20)   ---
  `total_amount`   INT           ---

### Operations Demonstrated

-   Create orders table
-   Insert orders
-   Retrieve orders for a specific customer
-   Update order amount
-   Delete an order
-   Find maximum order amount
-   Find minimum order amount
-   Calculate average order amount

Example:

``` sql
SELECT *
FROM orders
WHERE customerid = 101;
```

------------------------------------------------------------------------

## 3. Products Table

Stores cafe product and inventory information.

  Column           Data Type      Key
  ---------------- -------------- -------------
  `product_id`     INT            Primary Key
  `product_name`   VARCHAR(100)   ---
  `price`          INT            ---
  `stock`          INT            ---

### Sample Products

    Product ID Product        Price   Stock
  ------------ ------------ ------- -------
           101 Coffee           500      10
           102 Sandwich         550       7
           103 Cake            1000       0
           104 Tea              300      20
           105 Bubble Tea       900       6

### Operations Demonstrated

-   Create products table
-   Insert products
-   Sort products by price
-   Update product price
-   Delete out-of-stock products
-   Find products within a price range
-   Find most expensive product
-   Find cheapest product

Example:

``` sql
SELECT *
FROM products
WHERE price BETWEEN 500 AND 2000;
```

------------------------------------------------------------------------

## 4. Order Detail Table

Stores individual products included in each order.

  Column              Data Type   Key
  ------------------- ----------- -------------
  `order_detail_id`   INT         Primary Key
  `orderid`           INT         Foreign Key
  `product_id`        INT         Foreign Key
  `quantity`          INT         ---
  `sub_total`         INT         ---

This table demonstrates the use of **multiple foreign keys**.

``` sql
FOREIGN KEY (orderid)
REFERENCES orders(orderid),

FOREIGN KEY (product_id)
REFERENCES products(product_id)
```

------------------------------------------------------------------------

# 📊 SQL Operations Demonstrated

## CRUD Operations

### Create

``` sql
CREATE DATABASE cafe;
```

``` sql
CREATE TABLE customers (...);
```

### Insert

``` sql
INSERT INTO customers
(customerid, name, email, address)
VALUES
(101, 'John', 'john@gmail.com', 'rajkot');
```

### Read

``` sql
SELECT * FROM customers;
```

### Update

``` sql
UPDATE customers
SET address = 'delhi'
WHERE customerid = 101;
```

### Delete

``` sql
DELETE FROM customers
WHERE customerid = 105;
```

------------------------------------------------------------------------

# 🔎 Data Retrieval & Filtering

### Retrieve a specific customer's orders

``` sql
SELECT *
FROM orders
WHERE customerid = 101;
```

### Search customer by name

``` sql
SELECT *
FROM customers
WHERE name = 'Alice';
```

### Filter products by price

``` sql
SELECT *
FROM products
WHERE price BETWEEN 500 AND 2000;
```

------------------------------------------------------------------------

# 📈 Sorting

Products can be sorted from highest to lowest price:

``` sql
SELECT *
FROM products
ORDER BY price DESC;
```

------------------------------------------------------------------------

# 🧮 Aggregate Functions

The project demonstrates commonly used SQL aggregate functions.

### Total Revenue

``` sql
SELECT SUM(sub_total)
FROM order_detail;
```

### Highest Order Amount

``` sql
SELECT MAX(total_amount)
FROM orders;
```

### Lowest Order Amount

``` sql
SELECT MIN(total_amount)
FROM orders;
```

### Average Order Amount

``` sql
SELECT AVG(total_amount)
FROM orders;
```

### Number of Times Each Product Was Sold

``` sql
SELECT
    product_id,
    COUNT(product_id) AS total_sold
FROM order_detail
GROUP BY product_id;
```

------------------------------------------------------------------------

# 🏆 Top 3 Most Ordered Products

The following query calculates the total quantity sold for every product
and returns the top three:

``` sql
SELECT
    product_id,
    SUM(quantity) AS total_quantity
FROM order_detail
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 3;
```

### Concept Used

``` text
SUM()      → Calculates total quantity
GROUP BY   → Groups records by product
ORDER BY   → Sorts products by quantity
LIMIT 3    → Returns the top three
```

------------------------------------------------------------------------

# 💰 Revenue Analysis

Total revenue generated from order details:

``` sql
SELECT SUM(sub_total) AS total_revenue
FROM order_detail;
```

Based on the current sample records:

``` text
Total Revenue = 4650
```

------------------------------------------------------------------------

# 🔍 Specific Order Details

To retrieve all products/details belonging to a particular order:

``` sql
SELECT *
FROM order_detail
WHERE orderid = 5;
```

------------------------------------------------------------------------

# 📦 Sample Order Details

    Detail ID   Order ID   Product ID   Quantity   Sub Total
  ----------- ---------- ------------ ---------- -----------
            1          5          104          2         600
            2          1          101          3        1500
            3          3          102          2        1100
            4          4          105          1         900
            5          5          102          1         550

------------------------------------------------------------------------

# 🧩 SQL Clauses

SQL clauses are used to specify conditions, arrange results, group records, and limit query output.

## `WHERE`

Filters records based on a condition.

```sql
SELECT *
FROM customers
WHERE name = 'Alice';
```

## `ORDER BY`

Sorts query results in ascending (`ASC`) or descending (`DESC`) order.

```sql
SELECT *
FROM products
ORDER BY price DESC;
```

## `GROUP BY`

Groups rows with the same value, commonly used with aggregate functions.

```sql
SELECT
    product_id,
    SUM(quantity) AS total_quantity
FROM order_detail
GROUP BY product_id;
```

## `HAVING`

Filters grouped results after `GROUP BY`.

Example:

```sql
SELECT
    product_id,
    SUM(quantity) AS total_quantity
FROM order_detail
GROUP BY product_id
HAVING SUM(quantity) > 2;
```

## `LIMIT`

Restricts the number of rows returned.

```sql
SELECT
    product_id,
    SUM(quantity) AS total_quantity
FROM order_detail
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 3;
```

## `BETWEEN`

Selects values within a specified range.

```sql
SELECT *
FROM products
WHERE price BETWEEN 500 AND 2000;
```

## `IN`

Checks whether a value matches any value in a specified list.

```sql
SELECT *
FROM products
WHERE product_id IN (101, 102, 105);
```

## `LIKE`

Searches for a specified pattern.

```sql
SELECT *
FROM customers
WHERE name LIKE 'A%';
```

`A%` means the name starts with `A`.

## `AS`

Creates an alias for a column or expression.

```sql
SELECT
    SUM(sub_total) AS total_revenue
FROM order_detail;
```

---

# ⚙️ SQL Operators

Operators are symbols or keywords used to perform comparisons, calculations, and logical operations.

## Comparison Operators

| Operator | Meaning | Example |
|---|---|---|
| `=` | Equal to | `price = 500` |
| `<>` | Not equal to | `price <> 500` |
| `!=` | Not equal to | `price != 500` |
| `>` | Greater than | `price > 500` |
| `<` | Less than | `price < 500` |
| `>=` | Greater than or equal to | `price >= 500` |
| `<=` | Less than or equal to | `price <= 500` |

Example:

```sql
SELECT *
FROM products
WHERE price >= 500;
```

## Logical Operators

### `AND`

Returns records when **both conditions** are true.

```sql
SELECT *
FROM products
WHERE price >= 500
AND stock > 0;
```

### `OR`

Returns records when **at least one condition** is true.

```sql
SELECT *
FROM products
WHERE price = 500
OR price = 900;
```

### `NOT`

Reverses a condition.

```sql
SELECT *
FROM products
WHERE NOT stock = 0;
```

## Arithmetic Operators

| Operator | Meaning | Example |
|---|---|---|
| `+` | Addition | `price + 100` |
| `-` | Subtraction | `price - 100` |
| `*` | Multiplication | `price * quantity` |
| `/` | Division | `total_amount / 2` |
| `%` | Modulus / remainder | `price % 2` |

Example:

```sql
SELECT
    product_id,
    price * quantity AS total_price
FROM order_detail;
```

> **Note:** In this project, `order_detail` stores `sub_total` directly. In a more advanced design, the subtotal could be calculated using the product price and quantity through a `JOIN`.

## Special Operators

### `IS NULL`

Checks for missing values.

```sql
SELECT *
FROM customers
WHERE email IS NULL;
```

### `IS NOT NULL`

Checks for values that are not missing.

```sql
SELECT *
FROM customers
WHERE email IS NOT NULL;
```

### `IN`

Checks whether a value exists in a list.

```sql
SELECT *
FROM orders
WHERE customerid IN (101, 103, 104);
```

### `NOT IN`

Checks whether a value does not exist in a list.

```sql
SELECT *
FROM products
WHERE product_id NOT IN (103);
```

### `LIKE`

Performs pattern matching.

```sql
SELECT *
FROM customers
WHERE email LIKE '%gmail.com';
```

### `BETWEEN`

Checks whether a value falls within a range.

```sql
SELECT *
FROM products
WHERE price BETWEEN 500 AND 1000;
```

---

# 📚 SQL Clauses vs Operators

| Clauses | Operators |
|---|---|
| `WHERE` | `=` |
| `ORDER BY` | `>` |
| `GROUP BY` | `<` |
| `HAVING` | `>=` |
| `LIMIT` | `<=` |
| `BETWEEN` | `<>` |
| `IN` | `AND` |
| `LIKE` | `OR` |
| `AS` | `NOT` |

### Example Using Multiple Clauses and Operators

```sql
SELECT
    product_id,
    SUM(quantity) AS total_quantity
FROM order_detail
WHERE quantity >= 1
GROUP BY product_id
HAVING SUM(quantity) > 1
ORDER BY total_quantity DESC
LIMIT 3;
```

This single query demonstrates:

```text
WHERE      → filters records
>=         → comparison operator
GROUP BY   → groups products
SUM()      → calculates total quantity
HAVING     → filters grouped results
>          → comparison operator
ORDER BY   → sorts results
DESC       → descending order
LIMIT      → returns only 3 records
```


# 🎯 Learning Objectives

This project helps practice:

-   Database creation
-   Table creation
-   Primary keys
-   Foreign keys
-   Multiple foreign keys
-   Referential relationships
-   `INSERT`
-   `SELECT`
-   `UPDATE`
-   `DELETE`
-   `WHERE`
-   `BETWEEN`
-   `ORDER BY`
-   `GROUP BY`
-   `LIMIT`
-   `SUM()`
-   `COUNT()`
-   `MAX()`
-   `MIN()`
-   `AVG()`
-   Basic sales and revenue analysis

------------------------------------------------------------------------

# 👩‍💻 Author

**Janhavi Rathore**

A SQL/MySQL practice project demonstrating relational database design
and basic data analysis.

------------------------------------------------------------------------

## ⭐ Project Summary

**Cafe Management System** is a simple relational SQL project designed
to demonstrate how customer, order, product, and order-detail data can
be stored and analyzed using MySQL.

> **Database:** `cafe`\
> **Tables:** `customers`, `orders`, `products`, `order_detail`\
> **Focus:** SQL fundamentals + relational database concepts + basic
> sales analysis
