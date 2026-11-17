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


