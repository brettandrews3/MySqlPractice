SELECT * FROM bestbuy.products;

SELECT * FROM bestbuy.products WHERE Price > 1400;

SELECT * FROM bestbuy.products WHERE Price = 11.99 OR Price = 13.99;
SELECT * FROM products WHERE Price = 11.99 OR Price = 13.99;

SELECT * FROM bestbuy.products WHERE Price != '11.99'; /* Redo with using the word NOT */
SELECT * FROM bestbuy.products WHERE NOT Price = 11.99;

SELECT * FROM bestbuy.products ORDER BY Price DESC;
/*  find all products and sort them by price from greatest to least */
SELECT * FROM bestbuy.employees WHERE MiddleInitial IS NULL;
/* find all employees who don't have a middle initial */
SELECT DISTINCT Price FROM bestbuy.products;
/* find distinct product prices */
SELECT * FROM bestbuy.employees WHERE FirstName LIKE 'j%';
/* find all employees whose first name starts with the letter “j” */
SELECT * FROM bestbuy.products WHERE Name LIKE 'Macbook';
/* find all Macbooks */
SELECT * FROM bestbuy.products WHERE OnSale = 1;
/* find all products that are on sale */
SELECT AVG(Price) FROM bestbuy.products;
/* find the average price of all products */
SELECT * FROM employees WHERE Title = 'Geek Squad' AND MiddleInitial IS NULL;
/* find all Geek Squad employees who don't have a middle initial */
SELECT * FROM products WHERE StockLevel BETWEEN 500 AND 1200;
/* -- find all products from the products table whose stock level is in the range of 500 to 1200. 
Order by least to greatest. **Try this with the between keyword */
SELECT * FROM bestbuy.categories; -- Computers are CategoryID 1;

SELECT * FROM products;
SELECT * FROM products INNER JOIN sales ON sales.ProductID = products.ProductID;
-- joins: select all the computers from the products table;
SELECT * FROM products AS p
INNER JOIN categories AS c ON c.CategoryID = P.CategoryID;

SELECT p.Name as Product, C.Name AS CategoryID FROM products AS p
INNER JOIN categories AS c ON c.CategoryID = P.CategoryID WHERE CategoryID = 1;
-- using the products table and the categories table, return the product name and the category name
 
-- joins: find all product names, product prices, and products ratings that have a rating of 5
SELECT p.Name, p.Price, r.Rating FROM products AS p INNER JOIN reviews AS r ON r.ProductID = p.ProductID
 WHERE r.Rating = 5;
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
-- SELECT * FROM sales AS s
-- INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID;
SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS Total FROM sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

-- joins: find the name of the department, and the name of the category for Appliances and Games
SELECT d.Name as 'Department Name ', c.Name AS 'Category Name' FROM departments AS d
INNER JOIN categories AS c ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

-- joins: find the employee name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use COUNT() && SUM()
SELECT p.Name, Sum(s.Quantity), Sum(s.Quantity * s.PricePerUnit) FROM products AS p INNER JOIN sales
AS s ON s.ProductID = p.ProductID
WHERE p.ProductID = 97;
-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. 
-- (only return for the lowest rating!)
SELECT p.Name, r.Reviewer, r.Rating, r.Comment FROM products 
AS p INNER JOIN reviews AS r ON r.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, 
the name of each product, how many of that product they sold and what date they sold it on */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) AS TotalSold, s.Date 
FROM Sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;

SELECT * FROM Departments;

UPDATE products SET Name = 'whatever' WHERE ProductID = 941;

SELECT * FROM products;

INSERT INTO products (Name, Price, CategoryID) VALUES ('Michaels product', 300, 4);