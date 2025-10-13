-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
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
/*'root@localhost', 'LAPTOP-BMPMMU9A', '8.0.42', '2025-09-01 11:27:56'
*/

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 

Create Database Library;

Use Library;

Create Table Books(
	BookID Varchar(10) Primary Key,
    Book_Name Varchar(50),
    Author varchar(30),
    Publish_Year Year,
    Total_Copies int,
    Available_Copies int
);

Create Table Members(
	MemberID Varchar(10) Primary Key,
    Member_Name Varchar(30),
    Membership_Type varchar(20),
    Join_Date Date
);



-- Paste the Output below for the given command ( DESC TableName;) 

Desc Books;
/*'BookID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Book_Name', 'varchar(50)', 'YES', '', NULL, ''
'Author', 'varchar(30)', 'YES', '', NULL, ''
'Publish_Year', 'year', 'YES', '', NULL, ''
'Total_Copies', 'int', 'YES', '', NULL, ''
'Available_Copies', 'int', 'YES', '', NULL, ''
*/

Desc Members;
/*'MemberID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Member_Name', 'varchar(30)', 'YES', '', NULL, ''
'Membership_Type', 'varchar(20)', 'YES', '', NULL, ''
'Join_Date', 'date', 'YES', '', NULL, ''
*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

INSERT INTO Books VALUES(101,"1984_The Black Swan","George Orwell",1949,10,04);
INSERT INTO Books VALUES (102, "To Kill a Mockingbird", "Harper Lee", 1960, 12, 5);
INSERT INTO Books VALUES (103, "The Great Gatsby", "F. Scott Fitzgerald", 1925, 20, 8);
INSERT INTO Books VALUES (104, "Brave New World", "Aldous Huxley", 1932, 15, 7);
INSERT INTO Books VALUES (105, "The Catcher in the Rye", "J.D. Salinger", 1951, 18, 6);
INSERT INTO Books VALUES (106, "Sapiens_Homo Deus", "Yuval Noah Harari", 2011, 22, 9);
INSERT INTO Books VALUES (107, "The Alchemist", "Paulo Coelho", 1988, 10, 3);
INSERT INTO Books VALUES (108, "Thinking, Fast and Slow", "Daniel Kahneman", 2011, 5, 11);
INSERT INTO Books VALUES (109, "The Godfather", "Mariopuzo", 1969, 28, 2);
INSERT INTO Books VALUES (110, "The Road", "Cormac McCarthy", 2006, 7, 4);




-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

SELECT * FROM Books;

/*'101', '1984_The Black Swan', 'George Orwell', 1949, '10', '4'
'102', 'To Kill a Mockingbird', 'Harper Lee', 1960, '12', '5'
'103', 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, '20', '8'
'104', 'Brave New World', 'Aldous Huxley', 1932, '15', '7'
'105', 'The Catcher in the Rye', 'J.D. Salinger', 1951, '18', '6'
'106', 'Sapiens_Homo Deus', 'Yuval Noah Harari', 2011, '22', '9'
'107', 'The Alchemist', 'Paulo Coelho', 1988, '10', '3'
'108', 'Thinking, Fast and Slow', 'Daniel Kahneman', 2011, '5', '11'
'109', 'The Godfather', 'Mariopuzo', 1969, '28', '2'
'110', 'The Road', 'Cormac McCarthy', 2006, '7', '4'
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

INSERT INTO Members VALUES (1, "David Lee", "Platinum", "2024-04-15");
INSERT INTO Members VALUES (2, "Emma Wilson", "Silver", "2024-05-22");
INSERT INTO Members VALUES (3, "Aarav Mehta", "Gold", "2024-06-10");
INSERT INTO Members VALUES (4, "Sophia Thomas", "Platinum", "2024-07-01");
INSERT INTO Members VALUES (5, "Ravi Kumar", "Silver", "2024-08-18");
INSERT INTO Members VALUES (6, "Isabella Fernandez", "Gold", "2024-09-05");
INSERT INTO Members VALUES (7, "Liam Patel", "Platinum", "2024-10-12");
INSERT INTO Members VALUES (8, "Ananya Roy", "Silver", "2024-11-20");
INSERT INTO Members VALUES (9, "Noah Singh", "Gold", "2024-12-03");
INSERT INTO Members VALUES (10, "Maya Desai", "Platinum", "2025-01-15");



-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

SELECT * FROM Members;

/*'1', 'David Lee', 'Platinum', '2024-04-15'
'10', 'Maya Desai', 'Platinum', '2025-01-15'
'2', 'Emma Wilson', 'Silver', '2024-05-22'
'3', 'Aarav Mehta', 'Gold', '2024-06-10'
'4', 'Sophia Thomas', 'Platinum', '2024-07-01'
'5', 'Ravi Kumar', 'Silver', '2024-08-18'
'6', 'Isabella Fernandez', 'Gold', '2024-09-05'
'7', 'Liam Patel', 'Platinum', '2024-10-12'
'8', 'Ananya Roy', 'Silver', '2024-11-20'
'9', 'Noah Singh', 'Gold', '2024-12-03'
*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

Alter Table Books
ADD (Published_Location Varchar(50)); 

UPDATE Books 
SET Published_Location = "Bangalore";

UPDATE Books 
SET Total_Copies = Total_Copies + 2 
WHERE Book_Name = "1984_The Black Swan";


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

SELECT * FROM Books;

/*'101', '1984_The Black Swan', 'George Orwell', 1949, '12', '4', 'Bangalore'
'102', 'To Kill a Mockingbird', 'Harper Lee', 1960, '12', '5', 'Bangalore'
'103', 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, '20', '8', 'Bangalore'
'104', 'Brave New World', 'Aldous Huxley', 1932, '15', '7', 'Bangalore'
'105', 'The Catcher in the Rye', 'J.D. Salinger', 1951, '18', '6', 'Bangalore'
'106', 'Sapiens_Homo Deus', 'Yuval Noah Harari', 2011, '22', '9', 'Bangalore'
'107', 'The Alchemist', 'Paulo Coelho', 1988, '10', '3', 'Bangalore'
'108', 'Thinking, Fast and Slow', 'Daniel Kahneman', 2011, '5', '11', 'Bangalore'
'109', 'The Godfather', 'Mariopuzo', 1969, '28', '2', 'Bangalore'
'110', 'The Road', 'Cormac McCarthy', 2006, '7', '4', 'Bangalore'
*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

UPDATE Members 
SET Membership_Type = "Gold" 
WHERE Member_Name = "Emma Wilson";


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM Members;

/*'1', 'David Lee', 'Platinum', '2024-04-15'
'10', 'Maya Desai', 'Platinum', '2025-01-15'
'2', 'Emma Wilson', 'Gold', '2024-05-22'
'3', 'Aarav Mehta', 'Gold', '2024-06-10'
'4', 'Sophia Thomas', 'Platinum', '2024-07-01'
'5', 'Ravi Kumar', 'Silver', '2024-08-18'
'6', 'Isabella Fernandez', 'Gold', '2024-09-05'
'7', 'Liam Patel', 'Platinum', '2024-10-12'
'8', 'Ananya Roy', 'Silver', '2024-11-20'
'9', 'Noah Singh', 'Gold', '2024-12-03'
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

DELETE FROM Members
WHERE Member_Name = "David Lee";


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

SELECT * FROM Members;

/*'10', 'Maya Desai', 'Platinum', '2025-01-15'
'2', 'Emma Wilson', 'Gold', '2024-05-22'
'3', 'Aarav Mehta', 'Gold', '2024-06-10'
'4', 'Sophia Thomas', 'Platinum', '2024-07-01'
'5', 'Ravi Kumar', 'Silver', '2024-08-18'
'6', 'Isabella Fernandez', 'Gold', '2024-09-05'
'7', 'Liam Patel', 'Platinum', '2024-10-12'
'8', 'Ananya Roy', 'Silver', '2024-11-20'
'9', 'Noah Singh', 'Gold', '2024-12-03'
*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

create table BorrowingTable (
SlNo varchar(100) Primary Key,
MemberID varchar(10),
Member_Name varchar(50),
BookID varchar(10),
Book_Name varchar(30),
Borrowed_Date date,
Foreign Key(MemberID) references Members(MemberID),
Foreign Key(BookID) references Books(BookID));


insert into BorrowingTable values (1, 2, "Emma Wilson", 102, "The Catcher in the Rye", '2024-06-01');


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

select * from BorrowingTable;

-- '1', '2', 'Emma Wilson', '102', 'The Catcher in the Rye', '2024-06-01'

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

select Member_Name from BorrowingTable where BookID = '102';

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
# Member Name
-- 'Emma Wilson'

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 