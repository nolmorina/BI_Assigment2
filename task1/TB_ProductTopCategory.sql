Create TABLE IF NOT Exists ProductTopCategory
(
    PK_ProductTopCategory INT         NOT NULL,
    Name                  VARCHAR(50) NOT NULL,
    ShipSurcharge         DECIMAL(13, 4),
    PRIMARY KEY (PK_ProductTopCategory)
);
