-- JOIN: Select all computers from products table. Using products & categories tables, return 
-- product name & category name. 
SELECT P.Name AS product, C.Name AS Category FROM products AS P
INNER JOIN categories AS C ON C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';
-- "Find the product Name, category name from the products table
-- "Nickname the tables as P, C, then join tables along their CategoryID columns
-- "Where the Category Name is 'Computers' ".

-- JOIN: Find all product names, product prices, and product ratings that have a rating of 5.
SELECT p.Name, p.Price AS product, R.rating FROM products AS P
INNER JOIN reviews AS R ON P.productID = R.productID
WHERE R.rating = 5;
-- "Return the product name and price from products table P and rating from table R
-- "Join products to reviews table R along their shared Product IDs
-- "Only where review table's rating value = 5."

-- JOIN: Find the employee with the most quantity sold. Use the SUM( ) and GROUP BY commands.
SELECT e.FirstName, e.MiddleInitial, e.LastName, SUM(s.Quantity) 
AS Total FROM employees AS e
INNER JOIN SALES AS s ON  e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC LIMIT 2;
-- "Return the full name and total sales
-- "From employees table 'e'
-- "Combine the Sales table 's' with employees along the EmployeeID column
-- "Group the results by the EmployeeID from employees table
-- "Organize results by Total column, limit the top 2 emmployees"

-- JOIN: Find the department name and category name for Appliances and Games
SELECT d.Name AS 'Department Name', c.Name AS 'Category Name'
FROM departments AS d
INNER JOIN categories  AS c ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';
-- "Fetch the Name columns from departments and categories, renaming them accordingly
-- "Join categories to departments along the shared DepartmentID column
-- "But only where the category name is 'Appliances' or 'Games'

