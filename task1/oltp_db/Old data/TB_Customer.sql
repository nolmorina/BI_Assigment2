create table TB_Customer(
CustomerID int,
PersonID int,
AccountNumber varchar(255),
CONSTRAINT PK_Customer PRIMARY KEY (CustomerID),
CONSTRAINT FK_Person_Customer FOREIGN KEY (PersonID) REFERENCES TB_Person(PersonID)
);