Create TABLE IF NOT Exists ProductSubCategory
(
    PK_ProductSubCategory                    INT         NOT NULL,
    FK_ProductTopCategory_ProductSubCategory INT         NOT NULL,
    Name                                     VARCHAR(50) NOT NULL,
    PRIMARY KEY (PK_ProductSubCategory),
    FOREIGN KEY (FK_ProductTopCategory_ProductSubCategory) references ProductTopCategory (PK_ProductTopCategory)
);
