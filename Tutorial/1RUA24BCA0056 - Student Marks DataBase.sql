-- Tutorial 2
-- DATE : 03-09-2025
-- STUDENT NAME: NAMISH M S
-- USN: 1RUA24BCA0056


CREATE DATABASE Student_Marks_DB;

USE Student_Marks_DB;

CREATE TABLE Course(
	CourseID VARCHAR(20) PRIMARY KEY,
    Course_Name Varchar(20),
    Credits INT,
    Course_Duration VARCHAR(10)
);

DESC Course;
/*'CourseID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'Course_Name', 'varchar(20)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'Course_Duration', 'varchar(10)', 'YES', '', NULL, ''
*/

CREATE TABLE Student(
	CourseID VARCHAR(20),
	USN VARCHAR(20) PRIMARY KEY,
    Student_Name VARCHAR(20),
    Date_of_Birth DATE,
    Age INT,
    Email VARCHAR(50) UNIQUE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

DESC Student;
/*'CourseID', 'varchar(20)', 'YES', 'MUL', NULL, ''
'USN', 'varchar(20)', 'NO', 'PRI', NULL, ''
'Student_Name', 'varchar(20)', 'YES', '', NULL, ''
'Date_of_Birth', 'date', 'YES', '', NULL, ''
'Age', 'int', 'YES', '', NULL, ''
'Email', 'varchar(50)', 'YES', 'UNI', NULL, ''
*/

CREATE TABLE Student_Marks(
	CourseID VARCHAR(20),
	USN VARCHAR(20),
    Mathematics INT,
    DBMS INT,
    JAVA INT,
    FOREIGN KEY (USN) REFERENCES Student(USN), 
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

DESC Student_Marks;
/*'CourseID', 'varchar(20)', 'YES', 'MUL', NULL, ''
'USN', 'varchar(20)', 'YES', 'MUL', NULL, ''
'Mathematics', 'int', 'YES', '', NULL, ''
'DBMS', 'int', 'YES', '', NULL, ''
'JAVA', 'int', 'YES', '', NULL, ''
*/

-- INSERT 

INSERT INTO COURSE VALUES ('CS101001', 'BCA', 164, '4-Years');
INSERT INTO COURSE VALUES ('CS101002', 'B-Tech', 180, '4-Years');
INSERT INTO COURSE VALUES ('CS101003', 'BSC', 132, '4-Years');



INSERT INTO Student VALUES ('CS101001', '1RUA24BCA0001', 'Akil', '2006-03-10', 19, 'Akil@gmail.com');
INSERT INTO Student VALUES ('CS101002', '1RUA24BTech0002', 'Sneha', '2006-04-15', 19, 'sneha@gmail.com');
INSERT INTO Student VALUES ('CS101003', '1RUA24BSC0003', 'Rohan', '2006-06-22', 19, 'rohan@gmail.com');
INSERT INTO Student VALUES ('CS101001', '1RUA24BCA0004', 'Isha', '2006-08-09', 19, 'isha@gmail.com');
INSERT INTO Student VALUES ('CS101002', '1RUA24BTech0005', 'Karan', '2006-01-30', 19, 'karan@gmail.com');
INSERT INTO Student VALUES ('CS101003', '1RUA24BSC0006', 'Neha', '2006-03-18', 19, 'neha@gmail.com');
INSERT INTO Student VALUES ('CS101002', '1RUA24BTech0007', 'Aditya', '2006-07-05', 19, 'aditya@gmail.com');
INSERT INTO Student VALUES ('CS101001', '1RUA24BCA0008', 'Pooja', '2006-02-25', 19, 'pooja@gmail.com');
INSERT INTO Student VALUES ('CS101001', '1RUA24BCA0009', 'Vikram', '2006-09-12', 19, 'vikram@gmail.com');
INSERT INTO Student VALUES ('CS101003', '1RUA24BSC0010', 'Meera', '2006-05-03', 19, 'meera@gmail.com');


INSERT INTO Student_Marks VALUES ('CS101001', '1RUA24BCA0001', 85, 78, 90);
INSERT INTO Student_Marks VALUES ('CS101002', '1RUA24BTech0002', 88, 82, 91);
INSERT INTO Student_Marks VALUES ('CS101003', '1RUA24BSC0003', 75, 80, 70);
INSERT INTO Student_Marks VALUES ('CS101001', '1RUA24BCA0004', 20, 89, 95);
INSERT INTO Student_Marks VALUES ('CS101002', '1RUA24BTech0005', 79, 30, 84);
INSERT INTO Student_Marks VALUES ('CS101003', '1RUA24BSC0006', 81, 85, 15);
INSERT INTO Student_Marks VALUES ('CS101002', '1RUA24BTech0007', 90, 87, 93);
INSERT INTO Student_Marks VALUES ('CS101001', '1RUA24BCA0008', 77, 74, 80);
INSERT INTO Student_Marks VALUES ('CS101001', '1RUA24BCA0009', 83, 79, 86);
INSERT INTO Student_Marks VALUES ('CS101003', '1RUA24BSC0010', 86, 88, 90);

-- ALTER 

ALTER TABLE Student_Marks ADD(
	Total INT,
    Average DECIMAL(10, 2),
    Result VARCHAR(10)
);

DESC Student_Marks;
/*'CourseID', 'varchar(20)', 'YES', 'MUL', NULL, ''
'USN', 'varchar(20)', 'YES', 'MUL', NULL, ''
'Mathematics', 'int', 'YES', '', NULL, ''
'DBMS', 'int', 'YES', '', NULL, ''
'JAVA', 'int', 'YES', '', NULL, ''
'Total', 'int', 'YES', '', NULL, ''
'Average', 'decimal(10,2)', 'YES', '', NULL, ''
'Result', 'varchar(10)', 'YES', '', NULL, ''
*/

-- UPDATE 

UPDATE Student_Marks 
SET Total = Mathematics + DBMS + JAVA;

UPDATE Student_Marks
SET Average = (Total/3);

UPDATE Student_Marks
SET Result = "PASS" 
WHERE Mathematics >= 35 AND DBMS >= 35 AND JAVA >= 35;

UPDATE Student_Marks
SET Result = "FAIL" 
WHERE Mathematics < 35 OR DBMS < 35 OR JAVA < 35;

-- SELECT 

SELECT * FROM Course;
/*'CS101001', 'BCA', '164', '4-Years'
'CS101002', 'B-Tech', '180', '4-Years'
'CS101003', 'BSC', '132', '4-Years'
*/

SELECT * FROM Student;
/*'CS101001', '1RUA24BCA0001', 'Akil', '2006-03-10', '19', 'Akil@gmail.com'
'CS101001', '1RUA24BCA0004', 'Isha', '2006-08-09', '19', 'isha@gmail.com'
'CS101001', '1RUA24BCA0008', 'Pooja', '2006-02-25', '19', 'pooja@gmail.com'
'CS101001', '1RUA24BCA0009', 'Vikram', '2006-09-12', '19', 'vikram@gmail.com'
'CS101003', '1RUA24BSC0003', 'Rohan', '2006-06-22', '19', 'rohan@gmail.com'
'CS101003', '1RUA24BSC0006', 'Neha', '2006-03-18', '19', 'neha@gmail.com'
'CS101003', '1RUA24BSC0010', 'Meera', '2006-05-03', '19', 'meera@gmail.com'
'CS101002', '1RUA24BTech0002', 'Sneha', '2006-04-15', '19', 'sneha@gmail.com'
'CS101002', '1RUA24BTech0005', 'Karan', '2006-01-30', '19', 'karan@gmail.com'
'CS101002', '1RUA24BTech0007', 'Aditya', '2006-07-05', '19', 'aditya@gmail.com'
*/

SELECT * FROM Student_Marks;
/*'CS101001', '1RUA24BCA0001', '85', '78', '90', '253', '84.33', 'PASS'
'CS101002', '1RUA24BTech0002', '88', '82', '91', '261', '87.00', 'PASS'
'CS101003', '1RUA24BSC0003', '75', '80', '70', '225', '75.00', 'PASS'
'CS101001', '1RUA24BCA0004', '20', '89', '95', '204', '68.00', 'FAIL'
'CS101002', '1RUA24BTech0005', '79', '30', '84', '193', '64.33', 'FAIL'
'CS101003', '1RUA24BSC0006', '81', '85', '15', '181', '60.33', 'FAIL'
'CS101002', '1RUA24BTech0007', '90', '87', '93', '270', '90.00', 'PASS'
'CS101001', '1RUA24BCA0008', '77', '74', '80', '231', '77.00', 'PASS'
'CS101001', '1RUA24BCA0009', '83', '79', '86', '248', '82.67', 'PASS'
'CS101003', '1RUA24BSC0010', '86', '88', '90', '264', '88.00', 'PASS'
*/






