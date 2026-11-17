/*SELECT  Customers.CompanyName, Orders.OrderID, SUM("[O D]".Quantity), E.FirstName+ ' ' + E.LastName AS FullName From Orders
    INNER JOIN dbo.Customers  on Customers.CustomerID = Orders.CustomerID
    INNER JOIN dbo.[Order Details] "[O D]" on Orders.OrderID = "[O D]".OrderID
    INNER JOIN dbo.Employees E on E.EmployeeID = Orders.EmployeeID
    GROUP BY CompanyName, Orders.OrderID, E.FirstName, E.LastName

SELECT  Customers.CompanyName, Orders.OrderID, SUM("[O D]".Quantity * "[O D]".UnitPrice ) From Orders
        INNER JOIN dbo.Customers  on Customers.CustomerID = Orders.CustomerID
        INNER JOIN dbo.[Order Details] "[O D]" on Orders.OrderID = "[O D]".OrderID
        GROUP BY CompanyName, Orders.OrderID

SELECT  Customers.CompanyName, Orders.OrderID, SUM("[O D]".Quantity * "[O D]".UnitPrice) + Orders.Freight AS TotalPrice From Orders
        INNER JOIN dbo.Customers  on Customers.CustomerID = Orders.CustomerID
        INNER JOIN dbo.[Order Details] "[O D]" on Orders.OrderID = "[O D]".OrderID
        GROUP BY CompanyName, Orders.OrderID, Orders.Freight */

/* SELECT DISTINCT s.CompanyName
FROM Shippers s
         INNER JOIN Orders o
                    ON s.ShipperID = o.ShipVia
         INNER JOIN [Order Details] od
                    ON o.OrderID = od.OrderID
         INNER JOIN Products p
                    ON od.ProductID = p.ProductID
         INNER JOIN Categories c
                    ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Meat/Poultry'
  AND YEAR(o.ShippedDate) = 1997
  AND MONTH(o.ShippedDate) = 3; */


/* SELECT DISTINCT s.CompanyName FROM Shippers s
        LEFT JOIN Orders o ON s.ShipperID = o.ShipVia
                        AND YEAR(o.ShippedDate) = 1997
                        AND MONTH(o.ShippedDate) = 3
        LEFT JOIN [Order Details] od ON o.OrderID = od.OrderID
        LEFT JOIN Products p ON od.ProductID = p.ProductID
        LEFT JOIN Categories c ON p.CategoryID = c.CategoryID AND c.CategoryName = 'Meat/Poultry'

        GROUP BY s.ShipperID, s.CompanyName
        HAVING COUNT(c.CategoryID) = 0; */

/* SELECT s.CompanyName, SUM("[O D]".Quantity * "[O D]".UnitPrice ) FROM Shippers s
    LEFT JOIN Orders o ON o.ShipVia = s.ShipperID AND YEAR(o.ShippedDate) = 1997 AND MONTH(o.ShippedDate) = 3
    LEFT JOIN dbo.[Order Details] "[O D]" on o.OrderID = "[O D]".OrderID
    LEFT JOIN dbo.Products P on P.ProductID = "[O D]".ProductID
    LEFT JOIN dbo.Categories C on C.CategoryID = P.CategoryID AND c.CategoryName = 'Meat/Poultry'
    GROUP BY s.CompanyName */


/* 3.1 SELECT c.CategoryName, SUM("[O D]".Quantity)FROM Categories c
    INNER JOIN dbo.Products P on c.CategoryID = P.CategoryID
    INNER JOIN dbo.[Order Details] "[O D]" on P.ProductID = "[O D]".ProductID
    group by c.CategoryName */



/* 3.2 SELECT c.CategoryName, SUM("[O D]".Quantity)FROM Categories c
left join dbo.Products P on c.CategoryID = P.CategoryID
LEFT JOIN dbo.[Order Details] "[O D]" on P.ProductID = "[O D]".ProductID
inner join dbo.Orders O on O.OrderID = "[O D]".OrderID AND YEAR(o.ShippedDate) = 1997

group by c.CategoryName */

/* 3.3 SELECT c.CategoryName, SUM("[O D]".Quantity * "[O D]".UnitPrice )FROM Categories c
    LEFT JOIN dbo.Products P on c.CategoryID = P.CategoryID
    LEFT JOIN dbo.[Order Details] "[O D]" on P.ProductID = "[O D]".ProductID
    group by c.CategoryName */


/* 4.1 SELECT s.CompanyName, COUNT(O.OrderID)FROM Shippers s
    LEFT JOIN dbo.Orders O on s.ShipperID = O.ShipVia and YEAR(O.OrderDate) = 1997
    group by s.CompanyName */

/* 4.2 SELECT TOP 1 s.CompanyName FROM Shippers s
    LEFT JOIN dbo.Orders O on s.ShipperID = O.ShipVia and YEAR(O.OrderDate) = 1997
    group by s.CompanyName
    order by COUNT(O.OrderID) DESC */

/* 4.3 SELECT s.CompanyName, SUM(O.Freight) FROM Shippers s
    LEFT JOIN dbo.Orders O on s.ShipperID = O.ShipVia AND
                              YEAR(ShippedDate) = 1998 AND
                              MONTH(ShippedDate) = 5 AND
                              DAY(ShippedDate) BETWEEN 3 AND 29
    group by s.CompanyName */

/* 5.1 SELECT e.FirstName, e.LastName, SUM("[O D]".Quantity * "[O D]".UnitPrice )FROM Employees e
    LEFT JOIN dbo.Orders O on e.EmployeeID = O.EmployeeID AND
                              YEAR(OrderDate) = 1996 AND
                              MONTH(OrderDate) = 5
    LEFT JOIN dbo.[Order Details] "[O D]" on O.OrderID = "[O D]".OrderID
group by e.FirstName, e.LastName */


/* 5.2 SELECT TOP 1 e.FirstName, e.LastName, COUNT(O.OrderID) FROM Employees e
    LEFT JOIN dbo.Orders O on e.EmployeeID = O.EmployeeID AND
                              YEAR(OrderDate) = 1996
    group by e.FirstName, e.LastName
    order by COUNT(O.OrderID) DESC */

/* 5.3 SELECT TOP 1 e.FirstName, e.LastName, SUM("[O D]".Quantity * "[O D]".UnitPrice ) AS Value FROM Employees e
    LEFT JOIN dbo.Orders O on e.EmployeeID = O.EmployeeID AND
                              YEAR(OrderDate) = 1996
    LEFT JOIN dbo.[Order Details] "[O D]" on O.OrderID = "[O D]".OrderID
group by e.FirstName, e.LastName
order by Value DESC */

/* 6.1 SELECT e.FirstName, e.LastName, SUM("[O D]".Quantity * "[O D]".UnitPrice ) AS Value FROM Employees e
    LEFT  JOIN dbo.Orders O on e.EmployeeID = O.EmployeeID
    LEFT OUTER JOIN dbo.[Order Details] "[O D]" on O.OrderID = "[O D]".OrderID
WHERE e.EmployeeID IN (
    SELECT DISTINCT e.ReportsTo
    FROM dbo.Employees
    WHERE ReportsTo IS NOT NULL )
group by e.FirstName, e.LastName; */


/* 6.2 SELECT c.CompanyName FROM Customers c
    LEFT JOIN dbo.Orders O on c.CustomerID = O.CustomerID
    WHERE YEAR(OrderDate) = 1998
    GROUP BY c.CompanyName, c.Country
    HAVING (c.Country LIKE 'France' AND COUNT(o.OrderID) > 2) OR
           (c.Country LIKE 'Germany' AND COUNT(o.OrderID) > 3) */
