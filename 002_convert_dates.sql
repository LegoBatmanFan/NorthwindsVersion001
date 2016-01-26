/*
-- --------------------------------------------------------------------------------------
-- LegoBatmanFan	Version of the Northwinds Database
-- 
-- Purpose of this project: To learn/understand SQL by creating a version 
l-- of the Northwinds database.
-- 
-- The data used for creating the database comes from w3 schools 
-- (http://www.w3schools.com/sql/) and
--  https://northwinddatabase.codeplex.com/releases/view/71634 
-- Oh yeah, some of this came out of my head.
--
-- The Northwinds MS Access database contains data for the fictional 
--  company Northwind Traders. This database is shipped with Microsoft Office. 
-- 
-- More information about the Northwinds database can be found at:
-- https://technet.microsoft.com/en-us/library/aa276825%28v=sql.80%29.aspx
-- https://northwinddatabase.codeplex.com/releases/view/71634
-- https://github.com/dalers/mywind
-- 
-- A modified version of this database can be found at:
-- http://www.w3schools.com/sql/
-- 
-- The following set of SQL files
-- 001_create_database.sql
-- 002_convert_dates.sql
-- 003_add_more_columns.sql
-- 004_update_tables.sql
-- attempt to build the Northwinds database using MySQL . 
-- 
-- 002_convert_dates.sql changes the following fields in their respective tables: 
-- BirthDate - employees
-- OrderDate - orders
-- --------------------------------------------------------------------------------------
*/

-- --------------------------------------------------------------------------------------
-- Take a look at the structure for the orders and employees tables.
-- --------------------------------------------------------------------------------------
SELECT 'Look at the structure for orders and employees. Make a note of the structure for each table' AS ' ';
DESCRIBE employees;
DESCRIBE orders;


-- --------------------------------------------------------------------------------------
--  Convert the date in the OrderDate column to an actual date.
-- --------------------------------------------------------------------------------------
SELECT 'For the orders table, convert the date in the OrderDate column to an actual date...' AS ' ';
-- --------------------------------------------------------------------------------------
--  Step 1: Add a new column "new_column" of the type DATE
-- --------------------------------------------------------------------------------------
ALTER TABLE orders ADD new_column DATE NOT NULL;
DESCRIBE orders;
-- --------------------------------------------------------------------------------------
--  Step 2: Copy the values from OrderDate to new_column. While copying
-- the string, change the string to the type DATE.
-- --------------------------------------------------------------------------------------
UPDATE orders SET new_column = STR_TO_DATE(OrderDate,'%m/%d/%Y');
DESCRIBE orders;
-- --------------------------------------------------------------------------------------
--  Step 3: Drop the OrderDate column.
-- --------------------------------------------------------------------------------------
ALTER TABLE orders DROP OrderDate;
DESCRIBE orders;
-- --------------------------------------------------------------------------------------
--  Step 3: Change the name of "new_column" to "OrderDate."
-- --------------------------------------------------------------------------------------
ALTER TABLE orders CHANGE new_column OrderDate DATE;
DESCRIBE orders;


SELECT 'For the employees table, convert the date in the OrderDate column to an actual date...' AS ' ';
-- --------------------------------------------------------------------------------------
--  Step 1: Add a new column "DateOfBirth" of the type DATE
-- --------------------------------------------------------------------------------------
ALTER TABLE employees ADD DateOfBirth DATE NOT NULL;
DESCRIBE employees;
-- --------------------------------------------------------------------------------------
--  Step 2: Copy the values from BitthDate to DateOfBirth. While copying
-- the string, change the string to the type DATE.
-- --------------------------------------------------------------------------------------
UPDATE employees SET DateOfBirth = STR_TO_DATE(BirthDate,'%m/%d/%Y');
DESCRIBE employees;
ALTER TABLE employees DROP BirthDate;
-- --------------------------------------------------------------------------------------
--  Step 3: Drop the BirthDate column.
-- --------------------------------------------------------------------------------------
DESCRIBE employees;


-- --------------------------------------------------------------------------------------
-- A simple query of the employees and orders tables will be 
-- performed and the result will be exported to file. Review the file and
-- compare it to its corresponding table in the database before running the 
-- next sql script 003_add_more_columns.sql
-- --------------------------------------------------------------------------------------
SELECT 'Now check the data in the orders and employees tables...' AS ' ';

SELECT * FROM orders INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step002_orders_table.txt';
SELECT 'Output file new_orders_table.txt created.' AS ' ';


SELECT * FROM employees INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step002_employees_table.txt';
SELECT 'Output file new_employees_table.txt created.' AS ' ';

SELECT 'Output files created. Now, check the data in the tables (orders and employees) and compare it to the output files. Once the data has been verified, run the SQL script 003_add_more_columns.sql' AS ' ';

