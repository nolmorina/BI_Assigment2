INSERT INTO Dim_Location
(PK_DimLocation, Country, Region, TaxRate, ShipCoeff)
SELECT 
    Country.PK_Country AS PK_DimLocation,
    Country.Country AS Country,
    Country.Region AS Region,
    Country.TaxRate AS TaxRate,
    Country.ShipCoeff AS ShipCoeff
FROM BI_Bikes_036.Country;