from pathlib import Path

import pandas as pd

# 1. Load original dataset
file_path = Path(__file__).resolve().parents[1] / "data" / "student_data.xlsx"
df = pd.read_excel(file_path)

print("\n========== SIX DAMA DATA QUALITY CHECKS ==========")

total = len(df)


# 1. COMPLETENESS
# Check missing values in all columns

print("\n1. COMPLETENESS")

missing_values = df.isnull().sum()
total_missing = missing_values.sum()

print("Missing values:")
print(missing_values[missing_values > 0])

print("Total missing values:", total_missing)
print("Complete values:", (total * len(df.columns)) - total_missing)


# 2. ACCURACY
# Check whether age matches date of birth

print("\n2. ACCURACY")

dob = pd.to_datetime(df["dob"], errors="coerce")
age = pd.to_numeric(df["age"], errors="coerce")

today = pd.Timestamp("2026-11-16")

calculated_age = today.year - dob.dt.year

# Adjust age if birthday has not occurred yet
birthday_not_passed = (today.month < dob.dt.month) | (
    (today.month == dob.dt.month) & (today.day < dob.dt.day)
)

calculated_age = calculated_age - birthday_not_passed.astype(int)

age_correct = (age == calculated_age).sum()

print("Correct age records:", age_correct)
print("Incorrect or missing age records:", total - age_correct)


# 3. CONSISTENCY
# Check course names and phone number formats

print("\n3. CONSISTENCY")

course = df["course"].astype("string").str.strip().str.lower()

print("Course name variations:")
print(course.value_counts())

mobile = df["mobile"].astype("string").str.replace(r"\D", "", regex=True)

consistent_mobile = mobile.str.len() == 10

print("Consistent mobile numbers:", consistent_mobile.sum())
print("Inconsistent mobile numbers:", total - consistent_mobile.sum())


# 4. TIMELINESS
# Check joining dates

print("\n4. TIMELINESS")

doj = pd.to_datetime(df["doj"], errors="coerce")

valid_dates = doj.notna() & (doj <= today) & doj.between("2024-07-01", "2024-12-31")

print("Valid joining dates:", valid_dates.sum())
print("Invalid joining dates:", total - valid_dates.sum())


# 5. UNIQUENESS
# Check duplicate roll numbers

print("\n5. UNIQUENESS")

duplicates = df["roll-no"].duplicated(keep=False)

print("Unique roll numbers:", (~duplicates).sum())
print("Duplicate roll number records:", duplicates.sum())

print("Duplicate records:")
print(df.loc[duplicates, ["roll-no", "name"]])


# 6. VALIDITY
# Check email, age and phone number formats

print("\n6. VALIDITY")

valid_email = (
    df["email"]
    .astype("string")
    .str.fullmatch(r"[\w.+-]+@[\w-]+(?:\.[\w-]+)+", na=False)
)

valid_age = age.between(5, 100)

valid_mobile = mobile.str.fullmatch(r"\d{10}", na=False)

print("Valid emails:", valid_email.sum())
print("Invalid emails:", total - valid_email.sum())

print("Valid ages:", valid_age.sum())
print("Invalid ages:", total - valid_age.sum())

print("Valid mobile numbers:", valid_mobile.sum())
print("Invalid mobile numbers:", total - valid_mobile.sum())


print("\n========== ANALYSIS COMPLETED ==========")
