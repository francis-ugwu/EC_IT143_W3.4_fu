/*****************************************************************************************************************
NAME:    AdventureWorks2019
PURPOSE: 3.4 Adventure Works—Create Answers

--MODIFICATION LOG:
--Ver      Date        Author        Description
-------   ----------   -----------   -------------------------------------------------------------------------------
--1.0     10/05/2024   Alimamy       1. Creating a single SQL script


--RUNTIME: 
--1s

--NOTES: 
--This query will retrieve the top three cities generating the most revenue from bicycle sales this year. 
--******************************************************************************************************************/

---- Q1: Which three cities have generated the most revenue from bicycle sales this year?
---- A1: This query will return the top 3 cities by revenue from bicycle sales, 
---- allowing you to compare cities based on where the most revenue was generated for bicycle purchases in the current year..


SELECT TOP 3 
    A.City,
    SUM(SOD.LineTotal) AS TotalRevenue
FROM 
    Sales.SalesOrderHeader SOH
JOIN 
    Sales.SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
JOIN 
    Production.Product P ON SOD.ProductID = P.ProductID
JOIN 
    Person.Address A ON SOH.BillToAddressID = A.AddressID
JOIN 
    Production.ProductSubcategory PSC ON P.ProductSubcategoryID = PSC.ProductSubcategoryID
JOIN 
    Production.ProductCategory PC ON PSC.ProductCategoryID = PC.ProductCategoryID
WHERE 
    PC.Name = 'Bikes'
    AND YEAR(SOH.OrderDate) = YEAR(GETDATE())
GROUP BY 
    A.City
ORDER BY 
    TotalRevenue DESC;
