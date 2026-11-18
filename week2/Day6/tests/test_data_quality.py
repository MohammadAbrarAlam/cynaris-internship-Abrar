
from pathlib import Path

import pandas as pd

# Load original student dataset
file_path = (
    Path(__file__).resolve().parents[1]
    / "data"
    / "student_data.xlsx"
)

df = pd.read_excel(file_path)


# Test 1: Dataset should not be empty
def test_dataset_not_empty():
    assert len(df) > 0


# Test 2: Roll numbers should not be missing
def test_roll_number_not_missing():
    assert df["roll-no"].notna().all()


# Test 3: Roll numbers should be unique
def test_roll_number_unique():
    assert df["roll-no"].is_unique


# Test 4: Student names should not be missing
def test_student_name_not_missing():
    assert df["name"].notna().all()


# Test 5: Age should be between 5 and 100
def test_age_range():
    age = pd.to_numeric(df["age"], errors="coerce")
    assert age.between(5, 100).all()


# Test 6: Course should not be missing
def test_course_not_missing():
    assert df["course"].notna().all()
