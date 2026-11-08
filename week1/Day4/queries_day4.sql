-- Subquery: A subquery is a SQL query written inside another SQL query.

-- query 1: Find all orders placed by customers from São Paulo (SP).
SELECT *
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE city = 'São Paulo' AND state = 'SP'
);

-- Inner Query: Finds all customers from São Paulo (SP) and returns their customer IDs. 
-- Outer Query: The outer query then retrieves all orders associated with those customer IDs.

=============================================================================================
-- Query 2: Find all products that have been ordered by customers.
Select * 
From Products
Where product_id IN (
    SELECT product_id
    FROM order_items
);

-- Inner Query: Finds all product IDs that have been ordered by customers from the order_items table.
-- Outer Query: The outer query retrieves all product details from the Products table for those product IDs.

=============================================================================================
-- Query 3:Find all order items whose price is greater than the average product price.
SELECT *
FROM order_items
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- No Correlated Subquery: The inner query does not independ on the outer query.
-- Inner Query: Calculates the average price of all products from the products table.
-- Outer Query: Retrieves all order items from the order_items table where the price is greater than the average product price calculated by the inner query.
=============================================================================================
-- Query 4:Find all products whose weight is greater than the average product weight.
select *
from products
where weight > (
    select avg(weight)
    from products
);
-- No Correlated Subquery: The inner query depends on the outer query.
-- Inner Query: Calculates the average weight of all products from the products table.
-- Outer Query: Retrieves all products from the products table where the weight is greater than the average product weight calculated by the inner query.

=============================================================================================
-- Query 5: Find the highest-priced product item for each seller.
SELECT
    oi.seller_id,
    oi.product_id,
    oi.price
FROM order_items as oi
WHERE oi.price = (
    SELECT MAX(oi2.price)
    FROM order_items as oi2
    WHERE oi2.seller_id = oi.seller_id
);

-- Correlated Subquery: The inner query depends on the outer query.
-- Inner Query: Finds the maximum price of products for each seller from the order_items table.
-- Outer Query: Retrieves the seller_id, product_id, and price of the highest-priced product item for each seller from the order_items table.

=============================================================================================
-- Query 6: Find customers who have placed more than 3 orders.

SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state
FROM customers as c
WHERE (
    SELECT COUNT(*)
    FROM orders as o
    WHERE o.customer_id = c.customer_id) > 3;

  -- Inner Query: Counts the number of orders placed by each customer from the orders table.
  -- Outer Query: Retrieves the customer_id, customer_city, and customer_state of customers who have placed more than 3 orders from the customers table.

  =============================================================================================
-- Query 7: Find products whose price is greater than the average price of their own category.

SELECT
    p.product_id,
    p.product_category_name,
    oi.price
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.price > (
    SELECT AVG(oi2.price)
    FROM products p2
    JOIN order_items oi2
        ON p2.product_id = oi2.product_id
    WHERE p2.product_category_name = p.product_category_name
);

-- INNER JOIN: The query joins the products and order_items tables to get the product details along with their prices.
-- Correlated Subquery: The inner query depends on the outer query.
-- Inner Query: Calculates the average price of products within the same category as the outer query's product.
-- Outer Query: Retrieves the product_id, product_category_name, and price of products whose price is greater than the average price of their own category.
-- joining the products and order_items tables allows us to access the price information for each product while filtering based on the average price of products in the same category.

=============================================================================================
-- Query 8: Calculate total sales revenue for each seller.

WITH SellerRevenue AS (
    SELECT
        seller_id,
        SUM(price) AS total_revenue
    FROM order_items
    GROUP BY seller_id
)
SELECT *
FROM SellerRevenue
ORDER BY total_revenue DESC;

-- Common Table Expression (CTE): The query uses a CTE named SellerRevenue to calculate the total sales revenue for each seller.
-- Inner Query: The inner query calculates the total revenue for each seller by summing the prices of their order items and grouping by seller_id.
-- Outer Query: The outer query retrieves all sellers and their total revenue from the SellerRevenue C

=============================================================================================
-- Query 9: Find the top 5 customers with the highest total order value.

with CustomerOrderValue AS (
    SELECT
        o.customer_id,
        SUM(oi.price) AS total_order_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)

SELECT *
FROM CustomerOrderValue
ORDER BY total_order_value DESC
LIMIT 5;

-- Common Table Experession: It works similar to python functions, it allows us to create a temporary result set that can be referenced within the main query.
-- Inner Query: The inner query calculates the total order value for each customer by summing the prices of their order items and grouping by customer_id.
-- Outer Query: The outer query retrieves the top 5 customers with the highest total order value

=============================================================================================
-- Query 10: Find total revenue for each product category.

WITH CategoryRevenue AS (
    SELECT
        p.product_category_name,
        SUM(oi.price) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_category_name
)
SELECT *
FROM CategoryRevenue
ORDER BY total_revenue DESC;

-- Common Table Expression (CTE): The query uses a CTE named CategoryRevenue to calculate the total revenue for each product category.
-- Inner Query: The inner query calculates the total revenue for each product category by summing the prices of order items and grouping by product_category_name.
-- Outer Query: The outer query retrieves all product categories and their total revenue from the CategoryRevenue CTE, ordering the results by total revenue in descending order.

=============================================================================================
-- Query 11: Find the average order value for each customer.



