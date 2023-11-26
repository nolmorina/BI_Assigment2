Create TABLE IF NOT Exists Country
(
    PK_Country INT         NOT NULL,
    Country   VARCHAR(50) NOT NULL,
    Region    VARCHAR(50) NOT NULL,
    TaxRate   DECIMAL(13, 4),
    ShipCoeff DECIMAL(13, 4),
    PRIMARY KEY(PK_Country)
);
