SELECT p.ProductID, p.Name, AVG(pi.Quantity) AS AverageInventory
FROM Production.Product p
JOIN Production.ProductInventory pi ON p.ProductID = pi.ProductID
GROUP BY p.ProductID, p.Name;


SELECT p.ProductID, p.Name, pi.Quantity, p.SafetyStockLevel
FROM Production.Product p
JOIN Production.ProductInventory pi ON p.ProductID = pi.ProductID
WHERE pi.Quantity < p.SafetyStockLevel;


SELECT pod.PurchaseOrderID, SUM(pod.OrderQty) AS TotalOrderQty, p.ProductID, p.Name
FROM Purchasing.PurchaseOrderDetail pod
JOIN Production.Product p ON pod.ProductID = p.ProductID
GROUP BY pod.PurchaseOrderID, p.ProductID, p.Name;
