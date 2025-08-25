-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: NAMISH M S
-- USN: 1RUA24BCA0056
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
/* 'root@localhost', 'LAPTOP-BMPMMU9A', '8.0.42', '2025-08-25 11:23:51'
 */
-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
CREATE DATABASE College_Student_Management_System;
USE College_Student_Management_System;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:

-- Table 01:
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(10) ,
    HOD VARCHAR(10),
    ContactEmail VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    Location VARCHAR(10)
);


-- Table 02:
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(10),
    Credits INT,
    DepartmentID INT,
    Duration VARCHAR(50),
    Fee DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table 03:
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    DateOfBirth DATE,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Table 04:
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DepartmentID INT,
    Qualification VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table 05:
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(20),
    Year INT,
    Grade VARCHAR(5),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

--  describe the structure of each table and copy paste the Output 

-- Table 01:
Desc Departments;
/*
'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(10)', 'YES', '', NULL, ''
'HOD', 'varchar(10)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(100)', 'YES', 'UNI', NULL, ''
'PhoneNumber', 'varchar(20)', 'YES', '', NULL, ''
'Location', 'varchar(10)', 'YES', '', NULL, ''
*/

-- Table 02:
Desc Course;
/*
'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(10)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Duration', 'varchar(50)', 'YES', '', NULL, ''
'Fee', 'decimal(10,2)', 'YES', '', NULL, ''
*/

-- Table 03:
Desc Students;
/*
'StudentID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(50)', 'YES', '', NULL, ''
'LastName', 'varchar(50)', 'YES', '', NULL, ''
'Email', 'varchar(100)', 'YES', 'UNI', NULL, ''
'DateOfBirth', 'date', 'YES', '', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
*/

-- Table 04:
Desc Faculty;
/*
'FacultyID', 'int', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(50)', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(100)', 'YES', '', NULL, ''
'Email', 'varchar(100)', 'YES', 'UNI', NULL, ''
'PhoneNumber', 'varchar(20)', 'YES', '', NULL, ''
*/

-- Table 05:
Desc Enrollments;
/*
'EnrollmentID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'Semester', 'varchar(20)', 'YES', '', NULL, ''
'Year', 'int', 'YES', '', NULL, ''
'Grade', 'varchar(5)', 'YES', '', NULL, ''
*/


-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
-- 02: Modify the existing column from each table
-- 03 change the datatypes
-- 04: Rename a column
-- 05: Drop a column
-- 06: Rename the table
-- 07: describe the structure of the new table

-- Table 01:
ALTER TABLE Departments ADD (EstablishedYear INT, Website VARCHAR(100));

ALTER TABLE Departments
MODIFY DepartmentName VARCHAR(150);

ALTER TABLE Departments
MODIFY PhoneNumber BIGINT;

ALTER TABLE Departments
RENAME COLUMN Location TO CampusLocation;

ALTER TABLE Departments
DROP COLUMN HOD;

RENAME TABLE Departments TO DeptInfo;

DESC DeptInfo;

-- Table 02:
ALTER TABLE Course
ADD Language VARCHAR(50),
ADD Mode VARCHAR(50);

ALTER TABLE Course
MODIFY CourseName VARCHAR(150);

ALTER TABLE Course
MODIFY Fee FLOAT;

ALTER TABLE Course
RENAME COLUMN Duration TO CourseDuration;

ALTER TABLE Course
DROP COLUMN Credits;

RENAME TABLE Course TO CourseCatalog;

DESC CourseCatalog;

-- Table 03:
ALTER TABLE Students
ADD Gender VARCHAR(10),
ADD Address VARCHAR(200);

ALTER TABLE Students
MODIFY FirstName VARCHAR(100);

ALTER TABLE Students
MODIFY DateOfBirth DATETIME;

ALTER TABLE Students
RENAME COLUMN Email TO StudentEmail;

ALTER TABLE Students
DROP COLUMN LastName;

RENAME TABLE Students TO StudentRecords;

DESC StudentRecords;

-- Table 04:
ALTER TABLE Faculty
ADD JoiningDate DATE,
ADD Specialization VARCHAR(100);

ALTER TABLE Faculty
MODIFY FacultyName VARCHAR(120);

ALTER TABLE Faculty
MODIFY PhoneNumber BIGINT;

ALTER TABLE Faculty
RENAME COLUMN Qualification TO Degree;

ALTER TABLE Faculty
DROP COLUMN Email;

RENAME TABLE Faculty TO FacultyDirectory;

DESC FacultyDirectory;

-- Table 05:
ALTER TABLE Enrollments
ADD AttendancePercentage DECIMAL(5,2),
ADD Remarks TEXT;

ALTER TABLE Enrollments
MODIFY Grade VARCHAR(10);

ALTER TABLE Enrollments
MODIFY Year SMALLINT;

ALTER TABLE Enrollments
RENAME COLUMN Semester TO Term;

ALTER TABLE Enrollments
DROP COLUMN Remarks ;

RENAME TABLE Enrollments TO CourseEnrollments;

DESC CourseEnrollments;


/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/

-- Additional Task 1
ALTER TABLE StudentRecords
ADD Address VARCHAR(100);

-- Additional Task 2
ALTER TABLE StudentRecords
ADD Gender CHAR(1);

-- Additional Task 3
ALTER TABLE FacultyDirectory
ADD JoiningDate DATE;

-- Additional Task 4
ALTER TABLE CourseCatalog
MODIFY CourseName VARCHAR(100);

-- Additional Task 5
ALTER TABLE DeptInfo
MODIFY CampusLocation VARCHAR(80);

-- Additional Task 6
ALTER TABLE FacultyDirectory
RENAME COLUMN Qualification TO Degree;

-- Additional Task 7
RENAME TABLE FacultyDirectory TO Educators;

-- Additional Task 8
ALTER TABLE DeptInfo
DROP COLUMN PhoneNumber;

-- Additional Task 9
ALTER TABLE StudentRecords
DROP COLUMN StudentEmail;

-- Additional Task 10
ALTER TABLE CourseCatalog
DROP COLUMN CourseDuration;

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
Drop Table CoursesCatalog;
Drop Table CourseEnrollments;

SHOW TABLES; -- After dropping the table Enrollement and Course

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01