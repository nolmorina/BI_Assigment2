Create TABLE IF NOT Exists Product
(
    PK_Product                    INT            NOT NULL,
    ProductName                   VARCHAR(50)    NOT NULL,
    Productnumber                 VARCHAR(50)    NOT NULL,
    StandardCost                  DECIMAL(13, 4) NOT NULL,
    ListPrice                     DECIMAL(13, 4) NOT NULL,
    FK_ProductSubCategory_Product INT,
    FK_ProductModel_Product       INT,
    SellStartDate                 DATE           NOT NULL,
    SellEndDate                   DATE,
    PRIMARY KEY (PK_Product),
    FOREIGN KEY (FK_ProductSubCategory_Product) references ProductSubCategory (PK_ProductSubCategory),
    FOREIGN KEY (FK_ProductModel_Product) references ProductModel (PK_ProductModel)
);
