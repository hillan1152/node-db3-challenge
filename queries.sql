-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName
        , c.CategoryName
FROM Product as p
    JOIN Category as c
    ON p.CategoryId = c.Id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id as OrderId
    , s.CompanyName
FROM [Order] AS o
    JOIN Shipper AS s ON o.ShipVia = s.Id
WHERE O.OrderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT Product.ProductName
    , OrderDetail.Quantity
    , OrderDetail.Id
FROM OrderDetail
    JOIN Product ON OrderDetail.ProductId = Product.id
Where OrderDetail.OrderId = 10251
ORDER BY ProductName;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT distinct od.OrderId as OrderID
    , c.CompanyName as CompanyName
    , e.LastName as CustomerLastName
FROM [Order] as o
    Join OrderDetail as od on o.id = od.OrderId
    Join Customer as c on o.CustomerId = c.id
    Join Employee as e on o.EmployeeId = e.id;