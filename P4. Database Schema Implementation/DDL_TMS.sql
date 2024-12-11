DROP DATABASE IF EXISTS tms;

--IF OBJECT_ID('Billing', 'U') IS NOT NULL DROP TABLE Billing;
--IF OBJECT_ID('Booking_Service', 'U') IS NOT NULL DROP TABLE Booking_Service;
--IF OBJECT_ID('Booking', 'U') IS NOT NULL DROP TABLE Booking;
--IF OBJECT_ID('Tour_Employee', 'U') IS NOT NULL DROP TABLE Tour_Employee;
--IF OBJECT_ID('Activity', 'U') IS NOT NULL DROP TABLE Activity;
--IF OBJECT_ID('Meal', 'U') IS NOT NULL DROP TABLE Meal;
--IF OBJECT_ID('Transportation', 'U') IS NOT NULL DROP TABLE Transportation;
--IF OBJECT_ID('Accommodation', 'U') IS NOT NULL DROP TABLE Accommodation;
--IF OBJECT_ID('Service', 'U') IS NOT NULL DROP TABLE Service;
--IF OBJECT_ID('Vendor', 'U') IS NOT NULL DROP TABLE Vendor;
--IF OBJECT_ID('Tour', 'U') IS NOT NULL DROP TABLE Tour;
--IF OBJECT_ID('Customer', 'U') IS NOT NULL DROP TABLE Customer;
--IF OBJECT_ID('Employee', 'U') IS NOT NULL DROP TABLE Employee;
create database tms;

use tms;

CREATE TABLE Employee (
    Employee_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_Name NVARCHAR(100) NOT NULL,
    Employee_Role NVARCHAR(50),
    Department NVARCHAR(100),
    Email NVARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Hire_Date DATE NOT NULL,
    Salary DECIMAL(10, 2) CHECK (Salary >= 0)
);


CREATE TABLE Customer (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT NOT NULL,
    [Name] NVARCHAR(100) NOT NULL,
    Phone_Number VARCHAR(15) CHECK (Phone_Number LIKE '[0-9]%'),
    Email NVARCHAR(100) NOT NULL,
    Street_Address NVARCHAR(200),
    City NVARCHAR(100),
    [State] NVARCHAR(50),
    Zip_Code CHAR(5) CHECK (Zip_Code LIKE '[0-9][0-9][0-9][0-9][0-9]'),
    Date_Of_Birth DATE,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);



CREATE TABLE Tour (
    Tour_ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Tour_Description NVARCHAR(255),
    Duration INT CHECK (Duration > 0),
    Price DECIMAL(10, 2) CHECK (Price >= 0),
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    CHECK (End_Date >= Start_Date)
);

CREATE TABLE Booking (
    Booking_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Tour_ID INT NOT NULL,
    Booking_Date DATE NOT NULL,
    Total_Cost DECIMAL(10, 2) CHECK (Total_Cost >= 0),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID)
);


CREATE TABLE Vendor (
    Vendor_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT NOT NULL,
    Vendor_Name NVARCHAR(100) NOT NULL,
    Vendor_Contact NVARCHAR(100),
    Vendor_Type NVARCHAR(50) CHECK (Vendor_Type IN ('Accommodation', 'Transport', 'Meal', 'Activity')),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Service (
    Service_ID INT IDENTITY(1,1) PRIMARY KEY,
    Vendor_ID INT NOT NULL,
    [Service_Name] NVARCHAR(100) NOT NULL,
    Service_Price DECIMAL(10, 2) CHECK (Service_Price >= 0),
    Service_Availability NVARCHAR(50),
    Service_Type NVARCHAR(50) CHECK (Service_Type IN ('Accommodation', 'Transport', 'Meal', 'Activity')),
    FOREIGN KEY (Vendor_ID) REFERENCES Vendor(Vendor_ID)
);




CREATE TABLE Booking_Service (
    Booking_ID INT,
    Service_ID INT,
    Quantity INT CHECK (Quantity > 0),
    Total_service_cost DECIMAL(10, 2) CHECK (Total_service_cost >= 0),
    Check_In_Date DATE,
    Check_Out_Date DATE,
    PRIMARY KEY (Booking_ID, Service_ID),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID),
    FOREIGN KEY (Service_ID) REFERENCES [Service](Service_ID),
    -- Table-level CHECK constraint for Check_Out_Date > Check_In_Date
    CHECK (Check_Out_Date > Check_In_Date)
);

CREATE TABLE Accommodation (
    Accommodation_ID INT IDENTITY(1,1) PRIMARY KEY,  -- Unique ID for Accommodation
    Service_ID INT NOT NULL,                         -- Foreign key to Service table
    Room_Type VARCHAR(50) NOT NULL,
    FOREIGN KEY (Service_ID) REFERENCES Service(Service_ID)
);

CREATE TABLE Transportation (
    Transportation_ID INT IDENTITY(1,1) PRIMARY KEY,  -- Unique ID for Transportation
    Service_ID INT NOT NULL,                          -- Foreign key to Service table
    Vehicle_Model VARCHAR(100) NOT NULL,
    Vehicle_Capacity INT CHECK (Vehicle_Capacity > 0),
    FOREIGN KEY (Service_ID) REFERENCES Service(Service_ID)
);

CREATE TABLE Meal (
    Meal_ID INT IDENTITY(1,1) PRIMARY KEY,           -- Unique ID for Meal
    Service_ID INT NOT NULL,                          -- Foreign key to Service table
    Meal_Type VARCHAR(50) NOT NULL,
    Cuisine_Type VARCHAR(50) NOT NULL,
    FOREIGN KEY (Service_ID) REFERENCES Service(Service_ID)
);


CREATE TABLE Activity (
    Activity_ID INT IDENTITY(1,1) PRIMARY KEY,       -- Unique ID for Activity
    Service_ID INT NOT NULL,                          -- Foreign key to Service table
    Activity_Name VARCHAR(100) NOT NULL,
    Activity_Type VARCHAR(50),
    Activity_Duration INT CHECK (Activity_Duration > 0),
    FOREIGN KEY (Service_ID) REFERENCES Service(Service_ID)
);





CREATE TABLE Tour_Employee (
    Employee_ID INT NOT NULL,
    Tour_ID INT NOT NULL,
    PRIMARY KEY (Employee_ID, Tour_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID)
);

CREATE TABLE Billing (
    Billing_ID INT IDENTITY(1,1) PRIMARY KEY,
    Booking_ID INT NOT NULL,
    Billing_Amount DECIMAL(10, 2) NOT NULL CHECK (Billing_Amount >= 0),
    Billing_Date DATE NOT NULL,
    Payment_Status NVARCHAR(50) CHECK (Payment_Status IN ('Pending', 'Completed', 'Failed')),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);



