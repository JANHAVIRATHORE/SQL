use schooldb;

-- unique =unique + null values 
CREATE TABLE Emp4 (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,  -- Auto-incrementing primary key
    emp_name VARCHAR(50) NOT NULL
);

INSERT INTO Emp4 (emp_name) VALUES ('Alice');
INSERT INTO Emp4 (emp_name) VALUES ('Bob');
INSERT INTO Emp4 (emp_name) VALUES ('Charlie');

select * from emp4;

INSERT INTO Emp4 (emp_id, emp_name) VALUES (10, 'David');

select * from emp4;

INSERT INTO Emp4 (emp_name) VALUES ('simit');

select * from emp4;

ALTER TABLE Emp4 AUTO_INCREMENT = 100;

INSERT INTO Emp4 (emp_name) VALUES ('rahul');
INSERT INTO Emp4 (emp_name) VALUES ('ajay');
select * from emp4;

-- primary = unique + not null
-- combining 2 varaible column called composite id can create primary key

CREATE TABLE Orders (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);
-- cobination cannot be repeated 
INSERT INTO Orders (order_id, product_id, quantity) VALUES (1, 101, 2);
INSERT INTO Orders (order_id, product_id, quantity) VALUES (1, 102, 1);  -- Allowed

INSERT INTO Orders (order_id, product_id, quantity) VALUES (2, 102, 1);  -- Allowed

select * from orders;

-- key attributes (col primary key) non key attributes (non key col)

-- normalization means- dataset organize,structure in better manner 
-- 1) first normal form = duplicate, multiple values no in 1 col arrange
-- 2) second normal form =  partial dependency remove(with one find one)
-- 3) 