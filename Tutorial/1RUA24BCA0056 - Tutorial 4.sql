create database OnlineBookStore;
use OnlineBookStore;

create table Books(
	BookID int Primary key,
    Title Varchar(50),
    Author Varchar(50),
    Price int,
    PublishDate Date
);

insert into Books values
(1, 'The Silent Patient', 'Alex Michaelides', 499, '2019-02-05'),
(2, 'Atomic Habits', 'James Clear', 699, '2018-10-16'),
(3, 'Ikigai', 'Héctor García', 350, '2016-08-29'),
(4, 'Sapiens', 'Yuval Noah Harari', 899, '2011-06-04'),
(5, 'The Alchemist', 'Paulo Coelho', 399, '1988-04-15');

create table Customer(
	CustomerID Int Primary Key,
    Name varchar(50),
    Email varchar(50) unique,
    JoinDate Date
);

insert into Customer values
(101, 'Aarav Mehta', 'aarav.mehta@example.com', '2023-01-15'),
(102, 'Sneha Reddy', 'sneha.reddy@example.com', '2023-03-22'),
(103, 'Rohan Kapoor', 'rohan.kapoor@example.com', '2023-06-10'),
(104, 'Isha Verma', 'isha.verma@example.com', '2023-08-05'),
(105, 'Kunal Desai', 'kunal.desai@example.com', '2023-09-30');

create table Orders(
	OrderID int primary key,
    OrderDate date,
    Quantity int,
    CustomerID int,
    BookID int,
    foreign key (CustomerID) references Customer(CustomerID),
    foreign key (BookID) references Books(BookID)
);

insert into Orders values
(201, '2025-09-01', 1, 101, 2),  
(202, '2025-09-03', 2, 102, 5),  
(203, '2025-09-05', 1, 103, 1),  
(204, '2025-09-10', 3, 104, 3),  
(205, '2025-09-15', 1, 105, 4);  


-- 1. Display all the customer names in uppercase.

select upper(Name) As Name
from Customer;

/*'AARAV MEHTA'
'SNEHA REDDY'
'ROHAN KAPOOR'
'ISHA VERMA'
'KUNAL DESAI'
*/

-- 2. Show all customer names in lowercase.

select lower(Name) As Name
from Customer;

/*'aarav mehta'
'sneha reddy'
'rohan kapoor'
'isha verma'
'kunal desai'
*/

-- 3. Extract the first 3 letters of each book title.

select Substring(Title, 1, 3) As "Title 1st 3 Letters"
from Books;

/*'The'
'Ato'
'Iki'
'Sap'
'The'
*/

select left(Title, 3) As "Title 1st 3 Letters"
from Books;

/*'The'
'Ato'
'Iki'
'Sap'
'The'
*/

-- 4. Display each customer's email domain(after@)

select right(Email, 12) As Domain
from Customer;

/*'@example.com'
'@example.com'
'@example.com'
'@example.com'
'@example.com'
*/

-- 5. find the lenght of book title.

select length(Title) AS BookTitle
from Books;

/*'18'
'13'
'6'
'7'
'13'
*/

-- 6. replace the word "Book" with "Text" in title(if present).
-- SELECT REPLACE(Title, 'Book', 'Text') AS UpdatedTitle FROM Books;

-- 7.concatinate author name and book title as a single string.

select concat(Author , Title) as AuthorAndTitle 
from Books;

/*'Alex MichaelidesThe Silent Patient'
'James ClearAtomic Habits'
'Héctor GarcíaIkigai'
'Yuval Noah HarariSapiens'
'Paulo CoelhoThe Alchemist'
*/




