CREATE VIEW dbo.vw_SKUPriceâ AS
SELECT ID, Code, Name, (SELECT * FROM dbo.GetSKUPrice(ID)) AS price
FROM dbo.SKU;