USE AdventureWorks
--Exercise 1
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'CustomerID'
SELECT * FROM Sales.Customer

--Exercise 2
SELECT CreditCardID, CardType, CardNumber, ExpYear FROM Sales.CreditCard

--EXERCISE 3
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'TerritoryID'
SELECT CustomerID, AccountNumber, TerritoryID FROM Sales.Customer WHERE TerritoryID = 4

-- EXERCISE 4
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'LineTotal'
SELECT * FROM Sales.SalesOrderDetail WHERE LineTotal > 2000

--EXERCISE 5
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'ProductID'
SELECT * FROM Production.Product WHERE ProductID = 843 AND Name = 'Cable Lock'

--EXERCISE 6 
SELECT * FROM Sales.SalesOrderHeader WHERE OrderDate = '2004-06-06'

-- EXERCISE 7
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'OrderQty'
SELECT SalesOrderID, OrderQty, UnitPrice, LineTotal FROM Sales.SalesOrderDetail

--EXERCISE 8
SELECT LineTotal FROM Sales.SalesOrderDetail WHERE LineTotal > 2000 AND LineTotal < 2100

--EXERCISE 9
SELECT Name, CountryRegionCode, SalesYTD FROM Sales.SalesTerritory WHERE TerritoryID = 1

--EXERCISE 10
SELECT TaxAmt FROM Sales.SalesOrderHeader WHERE TaxAmt > 10000

--EXERCISE 11
SELECT * FROM Sales.SalesTerritory WHERE NAME IN('Canada', 'France', 'Germany')

--EXERCISE 12 
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'SalesPersonID'
UNION
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'TerritoryID'

SELECT SalesPersonID, TerritoryID FROM Sales.SalesOrderHeader WHERE TerritoryID IN (2, 4)

--EXERCISE 13
SELECT * FROM Sales.CreditCard WHERE CardType = 'Vista' AND ExpYear = 2006

--EXERCISE 14
SELECT ShipDate FROM Sales.SalesOrderHeader WHERE ShipDate > '2004-06-12'

--EXERCISE 15
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'Status'
UNION
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'OrderNumber'

SELECT  SalesOrderNumber, OrderDate, Status, SubTotal FROM Sales.SalesOrderHeader WHERE OrderDate = '2001-07-01' AND SubTotal > 10000

