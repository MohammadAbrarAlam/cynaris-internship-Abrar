-- Query 1: Inner Join (Customers and Orders tables)
Select
 * 
 from 
  Customers 
inner join
  Orders
on
  Customers.customer_id = Orders.customer_id;  -- Joins the Customers and Orders tables based on the customer_id column.

-- Inner Join is used to combine records from two tables based on a related column between them. In this case, it retrieves records where the customer_id matches in both Customers and Orders tables.
===================================================================================================

-- Query 2: Inner Join (Customers and Orders tables) specifying columns like customer_name, order_id, and order_date.

Select
  Customers.customer_name,
  Orders.order_id,
  Orders.order_date
from
  Customers
inner join
  Orders
on
  Customers.customer_id = Orders.customer_id;  -- Joins the Customers and Orders tables based


-- Query 3: Left Join (Customers and Orders tables) to retrieve all customers and their orders, including customers without orders.

select 
	c.customer_id,
	c.customer_city,
	o.order_id,
	o.order_status
	
from 
   Customers as c
LEFT JOIN
   orders as o
  
on 
	c.customer_id= o.customer_id
where order_status = "canceled";
 
-- Left Join is used to retrieve all records from the left table (Customers) and the matched records from the right table (Orders). If there is no match, NULL values are returned for columns from the right table. In this case, it retrieves all customers and their orders, including customers without orders, and filters for canceled orders.
===================================================================================================

-- Query 4: Right Join (Sellers and Order_items tables) to retrieve all orders and their corresponding customers, including orders without customers.
SELECT
    s.seller_id,
    s.seller_city,
    SUM(oi.price) AS total_sales
FROM sellers s
RIGHT JOIN order_items oi
    ON s.seller_id = oi.seller_id
GROUP BY
    s.seller_id,
    s.seller_city
ORDER BY total_sales DESC
LIMIT 5;

====================================================================================================
-- Query 5: Full Outer Join (Customers and Orders tables) to retrieve all customers and their orders, including customers without orders and orders without customers.
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
FROM Customers c
FULL OUTER JOIN Orders o
    ON c.customer_id = o.customer_id;

-- Full Outer Join is used to retrieve all records from both tables (Customers and Orders), including records that do not have matching values in the other table. In this case, it retrieves all customers and their orders, including customers without orders and orders without customers.
====================================================================================================
-- Query 6: Self Join (Employees table) to retrieve employees and their managers.

SELECT
    c1.customer_id AS customer_1,
    c1.customer_city,
    c2.customer_id AS customer_2
FROM customers c1
INNER JOIN customers c2
    ON c1.customer_city = c2.customer_city
WHERE c1.customer_id < c2.customer_id;

--- Self Join is used to join a table to itself. In this case, it retrieves pairs of customers who are from the same city, ensuring that each pair is unique by using the condition c1.customer_id < c2.customer_id.
====================================================================================================

--- Query 7: Group By + Having to identify duplicate rows.
SELECT
    order_id,
    COUNT(*) AS total_items
FROM 
    order_items
GROUP BY 
    order_id
HAVING  
    COUNT(*) > 1;

-- Group By is used to group rows that have the same values in specified columns into summary rows. In this case, it groups the order_items by order_id and counts the number of items in each order. The Having clause is used to filter the results to only include orders that have more than one item, effectively identifying duplicate rows based on order_id.
-- Having is used to filter the results of a Group By query based on aggregate functions, allowing you to specify conditions on the grouped data. In this case, it filters for orders that have more than one item, indicating potential duplicates in the order_items table.
