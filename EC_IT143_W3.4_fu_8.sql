/*****************************************************************************************************************
NAME:    AdventureWorks2019
PURPOSE: 3.4 Adventure Works—Create Answers

--MODIFICATION LOG:
--Ver      Date        Author            Description
-------   ----------   -----------       -------------------------------------------------------------------------------
--1.0     10/05/2024   Ailen Lujan       1. Creating a single SQL script


--RUNTIME: 
--35s

--NOTES: 
--To find all the views in the AdventureWorks database that include a column named ProductCategoryID, 
--you can query the system catalog views in SQL Server. Specifically, you can check the INFORMATION_SCHEMA.VIEW_COLUMN_USAGE 
--or sys.columns and sys.views system views to see where this column is used.
 
--******************************************************************************************************************/

---- Q1: Can you find views in AdventureWorks that include a column named "ProductCategoryID"?
---- A1: This query will return a list of all views in the AdventureWorks database that include the ProductCategoryID column.



SELECT 
    V.TABLE_NAME AS ViewName,
    C.COLUMN_NAME AS ColumnName
FROM 
    INFORMATION_SCHEMA.VIEW_COLUMN_USAGE V
JOIN 
    INFORMATION_SCHEMA.COLUMNS C ON V.VIEW_NAME = C.TABLE_NAME
WHERE 
    C.COLUMN_NAME = 'ProductCategoryID';
