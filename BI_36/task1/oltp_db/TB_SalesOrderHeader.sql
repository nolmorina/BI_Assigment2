CREATE TABLE IF NOT Exists TB_SalesOrderHeader
(
    SalesOrderID		INT         NOT NULL,
    SalesOrderNumber	VARCHAR(30) NOT NULL,
    OrderDate			DATE        NOT NULL,
    DueDate				DATE        NOT NULL,
    ShipDate			DATE,
    OrderStatusID		INT         NOT NULL,
    CustomerID			INT         NOT NULL,
    BillToAddressID		INT         NOT NULL,
    ShipToAddressID		INT         NOT NULL,
    ShipMethodID		INT         NOT NULL,
    
    CONSTRAINT PK_SalesOrder PRIMARY KEY (SalesOrderID),
    CONSTRAINT FK_OrderStatus_SalesOrderHeader FOREIGN KEY (OrderStatusID) references TB_OrderStatus (OrderStatusID),
    CONSTRAINT FK_Customer_SalesOrderHeader FOREIGN KEY (CustomerID) references TB_Customer (CustomerID),
    CONSTRAINT FK_BillToAddress_SalesOrderHeader FOREIGN KEY (BillToAddressID) references TB_Address (AddressID),
    CONSTRAINT FK_ShipToAddress_SalesOrderHeader FOREIGN KEY (ShipToAddressID)  references TB_Address (AddressID),
    CONSTRAINT FK_ShipMethod_SalesOrderHeader FOREIGN KEY (ShipMethodID) references TB_ShipMethod (ShipMethodID)
    
);
