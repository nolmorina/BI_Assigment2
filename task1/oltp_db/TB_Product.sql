create table TB_Product(
ProductID int,
ProductName varchar(255),
ProductNumber int,
StandardCost int,
ListPrice int,
ProductSubCategoryID int,
ProductModelID int,
SellStartDate date,
SellEndDate date,

constraint PK_Product primary key (ProductID),
constraint FK_ProductSubCategory_Product foreign key (ProductSubCategoryID) references TB_ProductSubCategory(ProductSubCategoryID),
constraint FK_ProductModel_Product foreign key (ProductModelID) references TB_ProductModel(ProductModelID)
);