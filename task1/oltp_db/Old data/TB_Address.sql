create table TB_Address(
AddressID int,
CountryID int,
AddressLine varchar(255),
City varchar(255),
PostalCode varchar(255),
constraint PK_Address primary key (AddressID),
constraint FK_Country_Address foreign key (CountryID) references TB_Country(CountryID)
);