# Week 2 – Day 1: Data Visualisation using Matplotlib and Seaborn

# 1. Objective:

The objective of this practical is to learn how to create meaningful and professional data visualisations using Python Matplotlib and Seaborn.

Using the Sample Superstore dataset, I practised creating different charts to analyse sales, profit, quantity, and business performance across years, months, regions, states, and product categories.

# 2. Learning Objectives:

- Understand Matplotlib and Seaborn libraries.
- Create different types of charts and plots.
- Visualise yearly and monthly sales trends.
- Compare sales and profits across categories and regions.
- Understand data distribution using histograms.
- Identify outliers using box plots.
- Analyse relationships between numerical variables using scatter plots.
- Apply chart titles, labels, legends, grids, and annotations.
- Save visualisations as PNG images.

# 3. Tools & Technologies:

- Python 3.11
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook
- Git & GitHub
- Kaggle

# 4. Python Environment Setup:

**Install required libraries:**

```bash
pip install numpy pandas matplotlib seaborn
```

**Launch Jupyter Notebook:**

```bash
jupyter notebook
```

**Import required libraries:**

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import os
```

# 5. Dataset Used:

**Dataset:** Sample Superstore Dataset

**Source:** Kaggle

**Dataset Link:** https://www.kaggle.com/datasets/vivek468/superstore-dataset-final

**File Name:** `Sample_ Superstore.csv`

The dataset contains 9,994 records and 19 columns, including order details, customer information, product categories, sales, quantity, discount, and profit.

# 6. Practical Implementation:

# 6.1 Load Dataset:

```python
df = pd.read_csv(
    "Sample_ Superstore.csv"
)

print(df.head())
```

# 6.2 Data Inspection:

Before creating visualisations, I inspected the dataset to understand its structure, data types, and missing values.

```python
print(df.head())
print(df.shape)
print(df.columns)
df.info()
print(df.describe())
print(df.isnull().sum())
print(df.duplicated().sum())
```

# 6.3 Data Cleaning:

- Checked and handled missing values.
- Removed duplicate records.
- Converted Order Date into datetime format.
- Filled missing categorical values with "Unknown".
- Replaced missing Quantity values with the median.

```python

# Remove duplicates
df.drop_duplicates(inplace=True)

# Convert Order Date
df["Order Date"] = pd.to_datetime(
    df["Order Date"],
    errors="coerce"
)

# Remove invalid dates
df.dropna(subset=["Order Date"], inplace=True)

# Fill categorical missing values
df.fillna({
    "Ship Mode": "Unknown",
    "State": "Unknown",
    "Region": "Unknown"
}, inplace=True)

# Fill missing Quantity
df["Quantity"] = df["Quantity"].fillna(
    df["Quantity"].median()
)
```

# 6.4 Update and Extract Date Information:

Extracted Year and Month from the Order Date column for time-based analysis.

```python

# Extract Year
df["Year"] = df["Order Date"].dt.year

# Extract Month Name
df["Month"] = df["Order Date"].dt.month_name()

# Filter years
df = df[
    (df["Year"] >= 2014) &
    (df["Year"] <= 2020)
]
```

# 6.5 GroupBy for Data Analysis:

GroupBy helps summarise data before creating charts.

**Sales by Year:**

```python
yearly_sales = df.groupby("Year")["Sales"].sum()

print(yearly_sales)
```

**Sales by Month:**

```python
monthly_sales = df.groupby("Month")["Sales"].sum()

print(monthly_sales)
```

**Profit by Year:**

```python
yearly_profit = df.groupby("Year")["Profit"].sum()

print(yearly_profit)
```

**Profit by Month:**

```python
monthly_profit = df.groupby("Month")["Profit"].sum()

print(monthly_profit)
```

# 6.6 Create Charts Using Matplotlib
`Chart Type `      Purpose | Use Case |
1) Line Plot:
   - Purpose: Show trends over time
   - Use: Yearly and monthly sales 
2) Bar Plot:
   -Purpose: Compare categories
   -Use: Sales by state and region
3) Pie Chart:
   - Purpose: Show percentage contribution
   - Use:Profit percentage by category
4) Histogram:
   - Purpose: Understand data distribution
   - Use:Sales and profit distribution
5) Scatter Plot:
   - Purpose: Show relationships between variables.
   - Use: Sales vs Profit.
     
6) Box Plot:
   - Purpose: Identify outliers and spread.
   - Use: Sales distribution by category.

**A. Line Plot – Yearly Sales Trend**

Used to visualise changes in sales over time.

```python
plt.figure(figsize=(10, 5))

plt.plot(
    yearly_sales.index,
    yearly_sales.values,
    color="blue",
    marker="o",
    linestyle="-",
    linewidth=2,
    markersize=8
)

plt.title("Yearly Sales Trend (2014–2017)")
plt.xlabel("Year")
plt.ylabel("Total Sales")
plt.xticks(yearly_sales.index)
plt.grid(True)

plt.tight_layout()
plt.show()
```

**B. Line Plot – Monthly Sales Trend**

Used to analyse monthly sales performance.

```python
plt.figure(figsize=(10, 5))

plt.plot(
    monthly_sales.index,
    monthly_sales.values,
    color="blue",
    marker="o",
    linewidth=2
)

plt.title("Monthly Sales Trend")
plt.xlabel("Month")
plt.ylabel("Total Sales")
plt.grid(True)

plt.tight_layout()
plt.show()
```

**C. Bar Plot – Sales by State**

Used to compare total sales across different states.

```python
state_sales = (
    df.groupby("State")["Sales"]
    .sum()
    .sort_values(ascending=False)
)

state_sales.plot(
    kind="bar",
    figsize=(15, 6)
)

plt.title("Sales by State")
plt.xlabel("State")
plt.ylabel("Total Sales")
plt.xticks(rotation=90)

plt.tight_layout()
plt.show()
```

**D. Bar Plot – Sales by Region**

```python
region_sales = (
    df.groupby("Region")["Sales"]
    .sum()
    .sort_values(ascending=False)
)

sns.set_theme(style="whitegrid", palette="Set2")

ax = region_sales.plot(
    kind="bar",
    figsize=(12, 6)
)

ax.bar_label(
    ax.containers[0],
    fmt="%.0f",
    padding=3
)

plt.title("Sales by Region")
plt.xlabel("Region")
plt.ylabel("Total Sales")
plt.xticks(rotation=0)

plt.tight_layout()
plt.show()
```

**E. Bar Plot – Sales by Category**

```python
category_sales = df.groupby("Category")["Sales"].sum()

category_sales.plot(
    kind="bar",
    figsize=(10, 5)
)

plt.title("Sales by Category")
plt.xlabel("Category")
plt.ylabel("Total Sales")

plt.tight_layout()
plt.show()
```

# Pie Chart – Profit Percentage by Category:

First, calculate total sales and profit for each category and then calculate profit percentage.

```python
category_profit = df.groupby("Category").agg({
    "Sales": "sum",
    "Profit": "sum"
})

category_profit["Profit Percentage"] = (
    category_profit["Profit"] /
    category_profit["Sales"]
) * 100

print(category_profit)
```

**Create Pie Chart:**

```python
plt.figure(figsize=(8, 8))

plt.pie(
    category_profit["Profit Percentage"],
    labels=category_profit.index,
    autopct="%1.2f%%",
    startangle=90,
    shadow=True
)

plt.title("Profit Percentage by Category")

plt.show()
```

# Histogram – Data Distribution:

A histogram shows the frequency distribution of numerical data.

**Sales Distribution:**

```python
plt.figure(figsize=(10, 5))

plt.hist(
    df["Sales"],
    bins=20
)

plt.title("Sales Distribution")
plt.xlabel("Sales")
plt.ylabel("Frequency")

plt.show()
```

**Profit Distribution:**

```python
plt.figure(figsize=(10, 5))

plt.hist(
    df["Profit"],
    bins=20
)

plt.title("Profit Distribution")
plt.xlabel("Profit")
plt.ylabel("Frequency")

plt.show()
```

**Quantity Distribution:**

```python
plt.figure(figsize=(10, 5))

plt.hist(
    df["Quantity"],
    bins=10
)

plt.title("Quantity Distribution")
plt.xlabel("Quantity")
plt.ylabel("Frequency")

plt.show()
```

# Scatter Plot – Relationship Between Variables

A scatter plot helps identify relationships between two numerical variables.

**A. Average Sales vs Average Profit by Category**

```python
sales_profit = df.groupby("Category")[
    ["Sales", "Profit"]
].mean()

plt.figure(figsize=(10, 5))

plt.scatter(
    sales_profit["Sales"],
    sales_profit["Profit"],
    s=150,
    alpha=0.7
)

for category, row in sales_profit.iterrows():
    plt.annotate(
        category,
        (row["Sales"], row["Profit"])
    )

plt.title("Average Sales vs Average Profit by Category")
plt.xlabel("Average Sales")
plt.ylabel("Average Profit")
plt.grid(True)

plt.tight_layout()
plt.show()
```

**B. Average Quantity vs Average Sales by Category**

```python
quantity_sales = df.groupby("Category")[
    ["Quantity", "Sales"]
].mean()

plt.figure(figsize=(10, 5))

plt.scatter(
    quantity_sales["Quantity"],
    quantity_sales["Sales"],
    s=150,
    alpha=0.7
)

for category, row in quantity_sales.iterrows():
    plt.annotate(
        category,
        (row["Quantity"], row["Sales"]),
        xytext=(5, 5),
        textcoords="offset points"
    )

plt.title("Average Quantity vs Average Sales by Category")
plt.xlabel("Average Quantity")
plt.ylabel("Average Sales")

plt.tight_layout()
plt.show()
```

# Box Plot – Sales Distribution by Category

A box plot helps understand the spread of data, median, quartiles, and outliers.

```python
category_sales = df.groupby("Category")[
    "Sales"
].apply(list)

plt.figure(figsize=(10, 5))

plt.boxplot(
    category_sales.values,
    tick_labels=category_sales.index
)

plt.title("Sales Distribution by Category")
plt.xlabel("Category")
plt.ylabel("Sales")
plt.grid(axis="y")

plt.tight_layout()
plt.show()
```

# 7. Save Charts as PNG Images:

Created a separate charts folder to store visualisation images.

```python
# Create charts folder
os.makedirs("charts", exist_ok=True)

# Function to save charts
def save_chart(filename):

    plt.tight_layout()

    plt.savefig(
        f"charts/{filename}.png",
        dpi=300,
        bbox_inches="tight"
    )

    plt.show()
    plt.close()
```

**Example:**

```python
plt.figure(figsize=(10, 5))

plt.plot(
    yearly_sales.index,
    yearly_sales.values,
    marker="o"
)

plt.title("Yearly Sales Trend")
plt.xlabel("Year")
plt.ylabel("Total Sales")

save_chart("Yearly Sales Trend")
```

# 8. Project Folder Structure:

```text
cynaris-internship-Abrar/
│
└── week2/
    └── Day1/
        │
        ├── visualizations.ipynb
        ├── Sample_ Superstore.csv
        ├── README.md
        │
        └── charts/
            ├── Yearly Sales Trend.png
            ├── Monthly Sales Trend.png
            ├── Sales by State.png
            ├── Sales by Region.png
            ├── Profit Percentage By Category.png
            ├── Profit Distribution.png
            └── Sales Distribution by Category.png
```

*Note: Keep the original dataset unchanged. Include generated chart images in GitHub if required for submission.*

# 9. Git & GitHub Workflow:

**Step 1: Create Feature Branch**

```bash
git checkout main
git pull origin main
git checkout -b feature/week-2-day-1
```

**Step 2: Stage Files**

```bash
git add week2/Day1/
```

**Step 3: Commit Changes**

```bash
git commit -m "feat: matplotlib-seaborn week-2-day-1 complete"
```

**Step 4: Push Branch**

```bash
git push -u origin feature/week-2-day-1
```

**Step 5: Create Pull Request**

- Base branch: `main`
- Compare branch: `feature/week-2-day-1`

**PR Title:** Week 2 Day 1 – Data Visualisation using Matplotlib and Seaborn

**PR Description:**

This PR contains my Week 2 Day 1 practical work on data visualisation using Matplotlib and Seaborn.

I worked with the Sample Superstore dataset and created different visualisations, including line plots, bar plots, pie charts, histograms, scatter plots, and box plots.

I also practised GroupBy operations, data aggregation, chart customisation, annotations, and saving charts as PNG images.

# 10. CIA Activities:

- **Research:** Explore professional data visualisation practices used by data analysts.
- **Career:** Search for Data Visualisation skills required in Data Analyst job roles.
- **Review:** Submit the Jupyter Notebook to CIA for feedback.

## 11. Viva Questions

**Q1. What is Matplotlib?**

Matplotlib is a Python library used to create charts and graphs for data visualisation.

**Q2. What is Seaborn?**

Seaborn is a Python visualisation library built on top of Matplotlib. It helps create attractive statistical charts with less code.

**Q3. What is the difference between Matplotlib and Seaborn?**

- Matplotlib provides more control over chart customisation.
- Seaborn provides built-in themes and statistical visualisations.

**Q4. When do you use a line plot?**

A line plot is used to show trends and changes over time, such as monthly or yearly sales.

**Q5. When do you use a bar chart?**

A bar chart is used to compare values across different categories, such as sales by region or state.

**Q6. What is a histogram?**

A histogram shows the frequency distribution of numerical data, such as sales, profit, and quantity.

**Q7. What is a scatter plot?**

A scatter plot shows the relationship between two numerical variables, such as sales and profit.

**Q8. What is a box plot?**

A box plot displays the distribution of numerical data using quartiles, median, and potential outliers.

**Q9. What is the purpose of GroupBy?**

GroupBy divides data into groups based on a particular column and performs calculations such as sum, mean, and count.

**Q10. How do you save a chart in Matplotlib?**

We use `plt.savefig()` to save a chart as an image file.

# 12. Learning Outcome

Through this practical, I gained hands-on experience in data visualisation using Matplotlib and Seaborn.

I learned how to create different charts, including line plots, bar charts, pie charts, histograms, scatter plots, and box plots.

I also understood how to use Pandas GroupBy operations to prepare data for visualisation, customise charts, add annotations, and save visualisations as PNG images.

This practical helped me understand how data visualisation makes business data easier to analyse, compare, and communicate.

---

**Internship:** Cynaris Solutions Pvt. Ltd.  
**Program:** Data Analyst Intern  
**Week:** 2  
**Day:** 1  
**Topic:** Data Visualisation using Matplotlib and Seaborn  
**Repository:** cynaris-internship-Abrar