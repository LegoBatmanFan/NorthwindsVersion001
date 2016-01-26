# LegoBatmanFan	Version of the Northwinds Database
My attempt to recreate the Northwinds database...from scratch!!!! 
___

* [Purpose of this project](#purpose-of-this-project)
* [Data](#data)
* [Database creation](#database-creation)
* [Caveats](#caveats)
___ 
 
#### Purpose of this project
To learn/understand SQL by creating a version of the Northwinds database.


[back to top](#legobatmanfan-version-of-the-northwinds-database)
___

#### Data
The data used for creating the database comes from [w3 schools](http://www.w3schools.com/sql/) and the [CodePlex Northwinds database download](https://northwinddatabase.codeplex.com/releases/view/71634) page.
Oh yeah, some of this came out of my head - like the extra employees.


The Northwinds MS Access database contains data for the fictional company Northwind Traders. Northwind Traders ships food products. This database is shipped with Microsoft Office. 

 
More information about the Northwinds database can be found at:
* [Microsoft's Northwind Sample Database page](https://technet.microsoft.com/en-us/library/aa276825%28v=sql.80%29.aspx)
* [CodePlex Northwinds database download page](https://northwinddatabase.codeplex.com/releases/view/71634)
* [The github repo for a MySQL version of the Microsoft Access 2010 Northwind sample database](https://github.com/dalers/mywind) 

 
A modified version of this database can be found at: [w3 schools](http://www.w3schools.com/sql/).


[back to top](#legobatmanfan-version-of-the-northwinds-database)
___

#### Database creation
##### The following set of files attempt to build the Northwinds database using MySQL . 
##### 001_create_database.sql: Database tables are created and files are imported.
* TABLEDATA_categories.txt ==> categories table
* TABLEDATA_customers.txt ==> customers table
* TABLEDATA_employees.txt ==> employees table
* TABLEDATA_order_details.txt ==> orders_details table
* TABLEDATA_orders.txt ==> orders table
* TABLEDATA_products.txt ==> products table
* TABLEDATA_shippers.txt ==> shippers table
* TABLEDATA_suppliers.txt ==> suppliers table


##### 002_convert_dates.sql: This file converts strings into dates in the employees and orders tables.
* employees ==> A new column called "new_column" is added. "OrderDate" is converted from VARCHAR to DATE and the value is added to new_column. "OrderDate" is dropped form the table. "new_column" is renamed "OrderDate."
* orders ==> A new column called "DateOfBirth" is added. "BirthDate" is converted from VARCHAR to DATE and the value is added to "DateOfBirth." "BirthDate" is dropped from the table.


##### 003_add_more_columns.sql: This file changes column names and adds columns to tables.
###### customers table: The column "CustomerPhone" is added. The following column name changes are made:
* Address ==> CustomerAddress
* City ==> CustomerCity 
* PostalCode ==> CustomerPostalCode 
* Country ==> CustomerCountry


###### shippers table: The column name Phone is changed to ShipperPhone. 
The columns ShipperAddress, ShipperCity, ShipperPostalCode, and ShipperCountry are added.


###### employees: The columns EmployeeAddress, EmployeeCity, EmployeePostalCode, EmployeeCountry, and EmployeePhone are added.


###### suppliers: The following changes are made to the column names:
* Address ==> SupplierAddress  
* City ==> SupplierCity  
* PostalCode ==> SupplierPostalCode  
* Country ==> SupplierCountry  
* Phone ==> SupplierPhone  


##### 004_update_tables.sql: This file adds data to the order_details, orders, customers, employees, and shippers tables using procedures.
* TABLEDATA_add_more_order_details.txt  ==> order_details table
* TABLEDATA_add_more_orders.txt ==> orders table
* TABLEDATA_add_customer_numbers.txt ==> customers table
* TABLEDATA_update_shippers.txt ==> shippers table


###### The procedures a/w the employees tables are different
* TABLEDATA_update_employees.txt ==> adds addresses and phone numbers for the employees in the employees table.
* TABLEDATA_add_more_employees.txt ==> adds more employees to the employees table.


[back to top](#legobatmanfan-version-of-the-northwinds-database)
___

#### Caveats
1. For step 1, the notes for employees 1 - 4 and 7 are not imported in the employees table. 
2. Country calling codes  were created with the website [Country Calling Codes](http://www.countrycallingcodes.com). This data was used for the customer phone numbers.
3. In some cases, the city was not listed on the website [Country Calling Codes]( http://www.countrycallingcodes.com), so the data for a different city was used. The table below lists this information.

|Missing City                   | Country              |Substitute City Used       |
|-----------------------------|---------------------|----------------------------|
|Tsawassen                    |Canada                |Terrace                        |
|Versailles                      |France                 |Cannes                        |
|Aachen                         |Germany              |Achim                          |
|Brandenburg                 |Germany              |Bremen                       |
|Cunewalde                    |Germany              |Cologne                      |
|Köln                             |Germany              | Kiel                            |
|München                       |Germany              |Munich                         |
|Reggio Emilia                |Italy                     |Reggio Calabria            |
|Walla                            |Poland                  |Bydgoszcz                   |
|Bräcke                          |Sweeden              |Bramma                      |
|Luleå                             |Sweeden              |Lund							  |
|Cowes                          |UK                       |Corwen                        |
|I. de Margarita               |Venezuela            |Maiquetía                     |


[back to top](#legobatmanfan-version-of-the-northwinds-database)
