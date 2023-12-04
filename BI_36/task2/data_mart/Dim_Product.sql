Create TABLE IF NOT Exists Dim_Product
(
    ProductID         	   INT            NOT NULL,
    ProductName            VARCHAR(50)    NOT NULL,
    ProductModelName       VARCHAR(50)    NOT NULL,
    ProductSubCategoryName VARCHAR(50)    NOT NULL,
    ProductTopCategoryName VARCHAR(50)    NOT NULL,
    StandardCost           DECIMAL(13, 4) NOT NULL,
    ListPrice              DECIMAL(13, 4) NOT NULL,
    StartDate          DATE           NOT NULL,
    EndDate            DATE,
    ProductStatus          VARCHAR(50),
    CHECK (
    (ProductStatus = 'Current' AND (EndDate IS NULL OR EndDate > '2021-09-30')) OR 
    (ProductStatus = 'Discontinued' AND EndDate IS NOT NULL AND EndDate <= '2021-09-30')),
    
    CONSTRAINT PK_DimProduct PRIMARY KEY (ProductID)
);
