INSERT INTO DIM_Product
(PK_DimProduct, ProductName, ProductModelName, ProductSubCategoryName, ProductTopCategoryName, StandardCost, ListPrice, StartDate, EndDate, ProductStatus)
SELECT 
    Product.PK_Product AS PK_DimProduct,
    Product.ProductName,
    COALESCE(ProductModel.ProductModelName, 'NoModelName') AS ProductModelName,
    COALESCE(ProductSubCategory.Name, 'NoSubCategory') AS ProductSubCategoryName,
    COALESCE(ProductTopCategory.Name, 'NoTopCategory') AS ProductTopCategoryName,
    Product.StandardCost,
    Product.ListPrice,
    Product.SellStartDate AS StartDate,
    Product.SellEndDate AS EndDate,
    CASE 
        WHEN Product.SellEndDate IS NULL OR Product.SellEndDate > '2021-09-30' THEN 'Current'
        ELSE 'Discontinued'
    END AS ProductStatus
FROM 
    BI_Bikes_036.Product
LEFT JOIN 
    BI_Bikes_036.ProductSubCategory ON Product.FK_ProductSubCategory_Product = ProductSubCategory.PK_ProductSubCategory
LEFT JOIN 
    BI_Bikes_036.ProductTopCategory ON ProductSubCategory.FK_ProductTopCategory_ProductSubCategory = ProductTopCategory.PK_ProductTopCategory
LEFT JOIN 
    BI_Bikes_036.ProductModel ON Product.FK_ProductModel_Product = ProductModel.PK_ProductModel;
