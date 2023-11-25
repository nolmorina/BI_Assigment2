create table TB_SalesOrderHeader(
SalesOrderID int,
SalesOrderNumber int,
OrderDate date,
DueDate date,
ShipDate date,
OrderStatusID int,
CustomerID int,
BillToAddressID int,
ShipToAddressID int,
ShipMethodID int,

constraint PK_SalesOrderHeader primary key (SalesOrderID),
constraint FK_Customer_SalesOrderHeader foreign key (CustomerID) references TB_Customer(CustomerID),
constraint FK_BillToAddress_SalesOrderHeader foreign key (BillToAddressID) references TB_Address(AddressID),
constraint FK_ShipToAddress_SalesOrderHeader foreign key (ShipToAddressID) references TB_Address(AddressID),
constraint FK_ShipMethod__SalesOrderHeader foreign key (ShipMethodID) references TB_ShipMethod(ShipMethodID)
);