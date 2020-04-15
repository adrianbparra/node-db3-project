-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select ProductName, c.CategoryName 
from Product as p
join Category as c
on p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.Id, s.CompanyName
from [Order] as o
join Shipper as s
on o.ShipVia = s.Id
where o.OrderDate < "2012-08-09"


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.ProductName, o.Quantity from [OrderDetail] as o
join [Product] as p
on p.Id = o.ProductId
where OrderId = 10251
order by p.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.


select o.Id as 'Order ID', c.CompanyName as 'Customer Company Name', e.LastName as 'Employee Last Name' from [Order] as o
join [Customer] as c
on o.CustomerId = c.Id
join [Employee] as e
on o.EmployeeId = e.Id

--   In [SQL Try Editor at W3Schools.com](https://www.w3schools.com/Sql/tryit.asp?filename=trysql_select_top):

--   Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT CategoryName, Count(Products.ProductID) as Count FROM Categories
JOIN Products
ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName


--   Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT OrderID, Quantity as ItemCount FROM [OrderDetails]
Group By OrderID