Create TABLE IF NOT Exists Dim_Date
(
    DateKey              INT         NOT NULL,
    FullDateAlternateKey DATE         NOT NULL,
    DayNumberOfWeek      INT         NOT NULL,
    EnglishDayNameOfWeek VARCHAR(10) NOT NULL,
    DayNumberOfMonth     INT         NOT NULL,
    DayNumberOfYear      INT         NOT NULL,
    WeekNumberOfYear     INT         NOT NULL,
    EnglishMonthName     VARCHAR(15) NOT NULL,
    MonthNumberOfYear    INT         NOT NULL,
    CalendarQuarter      INT		 NOT NULL,
    CalendarYear         INT         NOT NULL,
    CHECK (0 <= DayNumberOfWeek AND DayNumberOfWeek <= 7),
    CHECK (EnglishDayNameOfWeek = 'Monday' OR EnglishDayNameOfWeek = 'Tuesday' OR EnglishDayNameOfWeek = 'Wednesday' OR
           EnglishDayNameOfWeek = 'Thursday' OR EnglishDayNameOfWeek = 'Friday' OR EnglishDayNameOfWeek = 'Saturday' OR
           EnglishDayNameOfWeek = 'Sunday'),
    CHECK (1 <= DayNumberOfMonth AND DayNumberOfMonth <= 31),
    CHECK (1 <= DayNumberOfYear AND DayNumberOfYear <= 366),
    
    CONSTRAINT PK_DimDate PRIMARY KEY (DateKey)
);
