import html
import json
from pathlib import Path

import great_expectations as gx
import pandas as pd


# 1. Load student dataset
file_path = Path(__file__).resolve().parents[1] / "data" / "student_data.xlsx"

df = pd.read_excel(file_path)

print("Dataset loaded successfully!")
print("Total student records:", len(df))


# 2. Prepare columns for validation
df["age"] = pd.to_numeric(df["age"], errors="coerce")

df["email"] = df["email"].astype("string")

df["mobile"] = df["mobile"].astype("string").str.replace(r"\.0$", "", regex=True)

df["doj"] = pd.to_datetime(df["doj"], format="mixed", errors="coerce")


# 3. Create GX context
context = gx.get_context()


# 4. Connect DataFrame to GX
data_source = context.data_sources.add_pandas("student_data_source")

data_asset = data_source.add_dataframe_asset(name="student_data")

batch_definition = data_asset.add_batch_definition_whole_dataframe("student_batch")

batch = batch_definition.get_batch(batch_parameters={"dataframe": df})


# 5. Create Expectation Suite
suite = gx.ExpectationSuite(name="student_data_quality_suite")


# 6. Define 8 expectations
expectations = [
    # 1. Roll number must not be missing
    gx.expectations.ExpectColumnValuesToNotBeNull(column="roll-no"),
    # 2. Roll number must be unique
    gx.expectations.ExpectColumnValuesToBeUnique(column="roll-no"),
    # 3. Student name must not be missing
    gx.expectations.ExpectColumnValuesToNotBeNull(column="name"),
    # 4. Email must have a valid format
    gx.expectations.ExpectColumnValuesToMatchRegex(
        column="email", regex=r"^[\w.+-]+@[\w-]+(?:\.[\w-]+)+$"
    ),
    # 5. Age must be between 5 and 100
    gx.expectations.ExpectColumnValuesToBeBetween(
        column="age", min_value=5, max_value=100
    ),
    # 6. Mobile number must contain 10 digits
    gx.expectations.ExpectColumnValuesToMatchRegex(column="mobile", regex=r"^\d{10}$"),
    # 7. Course must not be missing
    gx.expectations.ExpectColumnValuesToNotBeNull(column="course"),
    # 8. DOJ must be within the expected period
    gx.expectations.ExpectColumnValuesToBeBetween(
        column="doj",
        min_value=pd.Timestamp("2024-07-01"),
        max_value=pd.Timestamp("2024-12-31"),
    ),
]


# 7. Add expectations to the suite
for expectation in expectations:
    suite.add_expectation(expectation)


# 8. Validate dataset
results = batch.validate(suite)


# 9. Generate HTML validation report
report_folder = Path(__file__).resolve().parents[1] / "reports"

report_folder.mkdir(parents=True, exist_ok=True)

report_file = report_folder / "great_expectations_report.html"

results_json = json.dumps(results.to_json_dict(), indent=4, default=str)

status = "PASSED" if results.success else "FAILED"

html_report = f"""
<!DOCTYPE html>
<html>
<head>
    <title>Student Data Quality Report</title>
    <style>
        body {{
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #f4f4f4;
        }}

        h1, h2 {{
            color: #333;
        }}

        .status {{
            font-weight: bold;
            font-size: 18px;
        }}

        pre {{
            background: white;
            padding: 20px;
            border-radius: 8px;
            white-space: pre-wrap;
            overflow-wrap: anywhere;
        }}
    </style>
</head>
<body>
    <h1>Student Data Quality Report</h1>

    <h2>Great Expectations Validation</h2>

    <p class="status">
        Overall Status: {status}
    </p>

    <p>Total Expectations: {len(expectations)}</p>

    <h2>Validation Results</h2>

    <pre>{html.escape(results_json)}</pre>
</body>
</html>
"""

report_file.write_text(html_report, encoding="utf-8")

print("\nHTML report generated successfully!")
print("Report location:", report_file)


# 10. Display validation summary
print("\n========== GX VALIDATION RESULTS ==========")

print("Total expectations:", len(expectations))
print("Overall validation passed:", results.success)
print("Validation statistics:", results.statistics)

print("\n========== VALIDATION COMPLETED ==========")
