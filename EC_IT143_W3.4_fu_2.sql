/*****************************************************************************************************************
NAME:    AdventureWorks2019
PURPOSE: 3.4 Adventure Works—Create Answers

--MODIFICATION LOG:
--Ver      Date        Author        Description
-------   ----------   -----------   -------------------------------------------------------------------------------
--1.0     10/05/2024   Obah        1. Creating a single SQL script


--RUNTIME: 
--1s

--NOTES: 
--To find the minimum shipping charge over the past two years, query the Sales.SalesOrderHeader table, 
--which contains information about shipping charges (Freight), and filter by the OrderDate to ensure only the past two years are considered..
 
--******************************************************************************************************************/

---- Q1: What is the minimum shipping charge for the past 2 years?
---- A1: This query will return the minimum freight charge for all orders placed in the last two years.


SELECT 
    MIN(Freight) AS MinimumShippingCharge
FROM 
    Sales.SalesOrderHeader
WHERE 
    OrderDate >= DATEADD(YEAR, -2, GETDATE());
