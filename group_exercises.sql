-- Northwind

-- 1.1 SELECT orderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS OrderValue FROM [Order Details] GROUP BY OrderID ORDER BY OrderValue DESC;
-- 1.2 SELECT TOP 10 orderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS OrderValue FROM [Order Details] GROUP BY OrderID ORDER BY OrderValue DESC;
-- 1.3 SELECT OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS OrderValue FROM [Order Details] GROUP BY OrderID HAVING SUM(Quantity) > 250;
-- 1.4 SELECT ProductID, SUM(UnitsOnOrder) AS OrderedUnits FROM Products WHERE ProductID < 3 GROUP BY ProductID

-- 4.1 SELECT EmployeeID, COUNT(OrderID)FROM Orders WHERE YEAR(ORderDate) = 1997 group by EmployeeID;
-- 4.2 SELECT EmployeeID, COUNT(DISTINCT CustomerID)FROM Orders WHERE YEAR(OrderDate) = 1997 group by EmployeeID;
-- 4.3 SELECT ShipVia, SUM(Freight) AS TotalFreight From Orders GROUP BY ShipVia;
-- 4.4 SELECT ShipVia, SUM(Freight) AS TotalFreight From Orders WHERE YEAR(OrderDate) IN (1996,1997) GROUP BY ShipVia;

-- 5.1 SELECT EmployeeID, YEAR(OrderDate) AS OrderYear, Count(OrderID) From Orders GROUP BY EmployeeID, YEAR(OrderDate) ORDER BY EmployeeID;
-- 5.2 SELECT EmployeeID, YEAR(OrderDate) AS OrderYear, Month(OrderDate) AS OrderMonth, Count(OrderID) From Orders GROUP BY EmployeeID, YEAR(OrderDate), MONTH(OrderDate) ORDER BY EmployeeID;

-- library

-- 2.1 SELECT Count(member_no) FROM adult;
-- 2.2 SELECT Count(member_no) FROM juvenile;
-- 2.3 SELECT COUNT(member_no) FROM adult WHERE state = 'CA';
-- 2.4 SELECT adult_member_no, count(member_no) FROM juvenile GROUP BY adult_member_no;
-- 2.5 SELECT adult_member_no, count(member_no) FROM juvenile WHERE YEAR(birth_date) < 1998 GROUP BY adult_member_no;

-- 3.1 SELECT member_no, Count(isbn) FROM loan GROUP BY member_no;
-- 3.2 SELECT member_no, Count(isbn) FROM reservation GROUP BY member_no;
-- 3.3 SELECT member_no, Count(isbn) FROM loanhist WHERE YEAR(in_date) = 2001 GROUP BY member_no;
-- 3.4 SELECT member_no, SUM(fine_assessed) FROM loanhist WHERE YEAR(in_date) = 2001 GROUP BY member_no ;
-- 3.5 SELECT count(isbn) FROM loanhist WHERE YEAR(out_date) = 2001 AND MONTH(out_date) = 5;
-- 3.6 SELECT AVG(DATEDIFF(day,out_date,in_date)) FROM loanhist WHERE YEAR(out_date) = 2001 AND MONTH(out_date) = 5;
