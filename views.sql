-- View 1: Customer Rental Summary
CREATE VIEW CustomerRentalSummary AS
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(r.RentalID) AS RentalCount, SUM(r.TotalCost) AS TotalRentalCost
FROM Customer c
JOIN Rental r ON c.CustomerID = r.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- View 2: Vehicle Maintenance Summary
CREATE VIEW VehicleMaintenanceSummary AS
SELECT v.VehicleID, v.Brand, v.Model, COUNT(m.MaintenanceID) AS MaintenanceCount, SUM(m.Cost) AS TotalMaintenanceCost
FROM Vehicle v
JOIN Maintenance m ON v.VehicleID = m.VehicleID
GROUP BY v.VehicleID, v.Brand, v.Model;

-- View 3: Rental Payment Summary
CREATE VIEW RentalPaymentSummary AS
SELECT r.RentalID, r.PickupDate, r.ReturnDate, COUNT(p.PaymentID) AS PaymentCount, SUM(p.Amount) AS TotalPayment
FROM Rental r
JOIN Payment p ON r.RentalID = p.RentalID
GROUP BY r.RentalID, r.PickupDate, r.ReturnDate;