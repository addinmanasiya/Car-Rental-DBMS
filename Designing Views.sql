-- View 1: Customer Rental Summary with Subquery in Columns 
CREATE VIEW CustomerRentalSummary AS
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    (SELECT COUNT(r.RentalID) FROM Rental r WHERE r.CustomerID = c.CustomerID) AS RentalCount,
    (SELECT SUM(r.TotalCost) FROM Rental r WHERE r.CustomerID = c.CustomerID) AS TotalRentalCost
FROM 
    Customer c;
    
-- View 2: Vehicle Maintenance Summary with Subquery in FROM Clause
CREATE VIEW VehicleMaintenanceSummary AS
SELECT 
    v.VehicleID,
    v.Brand,
    v.Model,
    m.MaintenanceCount,
    m.TotalMaintenanceCost
FROM 
    Vehicle v
JOIN 
    (SELECT 
        VehicleID, 
        COUNT(MaintenanceID) AS MaintenanceCount, 
        SUM(Cost) AS TotalMaintenanceCost 
     FROM 
        Maintenance 
     GROUP BY 
        VehicleID) m 
ON v.VehicleID = m.VehicleID;

-- View 3: Rental Payment Summary with Subquery in WHERE Clause
CREATE VIEW RentalPaymentSummary AS
SELECT 
    r.RentalID,
    r.PickupDate,
    r.ReturnDate,
    SUM(p.Amount) AS TotalPayment
FROM 
    Rental r
JOIN 
    Payment p ON r.RentalID = p.RentalID
WHERE 
    r.RentalID IN (SELECT RentalID FROM Payment WHERE Amount > 100)
GROUP BY 
    r.RentalID;
