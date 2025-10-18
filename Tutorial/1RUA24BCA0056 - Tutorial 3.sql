-- Name: NAMISH M S
-- USN: 1RUA24BCA0056

-- 1. School Database (Example Tables)
/*(StudentID, FirstName, LastName, DOB, Class, Marks, City)
(TeacherID, FirstName, LastName, Subject, HireDate, Salary)
(CourseID, CourseName, Credits)
(EnrollID, StudentID, CourseID, Grade)*/

create database School;
use School;

Create table Student(
	StudentID int primary key,
    FirstName Varchar(20),
    LastName varchar(20),
    DOB Date,
    Class Varchar(20),
    Marks INT,
    City Varchar(20)
);

desc Student;
/*'StudentID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(20)', 'YES', '', NULL, ''
'LastName', 'varchar(20)', 'YES', '', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
'Class', 'varchar(20)', 'YES', '', NULL, ''
'Marks', 'int', 'YES', '', NULL, ''
'City', 'varchar(20)', 'YES', '', NULL, ''
*/

Create table Teacher(
	TeacherID int primary key,
    FirstName Varchar(20),
    LastName Varchar(20),
    Subject Varchar(20),
    HireDate Date,
    Salary Decimal(10, 2)
);

desc Teacher;
/*'TeacherID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(20)', 'YES', '', NULL, ''
'LastName', 'varchar(20)', 'YES', '', NULL, ''
'Subject', 'varchar(20)', 'YES', '', NULL, ''
'HireDate', 'date', 'YES', '', NULL, ''
'Salary', 'decimal(10,2)', 'YES', '', NULL, ''
*/

Create Table Course(
	CourseID Int Primary key,
    CourseName Varchar(20),
    Credits int
);

desc Course;
/*'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(20)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
*/

Create Table Enrollment(
	EnrollID int primary key,
    StudentID int,
    CourseID int,
    Grade Varchar(10),
    Foreign key(StudentID) references Student(StudentID),
    Foreign key(CourseID) references Course(CourseID)
);

desc Enrollment;
/*'EnrollID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'Grade', 'varchar(10)', 'YES', '', NULL, ''
*/

insert into Student value (101, 'Aarav', 'Sharma', '2006-04-15', '10A', 88, 'Delhi');
insert into Student value (102, 'Isha', 'Verma', '2005-09-22', '12B', 92, 'Mumbai');
insert into Student value (103, 'Rohan', 'Mehta', '2007-01-10', '9C', 76, 'Bengaluru');
insert into Student value (104, 'Sneha', 'Patil', '2006-07-05', '10A', 81, 'Pune');
insert into Student value (105, 'Kabir', 'Singh', '2005-12-30', '12B', 95, 'Chennai');

Select * From Student;
/*'101', 'Aarav', 'Sharma', '2006-04-15', '10A', '88', 'Delhi'
'102', 'Isha', 'Verma', '2005-09-22', '12B', '92', 'Mumbai'
'103', 'Rohan', 'Mehta', '2007-01-10', '9C', '76', 'Bengaluru'
'104', 'Sneha', 'Patil', '2006-07-05', '10A', '81', 'Pune'
'105', 'Kabir', 'Singh', '2005-12-30', '12B', '95', 'Chennai'
*/

insert into Teacher values (201, 'Neha', 'Reddy', 'Mathematics', '2015-06-12', 55000.00);
insert into Teacher values (202, 'Raj', 'Kumar', 'Physics', '2017-08-25', 60000.00);
insert into Teacher values (203, 'Anita', 'Joshi', 'Chemistry', '2016-11-03', 58000.00);
insert into Teacher values (204, 'Vikram', 'Singh', 'English', '2018-01-20', 53000.00);
insert into Teacher values (205, 'Meera', 'Nair', 'Biology', '2019-09-10', 57000.00);

Select * From Teacher;
/*'201', 'Neha', 'Reddy', 'Mathematics', '2015-06-12', '55000.00'
'202', 'Raj', 'Kumar', 'Physics', '2017-08-25', '60000.00'
'203', 'Anita', 'Joshi', 'Chemistry', '2016-11-03', '58000.00'
'204', 'Vikram', 'Singh', 'English', '2018-01-20', '53000.00'
'205', 'Meera', 'Nair', 'Biology', '2019-09-10', '57000.00'
*/

insert into Course values (301, 'Maths', 4);
insert into Course values(302, 'Physics', 3);
insert into Course values(303, 'Chemistry', 4);
insert into Course values(304, 'Biology', 3);
insert into Course values(305, 'English', 2);

Select * From Course;
/*'301', 'Mathematics', '4'
'302', 'Physics', '3'
'303', 'Chemistry', '4'
'304', 'Biology', '3'
'305', 'English', '2'
*/

insert into Enrollment Values (401, 101, 301, 'A');
insert into Enrollment Values (402, 102, 302, 'B+');
insert into Enrollment Values (403, 103, 303, 'A-');
insert into Enrollment Values (404, 104, 304, 'B');
insert into Enrollment Values (405, 105, 305, 'A+');

Select * From Enrollment;
/*'401', '101', '301', 'A'
'402', '102', '302', 'B+'
'403', '103', '303', 'A-'
'404', '104', '304', 'B'
'405', '105', '305', 'A+'
*/

-- 3.   Perform the below SQL functions on the Student database. 

-- 1.Display the details  of all students.
select * from Student;
/*'101', 'Aarav', 'Sharma', '2006-04-15', '10A', '88', 'Delhi'
'102', 'Isha', 'Verma', '2005-09-22', '12B', '92', 'Mumbai'
'103', 'Rohan', 'Mehta', '2007-01-10', '9C', '76', 'Bengaluru'
'104', 'Sneha', 'Patil', '2006-07-05', '10A', '81', 'Pune'
'105', 'Kabir', 'Singh', '2005-12-30', '12B', '95', 'Chennai'
*/

-- 2. Show the  last 3 characters of course names.
select substring(CourseName, -3)
from Course;
/*'ics'
'ics'
'try'
'ogy'
'ish'
*/

-- 3. Concatenate FirstName and LastName of teachers as fullname
select concat(FirstName, ' ' , LastName) AS FullName
from Teacher;
/*'Neha Reddy'
'Raj Kumar'
'Anita Joshi'
'Vikram Singh'
'Meera Nair'
*/

-- 4. Find the length of each student’s name.
select length(concat(FirstName, ' ', LastName)) AS NameLength 
FROM Student;
/*'12'
'10'
'11'
'11'
'11'
*/

-- 5.Replace the word "Maths" with "Mathematics" in the Course table. (use REPLACE function)
select replace(CourseName, 'Maths', 'Mathematics')
from Course;
/*'Mathematics'
'Physics'
'Chemistry'
'Biology'
'English'
*/

-- 6.Find the absolute difference between maximum and minimum marks.
select ABS(max(Marks)-min(Marks))
from Student;
-- '19'

-- 7. Round off teachers’ salaries to the nearest thousand.
select round(Salary, -3) 
from Teacher;
/*'55000'
'60000'
'58000'
'53000'
'57000'
*/

-- 8.Show the square root of each course credit.
select Credits,sqrt(Credits)
from Course;
/*'4', '2'
'3', '1.7320508075688772'
'4', '2'
'3', '1.7320508075688772'
'2', '1.4142135623730951'
*/

-- 9. Display students’ marks along with ceiling and floor values. 
select Marks, ceil(Marks), floor(Marks)
from Student;
/*'88', '88', '88'
'92', '92', '92'
'76', '76', '76'
'81', '81', '81'
'95', '95', '95'
*/

-- 10. Find the modulus of total marks divided by 5.
select Marks,mod(Marks, 5)
from Student;
/*'88', '3'
'92', '2'
'76', '1'
'81', '1'
'95', '0'
*/

-- 11. Display the current date and time.
select now();
-- '2025-09-10 21:44:03'

-- 12.Show the year and month of hire for all teachers.
select concat(FirstName, ' ', LastName), year(HireDate), monthname(HireDate), month(HireDate)
from Teacher;
/*'Neha Reddy', '2015', 'June', '6'
'Raj Kumar', '2017', 'August', '8'
'Anita Joshi', '2016', 'November', '11'
'Vikram Singh', '2018', 'January', '1'
'Meera Nair', '2019', 'September', '9'
*/

-- 13. List students who were born in January.
select * From Student
where month(DOB) = 1;
/*'103', 'Rohan', 'Mehta', '2007-01-10', '9C', '76', 'Bengaluru'
*/

-- 14. Find the difference in days between today and a teacher’s HireDate. 
select concat(FirstName, ' ', LastName), HireDate, curdate(), datediff(curdate(), HireDate)
from Teacher;
/*'Neha Reddy', '2015-06-12', '2025-09-10', '3743'
'Raj Kumar', '2017-08-25', '2025-09-10', '2938'
'Anita Joshi', '2016-11-03', '2025-09-10', '3233'
'Vikram Singh', '2018-01-20', '2025-09-10', '2790'
'Meera Nair', '2019-09-10', '2025-09-10', '2192'
*/

-- 15. Find the total number of students in the school. 
select count(StudentID)
from Student;
/*'5'
*/

-- 16. Calculate the average salary of teachers.
select avg(Salary)
from Teacher;
/*'56600.000000'
*/

-- 17. Find the highest and lowest marks in the Student table.
select max(Marks), min(Marks)
from Student;
/*'95', '76'
*/


