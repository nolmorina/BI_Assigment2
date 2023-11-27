Create TABLE IF NOT Exists Customer
(
    PK_Customer        INT         NOT NULL,
    FK_Person_Customer INT         NOT NULL,
    AccountNumber      VARCHAR(30) NOT NULL,
    PRIMARY KEY (PK_Customer),
    FOREIGN KEY (FK_Person_Customer) references Person (PK_Person)
);
