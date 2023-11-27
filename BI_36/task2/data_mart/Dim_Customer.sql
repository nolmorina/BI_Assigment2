Create TABLE IF NOT Exists Dim_Customer
(
    PK_DimCustomer INT          NOT NULL,
    AccountNumber  VARCHAR(30)  NOT NULL,
    FullName       VARCHAR(150) NOT NULL,
    Gender         VARCHAR(1) CHECK (Gender IN ('M', 'F')),
    Age            INT,
    PRIMARY KEY (PK_DimCustomer)
);
