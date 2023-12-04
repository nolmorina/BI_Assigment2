SELECT
  Dim_Location.Country,
  EXTRACT(YEAR FROM Dim_Date.FullDateAlternateKey) AS Year,
  Dim_Date.EnglishMonthName,
  SUM(Fact_InternetSales.OrderLineShippingCost) AS ShippingCosts
FROM
  Fact_InternetSales
INNER JOIN
  Dim_Location ON Fact_InternetSales.ShipToLocationKey = Dim_Location.CountryID
INNER JOIN
  Dim_Date ON Fact_InternetSales.OrderDateKey = Dim_Date.DateKey
WHERE
  Dim_Location.Country = 'United Kingdom' AND
  Fact_InternetSales.ShipMethod = 'Cargo International' AND
  EXTRACT(YEAR FROM Dim_Date.FullDateAlternateKey) = 2020 AND
  EXTRACT(MONTH FROM Dim_Date.FullDateAlternateKey) BETWEEN 1 AND 6
GROUP BY
  Dim_Location.Country,
  EXTRACT(YEAR FROM Dim_Date.FullDateAlternateKey),
  Dim_Date.EnglishMonthName
ORDER BY
  Year,
  Dim_Date.EnglishMonthName;
