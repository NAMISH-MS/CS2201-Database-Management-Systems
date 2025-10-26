create database HotelDB;
use HotelDB;

-- Guests Table
CREATE TABLE Guests (
    GuestID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT
);

-- Rooms Table
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    RoomNumber VARCHAR(10) UNIQUE NOT NULL,
    RoomType VARCHAR(50) NOT NULL,
    PricePerNight DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) DEFAULT 'Available'
);

-- Bookings Table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    GuestID INT,
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    BookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);


-- Guests
INSERT INTO Guests (GuestID, FullName, PhoneNumber, Email, Address)
VALUES 
(101, 'Amit Sharma', '9876543210', 'amit@example.com', 'Delhi'),
(102, 'Priya Menon', '9123456789', 'priya@example.com', 'Bangalore');

-- Rooms
INSERT INTO Rooms (RoomID, RoomNumber, RoomType, PricePerNight, Status)
VALUES 
(201, '101', 'Deluxe', 3500.00, 'Available'),
(202, '102', 'Suite', 5000.00, 'Available'),
(203, '103', 'Standard', 2500.00, 'Available');

-- Bookings
INSERT INTO Bookings (BookingID, GuestID, RoomID, CheckInDate, CheckOutDate)
VALUES 
(301, 101, 201, '2025-10-20', '2025-10-23'),
(302, 102, 202, '2025-10-22', '2025-10-25');


-- Revenue per room type
SELECT 
    R.RoomType,
    SUM(DATEDIFF(B.CheckOutDate, B.CheckInDate) * R.PricePerNight) AS TotalRevenue
FROM 
    Bookings B
JOIN 
    Rooms R ON B.RoomID = R.RoomID
GROUP BY 
    R.RoomType;
    
/*'Deluxe', '10500.00'
'Suite', '15000.00'
*/

-- booking duration
SELECT 
    G.FullName,
    B.BookingID,
    DATEDIFF(B.CheckOutDate, B.CheckInDate) AS DurationDays
FROM 
    Bookings B
JOIN 
    Guests G ON B.GuestID = G.GuestID;
    /*'Amit Sharma', '301', '3'
'Priya Menon', '302', '3'
*/
    
 -- guest and booing details
 SELECT 
    B.BookingID,
    G.FullName,
    R.RoomNumber,
    R.RoomType,
    B.CheckInDate,
    B.CheckOutDate
FROM 
    Bookings B
JOIN Guests G ON B.GuestID = G.GuestID
JOIN Rooms R ON B.RoomID = R.RoomID;

/*'301', 'Amit Sharma', '101', 'Deluxe', '2025-10-20', '2025-10-23'
'302', 'Priya Menon', '102', 'Suite', '2025-10-22', '2025-10-25'
*/


-- inserting procedure

 DELIMITER $$

CREATE PROCEDURE InsertBookingManual (
    IN p_BookingID INT,
    IN p_GuestID INT,
    IN p_RoomID INT,
    IN p_CheckIn DATE,
    IN p_CheckOut DATE
)
BEGIN
    DECLARE room_status VARCHAR(20);
    
    SELECT Status INTO room_status FROM Rooms WHERE RoomID = p_RoomID;
    
    IF room_status = 'Available' THEN
        INSERT INTO Bookings (BookingID, GuestID, RoomID, CheckInDate, CheckOutDate)
        VALUES (p_BookingID, p_GuestID, p_RoomID, p_CheckIn, p_CheckOut);
        
        UPDATE Rooms SET Status = 'Booked' WHERE RoomID = p_RoomID;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Room is not available';
    END IF;
END$$

DELIMITER ;

CALL InsertBookingManual(303, 101, 201, '2025-11-01', '2025-11-04');

-- Updating procedure
DELIMITER $$

CREATE PROCEDURE UpdateBookingSimple (
    IN p_BookingID INT,
    IN p_NewCheckIn DATE,
    IN p_NewCheckOut DATE
)
BEGIN
    UPDATE Bookings
    SET 
        CheckInDate = p_NewCheckIn,
        CheckOutDate = p_NewCheckOut
    WHERE 
        BookingID = p_BookingID;
END$$

DELIMITER ;
CALL UpdateBookingSimple(303, '2025-11-02', '2025-11-05');