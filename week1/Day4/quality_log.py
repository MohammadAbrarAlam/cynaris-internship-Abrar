import pandas as pd

quality_log = [
    {
        "Column": "NAME",
        "Issue": "Uppercase/lowercase mismatch and special symbols",
        "Action": "Removed unwanted symbols and converted to Title Case",
        "Reason": "Maintain consistency"
    },
    {
        "Column": "EMAIL",
        "Issue": "Uppercase/lowercase mismatch and special symbols",
        "Action": "Removed unwanted symbols and converted to Lowercase",
        "Reason": "Maintain consistent email formatting"
    },
    {
        "Column": "MOBILE",
        "Issue": "Missing values and special symbols",
        "Action": "Removed unwanted symbols and flagged missing values",
        "Reason": "Avoid incorrect contact information"
    },
    {
        "Column": "DOB",
        "Issue": "Mixed date formats",
        "Action": "Converted into datetime",
        "Reason": "Standardize dates"
    },
    {
        "Column": "AGE",
        "Issue": "Missing values and unwanted column",
        "Action": "Applied median imputation and removed unwanted column",
        "Reason": "Maintain data quality"
    },
    {
        "Column": "COURSE",
        "Issue": "Special characters and missing values",
        "Action": "Replaced unwanted symbols and filled missing values",
        "Reason": "Maintain consistent course names"
    },
    {
        "Column": "DOJ",
        "Issue": "Mixed date formats",
        "Action": "Standardized date format",
        "Reason": "Consistent date representation"
    }
]

log_df = pd.DataFrame(quality_log)

print(log_df.to_string(index=False))

# Export Data Quality Log
log_df.to_csv("data_quality_log.csv", index=False)
