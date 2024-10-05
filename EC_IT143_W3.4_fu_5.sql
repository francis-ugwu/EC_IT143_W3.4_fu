/*****************************************************************************************************************
NAME:    AdventureWorks2019
PURPOSE: 3.4 Adventure Works—Create Answers

--MODIFICATION LOG:
--Ver      Date        Author             Description
-------   ----------   -----------        -------------------------------------------------------------------------------
--1.0     10/05/2024   Francis Ugwu       1. Built this script for EC IT440


--RUNTIME: 
--1m 35s

--NOTES: 
--This question provides detailed insight into customer purchasing behavior based on product categories, 
--allowing businesses to target specific customer segments that are spending the most on particular products.
 
--******************************************************************************************************************/

---- Q1: What are the customers purchasing trends based on product categories over the last two years,
----     and which customer segments are spending the most on each category?
---- A1: This query provides actionable insights into which customer segments are spending the most on various product categories, 
----     helping businesses tailor their marketing and sales efforts accordingl.


WITH CustomerPurchases AS (
    SELECT 
        C.CustomerID,
        P.ProductID,
        PC.Name AS ProductCategory,
        SUM(SOD.LineTotal) AS TotalSpent,
        ROW_NUMBER() OVER (PARTITION BY C.CustomerID, PC.Name ORDER BY SUM(SOD.LineTotal) DESC) AS PurchaseRank
    FROM 
        Sales.SalesOrderDetail SOD
    JOIN 
        Sales.SalesOrderHeader SOH ON SOD.SalesOrderID = SOH.SalesOrderID
    JOIN 
        Sales.Customer C ON SOH.CustomerID = C.CustomerID
    JOIN 
        Production.Product P ON SOD.ProductID = P.ProductID
    JOIN 
        Production.ProductSubcategory PSC ON P.ProductSubcategoryID = PSC.ProductSubcategoryID
    JOIN 
        Production.ProductCategory PC ON PSC.ProductCategoryID = PC.ProductCategoryID
    WHERE 
        SOH.OrderDate >= DATEADD(YEAR, -2, GETDATE())
    GROUP BY 
        C.CustomerID, PC.Name, P.ProductID
),
TopCustomers AS (
    SELECT 
        CustomerID,
        ProductCategory,
        TotalSpent
    FROM 
        CustomerPurchases
    WHERE 
        PurchaseRank = 1
)
SELECT 
    TC.ProductCategory,
    TC.CustomerID,
    SUM(TC.TotalSpent) AS TotalSpentPerCategory,
    (SELECT TOP 1 P.FirstName + ' ' + P.LastName 
     FROM Person.Person P
     JOIN Sales.Customer C ON P.BusinessEntityID = C.PersonID 
     WHERE C.CustomerID = TC.CustomerID) AS CustomerName
FROM 
    TopCustomers TC
GROUP BY 
    TC.ProductCategory, TC.CustomerID
ORDER BY 
    TotalSpentPerCategory DESC;
