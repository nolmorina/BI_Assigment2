INSERT INTO BI_BikesDW_036.DIM_Date
(PK_DimDate,FullDateAlternateKey,DayNumberOfWeek,EnglishDayNameOfWeek,DayNumberofMonth,DayNumberOfYear,WeekNumberOfYear,EnglishMonthName,MonthNumberofYear,CalendarQuarter,CalendarYear)
SELECT 
	YEAR(theDate) * 10000 + MONTH(theDate) * 100 + DAYOFMONTH(theDate) AS PK_DimDate,
    theDate AS FullDateAlternateKey,
    DAYOFWEEK(theDate) AS DayNumberOfWeek,
    CASE DAYOFWEEK(theDate)
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
    END AS EnglishDayNameOfWeek,
    DAY(theDate) AS DayNumberofMonth,
	DAYOFYEAR(theDate) AS DayNumberOfYear,
    WEEK(theDate) AS WeekNumberOfYear,
    MONTHNAME(theDate) AS EnglishMonthName,
    MONTH(theDate) AS MonthNumberofYear,
    QUARTER(theDate) AS CalendarQuarter,
    YEAR(theDate) AS CalendarYear
FROM (
    SELECT SellStartDate AS theDate FROM BI_Bikes_036.Product WHERE SellStartDate IS NOT NULL
    UNION
    SELECT SellEndDate FROM BI_Bikes_036.Product WHERE SellEndDate IS NOT NULL
    UNION
    SELECT OrderDate FROM BI_Bikes_036.SalesOrderHeader WHERE OrderDate IS NOT NULL
    UNION
    SELECT DueDate FROM BI_Bikes_036.SalesOrderHeader WHERE DueDate IS NOT NULL
    UNION
    SELECT ShipDate FROM BI_Bikes_036.SalesOrderHeader WHERE ShipDate IS NOT NULL
) AS dateData;
