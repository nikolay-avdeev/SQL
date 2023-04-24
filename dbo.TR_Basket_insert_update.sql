CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT, UPDATE
AS

UPDATE dbo.Basket
SET DiscountValue = (CASE 
                     WHEN ID_SKU IN (SELECT ID_SKU FROM dbo.Basket GROUP BY ID_SKU HAVING COUNT(ID_Family)>1) THEN 5
                     ELSE 0
                     END)
 