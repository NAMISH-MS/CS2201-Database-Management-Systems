-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: NAMISH M S
-- USN: 1RUA24BCA0056
-- SECTION: 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
/*'root@localhost', 'LAPTOP-BMPMMU9A', '8.0.42', '2025-09-08 11:30:14'
*/

CREATE DATABASE COMPANY;
USE COMPANY;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 

CREATE TABLE Employee(
	EmpID INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Salary Decimal (10, 2),
    BirthDate Date,
    HireDate Date
);

-- 2. Insert 10 records to employee;
INSERT INTO Employee VALUES (1001, 'Ragu', 'Kumar', 50000, '2000-05-20', '1985-02-02');
INSERT INTO Employee VALUES (1002, 'Priya', 'Sharma', 65000, '2005-08-15', '1990-07-22');
INSERT INTO Employee VALUES (1003, 'Amit', 'Singh', 72000, '2010-11-01', '1988-03-10');
INSERT INTO Employee VALUES (1004, 'Sunita', 'Patel', 58000, '2012-01-30', '1992-12-05');
INSERT INTO Employee VALUES (1005, 'Raj', 'Gupta', 90000, '2015-06-18', '1982-09-14');
INSERT INTO Employee VALUES (1006, 'Anjali', 'Verma', 48000, '2018-09-05', '1995-11-28');
INSERT INTO Employee VALUES (1007, 'Vikram', 'Reddy', 110000, '2019-02-11', '1986-01-19');
INSERT INTO Employee VALUES (1008, 'Kavita', 'Nair', 75000, '2021-07-29', '1997-04-16');
INSERT INTO Employee VALUES (1009, 'Suresh', 'Menon', 82000, '2022-04-14', '1991-10-30');
INSERT INTO Employee VALUES (1010, 'Deepa', 'Joshi', 62000, '2023-10-25', '1998-08-21');

-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
    OrderDate Date,
    TotalAmount Decimal(10, 2),
    EmpID INT,
    FOREIGN KEY (EmpID) References Employee(EmpID)
);


-- 4. Insert 10 records to Orders

INSERT INTO Orders VALUES (1, '2023-01-15', 250.75, 1002);
INSERT INTO Orders VALUES (2, '2023-01-17', 135.50, 1005);
INSERT INTO Orders VALUES (3, '2023-02-05', 780.00, 1001);
INSERT INTO Orders VALUES (4, '2023-02-12', 45.20, 1007);
INSERT INTO Orders VALUES (5, '2023-03-21', 1250.00, 1009);
INSERT INTO Orders VALUES (6, '2023-03-22', 95.99, 1003);
INSERT INTO Orders VALUES (7, '2023-04-01', 349.50, 1002);
INSERT INTO Orders VALUES (8, '2023-04-08', 670.80, 1010);
INSERT INTO Orders VALUES (9, '2023-05-19', 89.00, 1006);
INSERT INTO Orders VALUES (10, '2023-05-30', 2100.25, 1007);


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.

SELECT * FROM Employee; 
-- Output: 
/*'1001', 'Ragu', 'Kumar', '50000.00', '2000-05-20', '1985-02-02'
'1002', 'Priya', 'Sharma', '65000.00', '2005-08-15', '1990-07-22'
'1003', 'Amit', 'Singh', '72000.00', '2010-11-01', '1988-03-10'
'1004', 'Sunita', 'Patel', '58000.00', '2012-01-30', '1992-12-05'
'1005', 'Raj', 'Gupta', '90000.00', '2015-06-18', '1982-09-14'
'1006', 'Anjali', 'Verma', '48000.00', '2018-09-05', '1995-11-28'
'1007', 'Vikram', 'Reddy', '110000.00', '2019-02-11', '1986-01-19'
'1008', 'Kavita', 'Nair', '75000.00', '2021-07-29', '1997-04-16'
'1009', 'Suresh', 'Menon', '82000.00', '2022-04-14', '1991-10-30'
'1010', 'Deepa', 'Joshi', '62000.00', '2023-10-25', '1998-08-21'
*/

SELECT * FROM Orders;
-- Output: 
/*'1', '2023-01-15', '250.75', '1002'
'2', '2023-01-17', '135.50', '1005'
'3', '2023-02-05', '780.00', '1001'
'4', '2023-02-12', '45.20', '1007'
'5', '2023-03-21', '1250.00', '1009'
'6', '2023-03-22', '95.99', '1003'
'7', '2023-04-01', '349.50', '1002'
'8', '2023-04-08', '670.80', '1010'
'9', '2023-05-19', '89.00', '1006'
'10', '2023-05-30', '2100.25', '1007'
*/


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
SELECT round(Salary)
FROM Employee;

-- Output: 
/*'50000'
'65000'
'72000'
'58000'
'90000'
'48000'
'110000'
'75000'
'82000'
'62000'
*/

/* b. Absolute Values: Show absolute values of salaries */
SELECT ABS(Salary) AS "Salaries"
FROM Employee;

-- Output: 
/*'50000.00'
'65000.00'
'72000.00'
'58000.00'
'90000.00'
'48000.00'
'110000.00'
'75000.00'
'82000.00'
'62000.00'
*/

/* c. Ceiling Values: Get ceiling values of order amounts */
SELECT CEIL(TotalAmount) AS "Order Amounts"
FROM Orders;

-- Output: 
/*'251'
'136'
'780'
'46'
'1250'
'96'
'350'
'671'
'89'
'2101'
*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
SELECT count(EmpID) AS "Total Number of Employees"
FROM Employee;

-- Output: 
/*'10'
*/

/* b. Sum of Salaries: Calculate total salary expense */
SELECT sum(Salary) AS "Total Salary Expense"
FROM Employee;

-- Output: 
/*'712000.00'
*/

/* c. Average Order Amount: Find average order value */
SELECT avg(TotalAmount) AS "Average Order Value"
FROM Orders;

-- Output: 
/*'576.699000'
*/

/* d. Max/Min Salary: Find highest and lowest salaries */
SELECT max(Salary) "Highest Salary", min(Salary) AS "Lowest Salary"
FROM Employee;

-- Output: 
/*'110000.00', '48000.00'
*/

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
SELECT upper(FirstName) AS "Name's in Uppercase", lower(FirstName) AS "Name's in Lowercase"
FROM Employee;

-- Output: 
/*'RAGU', 'ragu'
'PRIYA', 'priya'
'AMIT', 'amit'
'SUNITA', 'sunita'
'RAJ', 'raj'
'ANJALI', 'anjali'
'VIKRAM', 'vikram'
'KAVITA', 'kavita'
'SURESH', 'suresh'
'DEEPA', 'deepa'
*/

/* b. Concatenate Names: Create full names */
SELECT concat(FirstName," ", LastName) AS "Full Name"
FROM Employee;

-- Output: 
/*'Ragu Kumar'
'Priya Sharma'
'Amit Singh'
'Sunita Patel'
'Raj Gupta'
'Anjali Verma'
'Vikram Reddy'
'Kavita Nair'
'Suresh Menon'
'Deepa Joshi'
*/

/* c. Extract Substring: Get first 3 characters of first names */
SELECT SUBSTRING(FirstName, 1, 3)
FROM Employee;

-- Output: 
/*'Rag'
'Pri'
'Ami'
'Sun'
'Raj'
'Anj'
'Vik'
'Kav'
'Sur'
'Dee'
*/

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
SELECT cast(OrderDate as Char)
FROM Orders;

-- Output: 
/*'2023-01-15'
'2023-01-17'
'2023-02-05'
'2023-02-12'
'2023-03-21'
'2023-03-22'
'2023-04-01'
'2023-04-08'
'2023-05-19'
'2023-05-30'
*/

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
SELECT now()
FROM Orders;

-- Output: 
/*'2025-09-08 12:42:42'
'2025-09-08 12:42:42'
'2025-09-08 12:42:42'
'2025-09-08 12:42:42'
'2025-09-08 12:42:42'
'2025-09-08 12:42:42'
'2025-09-08 12:42:42'
'2025-09-08 12:42:42'
'2025-09-08 12:42:42'
'2025-09-08 12:42:42'
*/

/* b. Extract Year: Get year from order dates */
SELECT SUBSTRING(OrderDate, 1, 4) AS "Year"
FROM Orders;

SELECT extract(YEAR from OrderDate)
FROM Orders;

-- Output:
/*'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
*/ 

/* c. Add Months: Add 3 months to order dates */
SELECT Date_add(OrderDate, INTERVAL 3 Month)
AS "Final Date"
FROM Orders;

-- Output: 
/*'2023-04-15'
'2023-04-17'
'2023-05-05'
'2023-05-12'
'2023-06-21'
'2023-06-22'
'2023-07-01'
'2023-07-08'
'2023-08-19'
'2023-08-30'
*/

/* d. Days Since Order: Calculate days between order date and now */
SELECT OrderID, datediff(NOW(), OrderDate) AS "DAYSINCEORDER"
FROM Orders;

-- Output: 
/*'1', '967'
'2', '965'
'3', '946'
'4', '939'
'5', '902'
'6', '901'
'7', '891'
'8', '884'
'9', '843'
'10', '832'
*/

-- END of the Task -- 