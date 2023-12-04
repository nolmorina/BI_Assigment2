SELECT
  Dim_Location.Country,
  SUM(Fact_InternetSales.OrderLineProfit) AS Profit
FROM
  Fact_InternetSales
INNER JOIN
  Dim_Location ON Fact_InternetSales.ShipToLocationKey = Dim_Location.CountryID
WHERE
  Fact_InternetSales.UnitPrice BETWEEN 1000 AND 2000
GROUP BY
  Dim_Location.Country
ORDER BY
  Profit DESC
