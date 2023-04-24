<p>1. Git
<p>1.1 Cоздать репозиторий на GitHub
<p>1.2 Каждый последующий пункт должен располагаться в отдельной ветке (в ветках не должно быть кода, который не относится к пункту)
<p>1.3 Создать Pull Request'ы каждой ветки в main
<p>2. Создать таблицы (на выходе: файл в репозитории CreateStructure.sql в ветке Tables)
<p>2.1 dbo.SKU (ID identity, Code, Name)
<p>2.1.1 Ограничение на уникальность поля Code
<p>2.1.2 Поле Code вычисляемое: "s" + ID
<p>2.2 dbo.Family (ID identity, SurName, BudgetValue)
<p>2.3 dbo.Basket (ID identity, ID_SKU (внешний ключ на таблицу dbo.SKU), ID_Family (Внешний ключ на таблицу dbo.Family) Quantity, Value, PurchaseDate, DiscountValue)
<p>2.3.1 Ограничение, что поле Quantity и Value не могут быть меньше 0
<p>2.3.2 Добавить значение по умолчанию для поля PurchaseDate: дата добавления записи (текущая дата)
<p>3. Создать функцию (на выходе: файл в репозитории dbo.udf_GetSKUPrice.sql в ветке Functions)
<p>3.1 Входной параметр @ID_SKU
<p>3.2 Рассчитывает стоимость передаваемого продукта из таблицы dbo.Basket по формуле
<p>3.1.1 сумма Value по переданному SKU / сумма Quantity по переданному SKU
<p>3.3 На выходе значение типа decimal(18, 2)
<p>4. Создать представление (на выходе: файл в репозитории dbo.vw_SKUPriceв ветке VIEWs)
<p>4.1 Возвращает все атрибуты продуктов из таблицы dbo.SKU и расчетный атрибут со стоимостью одного продукта (используя функцию dbo.udf_GetSKUPrice)
<p>5. Создать процедуру (на выходе: файл в репозитории dbo.usp_MakeFamilyPurchase в ветке Procedures
<p>5.1 Входной параметр (@FamilySurName varchar(255)) одно из значений атрибута SurName таблицы dbo.Family
<p>5.2 Процедура при вызове обновляет данные в таблицы dbo.Family в поле BudgetValue по логике
<p>5.2.1 dbo.Family.BudgetValue - sum(dbo.Basket.Value), где dbo.Basket.Value покупки для переданной в процедуру семьи
<p>5.2.2 При передаче несуществующего dbo.Family.SurName пользователю выдается ошибка, что такой семьи нет
<p>6. Создать триггер (на выходе: файл в репозитории dbo.TR_Basket_insert_update в ветке Triggers)
<p>6.1 Если в таблицу dbo.Basket за раз добавляются 2 и более записей одного ID_SKU, то значение в поле DiscountValue, для этого ID_SKU рассчитывается по формуле Value * 5%, иначе DiscountValue = 0
