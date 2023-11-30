INSERT INTO BI_BikesDW_036.Dim_Customer
(PK_DimCustomer, AccountNumber, FullName, Gender, Age)
SELECT 
    Customer.PK_Customer AS PK_DimCustomer,
    Customer.AccountNumber,
    CONCAT(Person.FirstName, ' ', IFNULL(Person.MiddleName, ''), ' ', Person.LastName) AS FullName,
    Person.Gender,
    TIMESTAMPDIFF(YEAR, Person.Birthday, '2021-09-30') AS Age 
FROM 
    BI_Bikes_036.Customer
INNER JOIN 
    BI_Bikes_036.Person ON Customer.FK_Person_Customer = Person.PK_Person;