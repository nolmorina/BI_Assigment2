Create TABLE IF NOT Exists Dim_Location
(
    CountryID		INT         NOT NULL,
    Country			VARCHAR(50) NOT NULL,
    Region			VARCHAR(50) NOT NULL,
    TaxRate			DECIMAL(13, 4),
    ShipCoeff		DECIMAL(13, 4),
    
    CONSTRAINT PK_DimLocation PRIMARY KEY (CountryID)
);
