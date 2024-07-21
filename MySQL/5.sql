create database 2336db5;

use 2336db5;

create table 2336_customer(
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255)
);

SHOW TABLES;
#B(1
INSERT INTO 2336_customer VALUES (1, 'D’Souza', 'goa'); 

#B(2
INSERT INTO 2336_Customer VALUES (2, 'ram', 'New York');

#B(3
SELECT * FROM 2336_customer WHERE LENGTH(city) = 3;

#B(4
INSERT INTO 2336_customer VALUES (3, 'Souza', 'a'); 
INSERT INTO 2336_customer VALUES (4, 'Souza', 'ahmedabad');
INSERT INTO 2336_customer VALUES (5, 'Souz', 'goa');  
INSERT INTO 2336_Customer VALUES (11, 'D’Souza', 'jan');
INSERT INTO 2336_Customer VALUES (12, 'Jay', 'New York');
INSERT INTO 2336_Customer VALUES (13, 'Alice', 'Chicago');
INSERT INTO 2336_Customer VALUES (14, 'Bob', 'Los Angeles');
SELECT * FROM 2336_customer WHERE city LIKE '%a_%';

#C(1
CREATE TABLE 2336_Loan (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    branch_name VARCHAR(255),
    amount DECIMAL(10, 2),
    CONSTRAINT loan_2336 FOREIGN KEY (customer_id) REFERENCES 2336_Customer(customer_id)
);
CREATE TABLE 2336_Account (
    account_id INT PRIMARY KEY,
    customer_id INT,
    branch_name VARCHAR(255),
    balance DECIMAL(10, 2),
   CONSTRAINT account_2336 FOREIGN KEY (customer_id) REFERENCES 2336_Customer(customer_id)
);

INSERT INTO 2336_Loan (loan_id, customer_id, branch_name, amount) VALUES
(1001, 1, 'Westridge', 5000.00),
(1002, 2, 'Bridgeton', 7000.00),
(31003, 3, 'Northridge', 10000.00),
(1004, 4, 'Southbridge', 12000.00),
(1009, 5, 'Perryridge ', 12000.00);

INSERT INTO 2336_Loan (loan_id, customer_id, branch_name, amount)
VALUES
    (1, 11, 'Perryridge', 5000.00),
    (2, 12, 'Brighton', 8000.00),
    (3, 13, 'Manus', 6000.00),
    (4, 14, 'Brighton', 7000.00);

INSERT INTO 2336_Account (account_id, customer_id, branch_name, balance) VALUES
(1005, 1, 'Westridge', 5000.00),
(1006, 2, 'Bridgeton', 7000.00),
(1007, 3, 'Northridge', 10000.00),
(1008, 4, 'Southbridge', 12000.00),
(1010, 5, 'Perryridge', 12000.00);

INSERT INTO 2336_Account (account_id, customer_id,branch_name , balance)
VALUES
    (101, 11, 'Perryridge', 12000.00),
    (102, 12, 'Brighton', 5000.00),
    (103, 13, 'Mianus', 9000.00),
    (104, 14, 'Perryridge', 15000.00),
    (105, 14, 'Brighton', 2000.00);

SELECT c.name, l.*
FROM 2336_Customer c
JOIN 2336_Loan l ON c.customer_id = l.customer_id
WHERE l.branch_name LIKE '%idge';

#C(2
SELECT c.name, c.city
FROM 2336_Customer c
JOIN 2336_Loan l ON c.customer_id = l.customer_id;


#C(3
SELECT c.*
FROM 2336_Customer c
JOIN 2336_Loan l ON c.customer_id = l.customer_id
WHERE l.branch_name = 'Perryridge'
UNION
SELECT c.*
FROM 2336_Customer c
JOIN 2336_Account a ON c.customer_id = a.customer_id
WHERE a.branch_name = 'Perryridge';

#C(4
SELECT c.*
FROM 2336_Customer c
JOIN 2336_Loan l ON c.customer_id = l.customer_id
JOIN 2336_Account a ON c.customer_id = a.customer_id
WHERE l.branch_name = 'Brighton' AND a.branch_name = 'Brighton';

#c(5
SELECT c.*
FROM 2336_Customer c
JOIN 2336_Account a ON c.customer_id = a.customer_id
LEFT JOIN 2336_Loan l ON c.customer_id = l.customer_id AND a.branch_name = l.branch_name
WHERE a.branch_name = 'Mianus' AND l.customer_id IS NULL;

#c(6
SELECT DISTINCT c.name
FROM 2336_customer c
JOIN 2336_account a ON c.customer_id = a.customer_id
JOIN 2336_account a2 ON a.branch_name = a2.branch_name
JOIN 2336_customer c2 ON a2.customer_id = c2.customer_id
WHERE c2.name = 'ram';

#c(7
 SELECT branch_name
 FROM 2336_account 
WHERE balance >(
 SELECT max(balance)
 FROM 2336_account 
WHERE branch_name = 'Brooklyn'
 );
 
 #c(8
  SELECT DISTINCT branch_name
 FROM 2336_account 
WHERE balance > ALL (SELECT balance FROM 2336_account WHERE branch_name = 'Brooklyn');

#c(9
 select name 
from 2336_customer c
 join 2336_account a 
on a.customer_id = c.customer_id
 where branch_name = 'Mianus'
 and not exists(
 select customer_id
 from 2336_loan l
 where branch_name = 'Mianus' and  c.customer_id = l.customer_id 
);

#c(10
select branch_name , count(distinct customer_id) as num_depositors
 from 2336_account
 group by branch_name;
 
 #c(11
  select branch_name , sum(balance) as total_depositors
 from 2336_account
 group by branch_name;
 
 #c(12
 select branch_name , avg(balance) as avg_balance
 from 2336_account
 group by branch_name;
 
 #c(13
 INSERT INTO 2336_account (account_id, customer_id, branch_name) VALUES ('111', '5', 
'Brighton');
 INSERT INTO 2336_account (account_id, customer_id, branch_name) VALUES ('112', '4', 
'vasco');

 select branch_name , avg(balance) as avg_balance
 from 2336_account
 group by branch_name;
 
 select branch_name, SUM(balance) / COUNT(balance) AS avg_balance
 from 2336_Account
 group by branch_name;
 
 #c(14
  select branch_name 
from 2336_account
 group by branch_name
 having avg(balance) >1200;
 
 #c(15
 select branch_name 
from 2336_account
 group by branch_name
 having avg(balance) >2000;
 
  #c(16
   SELECT branch_name
 FROM 2336_Account
 GROUP BY branch_name
 HAVING AVG(balance) = (
 SELECT MAX(avg_balance)
 FROM (
 SELECT AVG(balance) AS avg_balance
 FROM 2336_Account
 GROUP BY branch_name
 ) as subquery
 );
 12:57:54	FROM 2336_Account  GROUP BY branch_name  HAVING AVG(balance) = (  SELECT MAX(avg_balance)  FROM (  SELECT AVG(balance) AS avg_balance  FROM 2336_Account  GROUP BY branch_name  ) as subquery  )	Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM 2336_Account  GROUP BY branch_name  HAVING AVG(balance) = (  SELECT MAX(avg' at line 1	0.000 sec

#c(17
 SELECT customer_id, AVG(balance) AS avg_balance
 FROM 2336_Account
 WHERE branch_name = 'Harrison'
 GROUP BY customer_id
 HAVING COUNT(*) >= 2;
 
 #c(18
  SELECT *
 FROM 2336_Account
 WHERE balance = (SELECT MAX(balance) FROM 2336_Account);
 
 #c(19
  delete from 
2336_account 
where branch_name = 'Perryridge';
13:04:33	delete from  2336_account  where branch_name = 'Perryridge'	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec

#c(20
 delete from 2336_account
 where branch_name ='Needham';
 0	16	13:06:25	delete from 2336_account
  where branch_name ='Needham'	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. 
 To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec
 
 #c(21
 delete from 2336_account
 where balance <(
 select avg(balance)
 from 2336_account 
group by branch_name
 );
 13:08:15	delete from 2336_account  where balance <(  select avg(balance)  from 2336_account  group by branch_name  )	Error Code: 1093. You can't specify target table '2336_account' for update in FROM clause	0.016 sec'


#c(22
 INSERT INTO 2336_Account (account_id, customer_id,branch_name , balance)
 SELECT customer_id AS account_id, customer_id, 'Perryridge' AS branch_name, 200 AS balance
 FROM 2336_loan 
WHERE branch_name = 'Perryridge';

#c(23
update 2336_account
 set balance  =  case
 when balance > 10000 then balance*1.06
 else balance*1.05
 end;
 
 13:15:15	update 2336_account  set balance  =  case  when balance > 10000 then balance*1.06  else balance*1.05  end	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec
