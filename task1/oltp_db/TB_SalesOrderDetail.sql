Create TABLE IF NOT Exists SalesOrderDetail
(
    PK_SalesOrderDetail            INT            NOT NULL,
    FK_SalesOrder_SalesOrderDetail INT            NOT NULL,
    FK_Product_SalesOrderDetail    INT            NOT NULL,
    OrderQty                       INT            NOT NULL,
    UnitPrice                      DECIMAL(13, 4) NOT NULL,
    PRIMARY KEY (PK_SalesOrderDetail),
    FOREIGN KEY (FK_Product_SalesOrderDetail) references Product (PK_Product),
    FOREIGN KEY (FK_SalesOrder_SalesOrderDetail) references SalesOrderHeader (PK_SalesOrder)
);
