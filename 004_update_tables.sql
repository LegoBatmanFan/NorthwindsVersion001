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
-- 004_update_tables.sql adds data to the order_details, orders, customers,
-- employees, and shippers tables.
-- --------------------------------------------------------------------------------------
*/



-- --------------------------------------------------------------------------------------
-- Inserting data into the order_details table.
-- --------------------------------------------------------------------------------------
SELECT 'Inserting data into the order_details table...' AS ' ';
DROP TABLE IF EXISTS tmptable_order_details;
-- --------------------------------------------------------------------------------------
-- Create the temporary table tmptable_order_details.
-- Insert data from TABLEDATA_add_more_order_details.txt into
-- tmptable_order_details.
-- --------------------------------------------------------------------------------------
CREATE TABLE tmptable_order_details(
    tmp_OrderDetailID INT NOT NULL,
    tmp_OrderID  INT NOT NULL,
    tmp_ProductID  INT NOT NULL,
	tmp_Quantity  INT NOT NULL,
    PRIMARY KEY (tmp_OrderDetailID)
);
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_add_more_order_details.txt' 
INTO TABLE tmptable_order_details 
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------
-- The procedure add_more_details  takes data from tmptable_order_details
-- and inserts it into order_details.
-- --------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS add_more_details;
DELIMITER //
CREATE PROCEDURE add_more_details()
BEGIN
	DECLARE counter INT;
	DECLARE total_order_details, total_tmptable_order_details INT;
	DECLARE new_OrderDetailID INT;
	
	SET total_tmptable_order_details = (SELECT COUNT(*) FROM tmptable_order_details);
	SET total_order_details = (SELECT COUNT(*) FROM order_details);
	SET counter = 1;
	
	WHILE counter <= total_tmptable_order_details DO
		SET new_OrderDetailID = (SELECT tmp_OrderDetailID FROM tmptable_order_details WHERE tmp_OrderDetailID = counter);
		SET new_OrderDetailID = new_OrderDetailID + total_order_details;
		INSERT INTO order_details VALUES (new_OrderDetailID,
															(SELECT tmp_OrderID FROM tmptable_order_details WHERE tmp_OrderDetailID = counter),
															(SELECT tmp_ProductID FROM tmptable_order_details WHERE tmp_OrderDetailID = counter),
															(SELECT tmp_Quantity FROM tmptable_order_details WHERE tmp_OrderDetailID = counter));
		SET counter = counter + 1;
	END WHILE;
END //
DELIMITER ;

-- --------------------------------------------------------------------------------------
-- Call the procedure add_more_details.
-- --------------------------------------------------------------------------------------
CALL add_more_details();

-- --------------------------------------------------------------------------------------
-- Drop/delete add_more_details and tmptable_order_details.
-- --------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS add_more_details;
DROP TABLE IF EXISTS tmptable_order_details;





-- --------------------------------------------------------------------------------------
-- Inserting data into the orders table.
-- --------------------------------------------------------------------------------------
SELECT 'Inserting data into the orders table...' AS ' ';
DROP TABLE IF EXISTS tmptable_orders;
-- --------------------------------------------------------------------------------------
-- Create the table tmptable_orders
-- Insert data from TABLEDATA_add_more_orders.txt into
-- tmptable_orders.
-- --------------------------------------------------------------------------------------
CREATE TABLE tmptable_orders(
    tmp_OrderID INT NOT NULL,
    tmp_CustomerID  INT NOT NULL,
    tmp_EmployeeID  INT NOT NULL,
	tmp_OrderDate VARCHAR(20) NOT NULL,
	tmp_ShipperID INT NOT NULL,
    PRIMARY KEY (tmp_OrderID)
);
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_add_more_orders.txt' 
INTO TABLE tmptable_orders
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------
-- Add a column named new_column
-- --------------------------------------------------------------------------------------
ALTER TABLE tmptable_orders ADD new_column DATE NOT NULL;
DESCRIBE tmptable_orders;
-- --------------------------------------------------------------------------------------
-- Copy the data from tmp_OrderDate to the new_column. While copying
-- the data, change the string to the type DATE
-- --------------------------------------------------------------------------------------
UPDATE tmptable_orders SET new_column = STR_TO_DATE(tmp_OrderDate,'%m/%d/%Y');
DESCRIBE tmptable_orders;
-- --------------------------------------------------------------------------------------
-- Drop the column tmp_OrderDate
-- --------------------------------------------------------------------------------------
ALTER TABLE tmptable_orders DROP tmp_OrderDate;
DESCRIBE tmptable_orders;
-- --------------------------------------------------------------------------------------
-- Change new_column to tmp_OrderDate
-- --------------------------------------------------------------------------------------
ALTER TABLE tmptable_orders CHANGE new_column tmp_OrderDate DATE;
DESCRIBE tmptable_orders;

-- --------------------------------------------------------------------------------------
-- Copy the data from tmptable_orders into orders. Drop tmptable_orders.
-- --------------------------------------------------------------------------------------
INSERT INTO orders SELECT * FROM tmptable_orders;
DROP TABLE IF EXISTS tmptable_orders;





-- --------------------------------------------------------------------------------------
-- Add information to the Phone number column in the customer table.
-- --------------------------------------------------------------------------------------
SELECT 'Add a Phone number for each customer in the customer table...' AS ' ';
DROP TABLE IF EXISTS tmptable_customer;
-- --------------------------------------------------------------------------------------
-- Create the table tmptable_customer.
-- Insert data from TABLEDATA_add_customer_numbers.txt into
-- tmptable_customer.
-- --------------------------------------------------------------------------------------
CREATE TABLE tmptable_customer(
    CustomerID INT NOT NULL,
    PhoneNum VARCHAR(50) NOT NULL,
    PRIMARY KEY (CustomerID)
);
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_add_customer_numbers.txt' 
INTO TABLE tmptable_customer
IGNORE 1 ROWS; 

-- --------------------------------------------------------------------------------------
-- The procedure add_phone_numbers takes data from tmptable_customer
-- and inserts it into customers.
-- --------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS add_phone_numbers;
DELIMITER //
CREATE PROCEDURE add_phone_numbers()
BEGIN 
	DECLARE counter001, total_numbers INT;
    SET counter001 = 1;
	SET total_numbers = (SELECT COUNT(*) FROM tmptable_customer);
	SET total_numbers = total_numbers + 1;
	
	WHILE counter001 < total_numbers DO
		UPDATE customers SET CustomerPhone = (SELECT PhoneNum FROM tmptable_customer WHERE CustomerID=counter001) WHERE CustomerID=counter001;
		SET counter001 = counter001 + 1;
	END WHILE;
END//
DELIMITER ;

-- --------------------------------------------------------------------------------------
-- Call add_phone_numbers.
-- --------------------------------------------------------------------------------------
CALL add_phone_numbers();

-- --------------------------------------------------------------------------------------
-- Drop add_phone_numbers and tmptable_customer.
-- --------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS add_phone_numbers;
DROP TABLE IF EXISTS tmptable_customer;





-- --------------------------------------------------------------------------------------
-- Add information to the employees table.
-- Insert data from TABLEDATA_update_employees.txt into
-- tmptable_employee_data.
-- --------------------------------------------------------------------------------------
SELECT 'Add information to the employees table...' AS ' ';
DROP TABLE IF EXISTS tmptable_employee_data;
CREATE TABLE tmptable_employee_data(
    t_EmployeeID INT NOT NULL,
    t_EmployeeAddress VARCHAR(200) NOT NULL,
	t_EmployeeCity VARCHAR(50) NOT NULL,
	t_EmployeePostalCode VARCHAR(10) NOT NULL,
	t_EmployeeCountry VARCHAR(30) NOT NULL,
	t_EmployeePhone VARCHAR(20) NOT NULL,
    PRIMARY KEY (t_EmployeeID)
);
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_update_employees.txt' 
INTO TABLE tmptable_employee_data
IGNORE 1 ROWS; 

-- --------------------------------------------------------------------------------------
-- The procedure add_employee_data takes data from 
-- tmptable_employee_data and inserts it into employees
-- --------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS add_employee_data;
DELIMITER //
CREATE PROCEDURE add_employee_data()
BEGIN 
	DECLARE counter002, total_rows INT;
    SET counter002 = 1;
	SET total_rows = (SELECT COUNT(*) FROM tmptable_employee_data);
	SET total_rows = total_rows + 1;
	
	WHILE counter002 < total_rows DO
		UPDATE employees SET 
							EmployeeAddress = (SELECT t_EmployeeAddress FROM tmptable_employee_data WHERE t_EmployeeID = counter002),
							EmployeeCity = (SELECT t_EmployeeCity FROM tmptable_employee_data WHERE t_EmployeeID = counter002),
							EmployeePostalCode = (SELECT t_EmployeePostalCode FROM tmptable_employee_data WHERE t_EmployeeID = counter002),
							EmployeeCountry= (SELECT t_EmployeeCountry FROM tmptable_employee_data WHERE t_EmployeeID = counter002),
							EmployeePhone= (SELECT t_EmployeePhone FROM tmptable_employee_data WHERE t_EmployeeID = counter002)
		 WHERE EmployeeID=counter002;
		SET counter002 = counter002 + 1;
	END WHILE;
END//
DELIMITER ;

-- --------------------------------------------------------------------------------------
-- Call the procedure add_employee_data
-- --------------------------------------------------------------------------------------
CALL add_employee_data();

-- --------------------------------------------------------------------------------------
-- Drop add_employee_data and tmptable_employee_data
-- --------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS add_employee_data;
DROP TABLE IF EXISTS tmptable_employee_data;

-- --------------------------------------------------------------------------------------
-- Now, add some more employees to the table
-- --------------------------------------------------------------------------------------
DROP TABLE IF EXISTS tmptable_more_employees;
CREATE TABLE tmptable_more_employees(
    tmp_ID INT NOT NULL,
	tmp_LastName  VARCHAR(50) NOT NULL,
    tmp_FirstName  VARCHAR(50) NOT NULL,
	tmp_Photo VARCHAR(20) NOT NULL,
	tmp_Notes VARCHAR(600) NOT NULL,
	tmp_BirthDate VARCHAR(20) NOT NULL,
    tmp_Address VARCHAR(200) NOT NULL,
	tmp_City VARCHAR(50) NOT NULL,
	tmp_PostalCode VARCHAR(10) NOT NULL,
	tmp_Country VARCHAR(30) NOT NULL,
	tmp_Phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (tmp_ID)
);
-- --------------------------------------------------------------------------------------
-- Now, insert data into the temporary to the table
-- --------------------------------------------------------------------------------------
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_add_more_employees.txt' 
IGNORE INTO TABLE tmptable_more_employees 
IGNORE 1 ROWS;
-- --------------------------------------------------------------------------------------
-- Change the column name
-- --------------------------------------------------------------------------------------
ALTER TABLE tmptable_more_employees ADD new_column DATE NOT NULL;
UPDATE tmptable_more_employees SET new_column = STR_TO_DATE(tmp_BirthDate,'%m/%d/%Y');
ALTER TABLE tmptable_more_employees DROP tmp_BirthDate;
ALTER TABLE tmptable_more_employees CHANGE new_column tmp_BirthDate DATE;
-- --------------------------------------------------------------------------------------
-- This is the procedure to insert data
-- --------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS add_more_employees;
DELIMITER //
CREATE PROCEDURE add_more_employees()
BEGIN 
	DECLARE counter003, total_rows, next_value INT;
    SET counter003 = 1;
	SET total_rows = (SELECT COUNT(*) FROM tmptable_more_employees);
	SET total_rows = total_rows + 1;
	
	WHILE counter003 < total_rows DO
		SET next_value = (SELECT COUNT(*) FROM tmptable_more_employees);
		SET next_value = counter003 + next_value;
		INSERT INTO employees VALUES
							((SELECT tmp_ID FROM tmptable_more_employees WHERE tmp_ID = next_value),
							(SELECT tmp_LastName FROM tmptable_more_employees WHERE tmp_ID = next_value),
							(SELECT tmp_FirstName FROM tmptable_more_employees WHERE tmp_ID = next_value),
							(SELECT tmp_Photo FROM tmptable_more_employees WHERE tmp_ID = next_value),
							(SELECT tmp_Notes FROM tmptable_more_employees WHERE tmp_ID = next_value),
							(SELECT tmp_BirthDate FROM tmptable_more_employees WHERE tmp_ID = next_value),
							(SELECT tmp_Address FROM tmptable_more_employees WHERE tmp_ID = next_value),
							(SELECT tmp_City FROM tmptable_more_employees WHERE tmp_ID = next_value),
							(SELECT tmp_PostalCode FROM tmptable_more_employees WHERE tmp_ID = next_value),
							(SELECT tmp_Country FROM tmptable_more_employees WHERE tmp_ID = next_value),
							(SELECT tmp_Phone FROM tmptable_more_employees WHERE tmp_ID = next_value));
		SET counter003 = counter003 + 1;
	END WHILE;
END//
DELIMITER ;

-- --------------------------------------------------------------------------------------
-- Call the procedure add_more_employees
-- --------------------------------------------------------------------------------------
CALL add_more_employees();

-- --------------------------------------------------------------------------------------
-- Drop add_more_employees and tmptable_more_employees
-- --------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS add_more_employees;
DROP TABLE IF EXISTS tmptable_more_employees;





-- --------------------------------------------------------------------------------------
-- Add information to the shippers table.
-- Insert data from TABLEDATA_update_shippers.txt into
-- tmptable_shippers_data.
-- --------------------------------------------------------------------------------------
SELECT 'Add information to the shippers table...' AS ' ';
DROP TABLE IF EXISTS tmptable_shippers_data;
CREATE TABLE tmptable_shippers_data(
    t_ShipperID INT NOT NULL,
    t_ShipperAddress VARCHAR(200) NOT NULL,
	t_ShipperCity VARCHAR(50) NOT NULL,
	t_ShipperPostalCode VARCHAR(10) NOT NULL,
	t_ShipperCountry VARCHAR(30) NOT NULL,
    PRIMARY KEY (t_ShipperID)
);
LOAD DATA INFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/TABLEDATA_update_shippers.txt' 
INTO TABLE tmptable_shippers_data
IGNORE 1 ROWS; 

-- --------------------------------------------------------------------------------------
-- The procedure  add_shippers_data takes data from tmptable_shippers_data
-- and inserts it into shippers
-- --------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS add_shippers_data;
DELIMITER //
CREATE PROCEDURE add_shippers_data()
BEGIN 
	DECLARE counter004, total_rows INT;
    SET counter004 = 1;
	SET total_rows = (SELECT COUNT(*) FROM tmptable_shippers_data);
	SET total_rows = total_rows + 1;
	
	WHILE counter004 < total_rows DO
		UPDATE shippers SET 
							ShipperAddress = (SELECT t_ShipperAddress FROM tmptable_shippers_data WHERE t_ShipperID = counter004),
							ShipperCity = (SELECT t_ShipperCity FROM tmptable_shippers_data WHERE t_ShipperID = counter004),
							ShipperPostalCode = (SELECT t_ShipperPostalCode FROM tmptable_shippers_data WHERE t_ShipperID = counter004),
							ShipperCountry= (SELECT t_ShipperCountry FROM tmptable_shippers_data WHERE t_ShipperID = counter004)
		 WHERE ShipperID=counter004;
		SET counter004 = counter004 + 1;
	END WHILE;
END//
DELIMITER ;

-- --------------------------------------------------------------------------------------
-- Call add_shippers_data
-- --------------------------------------------------------------------------------------
CALL add_shippers_data();

-- --------------------------------------------------------------------------------------
-- Drop add_shippers_data and tmptable_shippers_data
-- --------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS add_shippers_data;
DROP TABLE IF EXISTS tmptable_shippers_data;





-- --------------------------------------------------------------------------------------
-- A simple query of the customers, shippers, employees, order_details, 
-- and orders tables will be performed and the result will be exported to file. 
-- Review the file and compare it to its corresponding table in the database.
-- --------------------------------------------------------------------------------------
SELECT 'Now check the data in the customers, shippers, employees, order_details, and orders tables...' AS ' ';

SELECT * FROM customers INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step004_customers_table.txt';
SELECT 'Output file step004_customers_table.txt created.' AS ' ';

SELECT * FROM shippers INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step004_shippers_table.txt';
SELECT 'Output file step004_shippers_table.txt created.' AS ' ';

SELECT * FROM employees INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step004_employees_table.txt';
SELECT 'Output file step004_employees_table.txt created.' AS ' ';

SELECT * FROM order_details INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step004_order_details_table.txt';
SELECT 'Output file step004_order_details_table.txt created.' AS ' ';

SELECT * FROM orders INTO OUTFILE 'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/step004_orders_table.txt';
SELECT 'Output file step004_orders_table.txt created.' AS ' ';

SELECT 'Output files created. Now, check the data in the tables (orders and employees) and compare it to the output files. Once the data has been verified, run the SQL script 004_update_tables.sql' AS ' ';
