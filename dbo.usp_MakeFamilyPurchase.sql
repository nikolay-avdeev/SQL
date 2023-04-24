--CREATE PROCEDURE dbo.usp_MakeFamilyPurchase (@FamilySurName varchar(255))
--AS
--BEGIN
--    UPDATE dbo.Family
--    SET BudgetValue = BudgetValue - (SELECT sum(Value) FROM dbo.Basket AS b JOIN Family AS f ON b.ID_Family=f.ID WHERE f.SurName = @FamilySurName)
--    WHERE SurName = @FamilySurName;
--END

CREATE PROCEDURE dbo.usp_MakeFamilyPurchase (@FamilySurName varchar(255))
AS
BEGIN
    SELECT
	CASE
	WHEN COUNT(SurName)=0 THEN 'такой семьи нет'
	ELSE 'расчет произведен'
	END
	FROM dbo.Family
	WHERE SurName = @FamilySurName
	
    UPDATE dbo.Family 
    SET BudgetValue = BudgetValue - (SELECT sum(Value) FROM dbo.Basket AS b JOIN Family AS f ON b.ID_Family=f.ID WHERE f.SurName = @FamilySurName)
	WHERE SurName = @FamilySurName
END



