CREATE VIEW dbo.vw_SKUPrice� AS
SELECT ID, Code, Name, (SELECT * FROM dbo.GetSKUPrice(ID)) AS price
FROM dbo.SKU;