-- Insert Sample Data into Vehicle_Category
INSERT INTO Vehicle_Category (CategoryID, Name, Description, BaseDailyRate)
VALUES (1, 'Sedan', 'Standard sedan', 40.00),
       (2, 'SUV', 'Sport Utility Vehicle', 50.00),
       (3, 'Coupe', 'Two-door sports car', 60.00),
       (4, 'Convertible', 'Convertible car', 70.00),
       (5, 'Hatchback', 'Five-door car', 45.00),
       (6, 'Minivan', 'Family vehicle', 55.00),
       (7, 'Pickup', 'Pickup truck', 65.00),
       (8, 'Van', 'Commercial van', 75.00),
       (9, 'Wagon', 'Station wagon', 50.00),
       (10, 'Luxury', 'Luxury car', 80.00);
 
 -- Populate Vehicle Table
INSERT INTO Vehicle (VehicleID, LicensePlate, Brand, Model, Year, Color, Mileage, Status, DailyRate, CategoryID)
VALUES 
-- Sedans
(1, 'ABC123', 'Toyota', 'Camry', 2020, 'Blue', 15000, 'Available', 40.00, 1),
(2, 'DEF456', 'Honda', 'Accord', 2021, 'Gray', 12000, 'Rented', 42.00, 1),
(3, 'GHI789', 'Hyundai', 'Elantra', 2019, 'Black', 25000, 'Available', 39.00, 1),
(4, 'JKL012', 'Nissan', 'Altima', 2018, 'White', 30000, 'Maintenance', 38.00, 1),
(5, 'MNO345', 'Kia', 'Optima', 2022, 'Silver', 8000, 'Available', 45.00, 1),

-- SUVs
(6, 'PQR678', 'Toyota', 'RAV4', 2021, 'Red', 20000, 'Available', 50.00, 2),
(7, 'STU901', 'Honda', 'CR-V', 2020, 'Blue', 22000, 'Rented', 52.00, 2),
(8, 'VWX234', 'Ford', 'Escape', 2019, 'Green', 15000, 'Available', 48.00, 2),
(9, 'YZA567', 'Chevrolet', 'Traverse', 2022, 'Gray', 10000, 'Available', 55.00, 2),
(10, 'BCD890', 'Mazda', 'CX-5', 2023, 'Black', 5000, 'Available', 60.00, 2),

-- Additional vehicle categories
(11, 'EFG678', 'Ford', 'Mustang', 2021, 'Yellow', 12000, 'Available', 60.00, 3),
(12, 'HIJ345', 'BMW', '4 Series', 2022, 'White', 8000, 'Available', 70.00, 4),
(13, 'KLM901', 'Volkswagen', 'Golf', 2019, 'Blue', 32000, 'Available', 45.00, 5),
(14, 'NOP234', 'Chrysler', 'Pacifica', 2020, 'Silver', 28000, 'Available', 55.00, 6),
(15, 'QRS567', 'Ram', '1500', 2021, 'Black', 24000, 'Available', 65.00, 7),
(16, 'TUV890', 'Ford', 'Transit', 2022, 'White', 18000, 'Available', 75.00, 8),
(17, 'WXY234', 'Subaru', 'Outback', 2019, 'Gray', 45000, 'Available', 50.00, 9),
(18, 'ZAB567', 'Mercedes', 'E-Class', 2023, 'Silver', 4000, 'Available', 80.00, 10);


-- Populate Customer Table
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Phone, DriversLicense, DateOfBirth, Address)
VALUES (1, 'John', 'Doe', 'john.doe@gmail.com', '1234567890', 'DL123456789', '1990-01-01', '123 Main St'),
       (2, 'Jane', 'Smith', 'jane.smith@yahoo.com', '0987654321', 'DL987654321', '1985-05-15', '456 Albert St'),
       (3, 'Alice', 'Johnson', 'alice.johnson@yahoo.com', '2233445566', 'DL234567890', '1992-07-23', '789 Oak St'),
       (4, 'Bob', 'Brown', 'bob.brown@gmail.com', '3344556677', 'DL345678901', '1988-03-12', '101 Pine St E'),
       (5, 'Charlie', 'Davis', 'charlieis@gmail.com', '4455667788', 'DL456789012', '1995-09-30', '202 Maple St'),
       (6, 'Diana', 'Evans', 'diana.evans@gmail.com', '5566778899', 'DL567890123', '1993-04-21', '303 Edinburg St'),
       (7, 'Frank', 'Foster', 'frank.foster@hotmail.com', '6677889900', 'DL678901234', '1987-11-11', '404 Cedar St'),
       (8, 'Grace', 'Garcia', 'grace67garcia@gmail.com', '7788990011', 'DL789012345', '1991-06-18', '505 Walnut St'),
       (9, 'Henry', 'Morris', 'henry.mor@gmail.com', '8899001122', 'DL890123456', '1989-02-28', '606 Spruce St'),
       (10, 'Ivy', 'Ito', 'ivy.ito@hotmail.com', '9900112233', 'DL901234567', '1994-08-05', '707 Oak St W');

-- Populate Rental Table
INSERT INTO Rental (RentalID, CustomerID, VehicleID, PickupDate, ReturnDate, ActualReturnDate, TotalCost, Status)
VALUES 
(1, 1, 1, '2023-10-01 09:00:00', '2023-10-05 09:00:00', '2023-10-05 10:00:00', 250.00, 'Completed'),
(2, 2, 2, '2023-11-01 10:00:00', '2023-11-03 10:00:00', NULL, 135.00, 'Active'),
(3, 3, 3, '2023-12-01 09:00:00', '2023-12-05 09:00:00', '2023-12-05 10:00:00', 300.00, 'Completed'),
(4, 4, 4, '2024-01-01 10:00:00', '2024-01-03 10:00:00', NULL, 140.00, 'Active'),
(5, 5, 5, '2024-02-01 09:00:00', '2024-02-05 09:00:00', '2024-02-05 10:00:00', 225.00, 'Completed'),
(6, 6, 6, '2024-03-01 10:00:00', '2024-03-03 10:00:00', NULL, 165.00, 'Active'),
(7, 7, 7, '2024-04-01 09:00:00', '2024-04-05 09:00:00', '2024-04-05 10:00:00', 325.00, 'Completed'),
(8, 8, 8, '2024-05-01 10:00:00', '2024-05-03 10:00:00', NULL, 170.00, 'Active'),
(9, 9, 9, '2024-06-01 09:00:00', '2024-06-05 09:00:00', '2024-06-05 10:00:00', 250.00, 'Completed'),
(10, 10, 10, '2024-07-01 10:00:00', '2024-07-03 10:00:00', NULL, 180.00, 'Active');

-- Populate Insurance Table
INSERT INTO Insurance (InsuranceID, Type, Coverage, DailyPremium, Description)
VALUES 
(1, 'Basic', 100000.00, 5.00, 'Basic coverage'),
(2, 'Comprehensive', 500000.00, 10.00, 'Comprehensive coverage'),
(3, 'Collision', 200000.00, 8.00, 'Collision coverage'),
(4, 'Liability', 300000.00, 7.00, 'Liability coverage'),
(5, 'Rental Reimbursement', 150000.00, 6.00, 'Rental reimbursement coverage'),
(6, 'Roadside Assistance', 100000.00, 4.00, 'Roadside assistance coverage'),
(7, 'Glass', 50000.00, 3.00, 'Glass coverage'),
(8, 'Uninsured Motorist', 120000.00, 9.00, 'Uninsured motorist coverage'),
(9, 'Towing', 80000.00, 5.00, 'Towing coverage'),
(10, 'Personal Injury Protection', 200000.00, 11.00, 'Personal injury protection coverage');

-- Populate Rental_Insurance Table
INSERT INTO Rental_Insurance (RentalID, InsuranceID)
VALUES (1, 1),
       (2, 2);

-- Popualte Payment Table
INSERT INTO Payment (PaymentID, RentalID, Amount, PaymentDate, PaymentMethod, TransactionID)
VALUES (1, 1, 250.00, '2023-10-01 09:30:00', 'Credit Card', 'TXN12345'),
       (2, 2, 135.00, '2023-11-01 10:30:00', 'Debit Card', 'TXN67890');

-- Populate Maintenance Table
INSERT INTO Maintenance (MaintenanceID, VehicleID, ServiceDate, Description, Cost, Technician)
VALUES (1, 1, '2023-09-01', 'Routine maintenance', 150.00, 'Tech1'),
       (2, 2, '2023-10-01', 'Oil change', 100.00, 'Tech2');

-- Populate Rental Location Table
INSERT INTO Rental_Location (LocationID, Name, Address, Phone, OperatingHours)
VALUES 
(1, 'Redline Rentals - Downtown', '123 Main St', '1112223333', '08:00-18:00'),
(2, 'Redline Rentals - Uptown', '456 Elm St', '4445556666', '08:00-18:00');

-- Populate Employee Table

INSERT INTO Employee (EmployeeID, FirstName, LastName, Email, Phone, LocationID, Role, HireDate)
VALUES 
(1, 'Alice', 'Brown', 'alice.brown@redline.com', '5197654321', 1, 'Manager', '2015-02-01'),
(2, 'Bob', 'Smith', 'bob.smith@redline.com', '4166543210', 1, 'Staff', '2018-03-15'),
(3, 'Chloe', 'Taylor', 'chloe.taylor@redline.com', '9055432109', 1, 'Staff', '2020-06-01'),
(4, 'David', 'Wilson', 'david.wilson@redline.com', '6475432108', 1, 'Technician', '2017-01-10'),
(5, 'Ella', 'Clark', 'ella.clark@redline.com', '5198765432', 1, 'Staff', '2019-11-15'),
(6, 'Frank', 'Garcia', 'frank.garcia@redline.com', '4161234567', 1, 'Technician', '2016-05-20'),
(7, 'Grace', 'Harris', 'grace.harris@redline.com', '9057654321', 1, 'Staff', '2021-07-01'),
(8, 'Henry', 'Johnson', 'henry.johnson@redline.com', '6478765432', 2, 'Manager', '2014-09-01'),
(9, 'Ivy', 'King', 'ivy.king@redline.com', '5192345678', 2, 'Staff', '2019-04-10'),
(10, 'Jack', 'Lee', 'jack.lee@redline.com', '4163456789', 2, 'Technician', '2018-02-20'),
(11, 'Katie', 'Miller', 'katie.miller@redline.com', '9054567890', 2, 'Staff', '2020-08-15'),
(12, 'Luke', 'Nelson', 'luke.nelson@redline.com', '6476543210', 2, 'Technician', '2017-03-10');

-- Populate Damage_Report Table
INSERT INTO Damage_Report (ReportID, RentalID, Description, ReportDate, RepairCost, Status)
VALUES (1, 1, 'Scratch on the door', '2023-10-05 11:30:00', 50.00, 'Pending'),
       (2, 2, 'Broken headlight', '2023-11-02 10:45:00', 100.00, 'Resolved');