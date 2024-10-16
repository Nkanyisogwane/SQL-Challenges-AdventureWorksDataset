SELECT c.CustomerID, SUM(soh.TotalDue) AS TotalPurchases
FROM Sales.Customer c
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalPurchases DESC;


SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;


SELECT c.CustomerID, COUNT(soh.SalesOrderID) AS PurchaseCount
FROM Sales.Customer c
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID
HAVING COUNT(soh.SalesOrderID) > 1;
