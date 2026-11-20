# Week 1 – Day 5: Python for Data – Pandas Basics

## 1. Objective

The objective of this practical is to learn how to use Python Pandas for data analysis and cleaning.

Using the Sample Superstore dataset, I practised loading data, exploring records, handling missing values, removing duplicates, filtering data, and generating useful insights.

## 2. Learning Objectives

- Load and explore CSV datasets.
- Understand DataFrames and data types.
- Identify and handle missing values.
- Find and remove duplicate records.
- Filter and update data.
- Perform grouping and aggregation.
- Export cleaned data into CSV format.

## 3. Tools & Technologies

- Python 3.11
- Pandas
- Jupyter Notebook
- Git & GitHub
- Kaggle

## 4. Python Environment Setup

**Install Python:** [https://www.python.org/downloads/](https://www.python.org/downloads/)

**Install required libraries:**

```bash
pip install pandas numpy jupyter
```

**Launch Jupyter Notebook:**

```bash
jupyter notebook
```

**Import Pandas:**

```python
import pandas as pd
```

## 5. Dataset Used

**Dataset:** Sample Superstore Dataset

**Source:** Kaggle

**Dataset Link:** [https://www.kaggle.com/datasets/vivek468/superstore-dataset-final](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

**File Name:** `Sample_ Superstore.csv`

The dataset contains retail sales information, including customers, orders, products, regions, sales, discounts, and profits.

## 6. Practical Implementation

### 6.1 Load Dataset

```python
df = pd.read_csv("Sample_ Superstore.csv", encoding="latin1")
```

### 6.2 Data Inspection Methods

| Method           | Purpose                 |
| ---------------- | ----------------------- |
| `head()`         | Display first 5 rows    |
| `tail()`         | Display last 5 rows     |
| `shape`          | Check rows and columns  |
| `columns`        | Display column names    |
| `dtypes`         | Check data types        |
| `info()`         | Dataset information     |
| `describe()`     | Statistical summary     |
| `sample()`       | Display random rows     |
| `duplicated()`   | Find duplicate records  |
| `isnull()`       | Find missing values     |
| `notnull()`      | Find non-missing values |
| `unique()`       | Find unique values      |
| `nunique()`      | Count unique values     |
| `value_counts()` | Count value frequencies |

**Examples:**

```python
print(df.head())
print(df.shape)
print(df.columns)
print(df.dtypes)
df.info()
print(df.describe())
print(df["Category"].value_counts())
print(df.isnull().sum())
print(df.duplicated().sum())
```

### 6.3 Data Cleaning Methods

| Method              | Purpose                     |
| ------------------- | --------------------------- |
| `fillna()`          | Fill missing values         |
| `dropna()`          | Remove missing values       |
| `drop_duplicates()` | Remove duplicate records    |
| `replace()`         | Replace incorrect values    |
| `astype()`          | Change data type            |
| `strip()`           | Remove extra spaces         |
| `rename()`          | Rename columns              |
| `drop()`            | Remove unwanted columns     |
| `to_datetime()`     | Convert into date format    |
| `to_numeric()`      | Convert into numeric format |
| `str.upper()`       | Convert text to uppercase   |
| `str.lower()`       | Convert text to lowercase   |

**Examples:**

```python
# Fill missing values
df["Postal Code"] = df["Postal Code"].fillna(0)

# Remove duplicates
df = df.drop_duplicates()

# Remove extra spaces
df["City"] = df["City"].str.strip()

# Convert date format
df["Order Date"] = pd.to_datetime(df["Order Date"])

# Convert numeric values
df["Sales"] = pd.to_numeric(df["Sales"])
```

### 6.4 Data Updating Methods

| Method      | Purpose                        |
| ----------- | ------------------------------ |
| `loc[]`     | Update values using conditions |
| `iloc[]`    | Update values using positions  |
| `replace()` | Replace specific values        |

**Examples:**

```python
# Update values using conditions
df.loc[df["City"] == "New York City", "Region"] = "East"

# Update values using positions
df.iloc[0, 5] = "Updated Value"

# Create a new column
df["Profit_Status"] = "Low"
df.loc[df["Profit"] > 100, "Profit_Status"] = "High"
```

### 6.5 Data Filtering Methods

| Method           | Purpose                 |
| ---------------- | ----------------------- |
| `df[]`           | Filter rows             |
| `filter()`       | Select columns          |
| `query()`        | Filter using conditions |
| `isin()`         | Match multiple values   |
| `between()`      | Filter within a range   |
| `str.contains()` | Search text             |
| `nlargest()`     | Find highest values     |
| `nsmallest()`    | Find lowest values      |

**Examples:**

```python
# Sales greater than 500
df_filtered = df[df["Sales"] > 500]

# Select specific columns
df_filtered = df.filter(items=["Order ID", "Sales", "Profit"])

# Filter using multiple conditions
df_filtered = df.query("Sales > 500 and Profit > 100")

# Filter specific regions
df_filtered = df[df["Region"].isin(["West", "East"])]

# Find top 5 sales
print(df.nlargest(5, "Sales"))
```

### 6.6 GroupBy and Aggregation

GroupBy helps analyse data by categories and calculate totals, averages, and counts.

**Total Sales by Region:**

```python
region_sales = df.groupby("Region")["Sales"].sum()
print(region_sales)
```

**Profit by Category:**

```python
category_profit = df.groupby("Category")["Profit"].sum()
print(category_profit)
```

**Multiple Aggregations:**

```python
summary = df.groupby("Category").agg(
    total_sales=("Sales", "sum"),
    average_sales=("Sales", "mean"),
    total_profit=("Profit", "sum")
)

print(summary)
```

### 6.7 Export Cleaned Dataset

```python
df.to_csv("cleaned_orders.csv", index=False)

print("Cleaned dataset exported successfully!")
```

## 7. Project Folder Structure

```text
cynaris-internship-Abrar/
│
└── week1/
    └── Day5/
        ├── analysis_day5.ipynb
        ├── Sample_ Superstore.csv
        ├── cleaned_orders.csv
        └── README.md
```

*Note: Keep the original dataset unchanged. Include the cleaned CSV in GitHub only if required for submission.*

## 8. Git & GitHub Workflow

**Step 1: Create Feature Branch**

```bash
git checkout main
git pull origin main
git checkout -b feature/week-1-day-5
```

**Step 2: Stage Files**

```bash
git add week1/Day5/analysis_day5.ipynb week1/Day5/README.md
```

**Step 3: Commit Changes**

```bash
git commit -m "feat: python-pandas week-1-day-5 complete"
```

**Step 4: Push Branch**

```bash
git push -u origin feature/week-1-day-5
```

**Step 5: Create Pull Request**

- Base branch: `main`
- Compare branch: `feature/week-1-day-5`

**PR Title:** Week 1 Day 5 – Python Pandas Basics

**PR Description:**

This PR contains my Day 5 Pandas practical work, including dataset exploration, data cleaning, filtering, GroupBy operations, and CSV export.

## 9. Deliverables

| Deliverable   | Description           |
| ------------- | --------------------- |
| Dataset       | Sample Superstore CSV |
| Notebook      | `analysis_day5.ipynb` |
| Documentation | `README.md`           |
| Cleaned Data  | `cleaned_orders.csv`  |
| Git Commit    | Descriptive commit    |
| Pull Request  | PR against main       |

## 10. CIA Activities

- **Research:** Explore useful Pandas methods for data analysis.
- **Career:** Search for Python Pandas skills in Data Analyst job roles.
- **Review:** Submit the notebook to CIA for feedback.

## 11. Viva Questions

**Q1. What is a Pandas DataFrame?**

A DataFrame is a two-dimensional data structure that stores information in rows and columns, similar to an Excel spreadsheet.

**Q2. How does groupby() work?**

It groups data based on a column and allows calculations such as sum, average, and count.

**Q3. What is the difference between loc and iloc?**

- `loc[]` selects data using labels.
- `iloc[]` selects data using integer positions.

## 12. Learning Outcome

Through this practical, I gained hands-on experience with Pandas using the Sample Superstore dataset. I learned how to explore, clean, filter, and analyse data, handle missing values and duplicates, perform aggregations, and export cleaned datasets.

These skills helped me understand how Pandas is used in everyday data analysis workflows.

---

**Internship:** Cynaris Solutions Pvt. Ltd.
**Program:** Data Analyst Intern
**Week:** 1
**Day:** 5
**Topic:** Python for Data – Pandas Basics
**Repository:** cynaris-internship-Abrar
