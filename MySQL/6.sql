create database 2336db6;

use 2336db6;

CREATE TABLE Salesman (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    commission DECIMAL(5,2) DEFAULT 0.00,
    hire_date DATE
);

CREATE TABLE Customer (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    grade varchar(2),
    registration_date DATE
);

CREATE TABLE Orders (
    Orders_number INT PRIMARY KEY,
    purchase_amount DECIMAL(10,2) NOT NULL,
    Orders_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (salesman_id) REFERENCES Salesman(id)
);

CREATE TABLE ItemMaster (
    id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price DECIMAL(8,2) NOT NULL,
    product_commission DECIMAL(5,2) DEFAULT 0.00,
    category VARCHAR(50)
);

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL,
    allotment_amount DECIMAL(10, 2) DEFAULT 0.00,
    manager_id INT
);

INSERT INTO Salesman (id, name, city, commission, hire_date) 
VALUES 
(1, 'John Doe', 'New York', 0.05, '2023-01-15'),
(2, 'Jane Smith', 'Los Angeles', 0.03, '2022-08-20'),
(3, 'Mike Johnson', 'Chicago', 0.04, '2023-03-10'),
(4, 'Emily Brown', 'San Francisco', 0.06, '2022-12-05'),
(5, 'David Lee', 'Houston', 0.04, '2023-02-28');

INSERT INTO Customer (id, name, city, grade, registration_date) 
VALUES 
(1, 'BigMart', 'New York', 'A', '2023-01-10'),
(2, 'FashionWorld', 'Los Angeles', 'B', '2022-09-05'),
(3, 'TechSolutions', 'Chicago', 'C', '2023-03-20'),
(4, 'HealthyBites', 'San Francisco', 'A', '2022-12-01'),
(5, 'HomeDecor', 'Houston', 'B', '2023-02-15');

INSERT INTO Orders (Orders_number, purchase_amount, Orders_date, customer_id, salesman_id) 
VALUES 
(1001, 500.00, '2023-01-20', 1, 1),
(1002, 300.00, '2022-09-10', 2, 2),
(1003, 800.00, '2023-03-25', 3, 3),
(1004, 1200.00, '2022-12-15', 4, 4),
(1005, 700.00, '2023-02-28', 5, 5);

INSERT INTO ItemMaster (id, product_name, product_price, product_commission, category) 
VALUES 
(1, 'Smartphone', 600.00, 0.05, 'Electronics'),
(2, 'Jeans', 50.00, 0.03, 'Apparel'),
(3, 'Laptop', 1000.00, 0.04, 'Electronics'),
(4, 'Salad', 10.00, 0.02, 'Food'),
(5, 'Sofa', 800.00, 0.06, 'Furniture');

INSERT INTO Department (department_id, department_name, allotment_amount, manager_id) 
VALUES 
(101, 'Sales', 100000.00, 1),
(102, 'Marketing', 80000.00, 2),
(103, 'HR', 60000.00, 3),
(104, 'Finance', 120000.00, 4),
(105, 'IT', 90000.00, 5);

INSERT INTO Salesman (id, name, city, commission) VALUES
(2001, 'Rahul Sharma', 'Margao', 0.1),
(2002, 'Yasim Khan', 'Panaji', 0.12),
(2003, 'Abel', 'Pune', 0.08),
(2004, 'Ankit', 'Vasco', 0.15),
(2005, 'Aman', 'Dharbabdora', 0.11);

INSERT INTO Customer (id, name, city, grade) VALUES
(3001, 'Ramesh', 'Dharbabdora', 'A'),
(3002, 'Suresh', 'Vasco', 'B'),
(3003, 'Raina', 'Pune', 'C'),
(3004, 'Sapana', 'Panaji', 'A'),
(3005, 'Pushparaj', 'Margao', 'B');

INSERT INTO Orders (orders_number, purchase_amount, orders_date, salesman_id, customer_id) VALUES
(1006, 3500.75, '2012-08-18', 2001, 3001),
(1007, 2800.25, '2012-08-18', 2002, 3002),
(1008, 4000.00, '2012-08-18', 2003, 3003),
(1009, 3200.50, '2012-08-19', 2004, 3004),
(1010, 4200.75, '2012-08-19', 2005, 3005);

INSERT INTO ItemMaster (id, product_name, product_price, product_commission) VALUES
(1001, 'Mobile', 15000.50, 0.05),
(1002, 'Shirt', 200.75, 0.07),
(1003, 'Fruits', 150.25, 0.06),
(1004, 'Mixer', 3200.00, 0.08),
(1005, 'Tea Cup', 250.50, 0.09);


INSERT INTO Department (department_id, department_name, allotment_amount, manager_id)
VALUES
    (1, 'Sales', 50000.00, 101),
    (2, 'Marketing', 40000.00, 102),
    (3, 'Finance', 60000.00, 103),
    (4, 'IT', 70000.00, 104),
    (5, 'Human Resources', 45000.00, 105);
    
    INSERT INTO ItemMaster (id, product_name, product_price, product_commission) VALUES
(1010, 'Mobile', 15000.50, 0.05),
(1012, 'Shrit', 200.75, 0.07),
(1013, 'Fruits', 150.25, 0.06),
(1014, 'Mixer', 3200.00, 0.08),
(1015, 'Tea Cup', 250.50, 0.09);

INSERT INTO Orders (orders_number, purchase_amount, orders_date, salesman_id, customer_id) VALUES
(1011, 1500.50, '2012-08-17', 2001, 3001),
(1012, 2200.75, '2012-08-17', 2002, 3002),
(1013, 1800.25, '2012-08-17', 2003, 3003),
(1014, 3000.00, '2012-08-17', 2004, 3004),
(1015, 2500.50, '2012-08-18', 2005, 3005),
(1016, 3500.75, '2012-08-18', 2001, 3001),
(1017, 2800.25, '2012-08-18', 2002, 3002),
(1018, 4000.00, '2012-08-18', 2003, 3003),
(1019, 3200.50, '2012-08-19', 2004, 3004),
(1020, 4200.75, '2012-08-19', 2005, 3005);

INSERT INTO Salesman (id, name, city, commission) VALUES
(2011, 'Rahul Sharma', 'Margao', 0.1),
(2012, 'Yasim Khan', 'Panaji', 0.12),
(2013, 'Abel', 'Pune', 0.08),
(2014, 'Ankit', 'Vasco', 0.15),
(2015, 'Aman', 'Dharbabdora', 0.11);

INSERT INTO Customer (id, name, city, grade) VALUES
(3011, 'Ramesh', 'Dharbabdora', 'A'),
(3012, 'Suresh', 'Vasco', 'B'),
(3013, 'Raina ', 'Pune', 'C'),
(3014, 'Sapana ', 'Panaji', 'A'),
(3015, 'Pushparaj ', 'Margao', 'B');




#1
SELECT SUM(purchase_amount) AS total_purchase_amount 
FROM Orders;

#2
SELECT AVG(purchase_amount) AS average_purchase_amount
FROM Orders;

#3
SELECT COUNT(DISTINCT id) AS num_salespeople
FROM Salesman;

#4
SELECT MAX(purchase_amount) AS max_purchase_amount
   FROM Orders;

#5
SELECT MIN(purchase_amount) AS min_purchase_amount
   FROM Orders;

#6
SELECT customer_id, MAX(purchase_amount) AS max_purchase_amount
FROM Orders
GROUP BY customer_id;

#7
SELECT Orders_date, customer_id, MAX(purchase_amount) AS max_purchase_amount
FROM Orders
GROUP BY Orders_date, customer_id;

#8
SELECT salesman_id,
    MAX(purchase_amount) AS highest_purchase_amount
FROM Orders WHERE Orders_date = '2012-08-17' GROUP BY salesman_id;

#9
SELECT customer_id, Orders_date, MAX(purchase_amount) AS max_purchase_amount
   FROM Orders
   WHERE purchase_amount > 2000.00
   GROUP BY customer_id, Orders_date;

#10
SELECT customer_id, Orders_date, MAX(purchase_amount) AS max_purchase_amount
    FROM Orders
    WHERE purchase_amount BETWEEN 2000 AND 6000
    GROUP BY customer_id, Orders_date;

#11
SELECT customer_id, Orders_date, MAX(purchase_amount) AS max_purchase_amount
FROM Orders
WHERE purchase_amount IN (2000, 3000, 5760, 6000)
GROUP BY customer_id, Orders_date;

#12
SELECT customer_id, MAX(purchase_amount) AS max_purchase_amount
FROM Orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id;


#13
SELECT customer_id, MAX(purchase_amount) AS max_purchase_amount
FROM Orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id
HAVING max_purchase_amount > 1000; 

#14
SELECT salesman_id, MAX(purchase_amount) AS max_purchase_amount
FROM Orders
WHERE salesman_id BETWEEN 5003 AND 5008
GROUP BY salesman_id;

#15
SELECT COUNT(*) AS num_Orders
FROM Orders
WHERE Orders_date = '2012-08-17';

#16
SELECT Orders_date, salesman_id, COUNT(*) AS num_Orders
FROM Orders
GROUP BY Orders_date, salesman_id;

#17
SELECT COUNT(*) AS num_customers
FROM Customer;

#18
SELECT COUNT(*) AS num_graded_customers
FROM Customer
WHERE grade IS NOT NULL;

#19
SELECT city, MAX(grade) AS max_grade
FROM Customer
GROUP BY city;

#20
SELECT city, COUNT(*) AS num_salespeople
FROM Salesman
GROUP BY city;

#21
SELECT AVG(product_price) AS average_product_price
FROM ItemMaster;

#22
SELECT COUNT(*) AS num_expensive_products
FROM ItemMaster
WHERE product_price >= 350;

#23
SELECT AVG(product_price) AS average_price, id AS company_id
FROM ItemMaster
GROUP BY id;

#24
SELECT SUM(allotment_amount) AS total_allotment_amount
FROM Department;

