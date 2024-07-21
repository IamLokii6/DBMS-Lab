use 2336db;
-- Q1)
 describe employee;
  show columns from employee;
  
  -- Q2)
    select * from MYSQL.USER;
    
-- Q3)
select constraint_name, table_name
from information_schema.KEY_COLUMN_USAGE
WHERE Table_schema='2336db' AND table_name = 'employee';

-- Q4)
SET SESSION TIME_ZONE = '+09:00';
SELECT now()

