/*

    INNER JOIN: Returns all rows when there is at least one match in BOTH tables
    LEFT JOIN: Return all rows from the left table, and the matched rows from the right table
    RIGHT JOIN: Return all rows from the right table, and the matched rows from the left table
    FULL JOIN: Return all rows when there is a match in ONE of the tables

*/

SELECT orders.OrderID, customers.CustomerName, orders.OrderDate FROM orders 
	INNER JOIN customers ON orders.CustomerID=customers.CustomerID INTO OUTFILE 
	'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/INNER_JOIN_table.txt';
	
SELECT orders.OrderID, employees.FirstName FROM orders
	RIGHT JOIN employees ON orders.EmployeeID=employees.EmployeeID ORDER BY orders.OrderID INTO OUTFILE
	'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/RIGHT_JOIN_table.txt';
	
SELECT customers.CustomerName, orders.OrderID FROM customers FULL OUTER JOIN orders
	ON customers.CustomerID=orders.CustomerID ORDER BY customers.CustomerName
	'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/OUTER_JOIN_table.txt';
	
SELECT City FROM customers UNION SELECT City FROM suppliers ORDER BY City INTO OUTFILE 
	'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/UNION_table.txt';

SELECT City FROM customers UNION ALL SELECT City FROM suppliers ORDER BY City INTO OUTFILE
	'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/UNION_ALL_table.txt';
	
SELECT City, Country FROM customers WHERE Country='Germany' UNION ALL SELECT City, Country FROM Suppliers
WHERE Country='Germany' ORDER BY City INTO OUTFILE
	'C:/Users/Lena Horsley/Documents/SQL_Practice/my_northwind/tables/UNION_ALL_WHERE_table.txt';
	
SELECT Shippers.ShipperName,COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers
ON Orders.ShipperID=Shippers.ShipperID
GROUP BY ShipperName; 


SELECT Shippers.ShipperName, Employees.LastName,
COUNT(Orders.OrderID) AS NumberOfOrders
FROM ((Orders
INNER JOIN Shippers
ON Orders.ShipperID=Shippers.ShipperID)
INNER JOIN Employees
ON Orders.EmployeeID=Employees.EmployeeID)
GROUP BY ShipperName,LastName; 


SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders FROM (Orders
INNER JOIN Employees
ON Orders.EmployeeID=Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10; 



SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID=Employees.EmployeeID
WHERE LastName='Davolio' OR LastName='Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25; 