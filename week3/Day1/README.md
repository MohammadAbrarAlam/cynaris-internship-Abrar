# 📊 Week 3 — Day 1: Power BI Fundamentals (Trending Sales Dashboard)

Welcome to the repository for **Week 3 — Day 1: Data Visualisation & Dashboards (Power BI)** as part of the **Cynaris Learning Data Analyst Internship** program.

# 1. Project Overview

The objective of this practical was to build an interactive Sales Analysis Dashboard using **Microsoft Power BI Desktop** and an Excel dataset.

The dashboard helps analyze sales performance, revenue, profit, product categories, regional sales, monthly trends, and customer ratings through KPI cards, charts, and interactive slicers.

# 2. Learning Objectives

- Understand Power BI Desktop fundamentals.
- Import Excel datasets into Power BI.
- Clean and transform data using Power Query.
- Understand data types and data modelling.
- Create DAX measures for business calculations.
- Build KPI cards and KPI visuals.
- Create different charts and graphs.
- Analyze monthly sales trends.
- Compare sales performance across regions.
- Create interactive slicers.
- Design a professional business dashboard.

# 3. Tools & Technologies

- Microsoft Power BI Desktop
- Microsoft Excel
- Power Query
- DAX (Data Analysis Expressions)
- Git & GitHub

# 4. Dataset Overview

**Dataset Name:** `trending_excel_dataset`

**Source:** Excel Dataset

The dataset contains 12 columns related to product sales and business performance.

| Column Name | Description |
|---|---|
| Date | Sales transaction date |
| Product_Category | Product category |
| Product_Name | Product name |
| Region | Sales region |
| Sales_Channel | Online or Offline sales |
| Units_Sold | Number of units sold |
| Unit_Price | Price per unit |
| Revenue | Total sales revenue |
| Cost | Total product cost |
| Profit | Total profit |
| Customer_Rating | Customer satisfaction rating |
| Trend_Tag | Sales trend classification |

# 5. Power BI Data Import & Transformation

# Step 1: Import Excel Dataset

1. Open Power BI Desktop.
2. Click Home → Get Data.
3. Select Excel Workbook.
4. Choose the `trending_excel_dataset` Excel file.
5. Select the required worksheet or table.
6. Click Transform Data.

# Step 2: Data Preparation Using Power Query

Checked and assigned appropriate data types.

| Column | Data Type |
|---|---|
| Date | Date |
| Product_Category | Text |
| Product_Name | Text |
| Region | Text |
| Sales_Channel | Text |
| Units_Sold | Whole Number |
| Unit_Price | Decimal Number |
| Revenue | Decimal Number |
| Cost | Decimal Number |
| Profit | Decimal Number |
| Customer_Rating | Decimal Number |
| Trend_Tag | Text |

After checking the dataset, clicked **Close & Apply** to load the data into Power BI.

# 6. DAX Measures & Calculations

Created DAX measures using Modeling → New Measure.

**Note:** The following formulas use `trending_excel_dataset` as the Power BI model table name. The table name must match the actual name shown in the Data pane.

# 1. Total Revenue

```dax
Total Revenue =
SUM(trending_excel_dataset[Revenue])
```

**Purpose:** Calculates total revenue generated from sales.

# 2. Total Profit

```dax
Total Profit =
SUM(trending_excel_dataset[Profit])
```

**Purpose:** Calculates the total profit generated.

# 3. Total Units Sold

```dax
Total Units Sold =
SUM(trending_excel_dataset[Units_Sold])
```

**Purpose:** Calculates the total number of products sold.

# 4. Total Cost

```dax
Total Cost =
SUM(trending_excel_dataset[Cost])
```

**Purpose:** Calculates the total cost of products.

# 5. Average Customer Rating

```dax
Avg Customer Rating =
AVERAGE(trending_excel_dataset[Customer_Rating])
```

**Purpose:** Calculates the average customer rating.

# 6. Profit Margin Percentage

```dax
Profit Margin % =
DIVIDE(
    [Total Profit],
    [Total Revenue],
    0
)
```

**Purpose:** Calculates the percentage of revenue retained as profit.

# 7. Average Unit Price

```dax
Avg Unit Price =
AVERAGE(trending_excel_dataset[Unit_Price])
```

**Purpose:** Calculates the average selling price per unit.
# 8. Total Transactions

```dax
Total Transactions =
COUNTROWS(trending_excel_dataset)
```

**Purpose:** Counts the total number of dataset rows.

Note: This measure counts records, not unique customer orders.

# 7. Dashboard Development & Visualizations

# A. Executive KPI Cards

Created Card visuals to display important business metrics.

The following KPI cards were created:

1. Total Revenue
2. Total Profit
3. Total Units Sold
4. Total Cost
5. Average Customer Rating

**Steps:**

1. Open Report View.
2. Select the Card visual.
3. Drag the required DAX measure into the Card.
4. Enable the title and callout value.
5. Customize font size, background, and display units.

### B. KPI Visual

Created a Revenue Performance KPI to compare actual revenue against a target.

**Revenue Target DAX:**

```dax
Revenue Target = 100000
```

This is an example target and can be adjusted according to business requirements.

**KPI Visual Fields:**

- Indicator: Total Revenue
- Trend Axis: Date
- Target Goals: Revenue Target

# C. Monthly Sales Analysis – Line Chart

**Objective:** Analyze monthly revenue trends.

**Visual:** Line Chart

| Field | Value |
|---|---|
| X-axis | Date |
| Y-axis | Total Revenue |
| Title | Monthly Sales Trend |

Used the Date hierarchy to analyze sales by month and year.

# D. Sales by Region – Bar Chart

**Objective:** Compare revenue across different geographical regions.

**Visual:** Clustered Bar Chart

| Field | Value |
|---|---|
| Y-axis | Region |
| X-axis | Total Revenue |
| Title | Sales by Region |

Sorted revenue values in descending order to identify the highest-performing region.

# E. Revenue by Product Category – Donut Chart

**Objective:** Understand each product category's contribution to total revenue.

**Visual:** Donut Chart

| Field | Value |
|---|---|
| Legend | Product_Category |
| Values | Total Revenue |
| Title | Revenue Contribution by Product Category |

Enabled data labels and legends for better readability.

# F. Additional Visualizations

Other useful visualizations included in the dashboard design:

- Unit Price by Region – Clustered Column Chart.
- Total Units Sold by Month – Area Chart.
- Revenue by Sales Channel – Donut or Pie Chart.
- Top 10 Products by Revenue – Bar Chart.

# 8. Interactive Slicers

Implemented slicers to enable dynamic filtering.

| Slicer | Dataset Column |
|---|---|
| Product Filter | Product_Name |
| Category Filter | Product_Category |
| Region Filter | Region |
| Date Filter | Date |
| Sales Channel Filter | Sales_Channel |

**Steps:**

1. Select the Slicer visual.
2. Drag the required column into its Field section.
3. Change the slicer style to Dropdown or Tile.
4. Repeat for other fields.
5. Test interactions with KPI cards and charts.

Used Edit Interactions to manage filtering between visuals.

# 9. Dashboard Pages

Designed the report with three logical pages:

**Page 1 – Sales Overview**
- Total Revenue
- Total Profit
- Total Units Sold
- Monthly Sales Trend
- Sales by Region
- Revenue by Product Category

**Page 2 – Sales Drill-down**
- Product-level analysis
- Category-level revenue
- Regional sales comparison
- Sales Channel analysis
- Interactive product filters

**Page 3 – KPI Summary**
- Revenue KPI
- Profit KPI
- Profit Margin %
- Customer Rating
- Revenue Target Comparison

# 10. Dashboard Insights

The dashboard provides a way to identify:

- Total revenue and profit performance.
- Best-performing product categories.
- Monthly sales fluctuations.
- Regional sales performance.
- Customer satisfaction levels.
- Online and offline sales contribution.
- Products generating higher revenue.

Actual business insights should be documented after analyzing the completed report and applying the required filters.

# 11. Power BI Report vs Dashboard

**Q1. What is a Power BI Report?**

A report is a multi-page collection of interactive visualizations connected to a semantic model. It supports slicers, filtering, and drill-down.

**Q2. What is a Power BI Dashboard?**

A dashboard is a single-page canvas available in Power BI Service that can combine pinned visuals from different reports.

**Q3. What is the difference between a Card and a KPI visual?**

A Card displays a single important value, while a KPI visual compares performance against a target and shows a trend.

**Q4. What is DAX?**

DAX stands for Data Analysis Expressions. It is a formula language used to create measures, calculated columns, and calculated tables.

**Q5. What is Power Query?**

Power Query is a data transformation tool used to clean, prepare, and transform data before loading it into Power BI.

**Q6. What is a Slicer?**

A slicer is an interactive visual filter used to filter report data based on selected values.

**Q7. What is the purpose of a Donut Chart?**

A Donut Chart displays the contribution of different categories to a total value.

**Q8. What is the difference between SUM() and AVERAGE() in DAX?**

SUM() calculates the total of numerical values, whereas AVERAGE() calculates their arithmetic mean.

**Q9. What is the purpose of DIVIDE() in DAX?**

DIVIDE() performs division safely and allows a default result when the denominator is zero.

**Q10. What is Import Mode?**

Import Mode loads and stores data inside the Power BI model for fast report performance.

**Q11. What is DirectQuery?**

DirectQuery allows Power BI to query the underlying data source rather than importing all data into the model.

**Q12. What is Edit Interactions?**

It controls how one visual affects other visuals on a report page.

## 12. CIA Activities

- **Research:** Explored Power BI dashboard design and data visualization techniques.
- **Career:** Learned how Power BI is used in Data Analyst and Business Intelligence roles.
- **Review:** Practiced DAX measures, KPI cards, charts, and slicers.
- **Documentation:** Recorded the practical workflow, formulas, and learning outcomes.

# 13. Git & GitHub Workflow

**Create Feature Branch**

```bash
git checkout main
git pull origin main
git checkout -b feature/week-3-day-1
```

**Commit Changes**

```bash
git add .
git commit -m "feat: powerbi-fundamentals week-3-day-1 complete"
```

**Push Branch**

```bash
git push -u origin feature/week-3-day-1
```

**Pull Request Title:**

Week 3 Day 1 – Power BI Fundamentals and Trending Sales Dashboard

**PR Description:**

Completed the Trending Sales Dashboard using Power BI Desktop. Imported and prepared the Excel dataset, created DAX measures, designed KPI cards, built monthly sales and regional sales charts, created a revenue-by-category donut chart, and implemented interactive slicers.

# 14. Project Folder Structure

```text
cynaris-internship-Abrar/
│
└── week3/
    └── Day1/
        ├── README.md
        ├── Trending_Sales_Dashboard.pbix
        ├── dashboard_screenshot.png
        │
        └── dataset/
            └── trending_excel_dataset.xlsx
```

# 15. Publishing to Power BI Service

**Pending Task:**

- Publish the report from Power BI Desktop.
- Open the report in Power BI Service.
- Verify report visuals and filters.
- Configure appropriate sharing permissions.
- Generate an authorized view-only sharing link, if supported by the account and organization settings.

Note: Publishing a report and creating a Power BI Service dashboard are separate activities.

# 16. Learning Outcome

Through this practical, I gained hands-on experience with Microsoft Power BI Desktop and business intelligence reporting.

I learned how to import Excel datasets, prepare data using Power Query, create DAX measures, build KPI cards, develop different charts, and implement interactive slicers.

I also gained practical knowledge of analyzing revenue, profit, product categories, monthly sales trends, and regional performance.

This practical improved my understanding of data visualization and helped me develop skills for real-world Data Analyst and Business Intelligence projects.

---

**Internship:** Cynaris Solutions Pvt. Ltd.  
**Program:** Data Analyst Intern  
**Week:** 3  
**Day:** 1  
**Topic:** Power BI Fundamentals – Trending Sales Dashboard  
**Dataset:** `trending_excel_dataset`  
**Repository:** `cynaris-internship-Abrar`  
**Technologies:** Power BI Desktop, Excel, Power Query, DAX, Git & GitHub

**Project Status:** Dashboard development completed; Power BI Service publishing pending.