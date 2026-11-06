# Week 1 – Day 2: SQL Joins — Combining Tables
Internship: Data Analyst Intern – Cynaris Solutions
Week: 1 | Day: 2
Topic: SQL Joins — Combining Tables


# 1. Objective:

To learn how to combine data from multiple related tables using SQL JOINs. Practice retrieving matching and unmatched records, performing self-joins, and identifying duplicate rows caused by JOIN operations using a real-world e-commerce dataset.

# 2. Topics Covered:

- INNER JOIN: Retrieves matching records from both tables.
- LEFT JOIN: Retrieves all records from the left table and matching records from the right.
- RIGHT JOIN: Retrieves all records from the right table and matching records from the left.
- FULL OUTER JOIN: Retrieves all records from both tables, including unmatched records.
- SELF JOIN: Joins a table with itself.
- Table Aliases: Makes SQL queries shorter and easier to read.
- Multiple Table JOINs: Combines data from multiple related tables.
- Duplicate Rows: Understands row multiplication caused by JOINs and how to fix it using aggregation and CTEs.

# 3. Tools & Technologies

- SQL: Querying and analyzing relational data.
- SQLite: Database management.
- DB Browser for SQLite: Creating databases and executing queries.
- VS Code Writing and managing SQL files.
- Git & GitHub: Version control and project submission.
- Kaggle: Downloading the sample dataset.

# 4. How to Download Sample Sales Dataset

1. Visit [Kaggle – Brazilian E-Commerce Public Dataset (Olist)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
2. Log in to your Kaggle account.
3. Click Download.
4. Extract the downloaded ZIP file.
5. Keep the required CSV files in your Day2 dataset folder.

# Dataset tables used:
- customers
- geolocation
- orders
- order_items
- payments
- products
- sellers

# How to Import CSV into DB Browser for SQLite:

1. Open DB Browser for SQLite**.
2. Click New Database and save it as sales_target`.db`.
3. Go to File → Import → Table from CSV file.
4. Select a CSV file, such as `customers.csv`.
5. Enter the table name as `customers`.
6. Check that the first row contains column names.
7. Click OK to import.
8. Repeat the same steps for the remaining CSV files.
9. Open the Execute SQL tab to write and run queries.

# 5. SQL Practice

Completed practical exercises using the Olist e-commerce dataset:

- Used INNER JOIN to retrieve matching customer and order records.
- Used LEFT JOIN to find all customers, including those without orders.
- Used RIGHT JOIN to include all order items, even without matching seller records.
- Used FULL OUTER JOIN to retrieve matched and unmatched records from both tables.
- Used SELF JOIN to find customers or sellers belonging to the same city.
- Joined multiple tables to analyze customers, orders, products, sellers, and payments.
- Used GROUP BY, HAVING, SUM(), and COUNT() for data analysis.
- Identified duplicate rows caused by multiple JOINs.
- Fixed incorrect totals using CTEs and pre-aggregation.

# 6. Project Folder Structure


cynaris-internship-Abrar/
│
├── Day2/
│   ├── sample-sales-data/
│   │   ├── customers.csv
│   │   ├── orders.csv
│   │   ├── order_items.csv
│   │   ├── payments.csv
│   │   ├── products.csv
│   │   ├── sellers.csv
│   │   └── geolocation.csv
│   │
│   ├── file.db
│   ├── sample.sql
│   ├── queries_day2.sql
│   └── README.md
│
└── README.md


Note: Keep the actual folder and file names consistent with your repository.

# 7. Git and GitHub Workflow

Created a feature branch to complete the Day 2 SQL JOIN assignment.

Create or switch to the feature branch:

(`git checkout -b feature/week-1-day-2`)


If the branch already exists:


git checkout feature/week-1-day-2

{Stage and commit changes:}
git add .
git commit -m "feat: sql-joins week-1-day-2 complete"

# 8. Push the Feature Branch


git push -u origin feature/week-1-day-2


This uploads the feature branch and its commits to GitHub.

# 9. Create a Pull Request

1. Open the GitHub repository.
2. Click Compare & pull request.
3. Select `main` as the base branch.
4. Select `feature/week-1-day-2` as the compare branch.
5. Add a title and short description.
6. Link the Day 2 deliverable.
7. Click Create pull request.

# 10. Deliverables

- `queries_day2.sql` containing examples of all four JOIN types.
- Practical examples of SELF JOIN and multiple-table JOINs.
- Duplicate row identification and correction queries.
- Updated `README.md`.
- GitHub feature branch with committed and pushed changes.
- Pull Request submitted for review.
- CIA activity and insights documented in the work log.

# 11. Learning Outcomes

After completing this lesson, I can:

- Combine related tables using different SQL JOIN types.
- Identify matching and unmatched records.
- Write SELF JOIN queries using table aliases.
- Understand one-to-many relationships.
- Identify and fix duplicate rows caused by JOIN multiplication.
- Use aggregate functions and CTEs to calculate accurate results.
- Manage SQL assignments using Git and GitHub.

# Learning Resources

- [Cynaris Learning Portal]
  (https://cynarissolutions.com/candidate/learn)

- [Kaggle Learn – Intro to SQL]
    (https://www.kaggle.com/learnintro-to-sql)
- [Mode SQL Tutorial]
    (https://mode.com/sql-tutorial)
- [W3Schools SQL Reference]
    (https://www.w3schools.com/sql/)
- [SQL Joins Video Lesson]
    (https://www.youtube.com/watch?v=9yeOJ0ZMUYw)




