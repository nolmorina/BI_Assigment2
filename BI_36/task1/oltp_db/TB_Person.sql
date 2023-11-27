Create TABLE IF NOT Exists Person
(
    PK_Person  INT         NOT NULL,
    FirstName  VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName   VARCHAR(50) NOT NULL,
    Gender     VARCHAR(1) CHECK (Gender IN ('M', 'F')),
    BirthDay   DATE,
    PRIMARY KEY (PK_Person)

);
