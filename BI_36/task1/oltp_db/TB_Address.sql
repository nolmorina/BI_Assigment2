Create TABLE IF NOT Exists Address
(
    PK_Address  INT         NOT NULL ,
    FK_Country_Address   INT         NOT NULL,
    AddressLine VARCHAR(60) NOT NULL,
    City        VARCHAR(30) NOT NULL,
    PostalCode  VARCHAR(15) NOT NULL,
    PRIMARY KEY(PK_Address),
    FOREIGN KEY (FK_Country_Address) references Country (PK_Country)
);
