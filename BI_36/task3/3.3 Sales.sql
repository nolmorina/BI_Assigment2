SELECT
  RANK() OVER (ORDER BY SUM(Fact_InternetSales.OrderLineProfit) DESC) AS CustomerRank,
  Dim_Customer.FullName AS CustomerName,
  SUM(Fact_InternetSales.OrderLineProfit) AS Profit
FROM
  Fact_InternetSales
INNER JOIN
  Dim_Customer ON Fact_InternetSales.CustomerKey = Dim_Customer.CustomerID
INNER JOIN
  Dim_Date ON Fact_InternetSales.OrderDateKey = Dim_Date.DateKey
WHERE
  Dim_Date.CalendarYear = 2021 AND
  Dim_Date.MonthNumberOfYear BETWEEN 1 AND 6
GROUP BY
  Dim_Customer.CustomerID,
  Dim_Customer.FullName
ORDER BY
  Profit DESC
LIMIT 10;
