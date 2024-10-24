---NORMALIZATION---

-- create E_Website database
CREATE DATABASE E_website;

-- USE E_Webite DATABASE
USE E_Website;

--create table FirstNormalForm
CREATE TABLE FirstNormalForm (
    OrderID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ProductName VARCHAR(100),
    ProductDescription VARCHAR(250),
    ProductReturnable VARCHAR(10),
    SellerName VARCHAR(100),
    Total DECIMAL(10, 2),
    OrderDate DATE,
    OrderStatus VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(10)
);


--Inserting data into FirstNormalForm Table
INSERT INTO FirstNormalForm (
    OrderID, FirstName, LastName, ProductName, ProductDescription, 
    ProductReturnable, SellerName, Total, OrderDate, OrderStatus, City, State, Pincode
)
VALUES 
('O1', 'Ram', 'Sharma', 'Laptop', 'Dell Laptop', 'No', 'Seller A', 52000, '2024-10-10', 'Approved', 'Indore', 'MP', '452001'),
('O2', 'Ram', 'Sharma', 'Air buds', 'Buds', 'Yes', 'Boat', 25000, '2024-10-10', 'Approved', 'Indore', 'MP', '452001'),
('O3', 'Param', 'Singh', 'Laptop', 'Dell Laptop', 'No', 'Seller A', 52000, '2024-10-15', 'Delivered', 'Pune', 'Maharashtra', '410014');


--TABLE IN FIRST NORMAL FORM--
SELECT * FROM FirstNormalForm;
+---------+-----------+----------+-------------+--------------------+-------------------+------------+----------+------------+-------------+--------+-------------+---------+
| OrderID | FirstName | LastName | ProductName | ProductDescription | ProductReturnable | SellerName | Total    | OrderDate  | OrderStatus | City   | State       | Pincode |
+---------+-----------+----------+-------------+--------------------+-------------------+------------+----------+------------+-------------+--------+-------------+---------+
| O1      | Ram       | Sharma   | Laptop      | Dell Laptop        | No                | Seller A   | 52000.00 | 2024-10-10 | Approved    | Indore | MP          | 452001  |
| O2      | Ram       | Sharma   | Air buds    | Buds               | Yes               | Boat       | 25000.00 | 2024-10-10 | Approved    | Indore | MP          | 452001  |
| O3      | Param     | Singh    | Laptop      | Dell Laptop        | No                | Seller A   | 52000.00 | 2024-10-15 | Delivered   | Pune   | Maharashtra | 410014  |
+---------+-----------+----------+-------------+--------------------+-------------------+------------+----------+------------+-------------+--------+-------------+---------+



---Converting 1NF to 2NF ---

--create table Customers 
CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Inserting data into Customer Table
INSERT INTO Customers (CustomerID, FirstName, LastName)
VALUES
('C1', 'Ram', 'Sharma'),
('C2', 'Param', 'Singh');


--create table Orders 
CREATE TABLE Orders (
    OrderID VARCHAR(10) PRIMARY KEY,
    CustomerID VARCHAR(10),
    Total DECIMAL(10, 2),
    OrderDate DATE,
    OrderStatus VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--Inserting data into Orders Table
INSERT INTO Orders (OrderID, CustomerID, Total, OrderDate, OrderStatus)
VALUES 
('O1', 'C1', 52000, '2024-10-10', 'Approved'),
('O2', 'C1', 25000, '2024-10-10', 'Approved'),
('O3', 'C2', 52000, '2024-10-15', 'Delivered');


--create table Products 
CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductDescription VARCHAR(250),
    ProductReturnable VARCHAR(10)
);


-- Inserting data into Products Table
INSERT INTO Products (ProductID, ProductName, ProductDescription, ProductReturnable)
VALUES
('P1', 'Laptop', 'Dell Laptop', 'No'),
('P2', 'Air buds', 'buds', 'Yes');


--create table SellerTable 
CREATE TABLE SellerTable (
    SellerID VARCHAR(10) PRIMARY KEY,
    SellerName VARCHAR(100)
);

--Inserting into SellerTable
INSERT INTO SellerTable (SellerID, SellerName)
VALUES
('S1', 'Seller A'),
('S2', 'Boat');


--create table Order_Product_Customer
CREATE TABLE Order_P_C_Table (
    OrderID VARCHAR(10),
    ProductID VARCHAR(10),
    CustomerID VARCHAR(10),
    SellerID VARCHAR(10),
    PRIMARY KEY (OrderID, ProductID, CustomerID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SellerID) REFERENCES SellerTable(SellerID)
);

--Inserting into Order_P_C_Table
INSERT INTO Order_P_C_Table (OrderID, ProductID, CustomerID, SellerID)
VALUES
('O1', 'P1', 'C1', 'S1'),
('O2', 'P2', 'C1', 'S2'),
('O3', 'P1', 'C2', 'S1');

-- TABLES IN FIRST TO SECOND --
SELECT * FROM Customers;
+------------+-----------+----------+
| CustomerID | FirstName | LastName |
+------------+-----------+----------+
| C1         | Ram       | Sharma   |
| C2         | Param     | Singh    |
+------------+-----------+----------+

 SELECT * FROM Orders;
+---------+------------+----------+------------+-------------+
| OrderID | CustomerID | Total    | OrderDate  | OrderStatus |
+---------+------------+----------+------------+-------------+
| O1      | C1         | 52000.00 | 2024-10-10 | Approved    |
| O2      | C1         | 25000.00 | 2024-10-10 | Approved    |
| O3      | C2         | 52000.00 | 2024-10-15 | Delivered   |
+---------+------------+----------+------------+-------------+


 SELECT * FROM Products;
+-----------+-------------+--------------------+-------------------+
| ProductID | ProductName | ProductDescription | ProductReturnable |
+-----------+-------------+--------------------+-------------------+
| P1        | Laptop      | Dell Laptop        | No                |
| P2        | Air buds    | buds               | Yes               |
+-----------+-------------+--------------------+-------------------+

SELECT * FROM SellerTable;
+----------+------------+
| SellerID | SellerName |
+----------+------------+
| S1       | Seller A   |
| S2       | Boat       |
+----------+------------+

SELECT * FROM Order_P_C_Table;
+---------+-----------+------------+----------+
| OrderID | ProductID | CustomerID | SellerID |
+---------+-----------+------------+----------+
| O1      | P1        | C1         | S1       |
| O3      | P1        | C2         | S1       |
| O2      | P2        | C1         | S2       |
+---------+-----------+------------+----------+


-- Converting From 2NF TO 3NF --


--create table Orders
CREATE TABLE Orders_3 (
    OrderID VARCHAR(10) PRIMARY KEY,
    OrderDate DATE,
    Total DECIMAL(10, 2),
    OrderStatus VARCHAR(50)
);

--Inserting data into Orders
INSERT INTO Orders_3 (OrderID, Total, OrderDate, OrderStatus)
VALUES 
('O1',  52000, '2022-10-10', 'Approved'),
('O2',  25000, '2022-10-10', 'Approved'),
('O3',  52000, '2022-10-15', 'Delivered');

--create table AddressTable
CREATE TABLE AddressTable_3 (
    SellerID VARCHAR(10),
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(10),
    PRIMARY KEY (SellerID),
    FOREIGN KEY (SellerID) REFERENCES SellerTable(SellerID)
);

--Inserting into AddressTable
INSERT INTO AddressTable_3 (SellerID, City, State, Pincode)
VALUES
('S1', 'Indore', 'MP', '452001'),
('S2', 'Pune', 'Maharashtra', '410014');


-- TABLE FROM SECOND TO THIRD--

SELECT * FROM Orders_3;
+---------+------------+----------+-------------+
| OrderID | OrderDate  | Total    | OrderStatus |
+---------+------------+----------+-------------+
| O1      | 2022-10-10 | 52000.00 | Approved    |
| O2      | 2022-10-10 | 25000.00 | Approved    |
| O3      | 2022-10-15 | 52000.00 | Delivered   |
+---------+------------+----------+-------------+

SELECT * FROM AddressTable_3;
+----------+--------+-------------+---------+
| SellerID | City   | State       | Pincode |
+----------+--------+-------------+---------+
| S1       | Indore | MP          | 452001  |
| S2       | Pune   | Maharashtra | 410014  |
+----------+--------+-------------+---------+



