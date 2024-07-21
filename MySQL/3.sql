create database pac3db;

use pac3db;

CREATE TABLE company(
Branch_id INT PRIMARY KEY,
Branch_name VARCHAR(65),
Branch_head INT 
);

CREATE TABLE customer(
Customer_id INT PRIMARY KEY,
Customer_name VARCHAR(65),
branch_id int,
FOREIGN KEY (branch_id) REFERENCES company(Branch_id)
);

CREATE TABLE emp(
Empid INT PRIMARY KEY,
Firstname VARCHAR(45),
Middlename VARCHAR(45),
Lastname VARCHAR(45),
Works_in int,
FOREIGN KEY (Works_in) REFERENCES company(Branch_id)
);

CREATE TABLE branch_supplier(
Branch_id INT,
FOREIGN KEY (Branch_id) REFERENCES company(Branch_id),
Supplier_name VARCHAR(85),
Supply_type VARCHAR(45)
);

CREATE TABLE works_with(
branch_id INT,
FOREIGN KEY (branch_id) REFERENCES company(Branch_id),
client_id INT,
total_sales int
);

INSERT INTO company VALUES 
(1, 'Technology', 204),
(2, 'Healthcare', 155),
(3, 'Retail', 206);

INSERT INTO customer VALUES 
(01, 'Alice', 1),
(02, 'Bob', 2),
(03, 'Eve', 3);

INSERT INTO branch_supplier VALUES 
(01, 'Tech Corp', 'Electronics'),
(01, 'Globe Office Supplies', 'Stationery'),
(02, 'Eco Power', 'Solar Panels');

INSERT INTO emp VALUES 
(104, 'Alice', 'Marie', 'Smith',01),
(105, 'Bob', 'William', 'Johnson',02),
(106, 'Eve', 'Elizabeth', 'Taylor',03);

INSERT INTO works_with VALUES (01,1,2000000),
								(02,3,7000000),
                                (03,2,9000500);
                                
                                
describe works_with;
 
update emp set Firstname = 'rohit' where Empid = '22';
update emp set Firstname = 'mohit' where Empid = '32';
update emp set Firstname = 'sham' where Empid = '12'; 

select * from company; 

delete from emp where Empid= '12'; 