from pathlib import Path

import pandas as pd

# 1. Load original dataset
data_folder = Path(__file__).resolve().parents[1] / "data"

input_file = data_folder / "student_data.xlsx"
output_file = data_folder / "student_data_with_errors.xlsx"

df = pd.read_excel(input_file)


# 2. Inject three intentional errors

# Error 1: Create a duplicate roll number
df.at[df.index[1], "roll-no"] = df.iloc[0]["roll-no"]

# Error 2: Add an invalid email
df.at[df.index[2], "email"] = "invalid-email"

# Error 3: Add an invalid age
df.at[df.index[3], "age"] = 150


# 3. Save the dataset with errors
df.to_excel(output_file, index=False)

print("Three intentional errors added successfully!")
print("File saved at:", output_file)

# Display modified records
print("\nModified records:")
print(df.iloc[:4][["roll-no", "email", "age"]])
