SELECT BusinessEntityID, Gender, Birthdate, HireDate
FROM HumanResources.Employee;


SELECT e.BusinessEntityID, e.Gender, e.Birthdate, e.HireDate,
		p.Rate, p.Payfrequency, p.RateChangeDate, p.ModifiedDate
FROM	HumanResources.Employee e
JOIN HumanResources.EmployeePayHistory p ON e.BusinessEntityID = p.BusinessEntityID;


SELECT e.BusinessEntityID, e.Gender, e.BirthDate, e.HireDate,d.Name as DepartmentName
FROM HumanResources.Employee e
JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
WHERE	edh.StartDate <= GETDATE()
AND (edh.EndDate IS NULL OR edh.EndDate > GETDATE());


SELECT d.Name AS DepartmentName, AVG(eph.Rate) AveragePayRate
FROM HumanResources.EmployeePayHistory eph
JOIN HumanResources.EmployeeDepartmentHistory edh ON eph.BusinessEntityID = edh.BusinessEntityID
JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
GROUP BY d.Name
ORDER BY d.Name;

SELECT d.Name AS DepartmentName, e.Gender, COUNT(e.BusinessEntityID) AS EmployeeCount
FROM HumanResources.Employee AS e
JOIN HumanResources.EmployeeDepartmentHistory AS edh ON e.BusinessEntityID = edh.BusinessEntityID
JOIN HumanResources.Department AS d ON edh.BusinessEntityID = d.DepartmentID
GROUP BY 
d.Name, e.Gender
ORDER BY 
d.Name, e.Gender;

SELECT d.Name AS DepartmentName, MAX(e.HireDate) AS MostRecentHireDate
FROM HumanResources.Employee AS e
JOIN HumanResources.EmployeeDepartmentHistory AS edh ON e.BusinessEntityID = edh.BusinessEntityID
JOIN HumanResources.Department AS d ON edh.DepartmentID = d.DepartmentID
GROUP BY d.Name
ORDER BY d.Name;

