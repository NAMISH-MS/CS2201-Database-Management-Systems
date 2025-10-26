CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50),
    Genre VARCHAR(30),
    TotalCopies INT NOT NULL,
    AvailableCopies INT NOT NULL
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    JoinDate DATE
);

CREATE TABLE BookIssues (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);


INSERT INTO Books VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'Fiction', 5, 5),
(2, 'Clean Code', 'Robert C. Martin', 'Programming', 3, 3),
(3, 'Harry Potter', 'J.K. Rowling', 'Fantasy', 10, 10);



INSERT INTO Members VALUES
(1, 'Alice', 'alice@example.com', '2024-01-15'),
(2, 'Bob', 'bob@example.com', '2024-03-10'),
(3, 'Charlie', 'charlie@example.com', '2024-05-20');


INSERT INTO BookIssues VALUES
(1, 1, 1, '2025-10-01', '2025-10-10'),
(2, 2, 2, '2025-10-05', NULL),
(3, 3, 1, '2025-10-07', NULL),
(4, 1, 3, '2025-10-08', NULL);

-- aggigate functions
-- total issued books per 

SELECT m.MemberID, m.Name, COUNT(bi.IssueID) AS TotalIssuedBooks
FROM Members m
LEFT JOIN BookIssues bi ON m.MemberID = bi.MemberID
GROUP BY m.MemberID, m.Name;
/*'1', 'Alice', '2'
'2', 'Bob', '1'
'3', 'Charlie', '1'
*/


SELECT b.Title, m.Name AS IssuedTo, bi.IssueDate
FROM BookIssues bi
JOIN Books b ON bi.BookID = b.BookID
JOIN Members m ON bi.MemberID = m.MemberID
WHERE bi.ReturnDate IS NULL;
/*'Clean Code', 'Bob', '2025-10-05'
'Harry Potter', 'Alice', '2025-10-07'
'The Alchemist', 'Charlie', '2025-10-08'
*/












