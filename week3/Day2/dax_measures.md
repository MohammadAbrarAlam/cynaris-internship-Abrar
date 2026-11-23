# Week3-Day2: 📊 DAX Measures & Calculations – Power BI Superstore Sales Dashboard

**Cynaris Learning – Data Analyst Internship**

# 1. Project Overview

This document covers the implementation of DAX (Data Analysis Expressions) in Microsoft Power BI using the Sample Superstore Sales dataset.

The objective is to perform business calculations, extract date components, create KPI measures, and analyze sales performance through interactive dashboards.

# 2. Learning Objectives

- Understand DAX fundamentals and syntax.
- Create measures using aggregation functions.
- Calculate total orders and unique customers.
- Calculate total sales, profit, and quantity.
- Extract year, month, day, and quarter from dates.
- Understand the difference between measures and calculated columns.
- Apply DAX calculations in KPI cards and charts.
- Use DAX with slicers and filters.

# 3. Tools & Technologies

- Microsoft Power BI Desktop
- DAX (Data Analysis Expressions)
- Microsoft Excel
- Sample Superstore Sales Dataset
- Git & GitHub

# 4. Dataset Overview

**Dataset Name:** Sample Superstore Sales

**Table Name:** `Orders`

The dataset contains 21 columns.

| Column Name | Description |
|---|---|
| Row ID | Unique row identifier |
| Order ID | Order identification |
| Order Date | Order transaction date |
| Ship Date | Shipping date |
| Ship Mode | Shipping method |
| Customer ID | Customer identification |
| Customer Name | Customer name |
| Segment | Customer segment |
| Country | Country |
| City | City |
| State | State |
| Postal Code | Postal code |
| Region | Sales region |
| Product ID | Product identification |
| Category | Product category |
| Sub-Category | Product sub-category |
| Product Name | Product name |
| Sales | Sales revenue |
| Quantity | Number of units sold |
| Discount | Discount percentage |
| Profit | Profit or loss |

# 5. What is DAX?

DAX stands for **Data Analysis Expressions**.

It is a formula language used in Power BI to create calculations, measures, calculated columns, and calculated tables.

**Example:**

```dax
Total Sales =
SUM(Orders[Sales])
```

**Purpose:** Calculates the total sales revenue from the dataset.

# 6. Basic DAX Measures

Created measures using Modeling → New Measure.

# 1. Total Orders

```dax
Total Orders =
DISTINCTCOUNT(Orders[Order ID])
```

**Purpose:** Counts the number of unique orders.

# 2. Total Customers

```dax
Total Customers =
DISTINCTCOUNT(Orders[Customer ID])
```

**Purpose:** Counts the number of unique customers.

# 3. Total Sales

```dax
Total Sales =
SUM(Orders[Sales])
```

**Purpose:** Calculates total sales revenue.

# 4. Total Profit

```dax
Total Profit =
SUM(Orders[Profit])
```

**Purpose:** Calculates total profit generated.

# 5. Total Quantity

```dax
Total Quantity =
SUM(Orders[Quantity])
```

**Purpose:** Calculates the total quantity of products sold.

# 6. Total Discount

```dax
Total Discount =
SUM(Orders[Discount])
```

**Purpose:** Calculates the sum of discount values recorded in the dataset. This is not the monetary discount amount.

# 7. Average Sales

```dax
Average Sales =
AVERAGE(Orders[Sales])
```

**Purpose:** Calculates average sales per dataset row.

# 8. Average Profit

```dax
Average Profit =
AVERAGE(Orders[Profit])
```

**Purpose:** Calculates average profit per dataset row.

# 9. Average Order Value

```dax
Average Order Value =
DIVIDE(
    [Total Sales],
    [Total Orders],
    0
)
```

**Purpose:** Calculates average revenue per unique order.

# 7. Advanced DAX Calculations

# 1. Profit Margin Percentage

```dax
Profit Margin % =
DIVIDE(
    [Total Profit],
    [Total Sales],
    0
) * 100
```

**Purpose:** Calculates the percentage of sales retained as profit.

# 2. Total Loss

```dax
Total Loss =
CALCULATE(
    SUM(Orders[Profit]),
    Orders[Profit] < 0
)
```

**Purpose:** Calculates the combined negative profit values.

# 3. Profitable Orders

```dax
Profitable Orders =
CALCULATE(
    DISTINCTCOUNT(Orders[Order ID]),
    Orders[Profit] > 0
)
```

**Purpose:** Counts unique orders associated with positive-profit rows.

# 4. Loss-Making Orders

```dax
Loss Making Orders =
CALCULATE(
    DISTINCTCOUNT(Orders[Order ID]),
    Orders[Profit] < 0
)
```

**Purpose:** Counts unique orders associated with negative-profit rows.

Note: An order can contain both profitable and loss-making products, so these two order counts may overlap.

# 5. Total Products

```dax
Total Products =
DISTINCTCOUNT(Orders[Product ID])
```

**Purpose:** Counts unique products.

# 6. Total States

```dax
Total States =
DISTINCTCOUNT(Orders[State])
```

**Purpose:** Counts unique states in the dataset.

# 8. Date Extraction Using Calculated Columns

Date extraction is useful for monthly, quarterly, and yearly sales analysis.

Go to Modeling → New Column.

# 1. Extract Year

```dax
Order Year =
YEAR(Orders[Order Date])
```

**Purpose:** Extracts the year from the order date.

# 2. Extract Month Number

```dax
Order Month Number =
MONTH(Orders[Order Date])
```

**Purpose:** Extracts the month number from 1 to 12.

# 3. Extract Month Name

```dax
Order Month =
FORMAT(Orders[Order Date], "MMMM")
```

**Purpose:** Extracts the full month name.

# 4. Extract Short Month Name

```dax
Short Month =
FORMAT(Orders[Order Date], "MMM")
```

**Purpose:** Extracts abbreviated month names such as Jan, Feb, and Mar.

# 5. Extract Day

```dax
Order Day =
DAY(Orders[Order Date])
```

**Purpose:** Extracts the day number from the order date.

# 6. Extract Day Name

```dax
Order Day Name =
FORMAT(Orders[Order Date], "dddd")
```

**Purpose:** Extracts the weekday name.

# 7. Extract Quarter

```dax
Order Quarter =
"Q" & QUARTER(Orders[Order Date])
```

**Purpose:** Identifies the financial or calendar quarter. This example uses calendar quarters.

# 8. Extract Year and Month

```dax
Year Month =
FORMAT(Orders[Order Date], "YYYY-MM")
```

**Purpose:** Creates a year-month label for monthly trend analysis.

# 9. Date Extraction Example

| Order Date | Year | Month | Day | Quarter |
|---|---:|---|---:|---|
| 05-01-2017 | 2017 | January | 5 | Q1 |
| 15-02-2017 | 2017 | February | 15 | Q1 |
| 20-03-2017 | 2017 | March | 20 | Q1 |
| 10-07-2017 | 2017 | July | 10 | Q3 |

Examples are illustrative.

**Important:** Select the `Order Month` column and use Column tools → Sort by column → `Order Month Number` to maintain chronological month order.

# 10. Time Intelligence DAX

These calculations are useful for comparing business performance over time.

# 1. Previous Year Sales

```dax
Previous Year Sales =
CALCULATE(
    [Total Sales],
    SAMEPERIODLASTYEAR(Orders[Order Date])
)
```

# 2. Year-over-Year Sales Growth

```dax
YoY Sales Growth % =
DIVIDE(
    [Total Sales] - [Previous Year Sales],
    [Previous Year Sales],
    0
) * 100
```

# 3. Month-to-Date Sales

```dax
MTD Sales =
TOTALMTD(
    [Total Sales],
    Orders[Order Date]
)
```

# 4. Year-to-Date Sales

```dax
YTD Sales =
TOTALYTD(
    [Total Sales],
    Orders[Order Date]
)
```

**Note:** For reliable time intelligence, create a dedicated Date table, mark it as the model's Date table, and establish a relationship with `Orders[Order Date]`.

# 11. Date Table Creation

Create a calculated table using Modeling → New Table.

```dax
DateTable =
ADDCOLUMNS(
    CALENDAR(
        MIN(Orders[Order Date]),
        MAX(Orders[Order Date])
    ),
    "Year", YEAR([Date]),
    "Month Number", MONTH([Date]),
    "Month", FORMAT([Date], "MMMM"),
    "Quarter", "Q" & QUARTER([Date]),
    "Day", DAY([Date]),
    "Day Name", FORMAT([Date], "dddd")
)
```

**Purpose:** Creates a dedicated calendar table for time-based analysis.

Create a relationship:

`DateTable[Date]` → `Orders[Order Date]`

Use a one-to-many relationship with DateTable on the one side.

# 12. DAX Functions Used

| Function | Purpose |
|---|---|
| SUM() | Adds numerical values |
| AVERAGE() | Calculates average |
| COUNTROWS() | Counts table rows |
| DISTINCTCOUNT() | Counts unique values |
| DIVIDE() | Performs safe division |
| CALCULATE() | Evaluates expressions under modified filters |
| FILTER() | Filters table rows |
| YEAR() | Extracts year |
| MONTH() | Extracts month |
| DAY() | Extracts day |
| FORMAT() | Formats values |
| QUARTER() | Extracts quarter |
| SAMEPERIODLASTYEAR() | Returns corresponding previous-year dates |
| TOTALYTD() | Calculates year-to-date values |
| TOTALMTD() | Calculates month-to-date values |

# 13. Measures vs Calculated Columns

| Measures | Calculated Columns |
|---|---|
| Calculated dynamically | Calculated row by row |
| Respond to report filters | Values stored in the data model |
| Used in KPI cards | Used in slicers and axes |
| Total Sales | Order Year |
| Total Profit | Order Month |
| Total Orders | Order Day |
| Profit Margin | Order Quarter |

# 14. Power BI Dashboard Applications

The DAX measures are used to develop three report pages.

# Page 1 – Sales Overview

**KPI Cards:**
- Total Sales
- Total Profit
- Total Orders
- Total Customers
- Total Quantity

**Visualizations:**
- Sales by Region – Bar Chart
- Sales by Category – Donut Chart
- Monthly Sales Trend – Line Chart
- Profit by Sub-Category – Column Chart

# Page 2 – Sales Drill-down

- Region → State → City
- Category → Sub-Category → Product
- Sales by Product
- Profit by Region
- Quantity by Category

# Page 3 – KPI Summary

- Total Revenue
- Total Profit
- Profit Margin %
- Average Order Value
- Year-over-Year Sales Growth %
- Previous Year Sales
- YTD Sales

# 15. Interactive Slicers

| Slicer | Dataset Column |
|---|---|
| Year | DateTable[Year] |
| Month | DateTable[Month] |
| Region | Orders[Region] |
| Category | Orders[Category] |
| Segment | Orders[Segment] |

Slicers help users interactively filter the report and analyze business performance.

# 16. Viva Questions & Answers

**Q1. What is DAX?**

DAX stands for Data Analysis Expressions. It is a formula language used in Power BI for calculations and data analysis.

**Q2. What is a DAX Measure?**

A measure is a dynamic calculation that changes according to filters and slicers.

**Q3. What is a Calculated Column?**

A calculated column creates a new column by applying a formula to each row of a table.

**Q4. What is the difference between SUM() and AVERAGE()?**

SUM() calculates the total, whereas AVERAGE() calculates the mean value.

**Q5. What is DISTINCTCOUNT()?**

It counts the number of unique values in a column.

**Q6. What is CALCULATE()?**

CALCULATE() evaluates an expression after modifying its filter context.

**Q7. What is DIVIDE()?**

DIVIDE() performs division and handles zero denominators safely.

**Q8. How do you extract the year from a date?**

Using the YEAR() function.

**Q9. How do you calculate total customers?**

Using DISTINCTCOUNT() on the Customer ID column.

**Q10. What is Profit Margin?**

Profit Margin measures how much profit a business earns from its revenue, expressed as a percentage.

**Q11. What is Time Intelligence in DAX?**

Time Intelligence functions analyze business performance across dates, months, quarters, and years.

**Q12. What is the difference between COUNTROWS() and DISTINCTCOUNT()?**

COUNTROWS() counts all rows in a table, whereas DISTINCTCOUNT() counts unique values in a column.

# 17. Practical Learning Outcomes

Through this practical, I learned how to:

- Create DAX measures for business calculations.
- Calculate total orders and unique customers.
- Analyze sales, profit, and quantity.
- Extract year, month, day, and quarter from dates.
- Calculate profit margins and average order values.
- Understand time intelligence functions.
- Create a dedicated Date table.
- Apply DAX calculations to interactive Power BI dashboards.

# 18. Git & GitHub Workflow

**Create Feature Branch**

```bash
git checkout main
git pull origin main
git checkout -b feature/week-3-day-2
```


**Stage Changes**

```bash
git add .
```

**Commit Changes**

```bash
git commit -m "docs: add dax-measures documentation"
```

**Push Changes**

```bash
git push origin feature/week-3-day-2
```

**Pull Request Title:**

Week 3 Day 1 – DAX Measures and Date Calculations Documentation

`Description:` 
  Created detailed DAX documentation for the Power BI Superstore Sales Dashboard, covering basic and advanced measures, total orders, unique customers, sales, profit, date extraction (year, month, day, and quarter), time intelligence functions, KPI calculations, and practical examples. Also documented DAX functions, viva questions, and GitHub workflow.

# 19. Project Folder Structure

```text
cynaris-internship-Abrar/
│
└── week3/
    └── Day2/
        ├── README.md
        ├── dax_measures.md
        ├── dax_sales_data.pbix
        ├── Screenshot/
        |-- dashboard_screenshot.png
        │
        └── dataset/
            └── Superstore_Sales.xlsx
```

# 20. Final Summary

**Internship:** Cynaris Solutions Pvt. Ltd.  
**Program:** Data Analyst Intern  
**Week:** 3  
**Day:** 1  
**Topic:** Power BI Fundamentals – DAX Measures & Calculations  
**Dataset:** Sample Superstore Sales  
**Technologies:** Power BI Desktop, DAX, Excel, Git & GitHub

**Deliverable:** `dax_measures.md`

**Learning Status:** DAX measures, calculated columns, date extraction, and KPI calculations documented for the Power BI Sales Dashboard.

---

**End of Documentation**