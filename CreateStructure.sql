--CREATE TABLE dbo.SKU (
--ID INT PRIMARY KEY identity,
-- Code AS 's'+ CAST(ID AS VARCHAR(12)) UNIQUE,
-- Name VARCHAR(20)
--);

--CREATE TABLE dbo.Family (
-- ID INT PRIMARY KEY identity,
-- SurName VARCHAR(20),
-- BudgetValue INT
--);

CREATE TABLE dbo.Basket (
 ID INT PRIMARY KEY identity,
 ID_SKU INT,
 ID_Family INT,
 Quantity INT CHECK(Quantity >-1),
 Value INT CHECK(Value >-1), 
 PurchaseDate DATE DEFAULT CONVERT (date, GETDATE()), 
 DiscountValue INT,
 FOREIGN KEY (ID_SKU) REFERENCES dbo.SKU (ID),
 FOREIGN KEY (ID_Family) REFERENCES dbo.Family (ID)
);