SELECT 
    e.BusinessEntityID, 
    p.FirstName + ' ' + p.LastName AS EmployeeName,
    eph.Rate,
    RANK() OVER (ORDER BY eph.Rate DESC) AS PerformanceRank
FROM 
    HumanResources.Employee e
JOIN 
    Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
JOIN 
    HumanResources.EmployeePayHistory eph ON e.BusinessEntityID = eph.BusinessEntityID;

	 

SELECT 
    d.Name AS DepartmentName, 
    AVG(eph.Rate) AS AverageSalary
FROM 
    HumanResources.Employee e
JOIN 
    HumanResources.EmployeePayHistory eph ON e.BusinessEntityID = eph.BusinessEntityID
JOIN 
    HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
JOIN 
    HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
GROUP BY 
    d.Name;


WITH RankedSalaries AS (
    SELECT 
        e.BusinessEntityID, 
        eph.Rate,
        ROW_NUMBER() OVER (PARTITION BY e.BusinessEntityID ORDER BY eph.RateChangeDate DESC) AS Rank
    FROM 
        HumanResources.Employee e
    JOIN 
        HumanResources.EmployeePayHistory eph ON e.BusinessEntityID = eph.BusinessEntityID
)
SELECT 
    BusinessEntityID, 
    Rate
FROM 
    RankedSalaries
WHERE 
    Rank = 1; -- Latest salary
