USE AdventureWorks
--Exercise 1
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'CustomerID'
SELECT * FROM Sales.Customer

--Exercise 2
SELECT CreditCardID AS 'Credit Card ID', CardType AS 'Credit Card Type', CardNumber AS 'Card Number', ExpYear AS 'Expiry Year' FROM Sales.CreditCard

--EXERCISE 3
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'TerritoryID'
SELECT CustomerID, AccountNumber, TerritoryID FROM Sales.Customer WHERE TerritoryID = 4

-- EXERCISE 4
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'LineTotal'
SELECT * FROM Sales.SalesOrderDetail WHERE LineTotal > 2000

--EXERCISE 5
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'ProductID'
SELECT * FROM Sales.SalesOrderDetail WHERE ProductID = 843 

--EXERCISE 6 
SELECT * FROM Sales.SalesOrderHeader WHERE OrderDate = '2004-06-06'

-- EXERCISE 7
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'OrderQty'
SELECT SalesOrderID AS 'Order ID', OrderQty AS 'Order Quantity', UnitPrice AS 'Unit Price', LineTotal AS 'Total Cost' FROM Sales.SalesOrderDetail

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

SELECT SalesPersonID AS 'Sales Person ID', TerritoryID AS 'Territory ID' FROM Sales.SalesOrderHeader WHERE TerritoryID IN (2, 4)

--EXERCISE 13
SELECT * FROM Sales.CreditCard WHERE CardType = 'Vista' AND ExpYear = 2006

--EXERCISE 14
SELECT ShipDate FROM Sales.SalesOrderHeader WHERE ShipDate > '2004-06-12'

--EXERCISE 15
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'Status'
UNION
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'OrderNumber'

SELECT  SalesOrderNumber AS 'Order Number', OrderDate AS 'Order Date', Status AS 'Status', SubTotal AS 'Total Cost' FROM Sales.SalesOrderHeader WHERE OrderDate = '2001-07-01' AND SubTotal > 10000

--EXERCISE 16
SELECT sals.CustomerID, per.ContactID,  per.FirstName, per.LastName, cus.OnlineOrderFlag FROM Person.Contact per JOIN Sales.Individual sals
ON per.ContactID = sals.ContactID
JOIN Sales.SalesOrderHeader cus
ON sals.CustomerID = cus.CustomerID
WHERE OnlineOrderFlag = 1 
ORDER BY CustomerID

--EXERCISE 17
SELECT ord.OrderQty AS 'Order ID', hed.TotalDue AS 'Total Due' FROM Sales.SalesOrderDetail ord JOIN Sales.SalesOrderHeader hed
ON ord.SalesOrderID = hed.SalesOrderID

--EXERCISE 18
SELECT SalesOrderID, TaxAmt FROM Sales.SalesOrderHeader WHERE TaxAmt < 2000 ORDER BY TaxAmt asc

--EXERCISE 19
SELECT SalesOrderID, SUM(LineTotal) AS TotalValue FROM Sales.SalesOrderDetail GROUP BY SalesOrderID ORDER BY SUM(LineTotal) asc

--EXERCISE 20
SELECT * FROM Sales.Currency WHERE Name like '%Dollar'

--EXERCISE 21
SELECT * FROM Sales.SalesTerritory WHERE Name like 'N%'

--EXERCISE 22
SELECT SalesPersonID AS 'Sales Person ID', TerritoryID AS 'Territory ID', SalesQuota AS 'Sales Quota' FROM Sales.SalesPerson WHERE SalesQuota IS NOT NULL

--EXERCISE 23
SELECT TOP 3 Bonus, SalesPersonID  FROM Sales.SalesPerson

--EXERCISE 24
SELECT * FROM Sales.Store WHERE Name like '%Bike%'

--EXERCISE 25
SELECT CardType FROM Sales.CreditCard

--EXERCISE 26
SELECT EmployeeID, LoginID, Title FROM HumanResources.Employee ORDER BY EmployeeID OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY

--EXERCISE 27
SELECT MAX(OrderQty) AS Maximum, MIN(OrderQty) AS Minimum, AVG(OrderQty) AS Average FROM Sales.SalesOrderDetail 

--EXERCISE 28
SELECT SUM(OrderQty) AS SUM FROM Sales.SalesOrderDetail 

--EXERCISE 29
SELECT TOP 5 SalesOrderID, TotalDue FROM Sales.SalesOrderHeader WHERE YEAR(OrderDate) = 2001 ORDER BY TotalDue desc;

--EXERCISE 30
SELECT SalesOrderID, SUM(LineTotal) AS TotalValue FROM Sales.SalesOrderDetail GROUP BY SalesOrderID 

--EXERCISE 31
SELECT ProductID, LineTotal FROM Sales.SalesOrderDetail WHERE LineTotal > 10000

--EXERCISE 32
SELECT ProductID, SUM(LineTotal) AS Total FROM Sales.SalesOrderDetail GROUP BY ROLLUP (ProductID)

--EXERCISE 33
SELECT SUM(OrderQty)As OrderValue, OrderDate FROM Sales.SalesOrderHeader soh JOIN Sales.SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY OrderDate

--EXERCISE 34
SELECT SUM(UnitPrice)AS TotalUnitPrice, SUM(LineTotal)AS TotalAmountCollected  FROM Sales.SalesOrderDetail WHERE ProductID IN (774, 777) GROUP BY ProductID
--Amount collected from both product id's
SELECT SUM(LineTotal)AS TotalAmountTogether  FROM Sales.SalesOrderDetail WHERE ProductID IN (774, 777) 

--EXERCISE 35
--Not Clear

--EXERCISE 36
SELECT SalesOrderID AS 'Sales Order ID', AVG(LineTotal) As 'Average Value' FROM Sales.SalesOrderDetail WHERE LineTotal < 5000  GROUP BY SalesOrderID 

--EXERCISE 37
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'SalesPersonID'
SELECT CustomerID, LEFT(Name, 15)AS First15, SalesPersonID FROM Sales.Store

--EXERCISE 38
SELECT SalesOrderID AS 'Order Number', TotalDue AS 'Total Due',  DATENAME(DAY, OrderDate) As 'Day Of Order', DATENAME(WEEKDAY, OrderDate)As 'Week Day'  FROM Sales.SalesOrderHeader

--EXERCISE 39
SELECT SalesOrderID, OrderQty, UnitPrice,  DENSE_RANK() OVER (ORDER BY UnitPrice) AS Identical FROM Sales.SalesOrderDetail 

--EXERCISE 40
SELECT EmployeeID, HireDate, DATENAME(MONTH, HireDate)As Month, DATENAME(YEAR, HireDate)As Year FROM HumanResources.Employee

--EXERCISE 41
SELECT CostRate, LocationID,  NTILE(3) OVER (ORDER BY LocationID ) AS Grouped FROM Production.Location WHERE CostRate > 12 ORDER BY CostRate desc

--EXERCISE 42
SELECT 'The list price of ' + Name + ' is' + CAST(ListPrice AS varchar(10))  FROM Production.Product WHERE ListPrice BETWEEN 360.00 AND 490.00 

--EXERCISE 43
SELECT ProductID, LineTotal AS 'Total' FROM Sales.SalesOrderDetail

--EXERCISE 44
SELECT SalesPersonID, SUM(SubTotal) AS SUM FROM Sales.SalesOrderHeader GROUP BY ROLLUP(SalesPersonID)

-- EXERCISE 45 Get back too
SELECT ProductID, StockedQty AS 'Availability of Products' FROM Purchasing.PurchaseOrderDetail

--EXERCISE 46 VERY WRONG I RETURNED YEAR INSTEAD OF PRICE
SELECT ProductID, YEAR(StartDate) AS 'Previous Year Price', EndDate AS 'Current Year Price' FROM Production.ProductListPriceHistory WHERE ProductID = 715 ORDER BY [Previous Year Price];

--EXERCISE 47
SELECT ISNULL(FirstName + ' ', '') +ISNULL(MiddleName + ' ', '') + ISNULL(LastName, '') AS 'Person Name' FROM Person.Contact WHERE FirstName like 'S%'

--EXERCISE 48
 SELECT Empid, Ename, Eproject FROM Work.Employee WHERE Empid IN (2,4)

--EXERCISE 49
SELECT Sname, Class FROM Student.StudentDetail Where Sname like 'S%'

--EXERCISE 50
 SELECT  Sname,  DENSE_RANK() OVER (ORDER BY Smarks desc) AS Marks FROM Student.StudentRecords ORDER BY Smarks desc

--EXERCISE 51
--1. row_number = Ranking Function
--2. pi() = Mathemathical Function
--3. avg() = Aggregate Function
--4. count() = Aggregate Function
--5. datefiff() = Date Function
--6. reverse() = String Function
--7. ntile() =Ranking Function