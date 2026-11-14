# Week 2 – Day 3: EDA Workflow

# 1. Objective

The objective of this practical is to perform a complete **Exploratory Data Analysis (EDA)** workflow on a real-world Superstore Sales dataset.

I worked on data cleaning, data transformation, statistical analysis, aggregation, and visualization to identify business trends and extract meaningful insights.

# 2. Learning Objectives

- Understand the complete EDA workflow.
- Load and inspect datasets using Pandas.
- Identify and handle missing values and duplicate records.
- Convert columns into appropriate data types.
- Extract date and time features.
- Create new columns using Pandas.
- Perform single and multiple-column grouping using `groupby()`.
- Apply aggregation functions such as `sum()`, `mean()`, `count()`, `min()`, and `max()`.
- Reshape data using `melt()`.
- Analyze trends and relationships using visualizations.
- Document business insights with supporting charts.

# 3. Tools & Technologies

- Python 3.11
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook
- Git & GitHub

# 4. Dataset Overview

**Dataset:** Superstore Sales Dataset

The dataset contains sales transaction information, including:

| Column       | Description                    |
| ------------ | ------------------------------ |
| Order ID     | Unique order identifier        |
| Order Date   | Date when an order was placed  |
| Ship Date    | Date when an order was shipped |
| Ship Mode    | Shipping method                |
| Customer ID  | Customer identifier            |
| Segment      | Customer segment               |
| City         | Customer city                  |
| State        | Customer state                 |
| Region       | Sales region                   |
| Category     | Product category               |
| Sub-Category | Product sub-category           |
| Sales        | Sales amount                   |
| Quantity     | Number of products             |
| Discount     | Discount applied               |
| Profit       | Profit or loss                 |

# 5. EDA Workflow

# Step 1: Import Libraries

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import os
```

# Step 2: Load and Inspect Dataset

```python
df = pd.read_csv("Superstore.csv")

# Dataset dimensions
print(df.shape)

# First and last records
display(df.head())
display(df.tail())

# Column names
print(df.columns)

# Data types
print(df.dtypes)

# Dataset information
df.info()

# Summary statistics
display(df.describe())
```

**Purpose:** Understand the dataset structure, columns, data types, and numerical summaries before performing analysis.

# Step 3: Data Quality Assessment

```python
# Missing values
print(df.isnull().sum())

# Duplicate records
print(df.duplicated().sum())

# Unique values
print(df.nunique())

# Check missing values percentage
print((df.isnull().mean() * 100).round(2))
```

**Purpose:** Identify missing values, duplicate records, and potential data-quality issues.

# Step 4: Data Cleaning

```python
# Remove duplicate records
df = df.drop_duplicates()

# Handle missing values
df["Column_Name"] = df["Column_Name"].fillna("Unknown")

# Verify missing values
print(df.isnull().sum())
```

*Note: Replace `Column_Name` with the actual column name and choose an appropriate missing-value strategy based on the data.*

# Step 5: Datetime Conversion:

**Convert date columns into Pandas datetime format**.

```python
df["Order Date"] = pd.to_datetime(df["Order Date"])
df["Ship Date"] = pd.to_datetime(df["Ship Date"])
```
Extract useful date components:

```python
df["Year"] = df["Order Date"].dt.year
df["Month"] = df["Order Date"].dt.month
df["Month_Name"] = df["Order Date"].dt.month_name()
df["Day"] = df["Order Date"].dt.day
df["Day_Name"] = df["Order Date"].dt.day_name()
df["Quarter"] = df["Order Date"].dt.quarter
```
**Purpose:** Enable daily, monthly, quarterly, and yearly trend analysis.

# Step 6: Type Casting:
```python
  # Convert Quantity into integer
  df["Quantity"] = df["Quantity"].astype("int64")

  # Convert categorical columns
  df["Category"] = df["Category"].astype("category")
  df["Region"] = df["Region"].astype("category")

  # Verify data types
  print(df.dtypes)
```

**Purpose:** Maintain correct data types, improve data consistency, and support efficient analysis.

# Step 7: Create New Columns:
  - Create additional features to support business analysis.
  ```python
  # Shipping duration
  df["Shipping_Days"] = (
    df["Ship Date"] - df["Order Date"]
  ).dt.days

  # Profit margin percentage
  df["Profit_Margin"] = (
    df["Profit"] / df["Sales"].replace(0, np.nan)
  ) * 100

  # Sales performance
  df["Sales_Status"] = np.where(
    df["Sales"] > df["Sales"].median(),
    "High Sales",
    "Low Sales"
  )
```

**Purpose:** Create meaningful features that help identify sales performance and business patterns.

# 6. Pandas Analysis

  # A. GroupBy Analysis

  `groupby()`: divides data into groups and allows us to perform calculations on each group.

  Common aggregation functions:

| Function    | Purpose                 |
| ----------- | ----------------------- |
| `sum()`     | Calculates total        |
| `mean()`    | Calculates average      |
| `count()`   | Counts non-null records |
| `min()`     | Finds minimum value     |
| `max()`     | Finds maximum value     |
| `nunique()` | Counts unique values    |

# B.Single-Column Grouping
  Example: Category-wise Sales and Profit.

  ```python
  category_analysis = df.groupby("Category").agg(
    Total_Sales=("Sales", "sum"),
    Average_Sales=("Sales", "mean"),
    Total_Profit=("Profit", "sum"),
    Total_Orders=("Order ID", "nunique")
  ).reset_index()
  

# C. Multiple-Column Grouping

Example: Region and Category-wise analysis.

```python
region_category = df.groupby(
    ["Region", "Category"]
).agg(
    Total_Sales=("Sales", "sum"),
    Total_Profit=("Profit", "sum"),
    Total_Quantity=("Quantity", "sum"),
    Total_Orders=("Order ID", "nunique")
).reset_index()
```

# D. Monthly, Daily and Yearly Analysis

**Monthly analysis:**

```python
monthly_analysis = df.groupby(
    ["Year", "Month", "Month_Name"]
).agg(
    Total_Sales=("Sales", "sum"),
    Total_Profit=("Profit", "sum"),
    Total_Orders=("Order ID", "nunique")
).reset_index()
```

**Daily analysis:**

```python
  daily_analysis = df.groupby("Day_Name").agg(
    Total_Sales=("Sales", "sum"),
    Total_Profit=("Profit", "sum"),
    Total_Orders=("Order ID", "nunique")
  ).reset_index()
```

**Yearly analysis:**

```python
  yearly_analysis = df.groupby("Year").agg(
    Total_Sales=("Sales", "sum"),
    Total_Profit=("Profit", "sum"),
    Total_Orders=("Order ID", "nunique")
  ).reset_index()
```

*Note: Sort month and weekday results using their numerical or calendar order before visualization.*

# E. Other Business Groupings:

I also performed analysis using:
- Category and Sub-Category
- Region and State
- State and City
- Segment and Category
- Discount and Profit
- Ship Mode and Sales
- Year and Month
- Day and Month

**Purpose:** Compare business performance across products, locations, customer segments, and time periods.

# F. Data Reshaping Using `melt()`

`melt()` converts wide-format data into long-format data.

```python
monthly_melt = pd.melt(
    monthly_analysis,
    id_vars=["Year", "Month", "Month_Name"],
    value_vars=["Total_Sales", "Total_Profit"],
    var_name="Metric",
    value_name="Amount"
)
```

**Purpose:** Reshape multiple metric columns into one column, making it easier to compare Sales and Profit in a common visualization.

# 7. Data Visualization

I used Matplotlib and Seaborn to visualize sales performance, distributions, relationships, and business trends.

# A. Bar Plot

**Purpose:** Compare values across categories.

**When to use:**

- Category-wise Sales and Profit.
- Sub-Category-wise performance.
- Region-wise Sales.
- State-wise and City-wise comparisons.

```python
plt.figure(figsize=(10, 6))

sns.barplot(
    data=category_analysis,
    x="Category",
    y="Total_Sales"
)

plt.title("Category-wise Total Sales")
plt.xlabel("Category")
plt.ylabel("Total Sales")
plt.tight_layout()
plt.show()
```

# B. Line Plot

**Purpose:** Show trends and changes over time.

**When to use:**

- Monthly Sales and Profit.
- Yearly Sales trends.
- Daily business performance.

```python
sns.lineplot(
    data=monthly_analysis,
    x="Month",
    y="Total_Sales",
    hue="Year",
    marker="o"
)

plt.title("Monthly Sales Trend")
plt.tight_layout()
plt.show()
```

# C. Histogram

**Purpose:** Understand the frequency distribution of numerical data.

**When to use:**
- Sales distribution.
- Profit distribution.
- Quantity distribution.
- Discount distribution.

```python
sns.histplot(
    data=df,
    x="Sales",
    bins=30,
    kde=True
)

plt.title("Sales Distribution")
plt.tight_layout()
plt.show()
```
# D. Box Plot

**Purpose:** Understand data distribution, spread, median, and potential outliers.
**When to use:**

- Profit distribution by Category.
- Sales distribution by Region.
- Sub-Category-wise Profit analysis.

```python
sns.boxplot(
    data=df,
    x="Category",
    y="Profit"
)

plt.title("Category-wise Profit Distribution")
plt.tight_layout()
plt.show()
```

# E. Scatter Plot

**Purpose:** Identify relationships between two numerical variables.
**When to use:**
- Sales vs Profit.
- Discount vs Profit.
- Quantity vs Sales.

```python
sns.scatterplot(
    data=df,
    x="Sales",
    y="Profit",
    hue="Category"
)

plt.title("Sales vs Profit")
plt.tight_layout()
plt.show()
```
# F. Heatmap

**Purpose:** Visualize numerical correlations or compare aggregated values across two categories.

**When to use:**
- Correlation between Sales, Profit, Quantity, and Discount.
- Region vs Category Sales.
- Month vs Year Sales.

```python
correlation = df[
    ["Sales", "Profit", "Quantity", "Discount"]
].corr()

sns.heatmap(
    correlation,
    annot=True,
    cmap="coolwarm",
    fmt=".2f"
)

plt.title("Correlation Heatmap")
plt.tight_layout()
plt.show()
```
# G. Pie Chart

**Purpose:** Show the percentage contribution of different categories.

**When to use:**

- Category-wise Sales contribution.
- Segment-wise Orders contribution.
- Region-wise Sales contribution.

```python
category_sales = df.groupby("Category")["Sales"].sum()

plt.pie(
    category_sales,
    labels=category_sales.index,
    autopct="%1.1f%%",
    startangle=90
)

plt.title("Category-wise Sales Contribution")
plt.tight_layout()
plt.show()
```
# H. Count Plot
**Purpose:** Count the frequency of categorical records.
**When to use:**

- Category-wise records.
- Region-wise records.
- Segment-wise records.
- Ship Mode-wise records.

```python
sns.countplot(
    data=df,
    x="Region",
    hue="Region"
)

plt.title("Region-wise Records Count")
plt.tight_layout()
plt.show()
```

*Note: Count Plot counts rows, not unique orders.*

# I. Area Plot

**Purpose:** Show trends over time with the area below the line filled.

**When to use:**

- Monthly Sales trends.
- Yearly Sales comparisons.
- Changes in business performance over time.

```python
monthly_trend = df.groupby(
    ["Year", "Month"]
)["Sales"].sum().reset_index()

for year, data in monthly_trend.groupby("Year"):
    plt.fill_between(
        data["Month"],
        data["Sales"],
        alpha=0.25,
        label=year
    )

    plt.plot(
        data["Month"],
        data["Sales"],
        marker="o"
    )

plt.title("Year-wise Monthly Sales Trend")
plt.xlabel("Month")
plt.ylabel("Total Sales")
plt.legend(title="Year")
plt.tight_layout()
plt.show()
```
# 8. Summary Statistics

Generate descriptive statistics for numerical columns.

```python
summary_statistics = df[
    ["Sales", "Profit", "Quantity", "Discount"]
].describe().T

display(summary_statistics)
```

This provides:

- Count
- Mean
- Standard deviation
- Minimum
- 25th percentile
- Median (50th percentile)
- 75th percentile
- Maximum

# 9. Saving Cleaned Dataset and Charts

Create an output folder and save the cleaned dataset.

```python
os.makedirs("output", exist_ok=True)

df.to_csv(
    "output/Cleaned_dataset.csv",
    index=False
)
```

Create a charts folder and save visualizations.

```python
os.makedirs("charts", exist_ok=True)

def save_plot(filename, dpi=300):
    plt.savefig(
        f"charts/{filename}.png",
        dpi=dpi,
        bbox_inches="tight",
        facecolor="white"
    )
    print(f"Graph saved: charts/{filename}.png")
```
# 10. Business Insights

Document at least five findings supported by your analysis and charts.

Examples of questions to investigate:

1. Which product category generates the highest total sales?
2. Which sub-category has the lowest or negative profit?
3. Which region contributes the most to total sales?
4. Which customer segment generates the highest sales?
5. How do monthly sales and profits change over the years?
6. Does a higher discount relate to lower profit?
7. Which shipping mode has the highest number of records?

*Actual findings should be added after analyzing the dataset. Avoid assuming results without checking the data.*

# 11. Project Folder Structure

```text
cynaris-internship-Abrar/
│
└── week2/
    └── Day3/
        ├── eda_report.ipynb
        ├── README.md
        │
        ├── Cleaned_dataset.csv
        │
        └── charts/
            ├── category_sales.png
            ├── monthly_sales_trend.png
            ├── sales_distribution.png
            ├── profit_boxplot.png
            ├── sales_profit_scatter.png
            ├── correlation_heatmap.png
            └── monthly_sales_area.png
```

# 12. Git & GitHub Workflow
**Create Feature Branch:**

```bash
git checkout main
git pull origin main
git checkout -b feature/week-2-day-3
```

**Stage and Commit:**

```bash
git add .
git commit -m "feat: eda-workflow week-2-day-3 complete"
```

**Push Branch:**

```bash
git push -u origin feature/week-2-day-3
```

**Pull Request:**

- Base: `main`
- Compare: `feature/week-2-day-3`
- Title: Week 2 Day 3 – EDA Workflow

**PR Description:**

Completed a complete Exploratory Data Analysis workflow using Pandas, NumPy, Matplotlib, and Seaborn. Performed data cleaning, datetime conversion, feature creation, type casting, grouping, aggregation, data reshaping, statistical analysis, and business visualizations.

# 13. CIA Activities

- **Research:** Asked CIA about the standard EDA checklist used by professional Data Analysts.
- **Career:** Explore Data Analyst roles and required EDA skills using the CIA Career tab.
- **Review:** Submit the EDA notebook to CIA for feedback.
- **Documentation:** Record CIA insights in the daily work log.

# 14. Viva Questions

**Q1. What is EDA?**

EDA stands for Exploratory Data Analysis. It is the process of understanding, cleaning, analyzing, and visualizing data to discover patterns and insights.

**Q2. Why is EDA important?**

EDA helps identify missing values, duplicates, outliers, relationships, and business trends before further analysis or modeling.

**Q3. How do you identify outliers?**

Outliers can be identified using box plots, IQR, and Z-score methods.

**Q4. What does a correlation heatmap show?**

It shows the strength and direction of relationships between numerical variables. Correlation does not necessarily mean causation.

**Q5. What is the purpose of `groupby()`?**

It groups records based on one or more columns and allows aggregation.

**Q6. Why do we convert columns into datetime?**

Datetime conversion allows us to extract year, month, day, and other date components for time-based analysis.

**Q7. What is the purpose of `melt()`?**

It converts wide-format data into long-format data.

**Q8. Difference between Histogram and Count Plot?**

Histogram displays the distribution of numerical data, whereas Count Plot displays the frequency of categorical records.

**Q9. What is the difference between `count()` and `nunique()`?**

`count()` counts non-null values, whereas `nunique()` counts distinct values.

**Q10. What is a correlation coefficient?**

It measures the strength and direction of a linear relationship between two numerical variables, usually between -1 and +1.

# 15. Learning Outcome

Through this practical, I gained hands-on experience in performing a complete EDA workflow using Python.

I learned how to inspect and clean datasets, handle missing values and duplicates, convert data types, extract datetime features, create new columns, perform single and multiple-column grouping, apply aggregation functions, and reshape data using `melt()`.

I also practised creating different visualizations using Matplotlib and Seaborn to understand data distributions, business trends, relationships, and patterns.

This practical improved my understanding of how Data Analysts transform raw data into meaningful business insights.

---

**Internship:** Cynaris Solutions Pvt. Ltd.
**Program:** Data Analyst Intern
**Week:** 2
**Day:** 3
**Topic:** Exploratory Data Analysis (EDA) Workflow
**Repository:** `cynaris-internship-Abrar`
