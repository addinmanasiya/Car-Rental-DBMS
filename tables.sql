-- Group 58 Assignment 3--
DROP DATABASE IF EXISTS car_rental;
CREATE DATABASE car_rental;
USE car_rental;

-- Create the VehicleCategory table
CREATE TABLE Vehicle_Category (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT,
    BaseDailyRate DECIMAL(10, 2) NOT NULL
);

-- Create the Vehicle table
CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY,
    LicensePlate VARCHAR(15) NOT NULL UNIQUE,
    Brand VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Color VARCHAR(30) NOT NULL,
    Mileage INT NOT NULL,
    Status ENUM('Available', 'Rented', 'Maintenance') NOT NULL,
    DailyRate DECIMAL(10, 2) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Vehicle_Category(CategoryID)
);

-- Create the Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL,
    DriversLicense VARCHAR(20) NOT NULL UNIQUE,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR(200) NOT NULL
);

-- Create a trigger to enforce the age constraint
DELIMITER $$

CREATE TRIGGER before_customer_insert
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    IF YEAR(CURDATE()) - YEAR(NEW.DateOfBirth) < 21 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer must be at least 21 years old.';
    END IF;
END$$

DELIMITER ;

-- Create the Rental table
CREATE TABLE Rental (
    RentalID INT PRIMARY KEY,
    CustomerID INT,
    VehicleID INT,
    PickupDate DATETIME NOT NULL,
    ReturnDate DATETIME NOT NULL,
    ActualReturnDate DATETIME,
    TotalCost DECIMAL(10, 2),
    Status ENUM('Active', 'Completed', 'Cancelled') NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

-- Create the Insurance table
CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY,
    Type VARCHAR(50) NOT NULL,
    Coverage DECIMAL(10, 2) NOT NULL,
    DailyPremium DECIMAL(10, 2) NOT NULL,
    Description TEXT
);

-- Create the RentalInsurance table (Many-to-Many relationship between Rental and Insurance)
CREATE TABLE Rental_Insurance (
    RentalID INT,
    InsuranceID INT,
    PRIMARY KEY (RentalID, InsuranceID),
    FOREIGN KEY (RentalID) REFERENCES Rental(RentalID),
    FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID)
);

-- Create the Payment table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    RentalID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATETIME NOT NULL,
    PaymentMethod ENUM('Credit Card', 'Debit Card', 'Cash') NOT NULL,
    TransactionID VARCHAR(100) UNIQUE,
    FOREIGN KEY (RentalID) REFERENCES Rental(RentalID)
);

-- Create the Maintenance table
CREATE TABLE Maintenance (
    MaintenanceID INT,
    VehicleID INT,
    ServiceDate DATE NOT NULL,
    Description TEXT NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    Technician VARCHAR(100) NOT NULL,
    PRIMARY KEY (MaintenanceID, VehicleID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

-- Create the RentalLocation table
CREATE TABLE Rental_Location (
    LocationID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    OperatingHours VARCHAR(100) NOT NULL
);

-- Create the Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL,
    LocationID INT,
    Role ENUM('Manager', 'Staff', 'Technician') NOT NULL,
    HireDate DATE NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES Rental_Location(LocationID)
);

-- Create the DamageReport table
CREATE TABLE Damage_Report (
    ReportID INT PRIMARY KEY,
    RentalID INT,
    Description TEXT NOT NULL,
    ReportDate DATETIME NOT NULL,
    RepairCost DECIMAL(10, 2),
    Status ENUM('Pending', 'Resolved') NOT NULL,
    FOREIGN KEY (RentalID) REFERENCES Rental(RentalID)
);

