-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: NAMISH M S
-- USN: 1RUA24BCA0056_Lab01
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost', 'LAPTOP-BMPMMU9A', '8.0.42', '2025-08-18 11:32:28'

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:

create database DBLab001;
use DBLab001;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:

create table STUDENTS(
StudentID varchar(10) Primary key,
FirstName varchar(15),
LastName varchar(10),
Email varchar(15) Unique,
DOB Date
);

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*
'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(15)', 'YES', '', NULL, ''
'LastName', 'varchar(10)', 'YES', '', NULL, ''
'Email', 'varchar(15)', 'YES', 'UNI', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
 */

-- Alter the table and 2 new columns
Alter table STUDENTS add(Gender varchar(2), age int);
desc STUDENTS;
-- Modify a column data type
alter table STUDENTS modify LastName varchar(15);
desc STUDENTS;
-- Rename a column
alter table STUDENTS rename column DOB to DateOFBirth;
Alter Table STUDENTS rename column FirstName to Name;
desc STUDENTS;
-- Drop a column
Alter Table STUDENTS Drop LastName;
desc STUDENTS;
-- Rename the table
Rename Table STUDENTS to STUDENT;
desc STUDENT;


-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:

create table Courses(
CourseID varchar(10) Primary Key,
CourseName varchar(10),
Credits int
);

DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :
/* 'CourseID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(10)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
*/

-- Alter the table and 2 new columns
Alter table Courses add (Faculty varchar(10), Timings varchar(10));
desc Courses;
-- Modify a column data type
alter table Courses modify Timings numeric(10, 2);
-- Rename a column
alter table Courses rename column Faculty to Lecturer;
-- Drop a column
alter table Courses drop Timings;
-- Rename the table
Rename table Courses to Course;


-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
Create Table Enrollments(
EnrollmentsID varchar(10) Primary Key,
StudentID varchar(10),
CourseID varchar(10),
Foreign key(StudentID) references Student(StudentID),
Foreign key(CourseID) references Course(CourseID)
);

DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
/* 'EnrollmentsID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'StudentID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(10)', 'YES', 'MUL', NULL, ''
 */
 
-- Alter the table and 2 new columns
Alter table ENROLLMENTS add(Admission Date, Fee Decimal);
-- Modify a column data type
Alter Table ENROLLMENTS modify Fee int;
-- Rename a column
Alter Table ENROLLMENTS rename column Fee to Fees;
-- Drop a column
Alter Table ENROLLMENTS drop Fees;
-- Rename the table
Rename Table ENROLLMENTS to ENROLLMENT;

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
Alter table Student add (PhoneNumber varchar(10));

DESC STUDENT; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]
/* 'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Name', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(15)', 'YES', 'UNI', NULL, ''
'DateOFBirth', 'date', 'YES', '', NULL, ''
'Gender', 'varchar(2)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(10)', 'YES', '', NULL, ''
 */ 

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
Alter Table Course modify Credits Decimal;

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

Drop Table Enrollment;
Drop Table Course;

SHOW TABLES; -- After dropping the table Enrollement and Course

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
