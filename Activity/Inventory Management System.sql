CREATE DATABASE InventoryDB;
USE InventoryDB;

-- Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactNumber VARCHAR(15),
    City VARCHAR(50)
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);

-- SupplyOrders Table
CREATE TABLE SupplyOrders (
    OrderID INT PRIMARY KEY,
    SupplierID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    Status varchar(20),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Suppliers
INSERT INTO Suppliers VALUES
(1, 'Reliance Wholesale', '9876543210', 'Mumbai'),
(2, 'Tata Distributors', '9123456780', 'Delhi'),
(3, 'Aditya Birla Supply Co.', '9988776655', 'Bengaluru');

-- Products
INSERT INTO Products VALUES
(101, 'LED Bulb', 'Electronics', 120.00),
(102, 'Ceiling Fan', 'Electronics', 1450.00),
(103, 'Rice Bag 25kg', 'Groceries', 950.00),
(104, 'Notebook Pack', 'Stationery', 250.00);

-- Supply Orders
INSERT INTO SupplyOrders VALUES
(1001, 1, 101, 500, '2025-10-01', 'Delivered'),
(1002, 1, 103, 200, '2025-10-05', 'Pending'),
(1003, 2, 102, 150, '2025-10-10', 'Delivered'),
(1004, 3, 104, 300, '2025-10-12', 'Cancelled');


-- total quantity supplied per supplier
SELECT 
    S.SupplierName,
    SUM(SO.Quantity) AS TotalQuantitySupplied
FROM 
    SupplyOrders SO
JOIN 
    Suppliers S ON SO.SupplierID = S.SupplierID
GROUP BY 
    S.SupplierName;
    
/*'Reliance Wholesale', '700'
'Tata Distributors', '150'
'Aditya Birla Supply Co.', '300'
*/

-- use aggrigate and daye functions
-- to finde out how many days required order to be diliver
/*SELECT
    o.OrderID,
    s.Name AS SupplierName,
    DATEDIFF(o.DeliveryDate, o.OrderDate) AS DaysToDeliver
FROM SupplyOrders o
JOIN Suppliers s ON o.SupplierID = s.SupplierID;*/

-- monthly supply summary
SELECT 
    S.SupplierName,
    MONTH(SO.OrderDate) AS Month,
    YEAR(SO.OrderDate) AS Year,
    SUM(SO.Quantity) AS MonthlyQuantity
FROM 
    SupplyOrders SO
JOIN 
    Suppliers S ON SO.SupplierID = S.SupplierID
GROUP BY 
    S.SupplierName, YEAR(SO.OrderDate), MONTH(SO.OrderDate);
/*'Reliance Wholesale', '10', '2025', '700'
'Tata Distributors', '10', '2025', '150'
'Aditya Birla Supply Co.', '10', '2025', '300'
*/

-- orders with status pending
SELECT 
    OrderID, SupplierID, ProductID, Quantity, OrderDate
FROM 
    SupplyOrders
WHERE 
    Status = 'Pending';
/*'1002', '1', '103', '200', '2025-10-05'
*/

-- procedure inserting
DELIMITER //

CREATE PROCEDURE InsertSupplyOrder (
    IN p_OrderID INT,
    IN p_SupplierID INT,
    IN p_ProductID INT,
    IN p_Quantity INT,
    IN p_OrderDate DATE,
    IN p_Status VARCHAR(20)
)
BEGIN
    INSERT INTO SupplyOrders (OrderID, SupplierID, ProductID, Quantity, OrderDate, Status)
    VALUES (p_OrderID, p_SupplierID, p_ProductID, p_Quantity, p_OrderDate, p_Status);
END //

DELIMITER ;


-- procedure to update status

DELIMITER //

CREATE PROCEDURE UpdateOrderStatus (
    IN p_OrderID INT,
    IN p_NewStatus VARCHAR(20)
)
BEGIN
    UPDATE SupplyOrders
    SET Status = p_NewStatus
    WHERE OrderID = p_OrderID;
END //

DELIMITER ;

CALL InsertSupplyOrder(1005, 2, 101, 400, '2025-10-20', 'Pending');


CALL UpdateOrderStatus(1002, 'Delivered');

select * from SupplyOrders;

/*'1001', '1', '101', '500', '2025-10-01', 'Delivered'
'1002', '1', '103', '200', '2025-10-05', 'Delivered'
'1003', '2', '102', '150', '2025-10-10', 'Delivered'
'1004', '3', '104', '300', '2025-10-12', 'Cancelled'
'1005', '2', '101', '400', '2025-10-20', 'Pending'
*/

