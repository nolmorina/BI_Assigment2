INSERT INTO BI_BikesDW_036.Fact_InternetSales(
    SalesOrderLineNumber, 
    SalesOrderNumber, 
    OrderDateKey, 
    OrderDate, 
    DueDateKey, 
    DueDate, 
    ShipDateKey, 
    ShipDate, 
    ProductKey, 
    CustomerKey,
    ShipToLocationKey, 
    OrderStatus, 
    ShipMethod, 
    OrderQty, 
    UnitPrice, 
    OrderLineTotal, 
    OrderLineProfit, 
    OrderLineTaxAmt, 
    OrderLineShippingCost
)
SELECT
    CONCAT('SOL', BI_Bikes_036.TB_SalesOrderHeader.SalesOrderID, '-', BI_Bikes_036.TB_SalesOrderDetail.SalesOrderDetailID) AS SalesOrderLineNumber, 
    BI_Bikes_036.TB_SalesOrderHeader.SalesOrderNumber,
    10000 * YEAR(BI_Bikes_036.TB_SalesOrderHeader.OrderDate) + 100 * MONTH(BI_Bikes_036.TB_SalesOrderHeader.OrderDate) + DAY(BI_Bikes_036.TB_SalesOrderHeader.OrderDate) AS OrderDateKey,
    BI_Bikes_036.TB_SalesOrderHeader.OrderDate,
    10000 * YEAR(BI_Bikes_036.TB_SalesOrderHeader.DueDate) + 100 * MONTH(BI_Bikes_036.TB_SalesOrderHeader.DueDate) + DAY(BI_Bikes_036.TB_SalesOrderHeader.DueDate) AS DueDateKey,
    BI_Bikes_036.TB_SalesOrderHeader.DueDate,
    10000 * YEAR(BI_Bikes_036.TB_SalesOrderHeader.ShipDate) + 100 * MONTH(BI_Bikes_036.TB_SalesOrderHeader.ShipDate) + DAY(BI_Bikes_036.TB_SalesOrderHeader.ShipDate) AS ShipDateKey,
    BI_Bikes_036.TB_SalesOrderHeader.ShipDate AS ShipDate,
    BI_Bikes_036.TB_SalesOrderDetail.ProductID AS ProductKey, 
    BI_Bikes_036.TB_SalesOrderHeader.CustomerID AS CustomerKey, 
    BI_Bikes_036.TB_Address.CountryID AS ShipToLocationKey, 
    BI_Bikes_036.TB_OrderStatus.OrderStatusName AS OrderStatus,
    BI_Bikes_036.TB_ShipMethod.ShipMethodName AS ShipMethod,
    BI_Bikes_036.TB_SalesOrderDetail.OrderQty, 
    BI_Bikes_036.TB_SalesOrderDetail.UnitPrice, 
    (BI_Bikes_036.TB_SalesOrderDetail.OrderQty * BI_Bikes_036.TB_SalesOrderDetail.UnitPrice) AS OrderLineTotal,
    (BI_Bikes_036.TB_SalesOrderDetail.OrderQty * BI_Bikes_036.TB_SalesOrderDetail.UnitPrice) - (BI_Bikes_036.TB_SalesOrderDetail.OrderQty * BI_Bikes_036.TB_Product.StandardCost) AS OrderLineProfit,
    (BI_Bikes_036.TB_SalesOrderDetail.OrderQty * BI_Bikes_036.TB_SalesOrderDetail.UnitPrice) * BI_Bikes_036.TB_Country.TaxRate AS OrderLineTaxAmt,
    (BI_Bikes_036.TB_ShipMethod.ShipBase + (BI_Bikes_036.TB_SalesOrderDetail.OrderQty * BI_Bikes_036.TB_ShipMethod.ShipRate)) * BI_Bikes_036.TB_Country.ShipCoeff AS OrderLineShippingCost
FROM 
    BI_Bikes_036.TB_SalesOrderDetail
INNER JOIN BI_Bikes_036.TB_SalesOrderHeader ON BI_Bikes_036.TB_SalesOrderHeader.SalesOrderID = BI_Bikes_036.TB_SalesOrderDetail.SalesOrderID
INNER JOIN BI_Bikes_036.TB_Product ON BI_Bikes_036.TB_SalesOrderDetail.ProductID = BI_Bikes_036.TB_Product.ProductID
INNER JOIN BI_Bikes_036.TB_ShipMethod ON BI_Bikes_036.TB_SalesOrderHeader.ShipMethodID = BI_Bikes_036.TB_ShipMethod.ShipMethodID
INNER JOIN BI_Bikes_036.TB_OrderStatus ON BI_Bikes_036.TB_SalesOrderHeader.OrderStatusID = BI_Bikes_036.TB_OrderStatus.OrderStatusID
INNER JOIN BI_Bikes_036.TB_Address ON BI_Bikes_036.TB_SalesOrderHeader.ShipToAddressID = BI_Bikes_036.TB_Address.AddressID
INNER JOIN BI_Bikes_036.TB_Country ON BI_Bikes_036.TB_Address.CountryID = BI_Bikes_036.TB_Country.CountryID;