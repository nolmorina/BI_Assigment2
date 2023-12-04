INSERT INTO BI_BikesDW_036.Dim_Location
(CountryID, Country, Region, TaxRate, ShipCoeff)
SELECT 
    TB_Country.CountryID AS LocationKey,
    TB_Country.Country AS Country,
    TB_Country.Region AS Region,
    TB_Country.TaxRate AS TaxRate,
    TB_Country.ShipCoeff AS ShipCoeff
FROM BI_Bikes_036.TB_Country;