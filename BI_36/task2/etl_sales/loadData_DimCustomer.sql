INSERT INTO BI_BikesDW_036.Dim_Customer (CustomerID, AccountNumber, FullName, Gender, Age)
SELECT 
    TB_Customer.CustomerID, 
    TB_Customer.AccountNumber, 
    CONCAT(TB_Person.FirstName, ' ', TB_Person.LastName) AS FullName, 
    TB_Person.Gender,
    TIMESTAMPDIFF(YEAR, TB_Person.BirthDate, '2021-09-30') AS Age
FROM 
    BI_Bikes_036.TB_Customer
JOIN 
    BI_Bikes_036.TB_Person ON TB_Customer.PersonID = TB_Person.PersonID;
