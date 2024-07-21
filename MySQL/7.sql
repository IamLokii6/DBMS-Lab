use 2336db6;

#(1
SELECT s.name AS Salesman, c.name AS Customer, s.city
   FROM Salesman s
   INNER JOIN Customer c ON s.city = c.city;
   
#(2
SELECT o.Orders_number, o.purchase_amount, c.name AS Customer, c.city 
FROM Orders o 
INNER JOIN Customer c ON o.customer_id = c.id 
WHERE o.purchase_amount BETWEEN 500 AND 2000;

#(3 
SELECT DISTINCT purchase_amount 
FROM Orders 
Order BY purchase_amount DESC 
LIMIT 2, 1; 

#(4
SELECT DISTINCT city 
FROM ( 
SELECT city, LEAD(city) OVER (Order BY city) AS next_city 
FROM Customer 
) AS city_pairs 
WHERE city = next_city; 

#(5
SELECT c.name AS Customer_Name, c.city AS Customer_City, s.name AS Salesman, s.city AS 
Salesman_City, s.commission 
FROM Customer c 
INNER JOIN Salesman s ON c.city = s.city; 

#(6
SELECT c.name AS Customer_Name, c.city AS Customer_City, s.name AS Salesman, s.commission 
FROM Customer c 
INNER JOIN Salesman s ON c.city = s.city 
WHERE s.commission > 0.12; 

#(7
SELECT c.name AS Customer_Name, c.city AS Customer_City, s.name AS Salesman, s.city AS 
Salesman_City, s.commission 
FROM Customer c 
INNER JOIN Salesman s ON c.city != s.city AND s.commission > 0.12; 

#(8
SELECT o.Orders_number, o.Orders_date, o.purchase_amount, c.name AS Customer_Name, 
c.grade, s.name AS Salesman, s.commission 
FROM Orders o 
INNER JOIN Customer c ON o.customer_id = c.id 
INNER JOIN Salesman s ON o.salesman_id = s.id; 

#(9
SELECT s.id, s.name, s.city, c.id, c.name, c.city, o.Orders_number, o.purchase_amount 
FROM Salesman s 
INNER JOIN Orders o ON s.id = o.salesman_id 
INNER JOIN Customer c ON o.customer_id = c.id; 

#(10
SELECT c.name AS Customer_Name, c.city AS Customer_City, c.grade, s.name AS Salesman, 
s.city AS Salesman_City 
FROM Customer c 
LEFT JOIN Salesman s ON c.city = s.city 
Order BY c.id ASC; 

#(11
SELECT c.name AS Customer_Name, c.city AS Customer_City, c.grade, s.name AS Salesman, 
s.city AS Salesman_City 
FROM Customer c 
LEFT JOIN Salesman s ON c.city = s.city 
WHERE c.grade < 300 
Order BY c.id ASC; 

#(12
SELECT c.name AS Customer_Name, c.city, o.Orders_number, o.Orders_date, 
o.purchase_amount 
FROM Customer c 
LEFT JOIN Orders o ON c.id = o.customer_id 
Order BY o.Orders_date ASC; 

#(13
SELECT c.name AS Customer_Name, c.city, o.Orders_number, o.Orders_date, 
o.purchase_amount, s.name AS Salesman, s.commission 
FROM Customer c 
LEFT JOIN Orders o ON c.id = o.customer_id 
LEFT JOIN Salesman s ON o.salesman_id = s.id; 

#(14
SELECT s.name AS Salesman 
FROM Salesman s 
LEFT JOIN Customer c ON s.city = c.city 
WHERE c.id IS NOT NULL OR c.id IS NULL; 

#(15
SELECT s.name AS Salesman, c.name AS Customer_Name, c.city AS Customer_City, c.grade, 
o.Orders_number, o.Orders_date, o.purchase_amount 
FROM Salesman s 
LEFT JOIN Orders o ON s.id = o.salesman_id 
LEFT JOIN Customer c ON o.customer_id = c.id; 

#(16
SELECT s.name AS Salesman 
FROM Salesman s 
LEFT JOIN Customer c ON s.city = c.city 
LEFT JOIN Orders o ON c.id = o.customer_id 
WHERE o.purchase_amount >= 2000 OR c.grade IS NOT NULL; 

#(17
SELECT c.name AS Customer_Name, c.city AS Customer_City, o.Orders_number, o.Orders_date, 
o.purchase_amount 
FROM Customer c 
LEFT JOIN Orders o ON c.id = o.customer_id 
WHERE o.Orders_number IS NOT NULL; 
