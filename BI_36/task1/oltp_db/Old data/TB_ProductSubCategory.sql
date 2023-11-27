create table TB_ProductSubCategory(
ProductSubCategoryID int,
ProductTopCategoryID int,
Name varchar(255),
constraint PK_ProductSubCategory primary key (ProductSubCategoryID),
constraint FK_ProductTopCategory_ProductTopCategory foreign key (ProductTopCategoryID) references TB_ProductTopCategory(ProductTopCategoryID)
);