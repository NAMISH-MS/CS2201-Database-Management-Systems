-- Lab Experiment 08: Implementation of Procedure ( insert, update and delete)
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- 'root@localhost', 'LAPTOP-BMPMMU9A', '8.0.42', '2025-10-13 11:32:14'

-- Scenario: Employee Management System
-- CREATE AND LOAD THE database DBLab008
-- Write your SQL query below Codespace:

create database DBLab008;
use DBLab008;

-- Task 1: Create the Employee Table
-- Create a table to store information about Employee.
-- Include the following columns:
 --   empid INT PRIMARY KEY,
   -- empname VARCHAR(50),
   -- age INT,
   -- salary DECIMAL(10,2),
   -- designation VARCHAR(30),
   -- address VARCHAR(100),
   -- date_of_join DATE
-- Write your SQL query below Codespace:

create table Employee(
	empid INT PRIMARY KEY,
	empname VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    designation VARCHAR(30),
    address VARCHAR(100),
    date_of_join DATE
);

-- DESCRIBE THE SCHEMA -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
desc Employee;
/*'empid', 'int', 'NO', 'PRI', NULL, ''
'empname', 'varchar(50)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
'salary', 'decimal(10,2)', 'YES', '', NULL, ''
'designation', 'varchar(30)', 'YES', '', NULL, ''
'address', 'varchar(100)', 'YES', '', NULL, ''
'date_of_join', 'date', 'YES', '', NULL, ''
*/

-- insert 10 records to the table 
-- Write your SQL query below Codespace:

insert into Employee values 
(101, 'Aarav Mehta', 28, 55000.00, 'Software Engineer', 'Bengaluru, Karnataka', '2022-06-15'),
(102, 'Sneha Reddy', 32, 72000.00, 'Data Analyst', 'Hyderabad, Telangana', '2021-03-10'),
(103, 'Rohan Das', 45, 95000.00, 'Project Manager', 'Mumbai, Maharashtra', '2018-11-01'),
(104, 'Meera Iyer', 26, 48000.00, 'UI/UX Designer', 'Chennai, Tamil Nadu', '2023-01-20'),
(105, 'Kunal Sharma', 38, 88000.00, 'DevOps Engineer', 'Pune, Maharashtra', '2019-08-05'),
(106, 'Priya Nair', 30, 61000.00, 'Business Analyst', 'Kochi, Kerala', '2020-02-12'),
(107, 'Vikram Singh', 41, 102000.00, 'Tech Lead', 'Noida, Uttar Pradesh', '2017-07-18'),
(108, 'Tanvi Joshi', 29, 53000.00, 'QA Engineer', 'Nagpur, Maharashtra', '2022-09-25'),
(109, 'Aditya Rao', 35, 78000.00, 'Database Administrator', 'Visakhapatnam, Andhra Pradesh', '2020-11-30'),
(110, 'Neha Kapoor', 27, 60000.00, 'Content Strategist', 'Delhi', '2023-04-10');



-- COPYPASTE OF THE OUTPUT in CSV Format and terminate with ;
select * from Employee;

/*'101', 'Aarav Mehta', '28', '55000.00', 'Software Engineer', 'Bengaluru, Karnataka', '2022-06-15'
'102', 'Sneha Reddy', '32', '72000.00', 'Data Analyst', 'Hyderabad, Telangana', '2021-03-10'
'103', 'Rohan Das', '45', '95000.00', 'Project Manager', 'Mumbai, Maharashtra', '2018-11-01'
'104', 'Meera Iyer', '26', '48000.00', 'UI/UX Designer', 'Chennai, Tamil Nadu', '2023-01-20'
'105', 'Kunal Sharma', '38', '88000.00', 'DevOps Engineer', 'Pune, Maharashtra', '2019-08-05'
'106', 'Priya Nair', '30', '61000.00', 'Business Analyst', 'Kochi, Kerala', '2020-02-12'
'107', 'Vikram Singh', '41', '102000.00', 'Tech Lead', 'Noida, Uttar Pradesh', '2017-07-18'
'108', 'Tanvi Joshi', '29', '53000.00', 'QA Engineer', 'Nagpur, Maharashtra', '2022-09-25'
'109', 'Aditya Rao', '35', '78000.00', 'Database Administrator', 'Visakhapatnam, Andhra Pradesh', '2020-11-30'
'110', 'Neha Kapoor', '27', '60000.00', 'Content Strategist', 'Delhi', '2023-04-10'
*/

-- perform the following procedures on the employee database and copy paste the output in the space provided
-- A. Insert Procedure

-- 1. Write a stored procedure named InsertEmployee to insert a new employee record into the Employee table with all fields as input parameters.
DELIMITER //

create procedure InsertEmployee(
    in p_empid int,
    in p_empname varchar(50),
    in p_age int,
    in p_salary decimal(10,2),
    in p_designation varchar(30),
    in p_address varchar(100),
    in p_date_of_join date
)
begin
    insert into Employee(empid, empname, age, salary, designation, address, date_of_join)
    values (p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join);
end //

DELIMITER ;

-- 2. Modify the insert procedure to ensure the employee’s age must be between 18 and 60.
      -- If not, display a message: "Invalid age, employee not added."

DELIMITER //

create procedure InsertEmployeeWithAgeCheck(
    in p_empid int,
    in p_empname varchar(50),
    in p_age int,
    in p_salary decimal(10,2),
    in p_designation varchar(30),
    in p_address varchar(100),
    in p_date_of_join date
)
begin
    if p_age between 18 and 60 then
        insert into Employee(empid, empname, age, salary, designation, address, date_of_join)
        values (p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join);
   else
        select 'Invalid age, employee not added.' as Message;
    end if;
end //

DELIMITER ;

-- 3. Create a procedure that inserts a new employee record.
          -- If the salary is not provided, assign a default salary of 20000.
DELIMITER //

create procedure InsertEmployeeWithDefaultSalary(
    in p_empid int,
    in p_empname varchar(50),
    in p_age int,
    in p_salary decimal(10,2),
    in p_designation varchar(30),
    in p_address varchar(100),
    in p_date_of_join date
)
begin
    declare v_salary decimal(10,2);

    if p_salary is null then
        set v_salary = 20000.00;
    else
        set v_salary = p_salary;
    end if;

    insert into Employee(empid, empname, age, salary, designation, address, date_of_join)
    values(p_empid, p_empname, p_age, v_salary, p_designation, p_address, p_date_of_join);
end //

DELIMITER ;
          

-- 4. Write a procedure that inserts three new employee records in a single procedure using multiple INSERT statements.
DELIMITER //

create procedure InsertThreeEmployees()
begin
    insert into Employee(empid, empname, age, salary, designation, address, date_of_join)
    values (111, 'Rajiv Menon', 34, 65000.00, 'System Analyst', 'Bengaluru, Karnataka', '2022-05-10');

    insert into Employee(empid, empname, age, salary, designation, address, date_of_join)
    values (112, 'Anjali Verma', 29, 58000.00, 'HR Executive', 'Lucknow, Uttar Pradesh', '2021-12-01');

    insert into Employee(empid, empname, age, salary, designation, address, date_of_join)
    values (113, 'Farhan Khan', 40, 72000.00, 'Network Engineer', 'Ahmedabad, Gujarat', '2020-08-20');
end //

DELIMITER ;


-- B.  Update Procedure
/*
Update Salary:
Write a stored procedure named UpdateSalary to update an employee’s salary based on their empid.

Increment Salary by Percentage:
Create a procedure to increase the salary by 10% for all employees whose designation = 'Manager'.

Update Designation:
Write a procedure to update the designation of an employee by empid.
Example: Promote an employee from 'Clerk' to 'Senior Clerk'.

Update Address:
Write a procedure to update the address of an employee when empid is given as input.

Conditional Update (Age Check):
Create a procedure that updates salary only if the employee’s age > 40; otherwise, print "Not eligible for salary update."

*/

-- 1.
DELIMITER //

create procedure UpdateSalary(
    in p_empid int,
    in p_new_salary decimal(10,2)
)
begin
    update Employee
    set salary = p_new_salary
    where empid = p_empid;
end //

DELIMITER ;

-- 2.
DELIMITER //

create procedure IncrementManagerSalary()
begin
    update Employee
    set salary = salary * 1.10
    where designation = 'Manager';
end //

DELIMITER ;

-- 3.

DELIMITER //

create procedure UpdateDesignation(
    in p_empid int,
    in p_new_designation varchar(30)
)
begin
    update Employee
    set designation = p_new_designation
    where empid = p_empid;
end //

DELIMITER ;

-- 4.
DELIMITER //

create procedure UpdateAddress(
    in p_empid int,
    in p_new_address varchar(100)
)
begin
    update Employee
    set address = p_new_address
    where empid = p_empid;
end //

DELIMITER ;

-- 5.
DELIMITER //

create procedure ConditionalSalaryUpdate(
    in p_empid int,
    in p_new_salary decimal(10,2)
)
begin
    declare v_age int;

    select age into v_age from Employee where empid = p_empid;

    if v_age > 40 then
        update Employee
        set salary = p_new_salary
        where empid = p_empid;
    else
        select 'Not eligible for salary update.' as Message;
    end if;
end //

DELIMITER ;




-- C. Delete Procedure
/*
Delete by empid:
Write a stored procedure named DeleteEmployee to delete an employee record using their empid.

Delete by Designation:
Create a procedure that deletes all employees belonging to a specific designation (e.g., 'Intern').

Delete Based on Salary Range:
Write a procedure to delete employees whose salary is less than ₹15000.

Delete by Joining Year:
Write a procedure to delete employees who joined before the year 2015.
*/

-- 1. 
DELIMITER //

CREATE PROCEDURE DeleteEmployee(
    IN p_empid INT
)
BEGIN
    DELETE FROM Employee
    WHERE empid = p_empid;
END //

DELIMITER ;

-- 2.
DELIMITER //

CREATE PROCEDURE DeleteByDesignation(
    IN p_designation VARCHAR(30)
)
BEGIN
    DELETE FROM Employee
    WHERE designation = p_designation;
END //

DELIMITER ;

-- 3. 
DELIMITER //

CREATE PROCEDURE DeleteBySalaryRange()
BEGIN
    DELETE FROM Employee
    WHERE salary < 15000.00;
END //

DELIMITER ;

-- 4.
DELIMITER //

CREATE PROCEDURE DeleteByJoiningYear()
BEGIN
    DELETE FROM Employee
    WHERE YEAR(date_of_join) < 2015;
END //

DELIMITER ;


-- End of Lab Experiment 
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
