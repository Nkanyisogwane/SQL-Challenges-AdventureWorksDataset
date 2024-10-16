SELECT
    YEAR(SOH.OrderDate) AS OrderYear,
    MONTH(SOH.OrderDate) AS OrderMonth,
    SUM(SOH.TotalDue) OVER (ORDER BY YEAR(SOH.OrderDate), MONTH(SOH.OrderDate)) AS TotalSales,
    AVG(SOH.TotalDue) OVER (ORDER BY YEAR(SOH.OrderDate), MONTH(SOH.OrderDate)) AS AverageOrderValue
FROM
    Sales.SalesOrderHeader SOH;


SELECT 
    DATEPART(QUARTER, OrderDate) AS OrderQuarter,
    SUM(TotalDue) AS TotalOrders
FROM 
    Sales.SalesOrderHeader
GROUP BY 
    DATEPART(QUARTER, OrderDate)
ORDER BY 
    OrderQuarter;


SELECT 
    ProductName, 
    ISNULL([1], 0) AS January, 
    ISNULL([2], 0) AS February, 
    ISNULL([3], 0) AS March 
FROM 
    (SELECT 
        p.ProductID, 
        p.Name AS ProductName,  -- Rename here to be used in outer SELECT
        MONTH(SOH.OrderDate) AS OrderMonth, 
        SUM(SOD.OrderQty * SOD.UnitPrice) AS TotalSales 
     FROM 
        Sales.SalesOrderDetail SOD 
     JOIN 
        Sales.SalesOrderHeader SOH ON SOD.SalesOrderID = SOH.SalesOrderID 
     JOIN 
        Production.Product p ON SOD.ProductID = p.ProductID 
     GROUP BY 
        p.ProductID, p.Name, MONTH(SOH.OrderDate)) AS SourceTable 
PIVOT 
    (SUM(TotalSales) FOR OrderMonth IN ([1], [2], [3])) AS PivotTable;


DECLARE @sql NVARCHAR(MAX) = N'';
SET @sql = '
SELECT 
    YEAR(OrderDate) AS OrderYear, 
    MONTH(OrderDate) AS OrderMonth, 
    SUM(TotalDue) AS TotalSales 
FROM 
    Sales.SalesOrderHeader 
GROUP BY 
    YEAR(OrderDate), MONTH(OrderDate)';
EXEC sp_executesql @sql;



