-- Query 1: List all customers with their total rental costs
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(r.TotalCost) AS TotalRentalCost
FROM Customer c
JOIN Rental r ON c.CustomerID = r.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalRentalCost DESC;

-- Query 2: Find rentals with total cost greater than the average total cost
SELECT *
FROM Rental
WHERE TotalCost > (SELECT AVG(TotalCost) FROM Rental);

-- Query 3: List vehicles that have never been rented
SELECT v.VehicleID, v.Brand, v.Model
FROM Vehicle v
LEFT JOIN Rental r ON v.VehicleID = r.VehicleID
WHERE r.RentalID IS NULL;

-- Query 4: Find the most recent maintenance for each vehicle
SELECT v.VehicleID, v.Brand, v.Model, m.ServiceDate, m.Description
FROM Vehicle v
JOIN Maintenance m ON v.VehicleID = m.VehicleID
WHERE m.ServiceDate = (SELECT MAX(ServiceDate) FROM Maintenance WHERE VehicleID = v.VehicleID);

-- Query 5: List all rentals with their insurance details
SELECT r.RentalID, r.PickupDate, r.ReturnDate, i.Type, i.Coverage
FROM Rental r
JOIN Rental_Insurance ri ON r.RentalID = ri.RentalID
JOIN Insurance i ON ri.InsuranceID = i.InsuranceID;

-- Query 6: Find employees who have been with the company for more than 2 years
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employee
WHERE HireDate <= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- Query 7: List all rentals with their total payment amounts
SELECT r.RentalID, r.PickupDate, r.ReturnDate, SUM(p.Amount) AS TotalPayment
FROM Rental r
JOIN Payment p ON r.RentalID = p.RentalID
GROUP BY r.RentalID, r.PickupDate, r.ReturnDate;

-- Query 8: Find the top 3 most rented vehicles
SELECT v.VehicleID, v.Brand, v.Model, COUNT(r.RentalID) AS RentalCount
FROM Vehicle v
JOIN Rental r ON v.VehicleID = r.VehicleID
GROUP BY v.VehicleID, v.Brand, v.Model
ORDER BY RentalCount DESC
LIMIT 3;

-- Query 9: List all damage reports with their repair costs and statuses
SELECT d.ReportID, d.Description, d.RepairCost, d.Status
FROM Damage_Report d;

-- Query 10: Find top rentals by daily rate
SELECT r.RentalID, r.PickupDate, r.ReturnDate, v.DailyRate
FROM Rental r
JOIN Vehicle v ON r.VehicleID = v.VehicleID
ORDER BY v.DailyRate DESC
LIMIT 5;