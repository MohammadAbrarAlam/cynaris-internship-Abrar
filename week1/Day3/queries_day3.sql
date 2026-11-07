--Query 1: Total number of records
SELECT COUNT(*) AS total_records 
FROM superstore_data;

-- Count (): It is an aggregate function that returns the total number of records.
-- As : Aliasing the result as total_records for better readability.
===================================================================================
---Query 2: Total sales amount
SELECT SUM(Sales) AS total_sales
FROM superstore_data; 

--- Sum (): It is an aggregate function that returns the total sum of the Sales column.
===================================================================================
--Query 3: Average sales amount
SELECT AVG(Sales) AS average_sales
FROM superstore_data;

--- Avg (): It is an aggregate function that returns the average value of the Sales column.
===================================================================================
---Query 4: Maximum sales amount
SELECT MAX(Sales) AS maximum_sales
FROM superstore_data;

--- Max (): It is an aggregate function that returns the maximum value of the Sales column.
===================================================================================
---Query 5: Minimum sales amount
SELECT MIN(Sales) AS minimum_sales
FROM superstore_data;

--- Min (): It is an aggregate function that returns the minimum value of the Sales column.
===================================================================================
-- Query 6:Total sales by region
SELECT Region, SUM(Sales) AS total_sales_by_region
FROM superstore_data
GROUP BY Region;

-- group by: It is used to group the result set by one or more columns. 
===================================================================================
-- Query 7: Total sales and avg by category
SELECT Category,
 SUM(Sales) AS total_sales_by_category,
 AVG(Sales) AS average_sales_by_category
FROM superstore_data
GROUP BY Category;

====================================================================================
--Query-8: Regions having sales above 100000
SELECT region, SUM(Sales) AS total_sales
FROM superstore_data
GROUP BY region
HAVING SUM(Sales) > 100000;

--- Having: It is used to filter the result set based on aggregate functions.
====================================================================================
---Query-9: Top 5 products by sales
SELECT ProductName, 
  SUM(Sales) AS total_sales
FROM superstore_data
GROUP BY ProductName
ORDER BY total_sales DESC
LIMIT 5;

================================================================================
-- Query-10: Total sales by year
SELECT YEAR(OrderDate) AS order_year,
   SUM(Sales) AS total_sales_by_year
from superstore_data
GROUP BY YEAR(OrderDate)
ORDER BY order_year;

=================================================================================
-- Query-11:Calculate regional sales without removing individual records.
SELECT Region, Sales, 
  SUM(Sales) OVER (PARTITION BY Region) AS total_sales_by_region
FROM superstore_data;

--- Over(): It is used to perform aggregate functions without removing individual records.
--- Partition by: It is used to divide the result set into partitions to perform aggregate functions on each partition.
=================================================================================


