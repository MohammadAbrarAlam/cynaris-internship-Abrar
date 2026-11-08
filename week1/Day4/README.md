# Week 1 – Day 4:   SQL Subqueries & CTEs

# 1. Objective:

The objective of this practical is to understand and implement SQL Subqueries, Correlated Subqueries, and Common Table Expressions (CTEs) using a Brazilian E-commerce dataset.

The focus is on analysing customer orders, product prices, seller performance, and category-wise revenue using advanced SQL queries.

# Learning Objectives:

- Understand subqueries and their types.
- Practise correlated and non-correlated subqueries.
- Retrieve data using IN and aggregate functions.
- Analyse customer and seller performance.
- Create and use CTEs with the WITH clause.
- Combine multiple CTEs for data analysis.

# 2. Topics Covered:

`Subqueries`
A subquery is a SQL query written inside another SQL query.

**Types:**

- **Non-Correlated Subquery:** Executes independently of the outer query.
- **Correlated Subquery:** Depends on values from the outer query.

# Common Table Expressions (CTEs):

A CTE is a temporary named result set created using the WITH clause.
It makes complex SQL queries easier to read and organise.

**Key Uses:**

- Simplify complex queries.
- Break analysis into smaller steps.
- Reuse intermediate results.
- Perform multi-step analysis.

# 3. Tools & Technologies:

- SQL
- SQLite
- DB Browser for SQLite
- Kaggle
- Visual Studio Code
- Git & GitHub

# 4. Dataset Used:

**Dataset Name:** Brazilian E-Commerce Public Dataset by Olist

**Platform:** Kaggle

**Dataset Link:** [https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

**Database:** `sales_data.db`

**Dataset Format:** CSV

# Tables Used

| Table Name  | Description                         |
| ----------- | ----------------------------------- |
| customers   | Customer details and location       |
| orders      | Customer order information          |
| order_items | Products, sellers, and order prices |
| products    | Product details and categories      |
| sellers     | Seller information                  |

# 5. Practical Tasks – SQL Queries:

# Query 1: Find Orders from São Paulo (SP)
- Use a non-correlated subquery to find orders placed by customers from São Paulo.

    ```sql
    SELECT *
    FROM orders
    WHERE customer_id IN (
        SELECT customer_id
        FROM customers
        WHERE city = 'São Paulo'
        AND state = 'SP'
    );


**Explanation:**

- Inner Query: Retrieves customer IDs from São Paulo.
- Outer Query: Finds orders associated with those customers.

# Query 2: Find Products That Have Been Ordered

    ```sql
    SELECT *
    FROM products
    WHERE product_id IN (
        SELECT product_id
        FROM order_items
    );
    ```

**Explanation:**

- Inner Query: Retrieves product IDs available in order_items.
- Outer Query: Returns the corresponding product details.

# Query 3: Find Order Items Above Average Price

```sql
    SELECT *
    FROM order_items
    WHERE price > (
        SELECT AVG(price)
        FROM order_items
    );
```

**Explanation:**

- Inner Query: Calculates the average order item price.
- Outer Query: Finds items priced above the average.

# Query 4: Find Products Above Average Weight

```sql
SELECT *
FROM products
WHERE product_weight_g > (
    SELECT AVG(product_weight_g)
    FROM products
);
```

**Explanation:**

- Inner Query: Calculates the average product weight.
- Outer Query: Retrieves products weighing more than the average.

# Query 5: Find the Highest-Priced Item for Each Seller

```sql
    SELECT
        oi.seller_id,
        oi.product_id,
        oi.price
    FROM order_items oi
    WHERE oi.price = (
        SELECT MAX(oi2.price)
        FROM order_items oi2
        WHERE oi2.seller_id = oi.seller_id
    );
```

**Explanation:**

- Inner Query: Finds the maximum item price for each seller.
- Outer Query: Retrieves the highest-priced items for each seller.

# Query 6: Find Customers with More Than 3 Orders

```sql
    SELECT
        c.customer_id,
        c.customer_city,
        c.customer_state
    FROM customers c
    WHERE (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) > 3;
```

**Explanation:**

- Inner Query: Counts orders placed by each customer.
- Outer Query: Returns customers with more than three orders.

# Query 7: Find Products Priced Above Their Category Average

```sql
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
        WHERE p2.product_category_name =
            p.product_category_name
    );
```

**Explanation:**

- INNER JOIN: Combines product and order item details.
- Correlated Subquery: Calculates the average price within the same category.
- Outer Query: Returns items priced above their category average.

# Query 8: Calculate Total Revenue for Each Seller

```sql
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
```

**Explanation:**

- CTE: Calculates total revenue for each seller.
- Outer Query: Displays sellers ranked by revenue.

# Query 9: Find the Top 5 Customers by Order Value

```sql
    WITH CustomerOrderValue AS (
        SELECT
            o.customer_id,
            SUM(oi.price) AS total_order_value
        FROM orders o
        JOIN order_items oi
            ON o.order_id = oi.order_id
        GROUP BY o.customer_id
    )
    SELECT *
    FROM CustomerOrderValue
    ORDER BY total_order_value DESC
    LIMIT 5;
```

**Explanation:**

- CTE: Calculates total order value for each customer.
- Outer Query: Returns the five customers with the highest order value.

# Query 10: Calculate Revenue by Product Category

```sql
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
```

**Explanation:**

- CTE: Calculates total revenue for each product category.
- Outer Query: Displays category-wise revenue in descending order.

# Query 11: Find Average Order Value for Each Customer

```sql
    WITH OrderValues AS (
        SELECT
            o.customer_id,
            o.order_id,
            SUM(oi.price) AS order_value
        FROM orders o
        JOIN order_items oi
            ON o.order_id = oi.order_id
        GROUP BY o.customer_id, o.order_id
    ),
    CustomerOrderValue AS (
        SELECT
            customer_id,
            AVG(order_value) AS average_order_value
        FROM OrderValues
        GROUP BY customer_id
    )
    SELECT *
    FROM CustomerOrderValue
    ORDER BY average_order_value DESC;
```

**Explanation:**

- First CTE: Calculates the value of each order.
- Second CTE: Calculates the average order value for each customer.
- Outer Query: Displays customers ranked by average order value.

*Note: Revenue and order values in these queries are calculated using item prices only, excluding freight charges.*

# 6. Project Folder Structure

```text
cynaris-internship-Abrar/
│
└── Day4/
    ├── data/
    │   ├── customers.csv
    │   ├── orders.csv
    │   ├── order_items.csv
    │   ├── products.csv
    │   └── sellers.csv
    │
    ├── sales_data.db
    ├── queries_day4.sql
    └── README.md
```

**Note:** The CSV files are used to create and populate the SQLite database.
 Keep large raw datasets local unless required for submission.

# 7. Git and GitHub Workflow

**Step 1: Open Project Folder**
    (`cd cynaris-internship-Abrar`)

**Step 2: Create Feature Branch**
   ``` bash
    git checkout main
    git pull origin main
    git checkout -b feature/week-1-day-4
    ```

**Step 3: Stage Files**

    ```bash
    git add Day4/queries_day4.sql Day4/README.md
    ```
**Step 4: Commit Changes**

    ```bash
    git commit -m "feat: sql-cte week-1-day-4 complete"
    ```
**Step 5: Push Branch**

    ```bash
    git push -u origin feature/week-1-day-4
    ```
**Step 6: Create Pull Request**

    - Base branch: `main`
    - Compare branch: `feature/week-1-day-4`
    # Pull Request Title

Week 1 Day 4 – SQL Subqueries & CTEs
    ### Pull Request Description
    This pull request contains the Week 1 Day 4 SQL practical.

**Completed Tasks:**

- Practised correlated and non-correlated subqueries.
- Analysed customer orders and product prices.
- Identified top-performing sellers and customers.
- Calculated category-wise revenue using CTEs.
- Practised multi-step analysis using multiple CTEs.

**Deliverables:**

- `queries_day4.sql`
- `README.md`

# 8. Deliverables [Cynaris Learning]

| Deliverable     | Description                    | Status    |
| --------------- | ------------------------------ | --------- |
| Olist Dataset   | Brazilian E-commerce CSV files | To verify |
| SQLite Database | ecommerce.db                   | To verify |
| SQL Queries     | 11 Subquery and CTE examples   | To verify |
| README.md       | Project documentation          | Completed |
| Git Commit      | Descriptive commit             | Pending   |
| GitHub Push     | Feature branch pushed          | Pending   |
| Pull Request    | PR against main                | Pending   |
| CIA Activity    | Research and documentation     | Pending   |

# 9. CIA Activities

- **Research:** Explore recursive CTEs and their real-world applications.
- **Career:** Search for SQL CTE-related roles and required skills.
- **Review:** Submit SQL queries to CIA for feedback.
- **Learning:** Understand the performance differences between subqueries and CTEs.

# 10. Viva Questions

1. What is the difference between correlated and non-correlated subqueries?
2. What is the purpose of the WITH clause?
3. What is the difference between EXISTS and IN?

# 11. Learning Outcome

Through this practical, I gained hands-on experience with SQL subqueries and CTEs using an e-commerce dataset. I practised analysing customer orders, comparing product prices, calculating seller revenue, and identifying top-performing customers.

I also learned how CTEs simplify complex SQL queries and support multi-step data analysis.

---

**Internship:** Cynaris Solutions Pvt. Ltd.

**Program:** Data Analyst Intern

**Week:** 1

**Day:** 4

**Topic:** SQL Subqueries & CTEs

**Repository:** cynaris-internship-Abrar
