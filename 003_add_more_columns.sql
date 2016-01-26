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
-- International phone numbers were generated with the following website:
-- http://www.countrycallingcodes.com/
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
-- 003_add_more_columns.sql changes column names and adds several 
-- columns. See the comments for each section below.
-- --------------------------------------------------------------------------------------

*/

-- --------------------------------------------------------------------------------------
-- Look at the structure of the customer tables before making changes.
--
-- Make the following modifications to the customers table:
-- change the name of the column Address to CustomerAddress
-- change the name of the column City to CustomerCity 
-- change the name of the column PostalCode to CustomerPostalCode 
-- change the name of the column Country to CustomerCountry
-- add the column CustomerPhone 
-- 
-- Look at the structure of the customers table after making changes.
-- --------------------------------------------------------------------------------------
SELECT 'Modify the Address, City, Postal code, and Country column headers in the customers table. Add a column for the customer phone number..' AS ' ';
DESCRIBE customers;
ALTER TABLE customers CHANGE Address CustomerAddress VARCHAR(200) NOT NULL;
ALTER TABLE customers CHANGE City CustomerCity VARCHAR(50) NOT NULL;
ALTER TABLE customers CHANGE PostalCode CustomerPostalCode VARCHAR(10) NOT NULL;
ALTER TABLE customers CHANGE Country CustomerCountry VARCHAR(50) NOT NULL;
ALTER TABLE customers ADD CustomerPhone VARCHAR(60) NOT NULL;
DESCRIBE customers;



-- --------------------------------------------------------------------------------------
-- Look at the structure of the shippers table before making changes.
--
-- Make the following modifications to the shippers table:
-- add the column ShipperAddress 
-- add the column ShipperCity
-- add the column ShipperPostalCode
-- add the column ShipperCountry
-- change the name of the column Phone to ShipperPhone
--
-- Look at the structure of the shippers table after making changes.
-- --------------------------------------------------------------------------------------
SELECT 'Modify the Address, City, Postal code, and Country column headers in the shippers table...' AS ' ';
DESCRIBE shippers;
ALTER TABLE shippers ADD ShipperAddress VARCHAR(200) NOT NULL;
ALTER TABLE shippers ADD ShipperCity VARCHAR(50) NOT NULL;
ALTER TABLE shippers ADD ShipperPostalCode VARCHAR(10) NOT NULL;
ALTER TABLE shippers ADD ShipperCountry VARCHAR(30) NOT NULL;
ALTER TABLE shippers CHANGE Phone ShipperPhone VARCHAR(20) NOT NULL;
DESCRIBE shippers;



-- --------------------------------------------------------------------------------------
-- Look at the structure of the employees table before making changes.
--
-- add the column EmployeeAddress
-- add the column EmployeeCity 
-- add the column EmployeePostalCode 
-- add the column ADD EmployeeCountry 
-- add the column ADD EmployeePhone 
--
-- Look at the structure of the employees table after making changes.
-- --------------------------------------------------------------------------------------
SELECT 'Modify the Address, City, Postal code, Country, Phone number column headers in the employees table...' AS ' ';
DESCRIBE employees;
ALTER TABLE employees ADD EmployeeAddress VARCHAR(200) NOT NULL;
ALTER TABLE employees ADD EmployeeCity VARCHAR(50) NOT NULL;
ALTER TABLE employees ADD EmployeePostalCode VARCHAR(10) NOT NULL;
ALTER TABLE employees ADD EmployeeCountry VARCHAR(30) NOT NULL;
ALTER TABLE employees ADD EmployeePhone VARCHAR(20) NOT NULL;
DESCRIBE employees;



-- --------------------------------------------------------------------------------------
-- Look at the structure of the suppliers table before making changes.
--
-- change the name of the column Address to SupplierAddress  
-- change the name of the column City to SupplierCity  
-- change the name of the column PostalCode to SupplierPostalCode  
-- change the name of the column Country to SupplierCountry  
-- change the name of the column Phone to SupplierPhone  
--
-- Look at the structure of the suppliers table after making changes.
-- --------------------------------------------------------------------------------------
SELECT 'Modify the Address, City, Postal code, Country, Phone number column headers in the suppliers table...' AS ' ';
DESCRIBE suppliers;
ALTER TABLE suppliers CHANGE Address SupplierAddress VARCHAR(200) NOT NULL;
ALTER TABLE suppliers CHANGE City SupplierCity VARCHAR(50) NOT NULL;
ALTER TABLE suppliers CHANGE PostalCode SupplierPostalCode VARCHAR(10) NOT NULL;
ALTER TABLE suppliers CHANGE Country SupplierCountry VARCHAR(30) NOT NULL;
ALTER TABLE suppliers CHANGE Phone SupplierPhone VARCHAR(20) NOT NULL;
DESCRIBE suppliers;



-- --------------------------------------------------------------------------------------
-- A simple query of the customers, shippers, employees, and suppliers 
-- tables will be performed and the result will be exported to file. Review 
-- the file and compare it to its corresponding table in the database before 
-- running the next sql script 00update_tables.sql
-- --------------------------------------------------------------------------------------
SELECT 'Now check the data in the customers, shippers, employees, and suppliers tables...' AS ' ';

SELECT * FROM customers INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step003_customers_table.txt';
SELECT 'Output file step003_customers_table.txt created.' AS ' ';

SELECT * FROM shippers INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step003_shippers_table.txt';
SELECT 'Output file step003_shippers_table.txt created.' AS ' ';

SELECT * FROM employees INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step003_employees_table.txt';
SELECT 'Output file step003_employees_table.txt created.' AS ' ';


SELECT * FROM suppliers INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step003_suppliers_table.txt';
SELECT 'Output file step003_suppliers_table.txt created.' AS ' ';

SELECT 'Output files created. Now, check the data in the tables (orders and employees) and compare it to the output files. Once the data has been verified, run the SQL script 004_update_tables.sql' AS ' ';





