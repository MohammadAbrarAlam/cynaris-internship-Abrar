# Week 2 – Day 2: Pandas Advanced

# 1. Objective

The objective of this practical is to understand advanced Pandas operations for data manipulation, merging, aggregation, and reshaping.

I practised combining multiple DataFrames, creating pivot tables, converting wide data into long format, and performing multiple operations using method chaining.

# 2. Learning Objectives

- Merge DataFrames using `pd.merge()`.
- Understand Inner, Left, Right, and Outer joins.
- Understand `pd.merge()` vs `pd.concat()`.
- Create pivot tables using `pd.pivot_table()`.
- Reshape data using `pd.melt()`.
- Perform multiple operations using method chaining.

# 3. Tools & Technologies

- Python 3.11
- Pandas
- Seaborn
- Matplotlib
- Jupyter Notebook
- Git & GitHub

# 4. Environment Setup

**Install libraries:**

```bash
pip install pandas numpy matplotlib jupyter
```

**Import libraries:**

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
```

# 5. Practical Implementation

# a) Merge DataFrames Using pd.merge()

Combines two DataFrames using common columns or keys.

**Create Sample DataFrames:**

```python
customers = pd.DataFrame({
    "Customer_ID": [101, 102, 103, 104, 105],
    "Name": ["Abrar", "Sahil", "Rahul", "Faiz", "Imran"],
    "Region": ["East", "West", "Central", "South", "East"]
})

orders = pd.DataFrame({
    "Order_ID": [1, 2, 3, 4, 5],
    "Customer_ID": [101, 102, 103, 106, 101],
    "Sales": [500, 700, 300, 900, 600]
})
```

**Different Join Types:**

```python
# Inner Join
inner = pd.merge(customers, orders, on="Customer_ID", how="inner")

# Left Join
left = pd.merge(customers, orders, on="Customer_ID", how="left")

# Right Join
right = pd.merge(customers, orders, on="Customer_ID", how="right")

# Outer Join
outer = pd.merge(customers, orders, on="Customer_ID", how="outer")
```

**Merge Using Different Column Names:**

```python
result = pd.merge(
    df1, df2,
    left_on="Customer_ID",
    right_on="Client_ID",
    how="inner"
)
```

# b) Difference Between pd.merge() and pd.concat()

**Merge:** Combines DataFrames using common keys.

```python
merged = pd.merge(customers, orders, on="Customer_ID")
```

**Concat:** Combines DataFrames along rows or columns.

```python
combined = pd.concat(
    [df_jan, df_feb],
    axis=0,
    ignore_index=True
)
```

 -`pd.merge()`:  Combines using common keys 
 - `pd.concat()`:Combines along rows or columns.

# c) Create Pivot Table Using pd.pivot_table()

Summarises data using rows, columns, and aggregation functions.

**Sales by Region and Category:**

```python
sales_pivot = pd.pivot_table(
    df,
    values="Sales",
    index="Region",
    columns="Category",
    aggfunc="sum",
    fill_value=0
)

print(sales_pivot)
```

**Multiple Aggregations:**

```python
summary = pd.pivot_table(
    df,
    values=["Sales", "Profit"],
    index="Region",
    columns="Category",
    aggfunc="sum",
    fill_value=0
)
```

**Visualisation:**

```python
sales_pivot.plot(kind="bar", figsize=(10, 5))

plt.title("Sales by Region and Category")
plt.xlabel("Region")
plt.ylabel("Total Sales")
plt.tight_layout()
plt.show()
```

# d) Reshape Data Using pd.melt()

Converts wide-format data into long-format data.

**Create Sample DataFrame:**

```python
student = pd.DataFrame({
    "Roll_No": [101, 102, 103, 104, 105, 106],
    "Name": ["Abrar", "Sahil", "Rahul", "Faiz", "Imran", "Irfan"],
    "Math": [85, 78, 90, 65, 88, 75],
    "Science": [80, 85, 88, 70, 90, 82],
    "English": [75, 80, 85, 72, 86, 78]
})
```

**Wide to Long Format:**

```python
student_long = pd.melt(
    student,
    id_vars=["Roll_No", "Name"],
    var_name="Subject",
    value_name="Marks"
)

print(student_long)
```

**Filter Records:**

```python
high_marks = student_long[
    student_long["Marks"] >= 80
]

print(high_marks)
```

# e) Method Chaining in Pandas

Method chaining performs multiple operations in a single expression.

**Example: Sales Analysis**

```python
sales_analysis = (
    df
    .drop_duplicates()
    .dropna(subset=["Sales", "Profit"])
    .query("Sales > 0")
    .groupby("Region")
    .agg(
        Total_Sales=("Sales", "sum"),
        Total_Profit=("Profit", "sum"),
        Average_Sales=("Sales", "mean"),
        Total_Orders=("Order ID", "nunique")
    )
    .reset_index()
    .sort_values(by="Total_Sales", ascending=False)
)

print(sales_analysis)
```

**Operations Used:**

1. `drop_duplicates()` – Removes duplicates.
2. `dropna()` – Handles missing values.
3. `query()` – Filters records.
4. `groupby()` – Groups data.
5. `agg()` – Performs aggregations.
6. `reset_index()` – Resets the index.
7. `sort_values()` – Sorts results.

# 6. Comparison of Pandas Operations

| Operation | Purpose | Example Use Case |
* `merge()`:
   - Purpose: Combine using keys
   - Example: Customer and orders table.
     
* `concat()`:
   - Purpose: Combine DataFrame.
   - Example: Monthly datasets.
* `pivot_table()`:
   - Purpose: Summarise data.
   - Example: Regional sales.
* `melt()`:
   - Purpose: Wide to long format.
   - Example: Student marks.
* `Method Chaining`:
   - Multiple operations
   - Data analysis pipeline. 

# 7. Project Folder Structure

```text
cynaris-internship-Abrar/
│
└── week2/
    └── Day2/
        ├── advanced_pandas.ipynb
        └── README.md
```

# 8. Git & GitHub Workflow

**Create Feature Branch:**

```bash
git checkout main
git pull origin main
git checkout -b feature/week-2-day-2
```

**Stage and Commit:**

```bash
git add week2/Day2/
git commit -m "feat: pandas-advanced week-2-day-2 complete"
```

**Push Branch:**

```bash
git push -u origin feature/week-2-day-2
```

**Pull Request:**

- Base: `main`
- Compare: `feature/week-2-day-2`
- Title: Week 2 Day 2 – Pandas Advanced

**PR Description:**

Completed practical exercises on DataFrame merging, different join types, concatenation, pivot tables, data reshaping using melt, and method chaining.

# 9. CIA Activities

- **Research:** Explore advanced Pandas operations used in production.
- **Career:** Search for Data Analyst roles requiring Pandas skills.
- **Review:** Submit the notebook to CIA for feedback.
- **Documentation:** Record CIA insights in the daily work log.

# 10. Viva Questions:

**Q1. What is pd.merge()?**

It combines two DataFrames using common columns or keys.

**Q2. Difference between merge() and concat()?**

Merge combines using common keys, while concat combines along rows or columns.

**Q3. What are the four join types?**

Inner, Left, Right, and Outer joins.

**Q4. What is pd.pivot_table()?**

It summarises data using aggregation functions such as sum, mean, and count.

**Q5. What does pd.melt() do?**

It converts wide-format data into long-format data.

**Q6. What is method chaining?**

It performs multiple Pandas operations in a single expression.

**Q7. What is the use of groupby() and agg()?**

GroupBy creates groups, while agg performs calculations on those groups.

**Q8. Difference between Pandas and Excel PivotTables?**

Both summarise data, but Pandas uses Python code while Excel provides a graphical interface.

# 11. Learning Outcome

Through this practical, I gained hands-on experience with advanced Pandas operations. I learned to merge and concatenate DataFrames, create pivot tables, reshape datasets using `pd.melt()`, and apply multiple operations through method chaining.

These techniques help Data Analysts combine, transform, summarise, and prepare datasets for business analysis and reporting.

---

**Internship:** Cynaris Solutions Pvt. Ltd.  
**Program:** Data Analyst Intern  
**Week:** 2  
**Day:** 2  
**Topic:** Pandas Advanced  
**Repository:** cynaris-internship-Abrar