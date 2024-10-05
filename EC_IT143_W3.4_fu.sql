/*****************************************************************************************************************
NAME:    AdventureWorks2019
PURPOSE: 3.4 Adventure Works—Create Answers

--MODIFICATION LOG:
--Ver      Date        Author        Description
-------   ----------   -----------   -------------------------------------------------------------------------------
--1.0     10/05/2024   Lamidi       1. Built this script for EC IT440


--RUNTIME: 
--Xm Xs

--NOTES: 
--To determine the total number of products purchased by customers this week, 
--you can write a query that joins the relevant tables like SalesOrderHeader and SalesOrderDetail, 
--then filter by the order date within the current week.
 
--******************************************************************************************************************/

---- Q1: What are the total products purchased by customers this week?
---- A1: This query assumes that the week starts on Sunday. Adjust DATEPART(WEEKDAY, GETDATE()) according to your specific week start.


SELECT 
    SUM(SOD.OrderQty) AS TotalProductsPurchased
FROM 
    Sales.SalesOrderDetail SOD
JOIN 
    Sales.SalesOrderHeader SOH ON SOD.SalesOrderID = SOH.SalesOrderID
WHERE 
    SOH.OrderDate >= DATEADD(DAY, -DATEPART(WEEKDAY, GETDATE()) + 1, CONVERT(DATE, GETDATE())) 
    AND SOH.OrderDate < DATEADD(DAY, 8 - DATEPART(WEEKDAY, GETDATE()), CONVERT(DATE, GETDATE()));
