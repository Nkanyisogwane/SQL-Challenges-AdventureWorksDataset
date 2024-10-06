SELECT d.Name AS DepartmentName, YEAR(eph.RateChangeDate) AS Year,
		AVG(eph.Rate) AS AverageSalary
FROM	HumanResources.EmployeePayHistory eph
JOIN HumanResources.EmployeeDepartmentHistory edh ON eph.BusinessEntityID = edh.BusinessEntityID
JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
GROUP BY d.Name, YEAR(eph.RateChangeDate)
ORDER BY d.Name, Year;




SELECT d.Name AS DepartmentName, AVG(eph.Rate) AS AverageSalary
FROM HumanResources.EmployeePayHistory eph
JOIN HumanResources.EmployeeDepartmentHistory edh ON eph.BusinessEntityID = edh.BusinessEntityID
JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
GROUP BY d.Name
ORDER BY AverageSalary DESC;




SELECT 
    e.BusinessEntityID, 
    e.Gender, 
    eph1.Rate AS StartingSalary, 
    eph2.Rate AS CurrentSalary, 
    (eph2.Rate - eph1.Rate) AS SalaryIncrease
FROM 
    HumanResources.Employee e
JOIN 
    HumanResources.EmployeePayHistory eph1 ON e.BusinessEntityID = eph1.BusinessEntityID 
AND 
    eph1.RateChangeDate = (SELECT MIN(RateChangeDate) FROM HumanResources.EmployeePayHistory eph WHERE eph.BusinessEntityID = e.BusinessEntityID)
JOIN 
    HumanResources.EmployeePayHistory eph2 ON e.BusinessEntityID = eph2.BusinessEntityID 
AND 
    eph2.RateChangeDate = (SELECT MAX(RateChangeDate) FROM HumanResources.EmployeePayHistory eph WHERE eph.BusinessEntityID = e.BusinessEntityID)
ORDER BY 
    SalaryIncrease DESC;
