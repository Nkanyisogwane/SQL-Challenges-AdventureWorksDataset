SELECT p.ProductID, p.Name, pi.Quantity
FROM Production.Product p
JOIN Production.ProductInventory pi ON p.ProductID = pi.ProductID
WHERE pi.Quantity <= p.SafetyStockLevel;

SELECT p.ProductID, p.Name
FROM Production.Product p

SELECT p.ProductID, p.Name, pi.Quantity
FROM Production.Product p
JOIN Production.ProductInventory pi ON p.ProductID = pi.ProductID




SELECT 
    v.BusinessEntityID,
    v.Name AS VendorName,
    po.PurchaseOrderID,
    po.DueDate,
    po.OrderQty,
    po.ReceivedQty,
    DATEDIFF(DAY, po.DueDate, GETDATE()) AS DeliveryDelay
FROM 
    Purchasing.PurchaseOrderDetail po
INNER JOIN 
    Purchasing.ProductVendor pv ON po.ProductID = pv.ProductID
INNER JOIN 
    Purchasing.Vendor v ON pv.BusinessEntityID = v.BusinessEntityID
WHERE 
    DATEDIFF(DAY, po.DueDate, GETDATE()) > 0  -- Filtering for delayed deliveries
ORDER BY 
    DeliveryDelay DESC;


CREATE NONCLUSTERED INDEX idx_ProductVendor_BusinessEntityID ON Purchasing.ProductVendor (BusinessEntityID);

CREATE NONCLUSTERED INDEX idx_PurchaseOrderDetail_ProductID_DueDate_ReceivedQty ON Purchasing.PurchaseOrderDetail (ProductID, DueDate, ReceivedQty);

