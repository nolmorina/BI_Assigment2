SELECT
  DP.ProductTopCategoryName,
  SUM(Fact_InternetSales.OrderLineProfit) AS TotalProfit
FROM
  Fact_InternetSales
INNER JOIN
  Dim_Product AS DP ON Fact_InternetSales.ProductKey = DP.ProductID
INNER JOIN
  Dim_Date AS DD ON Fact_InternetSales.OrderDateKey = DD.DateKey
WHERE
  DD.CalendarYear = 2021
GROUP BY
  DP.ProductTopCategoryName
ORDER BY
  TotalProfit DESC;

  
  
  