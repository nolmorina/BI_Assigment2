INSERT INTO BI_BikesDW_036.Dim_Product
(
    ProductID,
    ProductName,
    ProductModelName,
    ProductSubCategoryName,
    ProductTopCategoryName,
    StandardCost,
    ListPrice,
    StartDate,
    EndDate,
    ProductStatus
)
SELECT 
    BI_Bikes_036.TB_Product.ProductID,
    BI_Bikes_036.TB_Product.ProductName,
    COALESCE(BI_Bikes_036.TB_ProductModel.ProductModelName, 'NoModelName') AS ProductModelName,
    COALESCE(BI_Bikes_036.TB_ProductSubCategory.Name, 'NoSubCategory') AS ProductSubCategoryName,
    COALESCE(BI_Bikes_036.TB_ProductTopCategory.Name, 'NoTopCategory')  AS ProductTopCategoryName,
    BI_Bikes_036.TB_Product.StandardCost,
    BI_Bikes_036.TB_Product.ListPrice,
    BI_Bikes_036.TB_Product.SellStartDate,
    BI_Bikes_036.TB_Product.SellEndDate,
    CASE 
        WHEN BI_Bikes_036.TB_Product.SellEndDate IS NULL OR BI_Bikes_036.TB_Product.SellEndDate > '2021-09-30' THEN 'Current'
        ELSE 'Discontinued'
    END
FROM 
    BI_Bikes_036.TB_Product
LEFT JOIN 
    BI_Bikes_036.TB_ProductSubCategory ON BI_Bikes_036.TB_Product.ProductSubCategoryID = BI_Bikes_036.TB_ProductSubCategory.ProductSubCategoryID
LEFT JOIN 
    BI_Bikes_036.TB_ProductTopCategory ON BI_Bikes_036.TB_ProductSubCategory.ProductTopCategoryID = BI_Bikes_036.TB_ProductTopCategory.ProductTopCategoryID
LEFT JOIN 
    BI_Bikes_036.TB_ProductModel ON BI_Bikes_036.TB_Product.ProductModelID = BI_Bikes_036.TB_ProductModel.ProductModelID;
