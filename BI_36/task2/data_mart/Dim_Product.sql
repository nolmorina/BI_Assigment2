Create TABLE IF NOT Exists Dim_Product
(
    PK_DimProduct          INT            NOT NULL,
    ProductName            VARCHAR(50)    NOT NULL,
    ProductModelName       VARCHAR(50)    NOT NULL,
    ProductSubCategoryName VARCHAR(50)    NOT NULL,
    ProductTopCategoryName VARCHAR(50)    NOT NULL,
    StandardCost           DECIMAL(13, 4) NOT NULL,
    ListPrice              DECIMAL(13, 4) NOT NULL,
    SellStartDate          DATE           NOT NULL,
    SellEndDate            DATE,
    ProductStatus          VARCHAR(50),
    CHECK (
    (ProductStatus = 'Current' AND (SellEndDate IS NULL OR SellEndDate > '2021-09-30')) OR 
    (ProductStatus = 'Discontinued' AND SellEndDate IS NOT NULL AND SellEndDate <= '2021-09-30')),
    PRIMARY KEY (PK_DimProduct)
);
