-- SQL ASSIGNMENT - 1 --

-- Creating a database --
CREATE DATABASE E_Commerce;

USE E_Commerce;

-- Creating Table Customers --
CREATE TABLE Customers(CustomerID INT PRIMARY KEY,
     Name VARCHAR(100),
     Email VARCHAR(254),
     Phone VARCHAR(15),
     City  VARCHAR(100)
      );

-- Description of table ---
DESC Customers;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| CustomerID | int          | NO   | PRI | NULL    |       |
| Name       | varchar(100) | YES  |     | NULL    |       |
| Email      | varchar(254) | YES  |     | NULL    |       |
| Phone      | varchar(15)  | YES  |     | NULL    |       |
| City       | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+

-- Creating Table Products --
CREATE TABLE Products(ProductID INT PRIMARY KEY,
    ProductName TEXT,
    Description TEXT,
    Price DECIMAL(10,2),
    IsReturnable VARCHAR(10)
     );

DESC Products;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| ProductID    | int           | NO   | PRI | NULL    |       |
| ProductName  | text          | YES  |     | NULL    |       |
| Description  | text          | YES  |     | NULL    |       |
| Price        | decimal(10,2) | YES  |     | NULL    |       |
| IsReturnable | varchar(10)   | YES  |     | NULL    |       |
+--------------+---------------+------+-----+---------+-------+

-- Creating Table Orders --
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(30),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        );

DESC Orders;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| OrderID     | int           | NO   | PRI | NULL    |       |
| CustomerID  | int           | YES  | MUL | NULL    |       |
| ProductID   | int           | YES  | MUL | NULL    |       |
| OrderDate   | date          | YES  |     | NULL    |       |
| Quantity    | int           | YES  |     | NULL    |       |
| TotalAmount | decimal(10,2) | YES  |     | NULL    |       |
| Status      | varchar(30)   | YES  |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+


-- Inserting Data into  Customer Table --
INSERT INTO Customers (CustomerID, Name, Email,Phone,City) VALUES
    (1,'Sandhya', 'sandhyajaiswal.203@gmail.com','1234567890','Indore'),
    (2,'Rashmi','rashmikan22@gmail.com','3456712890','Ujjain'),
    (3,'Param','Paramjeet203@gmail.com','1256780954','Batala');


SELECT * FROM Customers;
+------------+---------+------------------------------+------------+--------+
| CustomerID | Name    | Email                        | Phone      | City   |
+------------+---------+------------------------------+------------+--------+
|          1 | Sandhya | sandhyajaiswal.203@gmail.com | 1234567890 | Indore |
|          2 | Rashmi  | rashmikan22@gmail.com        | 3456712890 | Ujjain |
|          3 | Param   | Paramjeet203@gmail.com       | 1256780954 | Batala |
+------------+---------+------------------------------+------------+--------+

-- Inserting Data into Product Table --
INSERT INTO Products (ProductID,ProductName,Description,Price,IsReturnable) VALUES
    (1,'Laptop','High performance laptop',3200.00,'YES'),
    (2,'Smartphone','latest Model',1800.00,'YES'),
    (3,'Smartwatch','Coolest smartwatch',1200.00,'NO'),
    (4,'Headphones','Noise-cancelling',700.00,'YES');


 SELECT * FROM Products;
+-----------+-------------+-------------------------+---------+--------------+
| ProductID | ProductName | Description             | Price   | IsReturnable |
+-----------+-------------+-------------------------+---------+--------------+
|         1 | Laptop      | High performance laptop | 3200.00 | YES          |
|         2 | Smartphone  | Latest Model             | 1800.00 | YES          |
|         3 | Smartwatch  | Coolest smartwatch      | 1200.00 | NO           |
|         4 | Headphones  | Noise-cancelling        |  700.00 | YES          |
+-----------+-------------+-------------------------+---------+--------------+

-- Inserting Data into  Orders Table --
INSERT INTO Orders (OrderID,CustomerID,ProductID,OrderDate,Quantity,TotalAmount,Status) VALUES
    (1,1,1,'2024-11-01',1,1200.00,'Delivered'),
    (2,1,2,'2024-11-10',2,400.00,'Pending'),
    (3,2,3,'2024-11-15',1,800.00,'Shipped'),
    (4,3,4,'2024-11-20',1,100.00,'Cancelled');

SELECT * FROM Orders;
+---------+------------+-----------+------------+----------+-------------+-----------+
| OrderID | CustomerID | ProductID | OrderDate  | Quantity | TotalAmount | Status    |
+---------+------------+-----------+------------+----------+-------------+-----------+
|       1 |          1 |         1 | 2024-11-01 |        1 |     1200.00 | Delivered |
|       2 |          1 |         2 | 2024-11-10 |        2 |      400.00 | Pending   |
|       3 |          2 |         3 | 2024-11-15 |        1 |      800.00 | Shipped   |
|       4 |          3 |         4 | 2024-11-20 |        1 |      100.00 | Cancelled |
+---------+------------+-----------+------------+----------+-------------+-----------+

--- Performing Queries ---

--- Checking Status of My Order ---

 SELECT Status FROM Orders WHERE OrderID = 3;
+---------+
| Status  |
+---------+
| Shipped |
+---------+


---  Finding Total Amount of My Order  ---

SELECT SUM(TotalAmount) AS TotalAmount FROM Orders WHERE CustomerID = 1;
+-------------+
| TotalAmount |
+-------------+
|     1600.00 |
+-------------+

--- Updating City ---

UPDATE Customers SET City = 'Indore' WHERE CustomerID = 2;

SELECT * FROM Customers;
+------------+---------+------------------------------+------------+--------+
| CustomerID | Name    | Email                        | Phone      | City   |
+------------+---------+------------------------------+------------+--------+
|          1 | Sandhya | sandhyajaiswal.203@gmail.com | 1234567890 | Indore |
|          2 | Rashmi  | rashmikan22@gmail.com        | 3456712890 | Indore |
|          3 | Param   | Paramjeet203@gmail.com       | 1256780954 | Batala |
+------------+---------+------------------------------+------------+--------+

--- Changing Product Description ---

UPDATE Products SET Description = 'Newly Model' WHERE ProductID = 2;

SELECT * FROM Products;
+-----------+-------------+-------------------------+---------+--------------+
| ProductID | ProductName | Description             | Price   | IsReturnable |
+-----------+-------------+-------------------------+---------+--------------+
|         1 | Laptop      | High performance laptop | 3200.00 | YES          |
|         2 | Smartphone  | Newly Model             | 1800.00 | YES          |
|         3 | Smartwatch  | Coolest smartwatch      | 1200.00 | NO           |
|         4 | Headphones  | Noise-cancelling        |  700.00 | YES          |
+-----------+-------------+-------------------------+---------+--------------+

--- Display returnable products ---

SELECT ProductID,ProductName,Description FROM Products WHERE IsReturnable = 'Yes';

+-----------+-------------+-------------------------+
| ProductID | ProductName | Description             |
+-----------+-------------+-------------------------+
|         1 | Laptop      | High performance laptop |
|         2 | Smartphone  | Newly Model             |
|         4 | Headphones  | Noise-cancelling        |
+-----------+-------------+-------------------------+



