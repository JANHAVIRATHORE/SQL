# Data Transformer – SQL Project

## 📌 Project Overview

**Data Transformer** is a SQL-based database project developed using MySQL. It demonstrates essential and advanced SQL operations for managing customer information, order details, and employee records.

The project focuses on data retrieval, table joins, subqueries, date and string functions, window functions, and conditional logic. It helps demonstrate how SQL can be used to retrieve, transform, analyze, and organize structured data.

## 🎯 Objectives

- Create and manage a relational database using MySQL.
- Retrieve related data using different types of JOIN operations.
- Filter records using subqueries and aggregate functions.
- Extract and format dates.
- Manipulate strings using SQL functions.
- Calculate running totals and rank records.
- Apply conditional logic using CASE statements.
- Categorize employee salaries based on predefined conditions.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Query Language:** SQL
- **Database Tools:** MySQL Workbench / phpMyAdmin
- **Project Type:** SQL Database Project

## 🗄️ Database Name

`Data_transformer`

The database contains three tables:

1. `customers`
2. `orders`
3. `employees`

## 📂 Database Structure

### 1. Customers Table

The `customers` table stores customer information.

| Column Name | Data Type | Description |
|---|---|---|
| customer_id | INT | Unique customer ID and Primary Key |
| firstname | VARCHAR(50) | Customer's first name |
| lastname | VARCHAR(50) | Customer's last name |
| email | VARCHAR(50) | Customer's email address |
| registration_date | DATE | Customer registration date |

### 2. Orders Table

The `orders` table stores customer order information.

| Column Name | Data Type | Description |
|---|---|---|
| orderid | INT | Order identification number |
| customer_id | INT | References the customers table |
| order_date | DATE | Date the order was placed |
| total | INT | Total order amount |

**Relationship:** The `customer_id` column references `customers.customer_id` through a foreign key.

### 3. Employees Table

The `employees` table stores employee details.

| Column Name | Data Type | Description |
|---|---|---|
| employee_id | INT | Unique employee ID and Primary Key |
| firstname | VARCHAR(50) | Employee's first name |
| lastname | VARCHAR(50) | Employee's last name |
| department | VARCHAR(100) | Employee's department |
| hiredate | DATE | Employee hiring date |
| salary | INT | Employee salary |

## 📋 SQL Operations Implemented

The project implements the following 17 SQL operations.

### 1. Inner Join
Retrieves customers who have matching orders.

**SQL Concepts:** `INNER JOIN`, `ON`

### 2. Left Join
Retrieves all customers and their matching orders, including customers without orders.

**SQL Concepts:** `LEFT JOIN`

### 3. Right Join
Retrieves all orders and their matching customer information.

**SQL Concepts:** `RIGHT JOIN`

### 4. Full Outer Join
Combines the results of left and right joins to retrieve all matching and non-matching records from both tables.

**SQL Concepts:** `LEFT JOIN`, `RIGHT JOIN`, `UNION`

**Note:** MySQL does not directly support `FULL OUTER JOIN`. This operation is implemented using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`.

### 5. Orders Greater Than the Average Order Amount
Retrieves customers whose order amounts exceed the average order amount.

**SQL Concepts:** `JOIN`, `AVG()`, Subquery

### 6. Employees With Above-Average Salaries
Retrieves employees whose salaries are greater than the average salary of all employees.

**SQL Concepts:** `AVG()`, Subquery

### 7. Extract Year and Month From Order Dates
Extracts the year and month from each order date.

**SQL Functions:** `YEAR()`, `MONTH()`

### 8. Calculate the Difference in Days
Calculates the number of days between each order date and the current date.

**SQL Functions:** `CURDATE()`, `DATEDIFF()`

### 9. Format Order Dates
Displays order dates in a readable format, such as `01-Jul-2023`.

**SQL Function:** `DATE_FORMAT()`

### 10. Combine First and Last Names
Combines employee first names and last names into a single `FullName` column.

**SQL Function:** `CONCAT()`

### 11. Replace Customer First Names
Demonstrates how to replace a specified name with another name in query results.

**SQL Function:** `REPLACE()`

**Example:** Replace `John` with `Johnathan`.

### 12. Convert Names to Uppercase and Lowercase
Displays customer first names in uppercase and last names in lowercase.

**SQL Functions:** `UPPER()`, `LOWER()`

### 13. Remove Extra Spaces From Email Addresses
Uses the `TRIM()` function to remove leading and trailing spaces from email values.

**SQL Function:** `TRIM()`

### 14. Calculate a Running Total
Calculates the cumulative total of orders based on order date and order ID.

**SQL Concepts:** `SUM() OVER()`, Window Functions

### 15. Rank Orders by Total Amount
Ranks orders from highest to lowest total amount.

**SQL Concepts:** `RANK() OVER()`, Window Functions

### 16. Apply Discounts Based on Order Amount
Demonstrates conditional discount calculations using the order total.

| Order Amount | Discount |
|---|---|
| Greater than 1000 | 10% |
| Greater than 500 and up to 1000 | 5% |
| 500 or below | No discount |

**SQL Concept:** `CASE`

**Note:** The query calculates the discounted amount as well as the applicable discount category.

### 17. Categorize Employee Salaries
Classifies employees into salary categories according to their salaries.

| Salary Condition | Category |
|---|---|
| Salary >= 55000 | High |
| Salary >= 50000 and < 55000 | Medium |
| Salary < 50000 | Low |

**SQL Concept:** `CASE`


## 📊 Sample Data Overview

The project includes sample records for testing.

- **Customers:** John Doe and Jane Smith.
- **Orders:** Two orders associated with the sample customers.
- **Employees:** Mark Johnson and Susan Lee.

The sample records demonstrate how customer details, orders, and employee information can be retrieved and transformed using SQL.

## 📚 Key SQL Concepts Covered

This project demonstrates the following SQL concepts:

- Database creation and selection
- Table creation and data insertion
- Primary keys and foreign keys
- Inner, left, and right joins
- Combining query results using `UNION`
- Subqueries and aggregate functions
- Date and string manipulation functions
- Window functions and running totals
- Ranking using `RANK()`
- Conditional expressions using `CASE`
- Data retrieval and transformation

## 💡 Learning Outcomes

After completing this project, learners should be able to:

1. Design a simple relational database.
2. Retrieve related information from multiple tables.
3. Write queries using joins and subqueries.
4. Manipulate date and string values.
5. Perform cumulative calculations and ranking.
6. Apply conditional logic to categorize and transform data.
7. Understand practical applications of SQL in data analysis.


# 👩‍💻 Author

**Janhavi Rathore**

A SQL/MySQL practice project demonstrating relational database design
and basic data analysis.
