create database photo;
use photo;
create table Books(
BookID varchar(60) primary key,
Title varchar(55),
Author varchar(60),
Price INT,
PublishDate Date);

Insert Into Books(BookID,Title,Author,Price,PublishDate)
values('B001', 'The Silent Sea', 'Clive Cussler', 499, '2020-01-15'),
('B002', 'Atomic Habits', 'James Clear', 350, '2018-10-16'),
('B003', 'The Alchemist', 'Paulo Coelho', 299, '1993-05-01'),
('B004', 'Think Like a Monk', 'Jay Shetty', 420, '2020-09-08'),
('B005', 'Rich Dad Poor Dad', 'Robert Kiyosaki', 399, '1997-04-11');

create table Customers(
CustID varchar(45) primary key,
Email varchar(55),
JoinDate date );
alter table Customers add(name varchar(45));

Insert Into Customers(CustID,Email,JoinDate,Name)
VALUES
('C001', 'amit.sharma@example.com', '2023-01-15', 'Amit Sharma'),
('C002', 'priya.verma@example.com', '2023-03-10', 'Priya Verma'),
('C003', 'rahul.mehta@example.com', '2023-05-22', 'Rahul Mehta'),
('C004', 'sneha.kapoor@example.com', '2023-07-05', 'Sneha Kapoor'),
('C005', 'vikram.singh@example.com', '2023-09-12', 'Vikram Singh');

Create table Orders(
OrderID varchar(55) primary key,
CustID varchar(45),
BookID varchar(60),
Quantity INT,
OrderDate Date,
Foreign key (CustID) references Customers(CustID),
Foreign key(BookID) references Books(BookID));



INSERT INTO Orders (OrderID, CustID, BookID, Quantity, OrderDate)
VALUES 
('ORD001', 'C001', 'B001', 2, '2025-09-01'),
('ORD002', 'C002', 'B002', 1, '2025-09-03'),
('ORD003', 'C003', 'B003', 3, '2025-09-05'),
 ('ORD004', 'C004', 'B004', 1, '2025-09-07'), 
('ORD005', 'C005', 'B005', 4, '2025-09-10');

-- Display all customer names in uppercase.
select Upper(Name) from Customers;
/* 'AMIT SHARMA'
'PRIYA VERMA'
'RAHUL MEHTA'
'SNEHA KAPOOR'
'VIKRAM SINGH'*/
-- Show all customer names in lowercase.

-- Extract the first 3 letters of each book title.
select substring(Title,1,3) from Books;
/* 'The'
'Ato'
'The'
'Thi'
'Ric'*/
-- Display each customer’s email domain (after @).

-- Find the length of each book title.
select length(Title) from Books;
/*'14'
'13'
'13'
'17'
'17'*/
-- Replace the word "Book" with "Text" in titles (if present).
select replace(Title, 'Book','Text')
from Books;
/* 'The Silent Sea'
'Atomic Habits'
'The Alchemist'
'Think Like a Monk'
'Rich Dad Poor Dad'*/


-- Concatenate Author name and Book title as a single string.
select concat(Title,Author)
from Books;
/* 'The Silent SeaClive Cussler'
'Atomic HabitsJames Clear'
'The AlchemistPaulo Coelho'
'Think Like a MonkJay Shetty'
'Rich Dad Poor DadRobert Kiyosaki'*/

-- Show book titles where the author’s name contains ‘a’.
select Title, Author from books where Author Like '%a%';
/* 'Atomic Habits', 'James Clear'
'The Alchemist', 'Paulo Coelho'
'Think Like a Monk', 'Jay Shetty'
'Rich Dad Poor Dad', 'Robert Kiyosaki'*/

-- Display the year in which each book was published.
SELECT Title, YEAR(PublishDate) AS PublishDate 
FROM Books; 
/* 'The Silent Sea', 2020
'Atomic Habits', 2018
'The Alchemist', 1993
'Think Like a Monk', 2020
'Rich Dad Poor Dad', 1997*/

-- Find the month name in which each customer joined.
SELECT Name, MONTHNAME(JoinDate) AS JoinMonth 
From Customers;
/* 'Amit Sharma', 'January'
'Priya Verma', 'March'
'Rahul Mehta', 'May'
'Sneha Kapoor', 'July'
'Vikram Singh', 'September'*/

-- List customers who joined in 2025.
select * from Customers where Year(JoinDate)=2023;
-- Find the day name on which each order was placed.
SELECT  DAYNAME(OrderDate) AS OrderDay FROM Orders;
/* 'Monday'
'Wednesday'
'Friday'
'Sunday'
'Wednesday' */ 

-- Display the age of each book (in years since published).
SELECT Title, YEAR(CURDATE()) - YEAR(PublishDate) AS BookAge FROM Books;
/* 'The Silent Sea', '5'
'Atomic Habits', '7'
'The Alchemist', '32'
'Think Like a Monk', '5'
'Rich Dad Poor Dad', '28'*/


-- Find the number of days between today and each customer’s join date.
SELECT Name, DATEDIFF(Now(), JoinDate) AS DaysSinceJoin FROM Customers;
/* 'Amit Sharma', '976'
'Priya Verma', '922'
'Rahul Mehta', '849'
'Sneha Kapoor', '805'
'Vikram Singh', '736'*/


-- Show all orders placed in the month of December (any year).
select * from orders where month(OrderDate)= 9;
/* 'ORD001', 'C001', 'B001', '2', '2025-09-01'
'ORD002', 'C002', 'B002', '1', '2025-09-03'
'ORD003', 'C003', 'B003', '3', '2025-09-05'
'ORD004', 'C004', 'B004', '1', '2025-09-07'
'ORD005', 'C005', 'B005', '4', '2025-09-10'*/

-- Find the total number of books available in the store.
SELECT COUNT(*) AS TotalBooks From Books;
/* '5' */

-- Find the average price of books.
SELECT avg(Price) AS AveragePrice 
from Books;
/* '393.4000'*/

-- Find the maximum and minimum book price.
select max(Price),min(Price)
from books;
/* '499', '299'*/

-- Count how many customers joined after 2020.
select count(*) from Customers where JoinDate > 2020;
/* '5'*/

-- Find the total number of books ordered (all orders combined).
select Sum(Quantity)
from Orders;
/* '11' */

-- Show the total quantity of books ordered per customer.
SELECT CustID, SUM(Quantity) AS TotalQuantity FROM Orders GROUP BY CustID;
/* 'C001', '2'
'C002', '1'
'C003', '3'
'C004', '1'
'C005', '4'*/

-- Find the average order quantity per book.
select BookID,avg(Quantity) 
from Orders group by BookID ;
/* 'B001', '2.0000'
'B002', '1.0000'
'B003', '3.0000'
'B004', '1.0000'
'B005', '4.0000'*/

-- Find the book with the highest total quantity ordered.
select BookID,sum(Quantity) As TotalQuantity
from Orders group by BookID
/* 'B001', '2'*/

-- Show the total revenue generated per book (Price × Quantity).
select (Price * Qquantity) as TotalRevenue
from Books; 

-- Find the total number of orders placed each year
SELECT YEAR(OrderDate) AS OrderYear,
       COUNT(*) AS TotalOrders
FROM Orders
GROUP BY YEAR(OrderDate);
/* '2025', '5'*/
