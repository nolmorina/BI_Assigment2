SELECT
  ProductTopCategoryName,
  ProductSubCategoryName,
  ProductModelName,
  QuantitySold
FROM (
  SELECT
    Dim_Product.ProductTopCategoryName,
    Dim_Product.ProductSubCategoryName,
    Dim_Product.ProductModelName,
    SUM(Fact_InternetSales.OrderQty) AS QuantitySold,
    ROW_NUMBER() OVER (
      PARTITION BY Dim_Product.ProductTopCategoryName 
      ORDER BY SUM(Fact_InternetSales.OrderQty) DESC
    ) AS rn
  FROM
    Fact_InternetSales
  INNER JOIN
    Dim_Product ON Fact_InternetSales.ProductKey = Dim_Product.ProductID
  GROUP BY
    Dim_Product.ProductTopCategoryName,
    Dim_Product.ProductSubCategoryName,
    Dim_Product.ProductModelName
) AS RankedProducts
WHERE
  RankedProducts.rn <= 3
ORDER BY
  ProductTopCategoryName,
  QuantitySold DESC;
