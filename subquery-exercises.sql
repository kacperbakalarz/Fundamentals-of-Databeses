/* 1.1 SELECT SUM(UnitPrice * Quantity) + O.Freight FROM [Order Details]
    INNER JOIN dbo.Orders O on O.OrderID = [Order Details].OrderID
WHERE O.OrderID = 10250
group by O.Freight */


/* 1.2 SELECT O.OrderID, SUM(UnitPrice * Quantity) + O.Freight FROM [Order Details]
INNER JOIN dbo.Orders O on O.OrderID = [Order Details].OrderID
group by O.OrderID, O.Freight */

/* 1.3 SELECT p.ProductName , SUM("[O D]".Quantity * "[O D]".UnitPrice ) FROM Products p
    INNER JOIN dbo.[Order Details] "[O D]" on p.ProductID = "[O D]".ProductID
group by p.ProductName */

/* 1.4 SELECT p.ProductName , SUM("[O D]".Quantity * "[O D]".UnitPrice ) FROM Products p
    INNER JOIN dbo.[Order Details] "[O D]" on p.ProductID = "[O D]".ProductID
    inner join dbo.Orders O on O.OrderID = "[O D]".OrderID AND YEAR(OrderDate) = 1997
    group by p.ProductName */