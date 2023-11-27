CREATE TABLE TB_Person (
    PersonID INT,
    FirstName VARCHAR(255),
    MiddleName VARCHAR(255),
    LastName VARCHAR(255),
    Gender CHAR(1),
    BirthDate DATE,
    CONSTRAINT PK_Person PRIMARY KEY (PersonID)
);