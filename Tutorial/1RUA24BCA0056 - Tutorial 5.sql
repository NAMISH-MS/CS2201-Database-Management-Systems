create database TechNova_Pvt_Ltd;
use TechNova_Pvt_Ltd;

-- Creating tables

create table Department(
	dept_id int primary key,
    dept_name varchar(50),
    location varchar(50)
);

create table Employee(
	emp_id int primary key,
    emp_name varchar(50),
    age int,
    salary decimal(10, 2),
    designation varchar(50),
    address varchar(50),
    doj date,
    dept_id int,
    foreign key (dept_id) references Department(dept_id)
);

-- inserting data

insert into Department values
(101, 'Human Resources', 'Bengaluru'),
(102, 'Engineering', 'Hyderabad'),
(103, 'Marketing', 'Mumbai'),
(104, 'Finance', 'Delhi');


insert into Employee values
(1, 'Aarav Mehta', 29, 75000.00, 'Developer', 'Koramangala, Bengaluru', '2022-06-15', 102),
(2, 'Sneha Rao', 35, 92000.00, 'HR Manager', 'Indiranagar, Bengaluru', '2021-03-10', 101),
(3, 'Rohan Desai', 31, 68000.00, 'Marketing Executive', 'Andheri East, Mumbai', '2023-01-20', 103),
(4, 'Priya Nair', 28, 85000.00, 'Financial Analyst', 'Connaught Place, Delhi', '2022-09-05', 104),
(5, 'Karthik Iyer', 40, 105000.00, 'Engineering Lead', 'Gachibowli, Hyderabad', '2020-11-30', 102);

-- update query

update Employee
set salary = salary + 5000
where designation = 'Developer';

-- select wit aggregate functions

select 
    d.dept_id,
    d.dept_name,
    count(e.emp_id) as total_employees,
    avg(e.salary) as average_salary,
    max(e.salary) as highest_salary,
    min(e.salary) as lowest_salary
from 
    department d
join 
    employee e on d.dept_id = e.dept_id
group by 
    d.dept_id, d.dept_name;
    
/*'102', 'Engineering', '2', '92500.000000', '105000.00', '80000.00'
'101', 'Human Resources', '1', '92000.000000', '92000.00', '92000.00'
'103', 'Marketing', '1', '68000.000000', '68000.00', '68000.00'
'104', 'Finance', '1', '85000.000000', '85000.00', '85000.00'
*/

-- select with string functions

select 
    upper(emp_name) as emp_name_upper,
    upper(designation) as designation_upper,
    concat(emp_name, ' works as ', designation) as job_summary
from 
    Employee;

/*'AARAV MEHTA', 'DEVELOPER', 'Aarav Mehta works as Developer'
'SNEHA RAO', 'HR MANAGER', 'Sneha Rao works as HR Manager'
'ROHAN DESAI', 'MARKETING EXECUTIVE', 'Rohan Desai works as Marketing Executive'
'PRIYA NAIR', 'FINANCIAL ANALYST', 'Priya Nair works as Financial Analyst'
'KARTHIK IYER', 'ENGINEERING LEAD', 'Karthik Iyer works as Engineering Lead'
*/

-- select with date functions

select 
    emp_name,
    year(doj) as joining_year,
    datediff(year, doj, curdate()) as years_worked
from 
    Employee;
    
 /*'Aarav Mehta', '2022', '3'
'Sneha Rao', '2021', '4'
'Rohan Desai', '2023', '2'
'Priya Nair', '2022', '3'
'Karthik Iyer', '2020', '4'
*/


-- selecting using operations

select 
    e.emp_name,
    e.salary
from 
    employee e
join 
    department d on e.dept_id = d.dept_id
where 
    e.salary between 40000 and 80000
    and d.dept_name <> 'Sales';
    
/*'Aarav Mehta', '80000.00'
'Rohan Desai', '68000.00'
*/

-- inner join query
select 
    e.emp_name,
    e.designation,
    d.dept_name,
    d.location
from 
    employee e
inner join 
    department d on e.dept_id = d.dept_id;

/*'Sneha Rao', 'HR Manager', 'Human Resources', 'Bengaluru'
'Aarav Mehta', 'Developer', 'Engineering', 'Hyderabad'
'Karthik Iyer', 'Engineering Lead', 'Engineering', 'Hyderabad'
'Rohan Desai', 'Marketing Executive', 'Marketing', 'Mumbai'
'Priya Nair', 'Financial Analyst', 'Finance', 'Delhi'
*/

-- left outer join
select 
    e.emp_name,
    e.designation,
    d.dept_name
from 
    employee e
left join 
    department d on e.dept_id = d.dept_id;
    
/*'Aarav Mehta', 'Developer', 'Engineering'
'Sneha Rao', 'HR Manager', 'Human Resources'
'Rohan Desai', 'Marketing Executive', 'Marketing'
'Priya Nair', 'Financial Analyst', 'Finance'
'Karthik Iyer', 'Engineering Lead', 'Engineering'
*/

-- right outer join

select 
    e.emp_name,
    e.designation,
    d.dept_name,
    d.location
from 
    employee e
right join 
    department d on e.dept_id = d.dept_id;
    
/*'Sneha Rao', 'HR Manager', 'Human Resources', 'Bengaluru'
'Aarav Mehta', 'Developer', 'Engineering', 'Hyderabad'
'Karthik Iyer', 'Engineering Lead', 'Engineering', 'Hyderabad'
'Rohan Desai', 'Marketing Executive', 'Marketing', 'Mumbai'
'Priya Nair', 'Financial Analyst', 'Finance', 'Delhi'
*/

-- stored procedure - insert

delimiter //

create procedure InsertEmployee (
    in p_emp_id int,
    in p_emp_name varchar(50),
    in p_age int,
    in p_salary decimal(10,2),
    in p_designation varchar(50),
    in p_address varchar(50),
    in p_doj date,
    in p_dept_id int
)
begin
    insert into employee (
        emp_id, emp_name, age, salary, designation, address, doj, dept_id
    ) values (
        p_emp_id, p_emp_name, p_age, p_salary, p_designation, p_address, p_doj, p_dept_id
    );
end //

delimiter ;

-- stored procedure - update

delimiter //

create procedure UpdateSalary (
    in p_emp_id int,
    in p_new_salary decimal(10,2)
)
begin
    update employee
    set salary = p_new_salary
    where emp_id = p_emp_id;
end //

delimiter ;

-- stored procedure - delete

delimiter //

create procedure DeleteEmployee (
    in p_emp_id int
)
begin
    delete from employee
    where emp_id = p_emp_id;
end //

delimiter ;

-- comprehensive query

select 
    e.emp_name,
    d.dept_name,
    timestampdiff(year, e.doj, curdate()) as years_worked,
    e.salary + 5000 as salary_after_increment
from 
    employee e
join 
    department d on e.dept_id = d.dept_id
where 
    timestampdiff(year, e.doj, curdate()) > 2;

/*'Sneha Rao', 'Human Resources', '4', '97000.00'
'Aarav Mehta', 'Engineering', '3', '85000.00'
'Karthik Iyer', 'Engineering', '4', '110000.00'
'Priya Nair', 'Finance', '3', '90000.00'
*/
