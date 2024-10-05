/*****************************************************************************************************************
NAME:    AdventureWorks2019
PURPOSE: 3.4 Adventure Works—Create Answers

--MODIFICATION LOG:
--Ver      Date        Author              Description
-------   ----------   -----------         -------------------------------------------------------------------------------
--1.0     10/05/2024   Alex Gwilliam       1. Creating a single SQL script


--RUNTIME: 
--1m 23s

--NOTES: 
--To generate a list of where the company's employees and current applicants live, 
--you would need to query both the employee and applicant data. 
--Key Tables:
--HumanResources.Employee: Contains employee information.
--HumanResources.JobCandidate: Contains job candidate (applicant) information.
--Person.Person: Holds general person data (both employees and applicants).
--Person.Address: Contains address details for each person.
--HumanResources.EmployeeAddress and HumanResources.JobCandidateAddress: 
--Linking tables for employees' and candidates' addresses if such tables exist, 
--or you can join directly to the Address table if addresses are stored there.
 
--******************************************************************************************************************/

---- Q1: The company wants to increase efficiency by shortening commuting time.
----     Can you get me a list of where our employees and current applicants live?
---- A1: This query will give you a combined list of addresses for both employees and applicants,
----     which can help in assessing the proximity to the company and finding ways to reduce commuting time.



-- Get list of employee and applicant addresses
SELECT 
    P.BusinessEntityID AS PersonID,
    P.FirstName,
    P.LastName,
    A.AddressLine1,
    A.City,
    A.StateProvinceID,
    A.PostalCode,
    'Employee' AS Role
FROM 
    HumanResources.Employee E
JOIN 
    Person.Person P ON E.BusinessEntityID = P.BusinessEntityID
JOIN 
    Person.Address A ON P.BusinessEntityID = A.AddressID

UNION ALL

SELECT 
    P.BusinessEntityID AS PersonID,
    P.FirstName,
    P.LastName,
    A.AddressLine1,
    A.City,
    A.StateProvinceID,
    A.PostalCode,
    'Applicant' AS Role
FROM 
    HumanResources.JobCandidate JC
JOIN 
    Person.Person P ON JC.BusinessEntityID = P.BusinessEntityID
JOIN 
    Person.Address A ON P.BusinessEntityID = A.AddressID;
