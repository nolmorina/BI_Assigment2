CREATE TABLE IF NOT Exists SalesOrderHeader
(
    SalesOrder                        INT         NOT NULL,
    SalesOrderNumber                  VARCHAR(30) NOT NULL,
    OrderDate                         DATE        NOT NULL,
    DueDate                           DATE        NOT NULL,
    ShipDate                          DATE,
    FK_OrderStatusID_SalesOrderHeader INT         NOT NULL,
    FK_Customer_SalesOrderHeader      INT         NOT NULL,
    FK_BillToAddress_SalesOrderHeader INT         NOT NULL,
    FK_ShipToAddress_SalesOrderHeader INT         NOT NULL,
    FK_ShipMethod_SalesOrderHeader    INT         NOT NULL,

    PRIMARY KEY (SalesOrder),
    FOREIGN KEY (FK_OrderStatusID_SalesOrderHeader) references OrderStatus (PK_OrderStatus),
    FOREIGN KEY (FK_Customer_SalesOrderHeader) references Customer (PK_Customer),
    FOREIGN KEY (FK_BillToAddress_SalesOrderHeader) references Address (PK_Address),
    FOREIGN KEY (FK_ShipToAddress_SalesOrderHeader) references Address (PK_Address),
    FOREIGN KEY (FK_ShipMethod_SalesOrderHeader) references ShipMethod (PK_ShipMethod)
);
