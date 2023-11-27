Create TABLE IF NOT Exists Fact_InternetSales
(
    PK_FactInternetSales                INT            NOT NULL,
    SalesOrderNumber                    INT            NOT NULL,
    FK_OrderDate_FactInternetSales      INT            NOT NULL,
    OrderDate                           DATE,
    FK_DueDate_FactInternetSales        INT            NOT NULL,
    DueDate                             DATE           NOT NULL,
    FK_ShipData_FactInternetSales       INT            NOT NULL,  ---
    FK_Product_FactInternetSales        INT            NOT NULL,
    FK_Customer_FactInternetSales       INT            NOT NULL,
    FK_ShipToLocation_FactInternetSales INT            NOT NULL,
    OrderStatus                         VARCHAR(30)    NOT NULL,
    ShipMethod                          VARCHAR(30)    NOT NULL,
    OrderCity                           VARCHAR(30)    NOT NULL,
    UnitPrice                           DECIMAL(13, 4) NOT NULL,
    OrderLineTotal                      DECIMAL(13, 4) NOT NULL ,
    OrderLineProfit                     DECIMAL(13, 4) NOT NULL ,
    OrderLineTaxAmt                     DECIMAL(13, 4),
    OrderLineShippingCost               DECIMAL(13, 4),
    FOREIGN KEY (FK_OrderDate_FactInternetSales) references Dim_Date (PK_DimDate),
    FOREIGN KEY (FK_DueDate_FactInternetSales) references Dim_Date (PK_DimDate),
    FOREIGN KEY (FK_ShipData_FactInternetSales) references Dim_Date (PK_DimDate),
    FOREIGN KEY (FK_Product_FactInternetSales) references Dim_Product (PK_DimProduct),
    FOREIGN KEY (FK_Customer_FactInternetSales) references Dim_Customer (PK_DimCusromer),
    FOREIGN KEY (FK_ShipToLocation_FactInternetSale) references Dim_Location (PK_DimLocation),

);

