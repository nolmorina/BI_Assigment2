CREATE TABLE IF NOT Exists TB_ShipMethod
(
    ShipMethodID	INT NOT NULL,
    ShipMethodName	VARCHAR(50),
    ShipBase		DECIMAL(13, 4),
    ShipRate		DECIMAL(13, 4),
    
    CONSTRAINT PK_ShipMethod PRIMARY KEY (ShipMethodID)
);
