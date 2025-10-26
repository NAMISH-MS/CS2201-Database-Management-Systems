create database Hospital_Management_System;
use Hospital_Management_System;

-- Creating Tables
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(50),
    Phone VARCHAR(15)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender CHAR(1),
    DOB DATE,
    Phone VARCHAR(15)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- inseratiing the values 

INSERT INTO Doctors VALUES
(1, 'Dr. Asha Mehta', 'Cardiology', '9876543210'),
(2, 'Dr. Rajiv Nair', 'Orthopedics', '9876543211'),
(3, 'Dr. Neha Sharma', 'Pediatrics', '9876543212');

INSERT INTO Patients VALUES
(101, 'Ravi Kumar', 'M', '1990-05-12', '9123456780'),
(102, 'Sneha Reddy', 'F', '1985-08-23', '9123456781'),
(103, 'Amit Joshi', 'M', '2000-01-15', '9123456782'),
(104, 'Priya Verma', 'F', '1995-11-30', '9123456783');


INSERT INTO Appointments VALUES
(1001, 101, 1, '2025-10-25', 'Completed'),
(1002, 102, 2, '2025-10-26', 'Scheduled'),
(1003, 103, 1, '2025-10-26', 'Scheduled'),
(1004, 104, 3, '2025-10-27', 'Scheduled');


-- Performing joins

-- Inner join shows appointments with doctor and paitient details
SELECT 
    a.AppointmentID,
    p.Name AS PatientName,
    d.Name AS DoctorName,
    d.Specialization,
    a.AppointmentDate,
    a.Status
FROM Appointments a
Inner JOIN Patients p ON a.PatientID = p.PatientID
Inner JOIN Doctors d ON a.DoctorID = d.DoctorID;
/*'1001', 'Ravi Kumar', 'Dr. Asha Mehta', 'Cardiology', '2025-10-25', 'Completed'
'1003', 'Amit Joshi', 'Dr. Asha Mehta', 'Cardiology', '2025-10-26', 'Scheduled'
'1002', 'Sneha Reddy', 'Dr. Rajiv Nair', 'Orthopedics', '2025-10-26', 'Scheduled'
'1004', 'Priya Verma', 'Dr. Neha Sharma', 'Pediatrics', '2025-10-27', 'Scheduled'
*/

Select *
From Appointments AS A
Inner Join Doctors AS D on A.DoctorID = D.DoctorID
Inner Join Patients AS P on A.PatientID = P.PatientID;
/*'1001', '101', '1', '2025-10-25', 'Completed', '1', 'Dr. Asha Mehta', 'Cardiology', '9876543210', '101', 'Ravi Kumar', 'M', '1990-05-12', '9123456780'
'1003', '103', '1', '2025-10-26', 'Scheduled', '1', 'Dr. Asha Mehta', 'Cardiology', '9876543210', '103', 'Amit Joshi', 'M', '2000-01-15', '9123456782'
'1002', '102', '2', '2025-10-26', 'Scheduled', '2', 'Dr. Rajiv Nair', 'Orthopedics', '9876543211', '102', 'Sneha Reddy', 'F', '1985-08-23', '9123456781'
'1004', '104', '3', '2025-10-27', 'Scheduled', '3', 'Dr. Neha Sharma', 'Pediatrics', '9876543212', '104', 'Priya Verma', 'F', '1995-11-30', '9123456783'
*/

-- Left Join
-- Show all the patients even if they dont have an appointment

select *
from Patients as P
Left Join Appointments as A
ON P.PatientID = A.PatientID;

/*'101', 'Ravi Kumar', 'M', '1990-05-12', '9123456780', '1001', '101', '1', '2025-10-25', 'Completed'
'102', 'Sneha Reddy', 'F', '1985-08-23', '9123456781', '1002', '102', '2', '2025-10-26', 'Scheduled'
'103', 'Amit Joshi', 'M', '2000-01-15', '9123456782', '1003', '103', '1', '2025-10-26', 'Scheduled'
'104', 'Priya Verma', 'F', '1995-11-30', '9123456783', '1004', '104', '3', '2025-10-27', 'Scheduled'
*/

-- Aggregate Functions
-- Count total patients handeled per doctor

SELECT 
    d.DoctorID,
    d.Name AS DoctorName,
    COUNT(a.PatientID) AS TotalPatients
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, d.Name;
/*'1', 'Dr. Asha Mehta', '2'
'2', 'Dr. Rajiv Nair', '1'
'3', 'Dr. Neha Sharma', '1'
*/

-- Procedure

-- procedure to insert a new appointment
DELIMITER $$

create procedure InsertAppointment(
	in p_AppointmentID int,
    in p_PatientID int,
    in p_DoctorID int,
    in p_AppointmentDate date,
    in p_status varchar(20)
)
Begin
	insert into Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Status)
    Values (
		p_AppointmentID,
        p_PatientID,
        p_DoctorID,
        p_AppointmentDate,
        p_Status
	);
End $$
DELIMITER ;

call InsertAppointment(1005, 104, 2, '2025-10-28', 'Scheduled');

drop procedure InsertAppointment;


-- procedure to update appointment status
DELIMITER $$
create procedure UpdateAppointmentStatus(
	in p_AppointmentID int,
    in p_NewStatus varchar(20)
)
Begin
	update Appointments
    set Status = p_NewStatus
    where AppointmentID = p_AppointmentID;
End $$
DELIMITER ;

call UpdateAppointmentStatus(1002, 'Completed');


drop procedure UpdateAppointmentStatus;

select * from Appointments;
/*'1001', '101', '1', '2025-10-25', 'Completed'
'1002', '102', '2', '2025-10-26', 'Completed'
'1003', '103', '1', '2025-10-26', 'Scheduled'
'1004', '104', '3', '2025-10-27', 'Scheduled'
'1005', '104', '2', '2025-10-28', 'Scheduled'
*/
