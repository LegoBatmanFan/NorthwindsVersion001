
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
-- 001_create_database.sql creates the initial 8 tables with a set of data 
-- files.
-- --------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------
-- If the northwinds_test database exists, get rid of it. Create the database.
-- Now use it.
-- --------------------------------------------------------------------------------------
*/
DROP DATABASE IF EXISTS northwinds_test;
CREATE DATABASE northwinds_test;
USE northwinds_test;


-- --------------------------------------------------------------------------------------
-- Drop the "shippers" table if it exists. Create the "shippers" table and 
-- then insert data into the "shippers" table from the file
-- TABLEDATA_shippers.txt
-- --------------------------------------------------------------------------------------
SELECT 'Drop the shippers table if it exists; then create the shippers table.' AS ' ';
DROP TABLE IF EXISTS shippers;

CREATE TABLE shippers (
    ShipperID INT NOT NULL,
    ShipperName VARCHAR(50) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (ShipperID)
);

SELECT 'Inserting data into the shippers table...' AS ' ';
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_shippers.txt' 
INTO TABLE shippers 
IGNORE 1 ROWS;


-- --------------------------------------------------------------------------------------
-- Drop the "orders" table if it exists. Create the "orders" table and 
-- then insert data into the "orders" table from the file
-- TABLEDATA_order_details.txt
-- --------------------------------------------------------------------------------------
SELECT 'Drop the orders table if it exists; then create the orders table.' AS ' ';
DROP TABLE IF EXISTS order_details;

CREATE TABLE order_details(
    OrderDetailID INT NOT NULL,
    OrderID  INT NOT NULL,
    ProductID  INT NOT NULL,
	Quantity  INT NOT NULL,
    PRIMARY KEY (OrderDetailID)
);

SELECT 'Inserting data into the order_details' AS ' ';
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_order_details.txt' 
INTO TABLE order_details 
IGNORE 1 ROWS;



-- --------------------------------------------------------------------------------------
-- Drop the "categories" table if it exists. Create the "categories" table and 
-- then insert data into the "categories" table from the file
-- TABLEDATA_categories.txt
-- --------------------------------------------------------------------------------------
SELECT 'Drop the categories table if it exists; then create the categories table.' AS ' ';
DROP TABLE IF EXISTS categories;

CREATE TABLE categories(
    CategoryID INT NOT NULL,
    CategoryName  VARCHAR(20) NOT NULL,
    Description  VARCHAR(100) NOT NULL,
    PRIMARY KEY (CategoryID)
);

SELECT 'Inserting data into the categories table...' AS ' ';
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_categories.txt' 
INTO TABLE categories 
IGNORE 1 ROWS;



-- --------------------------------------------------------------------------------------
-- Drop the "customers" table if it exists. Create the "customers" table and 
-- then insert data into the "customers" table from the file
-- TABLEDATA_customers.txt
-- --------------------------------------------------------------------------------------
SELECT 'Drop the customers table if it exists; then create the customers table.' AS ' ';
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
    CustomerID INT NOT NULL,
    CustomerName  VARCHAR(50) NOT NULL,
    ContactName  VARCHAR(50) NOT NULL,
	Address VARCHAR(200) NOT NULL,
	City VARCHAR(50) NOT NULL,
	PostalCode VARCHAR(10) NOT NULL,
	Country VARCHAR(30) NOT NULL,
    PRIMARY KEY (CustomerID)
);

SELECT 'Inserting data into the customers table...' AS ' ';
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_customers.txt' 
INTO TABLE customers 
IGNORE 1 ROWS;



-- --------------------------------------------------------------------------------------
-- Drop the "products" table if it exists. Create the "products" table and 
-- then insert data into the "products" table from the file
-- TABLEDATA_products.txt
-- --------------------------------------------------------------------------------------
SELECT 'Drop the products table if it exists; then create the products table.' AS ' ';
DROP TABLE IF EXISTS products;

CREATE TABLE products(
    ProductID INT NOT NULL,
    ProductName  VARCHAR(50) NOT NULL,
    SupplierID  INT NOT NULL,
	CategoryID INT NOT NULL,
	Unit VARCHAR(50) NOT NULL,
	Price DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (ProductID)
);

SELECT 'Inserting data into the products table...' AS ' ';
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_products.txt' 
INTO TABLE products 
IGNORE 1 ROWS;



-- --------------------------------------------------------------------------------------
-- Drop the "employees" table if it exists. Create the "employees" table and 
-- then insert data into the "employees" table from the file
-- TABLEDATA_employees.txt
-- --------------------------------------------------------------------------------------
SELECT 'Drop the employees table if it exists; then create the employees table.' AS ' ';
DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
    EmployeeID INT NOT NULL,
    LastName  VARCHAR(50) NOT NULL,
    FirstName  VARCHAR(50) NOT NULL,
	BirthDate VARCHAR(20) NOT NULL,
	Photo VARCHAR(20) NOT NULL,
	Notes VARCHAR(600) NOT NULL,
    PRIMARY KEY (EmployeeID)
);

SELECT 'Inserting data into the employees table...' AS ' ';
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_employees.txt' 
IGNORE INTO TABLE employees 
IGNORE 1 ROWS;



-- --------------------------------------------------------------------------------------
-- Drop the "orders" table if it exists. Create the "orders" table and 
-- then insert data into the "orders" table from the file
-- TABLEDATA_orders.txt
-- --------------------------------------------------------------------------------------
SELECT 'Drop the orders table if it exists; then create the orders table.' AS ' ';
DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
    OrderID INT NOT NULL,
    CustomerID  INT NOT NULL,
    EmployeeID  INT NOT NULL,
	OrderDate VARCHAR(20) NOT NULL,
	ShipperID INT NOT NULL,
    PRIMARY KEY (OrderID)
);

SELECT 'Inserting data into the orders table..' AS ' ';

LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_orders.txt' 
INTO TABLE orders 
IGNORE 1 ROWS;
 

 
 -- --------------------------------------------------------------------------------------
-- Drop the "suppliers" table if it exists. Create the "suppliers" table and 
-- then insert data into the "suppliers" table from the file
-- TABLEDATA_suppliers.txt
-- --------------------------------------------------------------------------------------
SELECT 'Drop the suppliers table if it exists; then create the suppliers table.' AS ' ';
DROP TABLE IF EXISTS suppliers;

CREATE TABLE suppliers(
    SupplierID	INT NOT NULL,
	SupplierName VARCHAR(50) NOT NULL,
	ContactName	VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	PostalCode VARCHAR(20) NOT NULL,
	Country VARCHAR(50) NOT NULL,	
	Phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (SupplierID)
);

SELECT 'Inserting data into the suppliers table...' AS ' ';
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_suppliers.txt' 
INTO TABLE suppliers
IGNORE 1 ROWS;



-- --------------------------------------------------------------------------------------
-- Now, the database has been created. A simple query of each table will be 
-- performed and the result will be exported to file. Review the file and
-- compare it to its corresponding table in the database before running the 
-- next sql script 002_convert_dates.sql
-- --------------------------------------------------------------------------------------
SELECT 'Database created. Now a imple SELECT query will be performed and the result of the query will be saved to an output file' AS ' ';

SELECT * FROM shippers INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step001_shippers.txt';
SELECT 'Output file step001_shippers.txt created.' AS ' ';

SELECT * FROM order_details INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step001_order_details.txt';
SELECT 'Output file step001_order_details.txt created.' AS ' ';

SELECT * FROM categories INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step001_categories.txt';
SELECT 'Output file step001_categories.txt created.' AS ' ';

SELECT * FROM customers INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step001_customers.txt';
SELECT 'Output file step001_customers.txt created.' AS ' ';

SELECT * FROM products INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step001_products.txt';
SELECT 'Output file step001_products.txt table created.' AS ' ';

SELECT * FROM employees INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step001_employees.txt';
SELECT 'Output file step001_employees.txt created.' AS ' ';

SELECT * FROM orders INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step001_orders.txt';
SELECT 'Output file step001_orders.txt created.' AS ' ';

SELECT * FROM suppliers INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step001_suppliers.txt';
SELECT 'Output file step001_suppliers.txt created.' AS ' ';

SELECT 'Output files created. Now, check the data in each table and compare it to the output files. Once the data has been verified, run the SQL script 002_convert_dates.sql' AS ' ';