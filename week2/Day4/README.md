# Week 2 – Day 4: Data Cleaning

# 1. Objective

The objective of this practical is to clean and standardise a raw Student Dataset using Python and Pandas.

I worked on identifying missing values, empty cells, duplicates, inconsistent text, unwanted characters, incorrect date formats, and potential outliers.

# 2. Learning Objectives

- Validate datasets using Pandas.
- Identify missing values and empty cells.
- Remove duplicate records.
- Standardise text and column names.
- Handle unwanted spaces and special characters.
- Clean and standardise addresses.
- Convert dates into consistent formats.
- Apply missing-value handling techniques.
- Detect potential outliers using IQR.
- Maintain a Data Quality Log.

# 3. Tools & Technologies

- Python 3.11
- Pandas
- NumPy
- Jupyter Notebook
- Git & GitHub

# 4. Dataset Overview

**Dataset:** Student Sample Dataset
  -roll_no : Student ID 
  -name : Student name 
  - email : Email address
  - contact : Contact information
  - mobile : Mobile number 
  - address : Residential address 
  - dob :  Date of birth 
  - age : Student age 
  - course : Enrolled course 
  - doj : Date of joining 

The dataset contains missing values, duplicates, empty cells, inconsistent casing, unwanted symbols, and different date formats.

# 5. Data Cleaning Workflow

# Step 1: Import Libraries & Load Dataset

```python
import pandas as pd
import numpy as np
import os

df = pd.read_csv("student_sample_data.csv")
```

## Step 2: Data Validation

Inspect the dataset before cleaning.

```python
df.head()
df.tail()
df.info()

print(df.shape)
print(df.columns.tolist())
print(df.dtypes)

display(df.describe())

print(df.duplicated().sum())
print(df.isnull().sum())
```

**Purpose:** Understand dataset structure, data types, missing values, duplicates, and statistical information.

# Step 3: Handle Empty Cells & Whitespace

```python
# Check empty cells
print((df["mobile"] == "").sum())

# Check whitespace-only cells
print(
    df["mobile"].astype("string")
    .str.strip().eq("").sum()
)

# Remove unwanted spaces
df["name"] = df["name"].str.strip()
```

# Step 4: Standardise Text

```python
# Title Case
df["name"] = df["name"].str.title()

# Lowercase
df["email"] = df["email"].str.lower()

# Uppercase
df["course"] = df["course"].str.upper()

# Remove unwanted symbols
df["course"] = df["course"].str.replace(
    r"[/@#&]+", " ", regex=True
)
```

# Step 5: Handle Missing Values

```python
# Delete rows where name is missing
df = df.dropna(subset=["name"])

# Fill missing course values
df["course"] = df["course"].fillna("Unknown")

# Forward fill
df["course"] = df["course"].ffill()

# Fill numerical missing values
df["age"] = df["age"].fillna(df["age"].median())
```

**Purpose:** Remove or replace missing values using suitable methods.

Note: Choose one appropriate filling strategy instead of applying multiple methods blindly.

# Step 6: Remove Duplicates & Unnecessary Columns

```python
# Remove duplicate records
df = df.drop_duplicates()

# Drop unnecessary columns
df.drop(columns=["contact"], inplace=True)
```

# Step 7: Address Cleaning Using apply()

Create a custom function to standardise address abbreviations.

```python
def clean_address(address):

    if pd.isna(address):
        return address

    replacements = {
        "Apartment": "Apt",
        "Flat": "Fl",
        "Floor": "Flr",
        "Main Road": "Main Rd",
        "Street": "St",
        "Road": "Rd",
        "Colony": "Col",
        "Sector": "Sec",
        "Near": "Nr"
    }

    for old, new in replacements.items():
        address = address.replace(old, new)

    return address


df["address"] = df["address"].apply(clean_address)
```

# Step 8: Date Standardisation

**DOB:** Convert dates into `12th Nov, 2026` format.

```python
df["dob"] = pd.to_datetime(
    df["dob"], errors="coerce"
)

def format_date(date):

    if pd.isna(date):
        return date

    day = date.day

    if 11 <= day <= 13:
        suffix = "th"
    else:
        suffix = {
            1: "st", 2: "nd", 3: "rd"
        }.get(day % 10, "th")

    return date.strftime(f"{day}{suffix} %b, %Y")


df["dob"] = df["dob"].apply(format_date)
```

**DOJ:** Convert dates into `DD-MM-YYYY` format.

```python
df["doj"] = pd.to_datetime(
    df["doj"],
    format="mixed",
    dayfirst=True,
    errors="coerce"
)

df["doj"] = df["doj"].dt.strftime("%d-%m-%Y")
```

# Step 9: Standardise Column Names

```python
# Convert all column names into uppercase
df.columns = df.columns.str.upper()

print(df.columns.tolist())
```

# Step 10: Outlier Detection Using IQR

```python
Q1 = df["AGE"].quantile(0.25)
Q3 = df["AGE"].quantile(0.75)

IQR = Q3 - Q1

lower = Q1 - 1.5 * IQR
upper = Q3 + 1.5 * IQR

# Identify outliers
outliers = df[
    (df["AGE"] < lower) |
    (df["AGE"] > upper)
]

display(outliers)
```

**Purpose:** Identify unusually high or low numerical values.

# 6. Data Quality Log

Document the cleaning operations performed.

* NAME:
 - Issue: Inconsistent casing
 - Cleaning Action: Title Case
* EMAIL:
 - Issue: Uppercase letters
 - Cleaning Action:Lowercase

* MOBILE:
 - Issue: Empty cells.
 - Cleaning Action: Missing-value handling.

* ADDRESS:
 - Issue: Inconsistent abbreviations
 - Cleaning Action: Custom function.

* DOB:
 - Issue: Different date formats.
 - Date standardisation.
* DOJ:
 - Mixed date formats.
 - Datetime conversion.
* COURSE:
 - Issue: Unwanted symbols.
 - Cleaning Action: String replacement
* All Columns:
 - Duplicate records
 - Remove duplicates
* CONTACT:
 - Issue: Unnecessary column
 - Cleaning Action: Drop column.

# 7. Save Cleaned Dataset

```python
os.makedirs("output", exist_ok=True)

df.to_csv(
    "cleaned_dataset.csv",
    index=False
)

print("Cleaned dataset saved successfully!")
```

# 8. Project Folder Structure

```text
cynaris-internship-Abrar/
│
└── week2/
    └── Day4/
        ├── README.md
        ├── data_cleaning.ipynb
        ├── cleaning_log.md
        ├── student_sample_data.csv
        │
        └── output/
            └── cleaned_dataset.csv
```

# 9. Git & GitHub Workflow

**Create Feature Branch**

```bash
git checkout main
git pull origin main
git checkout -b feature/week-2-day-4
```

**Commit Changes**

```bash
git add .
git commit -m "feat: data-cleaning week-2-day-4 complete"
```

**Push Branch**

```bash
git push -u origin feature/week-2-day-4
```

**Pull Request Title:** Week 2 Day 4 – Data Cleaning

**PR Description:**

Completed data cleaning using Pandas. Handled missing values, duplicates, empty cells, text standardisation, address cleaning, date formatting, and outlier detection. Saved the cleaned dataset and documented cleaning operations.

# 10. CIA Activities

- **Research:** Explored strategies for handling missing values in time-series datasets.
- **Career:** Explored Data Cleaning skills and industry requirements.
- **Review:** Prepared deliverables for CIA feedback.
- **Documentation:** Recorded CIA insights in the daily work log.

# 11. Viva Questions

**Q1. What is Data Cleaning?**

The process of identifying and correcting errors, missing values, duplicates, and inconsistencies in data.

**Q2. What is the difference between NaN and an empty string?**

NaN represents a missing value, whereas an empty string contains no characters.

**Q3. What is the purpose of `dropna()` and `fillna()`?**

`dropna()` removes missing records, whereas `fillna()` replaces missing values.

**Q4. What is the purpose of `duplicated()`?**

It identifies repeated records in a dataset.

**Q5. What is the difference between `strip()`, `lstrip()`, and `rstrip()`?**

They remove unwanted whitespace from both sides, left side, and right side respectively.

**Q6. What is `apply()`?**

It applies a function to Series or DataFrame data.

**Q7. What is `to_datetime()`?**

It converts date values into Pandas datetime format.

**Q8. What is the IQR method?**

It identifies potential outliers using the difference between Q3 and Q1.

**Q9. What is forward-fill?**

It fills missing values using the previous available value.

**Q10. Why is Data Cleaning important?**

It improves data quality and helps produce accurate analysis and business insights.

# 12. Learning Outcome

Through this practical, I gained hands-on experience in cleaning and standardising datasets using Python and Pandas.

I learned data validation, missing-value handling, duplicate removal, string operations, address cleaning, date formatting, column standardisation, and outlier detection.

This practical improved my ability to transform raw data into clean and analysis-ready datasets.

---

**Internship:** Cynaris Solutions Pvt. Ltd.  
**Program:** Data Analyst Intern  
**Week:** 2  
**Day:** 4  
**Topic:** Data Cleaning  
**Repository:** `cynaris-internship-Abrar`  
**Technologies:** Python, Pandas, NumPy, Jupyter Notebook, Git & GitHub