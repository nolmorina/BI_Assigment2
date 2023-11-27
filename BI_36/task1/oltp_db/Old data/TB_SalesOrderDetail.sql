create table TB_SalesOrderDetail(
SalesOrderDetailID int,
SalesOrderID int,
ProductID int,
OrderQty int,
UnitPrice int,

constraint PK_SalesOrderDetail primary key (SalesOrderDetailID),
constraint FK_SalesOrder_SalesOrderDetail foreign key (SalesOrderID) references TB_SalesOrderHeader(SalesOrderID),
constraint FK_Product_SalesOrderDetail foreign key (ProductID) references TB_Product(ProductID)
);