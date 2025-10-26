create database FlightDB;
use FlightDB;


-- Passenger Table
CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Flight Table
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    Airline VARCHAR(50),
    Origin VARCHAR(50),
    Destination VARCHAR(50),
    DepartureTime DATETIME,
    ArrivalTime DATETIME
);

-- Booking Table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    BookingDate DATE,
    SeatNumber VARCHAR(10),
    Status VARCHAR(20),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

-- Passengers
INSERT INTO Passenger VALUES
(1, 'Namish M S', 'namish@example.com', '9876543210'),
(2, 'Aarav Patel', 'aarav.patel@example.com', '9123456780');

-- Flights
INSERT INTO Flight VALUES
(101, 'IndiGo', 'Bengaluru', 'Delhi', '2025-10-27 08:00:00', '2025-10-27 10:30:00'),
(102, 'Air India', 'Mumbai', 'Chennai', '2025-10-28 14:00:00', '2025-10-28 16:15:00');

-- Bookings
INSERT INTO Booking VALUES
(1001, 1, 101, '2025-10-20', '12A', 'Confirmed'),
(1002, 2, 102, '2025-10-21', '14C', 'Confirmed');

-- aggregate functions
-- to find total passengers per flight

select FlightID, count(*) AS TotalPassengers
from Booking 
group by FlightID;
/*'101', '1'
'102', '1'
*/

-- joins to display flight details for each passengers

SELECT 
    P.FullName,
    F.Airline,
    F.Origin,
    F.Destination,
    F.DepartureTime,
    B.SeatNumber,
    B.Status
FROM 
    Booking B
JOIN 
    Passenger P ON B.PassengerID = P.PassengerID
JOIN 
    Flight F ON B.FlightID = F.FlightID;
/*'Namish M S', 'IndiGo', 'Bengaluru', 'Delhi', '2025-10-27 08:00:00', '12A', 'Confirmed'
'Aarav Patel', 'Air India', 'Mumbai', 'Chennai', '2025-10-28 14:00:00', '14C', 'Confirmed'
*/

-- Inserting procedure
Delimiter $$
create procedure InsertBooking(
	in p_BookingID int,
    in p_PassengerID int,
    in p_FlightID int,
    in p_BookingDate date,
    in p_SeatNumber varchar(10),
    in p_Status varchar(20)
)

Begin
	insert into Booking (BookingID, PassengerID, FlightID, BookingDate, SeatNumber, Status) 
    values (p_BookingID, p_PassengerID, p_FlightID, p_BookingDate, p_SeatNumber, p_Status);
End $$

Delimiter ;

call InsertBooking(1003, 2, 101, '2025-10-25', '16A', 'Confrimed');

Select * from Booking;
/*'1001', '1', '101', '2025-10-20', '12A', 'Confirmed'
'1002', '2', '102', '2025-10-21', '14C', 'Confirmed'
'1003', '2', '101', '2025-10-25', '16A', 'Confrimed'
*/

-- updating procedure
delimiter $$
create procedure UpdatingBookingStatus(
	in p_BookingID int,
    in p_NewStatus varchar(20)
)
begin
	update Booking
    set Status = p_NewStatus
    where BookingID = p_BookingID;
end $$
delimiter ;

call UpdatingBookingStatus(1002, 'Cancelled');

select *  from Booking;
/*'1001', '1', '101', '2025-10-20', '12A', 'Confirmed'
'1002', '2', '102', '2025-10-21', '14C', 'Cancelled'
'1003', '2', '101', '2025-10-25', '16A', 'Confrimed'
*/