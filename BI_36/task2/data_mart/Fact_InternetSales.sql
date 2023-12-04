CREATE TABLE IF NOT EXISTS Fact_InternetSales
(
    SalesOrderLineNumber		VARCHAR(50)    NOT NULL,
    SalesOrderNumber			VARCHAR(50)    NOT NULL,
    OrderDateKey				INT            NOT NULL,
    OrderDate					DATE,
    DueDateKey					INT            NOT NULL,
    DueDate						DATE           NOT NULL,
    ShipDateKey					INT            NOT NULL,
    ShipDate					DATE		   NOT NULL,
    ProductKey					INT            NOT NULL,
    CustomerKey       			INT	           NOT NULL,
    ShipToLocationKey 			INT            NOT NULL,
    OrderStatus					VARCHAR(30)    NOT NULL,
    ShipMethod					VARCHAR(30)    NOT NULL,
    OrderQty					INT            NOT NULL, 
    UnitPrice					DECIMAL(13, 4) NOT NULL,
    OrderLineTotal				DECIMAL(13, 4) NOT NULL,
    OrderLineProfit				DECIMAL(13, 4) NOT NULL,
    OrderLineTaxAmt				DECIMAL(13, 4),
    OrderLineShippingCost		DECIMAL(13, 4),
    
    CONSTRAINT PK_FactSales PRIMARY KEY (SalesOrderLineNumber),
    CONSTRAINT FK_OrderDate_FactInternetSales FOREIGN KEY (OrderDateKey) REFERENCES Dim_Date (DateKey),
	CONSTRAINT FK_DueDate_FactInternetSales FOREIGN KEY (DueDateKey) REFERENCES Dim_Date (DateKey),
    CONSTRAINT FK_ShipDate_FactInternetSales FOREIGN KEY (ShipDateKey) REFERENCES Dim_Date (DateKey),
    CONSTRAINT FK_Product_FactInternetSales FOREIGN KEY (ProductKey) REFERENCES Dim_Product (ProductID),
    CONSTRAINT FK_Customer_FactInternetSales FOREIGN KEY (CustomerKey) REFERENCES Dim_Customer (CustomerID),
    CONSTRAINT FK_ShipToLocation_FactInternetSales FOREIGN KEY (ShipToLocationKey) REFERENCES Dim_Location (CountryID)
    
);
