SELECT 
    c.CustomerID,
    SUM(th.Quantity) AS TotalPurchased,
    COUNT(th.TransactionID) AS NumberOfTransactions,
    MIN(th.TransactionDate) AS FirstPurchaseDate,
    MAX(th.TransactionDate) AS LastPurchaseDate
FROM 
    Sales.Customer c
JOIN 
    Production.TransactionHistory th ON c.CustomerID = th.ReferenceOrderID
GROUP BY 
    c.CustomerID;


SELECT 
    c.CustomerID,
    DATEDIFF(MONTH, MAX(th.TransactionDate), GETDATE()) AS MonthsSinceLastPurchase
FROM 
    Sales.Customer c
LEFT JOIN 
    Production.TransactionHistory th ON c.CustomerID = th.ReferenceOrderID
GROUP BY 
    c.CustomerID
HAVING 
    MAX(th.TransactionDate) IS NULL OR DATEDIFF(MONTH, MAX(th.TransactionDate), GETDATE()) > 6;


SELECT 
    YEAR(th.TransactionDate) AS Year,
    MONTH(th.TransactionDate) AS Month,
    COUNT(DISTINCT c.CustomerID) AS ActiveCustomers
FROM 
    Sales.Customer c
JOIN 
    Production.TransactionHistory th ON c.CustomerID = th.ReferenceOrderID
GROUP BY 
    YEAR(th.TransactionDate), MONTH(th.TransactionDate)
ORDER BY 
    Year, Month;
