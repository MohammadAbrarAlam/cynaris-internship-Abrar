# Week 1 – Day 3:     (SQL Aggregations — GROUP BY & )

# 1. Objective:

The objective of this project is to understand and implement SQL aggregate functions, GROUP BY, HAVING, and Window Functions using a real-world retail sales dataset.

This practical focuses on summarizing large datasets, calculating business KPIs, analyzing regional and category-wise sales, and generating meaningful business insights using SQL.

# Learning Objectives:

- Understand aggregate functions: COUNT(), SUM(), AVG(), MAX(), MIN().
- Group records using GROUP BY.
- Filter aggregated results using HAVING.
- Perform sales analysis by region, category, and month.
- Understand and implement Window Functions using SUM() OVER().
- Generate business KPIs for retail sales analysis.

# 2. Topics Covered:
(`Aggregate Functions`)

 Function        Description
  * COUNT()      Counts total records 
  * SUM()        Calculates total sales or profit 
  * AVG()        Calculates average sales 
  * MAX()        Finds the maximum sales value 
  * MIN()        Finds the minimum sales value 

# GROUP BY:
  Used to group records with similar values.
  Practical analysis:
  - Total sales by region.
  - Total sales by category.
  - Monthly sales analysis.

# HAVING:
  Used to filter grouped results based on aggregate conditions.
  Example:
  - Identify regions where total sales exceed 100,000.

# Window Functions: 
  Used to perform calculations across related rows without combining individual records.
  Example:
  - Calculate total sales for each region using SUM() OVER(PARTITION BY Region).

# 3. Tools & Technologies:
- SQL
- SQLite
- DB Browser for SQLite
- Kaggle
- Visual Studio Code
- Git
- GitHub

# 4. How to Download Sample Sales Dataset:
`Dataset Name`: Sample Superstore Dataset
`Platform:` Kaggle
`Dataset Link:` https://www.kaggle.com/datasets/vivek468/superstore-dataset-final

# Download Steps:
1. Open the Kaggle dataset link.
2. Log in to your Kaggle account.
3. Click the Download button.
4. Download the ZIP file.
5. Extract the ZIP file.
6. Locate the Sample - Superstore.csv file.
7. Copy the CSV file into the Day3/data folder.

# 5. Dataset Tables Used:

**Main Table Name:** `superstore_data`

**Dataset Format:** CSV

# The Sample Superstore dataset contains 21 columns:

 Column Name          Description 

* Row ID              Unique row identifier 
* Order ID            Unique order identifier 
* Order Date          Date of customer order 
* Ship Date           Shipping date 
* Ship Mode           Shipping method 
* Customer ID         Customer identifier 
*  Customer Name      Customer name 
* Segment             Customer segment 
* Country             Country name 
* City                City name 
* State               State name 
* Postal Code         Postal code 
* Region              Sales region 
* Product ID          Product identifier 
* Category            Product category 
* Sub-Category        Product sub-category 
* Product Name        Product name 
* Sales               Sales amount 
* Quantity            Quantity sold 
* Discount            Discount percentage/value 
* Profit              Profit amount 

# How to Import CSV into DB Browser for SQLite:

1. Open DB Browser for SQLite.
2. Click New Database.
3. Save the database as `superstore.db` inside the Day3 folder.
4. Go to File → Import → Table from CSV file.
5. Select `Sample - Superstore.csv`.
6. Enter the table name as `superstore_data`.
7. Enable the option to create a new table.
8. Check that the column names are correctly recognized.
9. Click OK to import the dataset.
10. Click Write Changes to save the imported data.

# Verify Dataset Import:

- Run the following SQL query:
  SELECT *
  FROM superstore_data
  LIMIT 10;

- Check total records:
  SELECT COUNT(*) AS total_records
  FROM superstore_data;

# 6. Project Folder Structure

cynaris-internship-Abrar/
│
├── Day1/
│
├── Day2/
│
└── Day3/
    │
    │--- Sample - Superstore.csv
    │
    ├── superstore.db
    │
    ├── queries_day3.sql
    │
    └── README.md


**Note:** The database file and CSV dataset are used locally for practice. Avoid committing large or unnecessary dataset files to GitHub.

# 7. Git and GitHub Workflow

Git is used to track changes and manage the project source code.

# Step 1: Open Project Folder
  cd cynaris-internship-Abrar

# Step 2: Check Git Status
  git status

# Step 3: Create Feature Branch
  git checkout -b feature/week-1-day-3

# Step 4: Check Current Branch
  git branch

# Step 5: Add Project Files
  git add Day3/queries_day3.sql Day3/README.md

# Step 6: Commit Changes
  git commit -m "feat: sql-aggregations week-1-day-3 complete"

# 8. Push the Feature Branch
  Push the feature branch to the GitHub remote repository.
  git push -u origin feature/week-1-day-3


`Verify the branch:`
  (`git branch -a`)

Open your GitHub repository and check that the feature branch and committed files are available.

# 9. Create a Pull Request:

1. Open your GitHub repository.
2. Select the Pull Requests tab.
3. Click New Pull Request.
4. Select `main` as the base branch.
5. Select `feature/week-1-day-3` as the compare branch.
6. Enter the Pull Request title.
7. Add the project description.
8. Click Create Pull Request.

# Pull Request Title:

Week 1 Day 3 – SQL Aggregations: GROUP BY & HAVING

# Pull Request Description:

This pull request contains the Week 1 Day 3 SQL Aggregations practical.

**Completed Tasks:**

- Implemented 8 aggregate SQL queries.
- Practised COUNT(), SUM(), AVG(), MAX(), and MIN().
- Performed GROUP BY analysis by region, category, and month.
- Applied HAVING to filter aggregated results.
- Implemented one Window Function using SUM() OVER().
- Used the Sample Superstore retail sales dataset.

**Deliverables:**
- queries_day3.sql
- README.md

# 10. Deliverables [Cynaris Learning]

# Required Deliverables

| Deliverable | Description | Status |
|---|---|---|
| Sample Superstore Dataset | Kaggle CSV dataset | Completed |
| superstore_data | Imported SQLite table | Completed |
| queries_day3.sql | 8 aggregate queries + 1 window function | To verify |
| README.md | Project documentation | Completed |
| Git Commit | Descriptive commit message | Pending |
| GitHub Push | Feature branch pushed | Pending |
| Pull Request | PR raised against main | Pending |
| CIA Activity | Business KPI research and documentation | Pending |
# Business KPIs

The following business KPIs can be calculated using SQL:

1. Total Revenue – SUM(Sales)
2. Total Profit – SUM(Profit)
3. Total Orders – COUNT(DISTINCT "Order ID")
4. Average Sales – AVG(Sales)
5. Regional Revenue – GROUP BY Region
6. Category-wise Revenue – GROUP BY Category
7. Monthly Revenue – GROUP BY Month

### Learning Outcome

After completing this practical, I gained hands-on experience in SQL aggregation, grouping, filtering aggregated results, and Window Functions.

I also learned how SQL can be used to analyze retail sales data and generate meaningful business KPIs for data-driven decision-making.

**Internship:** Cynaris Solutions Pvt. Ltd.

**Program:** Data Analyst Intern

**Week:** 1

**Day:** 3

**Topic:** SQL Aggregations — GROUP BY & HAVING

**Repository:** cynaris-internship-Abrar