USE [Task2]

-- 1 Найти ID и имена клиентов, сделавших заказы в 2018 году
SELECT [C].[Id], [C].[Name]
FROM [Customer] [C]
JOIN [Order] [O] ON [O].[CustomerId] = [C].[Id] AND DATEPART(yyyy, [O].[OrderDate]) = 2018;
GO

-- 2 Номер первого заказа в 2019 году
SELECT TOP 1 [No]
FROM 
(
    SELECT ROW_NUMBER() OVER(ORDER BY [OrderDate]) AS [No], [OrderDate]
    FROM [Order]
) [O]
WHERE DATEPART(yyyy, [OrderDate]) = 2019

-- 3 Найти ID и имя клиента, получившего максимальную скидку в 2016 году
SELECT TOP 1 [C].[Id], [C].[Name]
FROM
(
    SELECT [CustomerId], MAX([Discount]) AS [MaxDiscount] 
    FROM [Order] WHERE DATEPART(yyyy, [OrderDate]) = 2016 
    GROUP BY [CustomerId]
) [O]
JOIN [Customer] [C] ON [C].[Id] = [O].[CustomerId];
GO

-- 4 Количество обработанных заказов сгруппированных по годам
SELECT DATEPART(yyyy, [OrderDate]) AS [Year], COUNT([ID]) AS [Number]
FROM [Order]
GROUP BY DATEPART(yyyy, [OrderDate]);
GO

-- 5 Найти итоговую сумму, потраченную Марией в нашем магазине (за всё время)
SELECT SUM([P].[Price] * [I].[NumberOfItems]) AS [Maria Spends]
FROM [Order] [O]
JOIN [Customer] [C] ON [O].[CustomerId] = [C].[Id] AND [C].[Name] = N'Мария'
JOIN [OrderItem] [I] ON [I].[OrderId] = [O].[Id]
JOIN [Product] [P] ON [I].[ProductId] = [P].[Id];
GO

-- 6 Вычислить долю денежных расходов Марии по отношению к расходом всех покупателей (за всё время)
WITH 

[MariaSpends_CTE] (Spends) AS
(
    SELECT SUM([P].[Price] * [I].[NumberOfItems]) 
    FROM [Order] [O]
    JOIN [Customer] [C] ON [O].[CustomerId] = [C].[Id] AND [C].[Name] = N'Мария'
    JOIN [OrderItem] [I] ON [I].[OrderId] = [O].[Id]
    JOIN [Product] [P] ON [I].[ProductId] = [P].[Id]
),

[CustomersSpends_CTE] (Spends) AS
(
    SELECT SUM([P].[Price] * [I].[NumberOfItems]) 
    FROM [Order] [O]
    JOIN [OrderItem] [I] ON [I].[OrderId] = [O].[Id]
    JOIN [Product] [P] ON [I].[ProductId] = [P].[Id]
)

SELECT ([M].[Spends] / [All].[Spends]) * 100 AS [Maria's share percent of total spends]
FROM [MariaSpends_CTE] [M], [CustomersSpends_CTE] [All];
GO