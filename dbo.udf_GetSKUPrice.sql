--CREATE FUNCTION GetSKUPrice(@ID_SKU INT)
--    RETURNS DECIMAL(18, 2)
--    BEGIN
--        DECLARE @sumBudget numeric(10,2)
--        SELECT @sumBudget = Value/Quantity FROM dbo.Basket
--        RETURN @sumBudget
--    END;

CREATE FUNCTION dbo.GetSKUPrice(@ID_SKU INT)
RETURNS TABLE
AS
RETURN
(
    SELECT SUM(Value)/SUM(Quantity) AS test
    FROM dbo.Basket
    WHERE ID_SKU = @ID_SKU
);
