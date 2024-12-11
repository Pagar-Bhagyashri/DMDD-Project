use tms;
GO


-- STORED PROCEDURES
-- 1. Get Customer Booking History
CREATE PROCEDURE sp_GetCustomerBookingHistory
    @CustomerID INT
AS
BEGIN
    SELECT 
        b.Booking_ID,
        t.Name AS TourName,
        t.Start_Date,
        t.End_Date,
        b.Total_Cost AS TourCost,
        bil.Billing_Amount AS TotalAmount,
        bil.Payment_Status
    FROM Booking b
    JOIN Tour t ON b.Tour_ID = t.Tour_ID
    JOIN Billing bil ON b.Booking_ID = bil.Booking_ID
    WHERE b.Customer_ID = @CustomerID
    ORDER BY b.Booking_Date DESC;
END;

-- Get customer booking history
EXEC sp_GetCustomerBookingHistory @CustomerID = 1;



-- 2. Get Available Tours for Date Range
CREATE PROCEDURE sp_GetAvailableTours
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT 
        t.Tour_ID,
        t.Name,
        t.Tour_Description,
        t.Duration,
        t.Price,
        t.Start_Date,
        t.End_Date,
        COUNT(b.Booking_ID) AS CurrentBookings
    FROM Tour t
    LEFT JOIN Booking b ON t.Tour_ID = b.Tour_ID
    WHERE t.Start_Date >= @StartDate 
    AND t.End_Date <= @EndDate
    GROUP BY 
        t.Tour_ID, t.Name, t.Tour_Description, 
        t.Duration, t.Price, t.Start_Date, t.End_Date
    ORDER BY t.Start_Date;
END;


-- Test getting available tours
EXEC sp_GetAvailableTours 
    @StartDate = '2024-06-01',
    @EndDate = '2024-12-31';



-- 3. Get Employee Performance Report
CREATE PROCEDURE sp_GetEmployeePerformance
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT 
        e.Employee_ID,
        e.Employee_Name,
        COUNT(b.Booking_ID) AS TotalBookings,
        SUM(bil.Billing_Amount) AS TotalRevenue,
        COUNT(CASE WHEN bil.Payment_Status = 'Completed' THEN 1 END) AS CompletedBookings,
        COUNT(CASE WHEN bil.Payment_Status = 'Pending' THEN 1 END) AS PendingBookings
    FROM Employee e
    LEFT JOIN Booking b ON e.Employee_ID = b.Employee_ID
    LEFT JOIN Billing bil ON b.Booking_ID = bil.Booking_ID
    WHERE b.Booking_Date BETWEEN @StartDate AND @EndDate
    GROUP BY e.Employee_ID, e.Employee_Name
    ORDER BY TotalRevenue DESC;
END;



-- Test employee performance report
EXEC sp_GetEmployeePerformance
    @StartDate = '2024-01-01',
    @EndDate = '2024-12-31';


-- 4. Get Service Availability Report
CREATE PROCEDURE sp_GetServiceAvailability
    @ServiceType VARCHAR(50) = NULL,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT 
        s.Service_ID,
        s.Service_Name,
        s.Service_Type,
        s.Service_Price,
        v.Vendor_Name,
        COUNT(bs.Booking_ID) AS TimesBooked,
        s.Service_Availability
    FROM Service s
    JOIN Vendor v ON s.Vendor_ID = v.Vendor_ID
    LEFT JOIN Booking_Service bs ON s.Service_ID = bs.Service_ID
    LEFT JOIN Booking b ON bs.Booking_ID = b.Booking_ID
    WHERE (@ServiceType IS NULL OR s.Service_Type = @ServiceType)
    AND (bs.Check_In_Date BETWEEN @StartDate AND @EndDate
         OR bs.Check_In_Date IS NULL)
    GROUP BY 
        s.Service_ID, s.Service_Name, s.Service_Type,
        s.Service_Price, v.Vendor_Name, s.Service_Availability
    ORDER BY TimesBooked DESC;
END;


-- 2. Testing Service Availability Report
-- Example 1: Get all services for a date range
EXEC sp_GetServiceAvailability 
    @ServiceType = NULL,
    @StartDate = '2024-01-01',
    @EndDate = '2024-12-31';


-- User-defined functions UDF's

--1.GetCustomerAge
CREATE FUNCTION GetCustomerAge (@CustomerID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT

    SELECT @Age = DATEDIFF(YEAR, Date_Of_Birth, GETDATE())
    FROM Customer
    WHERE Customer_ID = @CustomerID

    RETURN ISNULL(@Age, 0)
END
GO

SELECT dbo.GetCustomerAge(1) AS CustomerAge;



--2.CalculateTourRevenue
CREATE FUNCTION CalculateTourRevenue (@TourID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(10, 2)

    SELECT @TotalRevenue = SUM(b.Total_Cost)
    FROM Booking b
    WHERE b.Tour_ID = @TourID

    RETURN ISNULL(@TotalRevenue, 0)
END
GO


SELECT dbo.CalculateTourRevenue(1) AS TourRevenue;



--3. GetCustomerBookingHistory
CREATE FUNCTION GetCustomerBookingHistory
(
    @CustomerID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        (SELECT COUNT(*) FROM Booking WHERE Customer_ID = @CustomerID) AS BookingCount,
        (SELECT ISNULL(SUM(Total_Cost), 0) FROM Booking WHERE Customer_ID = @CustomerID) AS TotalSpent,
        (
            SELECT TOP 1 s.Service_Type
            FROM Booking b
            JOIN Booking_Service bs ON b.Booking_ID = bs.Booking_ID
            JOIN Service s ON bs.Service_ID = s.Service_ID
            WHERE b.Customer_ID = @CustomerID
            GROUP BY s.Service_Type
            ORDER BY COUNT(*) DESC
        ) AS FavoriteServiceType
)


SELECT * FROM dbo.GetCustomerBookingHistory(1)


-- Views
CREATE VIEW vw_TourBookingDetails AS
SELECT 
    t.Name AS TourName,
    t.Start_Date,
    t.End_Date,
    COUNT(b.Booking_ID) AS TotalBookings,
    SUM(b.Total_Cost) AS TotalRevenue,
    AVG(b.Total_Cost) AS AverageBookingCost
FROM Tour t
LEFT JOIN Booking b ON t.Tour_ID = b.Tour_ID
GROUP BY t.Name, t.Start_Date, t.End_Date;


SELECT * FROM vw_TourBookingDetails;



CREATE VIEW vw_CustomerBookingHistory AS
SELECT 
    c.Name AS CustomerName,
    COUNT(b.Booking_ID) AS TotalBookings,
    SUM(bl.Billing_Amount) AS TotalSpent,
    MAX(b.Booking_Date) AS LastBookingDate
FROM Customer c
LEFT JOIN Booking b ON c.Customer_ID = b.Customer_ID
LEFT JOIN Billing bl ON b.Booking_ID = bl.Booking_ID
GROUP BY c.Name;


SELECT * FROM vw_CustomerBookingHistory;



CREATE VIEW vw_ServicePerformance AS
SELECT 
    s.Service_Name,
    v.Vendor_Name,
    COUNT(bs.Booking_ID) AS TimesBooked,
    SUM(bs.Total_service_cost) AS TotalRevenue,
    AVG(bs.Total_service_cost) AS AverageRevenue
FROM Service s
JOIN Vendor v ON s.Vendor_ID = v.Vendor_ID
LEFT JOIN Booking_Service bs ON s.Service_ID = bs.Service_ID
GROUP BY s.Service_Name, v.Vendor_Name;


SELECT * FROM vw_ServicePerformance;


-- DML Trigger for Booking Audit
CREATE TABLE BookingAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    BookingID INT,
    Action VARCHAR(10),
    ChangeDate DATETIME,
    UserName VARCHAR(100)
);


CREATE TRIGGER trg_BookingAudit
ON Booking
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO BookingAudit (BookingID, Action, ChangeDate, UserName)
    SELECT i.Booking_ID, 'INSERT', GETDATE(), SYSTEM_USER
    FROM inserted i
    UNION ALL
    SELECT d.Booking_ID, 'DELETE', GETDATE(), SYSTEM_USER
    FROM deleted d
    WHERE NOT EXISTS (SELECT 1 FROM inserted WHERE Booking_ID = d.Booking_ID)
    UNION ALL
    SELECT i.Booking_ID, 'UPDATE', GETDATE(), SYSTEM_USER
    FROM inserted i
    INNER JOIN deleted d ON i.Booking_ID = d.Booking_ID;
END;




-- 3. Test the trigger with INSERT
INSERT INTO Booking (Employee_ID, Customer_ID, Tour_ID, Booking_Date, Total_Cost)
VALUES (1, 1, 1, GETDATE(), 1500.00);



-- 4. Test the trigger with UPDATE
UPDATE Booking
SET Total_Cost = Total_Cost + 100
WHERE Booking_ID = (SELECT MAX(Booking_ID) FROM Booking);



-- 5. Test the trigger with DELETE
DELETE FROM Booking
WHERE Booking_ID = (SELECT MAX(Booking_ID) FROM Booking);


-- 6. View the audit results
SELECT * FROM BookingAudit ORDER BY ChangeDate DESC;


-- 7. More detailed view of audit results with booking details
SELECT 
    ba.AuditID,
    ba.BookingID,
    ba.Action,
    ba.ChangeDate,
    ba.UserName,
    b.Employee_ID,
    b.Customer_ID,
    b.Tour_ID,
    b.Total_Cost
FROM BookingAudit ba
LEFT JOIN Booking b ON ba.BookingID = b.Booking_ID
ORDER BY ba.ChangeDate DESC;


-- To see all triggers in the database:
SELECT * FROM sys.triggers WHERE parent_class = 1; -- 1 means table-level triggers





