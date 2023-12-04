SELECT
  Dim_Location.Country,
  SUM(Fact_InternetSales.OrderLineTotal) AS TotalRevenue
FROM
  Fact_InternetSales
INNER JOIN
  Dim_Date ON Fact_InternetSales.ShipDateKey = Dim_Date.DateKey
INNER JOIN
  Dim_Location ON Fact_InternetSales.ShipToLocationKey = Dim_Location.CountryID
WHERE
  Dim_Date.CalendarYear = 2019
GROUP BY
  Dim_Location.Country
ORDER BY
  TotalRevenue DESC;
