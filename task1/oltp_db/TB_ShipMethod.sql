CREATE TABLE IF NOT Exists ShipMethod
(
    PK_ShipMethod  INT NOT NULL,
    ShipMethodName VARCHAR(50),
    ShipBase       DECIMAL(13, 4),
    ShipRate       DECIMAL(13, 4),
    PRIMARY KEY (PK_ShipMethod)
);
