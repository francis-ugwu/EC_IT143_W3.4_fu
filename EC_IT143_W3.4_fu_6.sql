/*****************************************************************************************************************
NAME:    AdventureWorks2019
PURPOSE: 3.4 Adventure Works—Create Answers

--MODIFICATION LOG:
--Ver      Date        Author                Description
-------   ----------   -----------           -------------------------------------------------------------------------------
--1.0     10/05/2024   Glorion Destine       1. Creating a single SQL script


--RUNTIME: 
--1m 45s

--NOTES: 
--To calculate the average delivery time for orders placed between January and March for the years 2021 and 2020, 
--you can compare the difference between the order date and the ship date for each order.

--Steps:
--Calculate the delivery time for each order as the difference between ShipDate and OrderDate.
--Filter the orders placed between January and March for both 2020 and 2021.
--Compute the average delivery time for each year.
--Compare the results.
 
--******************************************************************************************************************/

---- Q1: What was the average delivery time for orders place between January and March of 2021, 
----     and how does it compare to the same period in 2021?
---- A1: Run both queries and compare the AvgDeliveryTime_2021 and AvgDeliveryTime_2020 values to see how the average delivery time in 2021 
----     compares to that in 2020 for the same period. This will help to assess if there was an improvement 
----     or decline in delivery efficiency between the two periods..


-- Average delivery time for 2021 (January to March)
SELECT 
    AVG(DATEDIFF(DAY, SOH.OrderDate, SOH.ShipDate)) AS AvgDeliveryTime_2021
FROM 
    Sales.SalesOrderHeader SOH
WHERE 
    SOH.OrderDate BETWEEN '2021-01-01' AND '2021-03-31'
    AND SOH.ShipDate IS NOT NULL;

-- Average delivery time for 2020 (January to March)
SELECT 
    AVG(DATEDIFF(DAY, SOH.OrderDate, SOH.ShipDate)) AS AvgDeliveryTime_2020
FROM 
    Sales.SalesOrderHeader SOH
WHERE 
    SOH.OrderDate BETWEEN '2020-01-01' AND '2020-03-31'
    AND SOH.ShipDate IS NOT NULL;
