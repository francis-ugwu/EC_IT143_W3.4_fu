/*****************************************************************************************************************
NAME:    AdventureWorks2019
PURPOSE: 3.4 Adventure Works—Create Answers

--MODIFICATION LOG:
--Ver      Date        Author             Description
-------   ----------   -----------        -------------------------------------------------------------------------------
--1.0     10/05/2024   Francis Ugwu       1. Creating a single SQL script


--RUNTIME: 
--50s

--NOTES: 
--This question helps in understanding the overall structure of the database 
--and how data is organized under different schemas.
 
--******************************************************************************************************************/

---- Q1: How many tables exist in the AdventureWorks database, and what are the schemas they belong to?
---- A1: This query helps database administrators or users exploring the structure of AdventureWorks 
----     understand how the tables are distributed across different functional areas (schemas).



SELECT 
    s.name AS SchemaName,
    COUNT(t.name) AS TableCount
FROM 
    sys.tables t
JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
GROUP BY 
    s.name
ORDER BY 
    TableCount DESC;
