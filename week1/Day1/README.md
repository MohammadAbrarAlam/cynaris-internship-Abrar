# Week 1 – Day 1:    (SQL Fundamentals)

Internship: Data Analyst Intern – Cynaris Solutions
Candidate: Mohammad Abrar Alam
Repository:"cynaris-internship-Abrar"

# 1. Objective:

The objective of this task is to understand and practice basic SQL commands using a sample sales dataset and DB Browser for SQLite.

# 2. Topics Covered:

1. SELECT
2. WHERE
3. AND
4. OR
5. NOT
6. IN and NOT IN
7. BETWEEN
8. LIKE
9. IS NULL

# 3. Tools & Technologies:
- DB Browser for SQLite
- Git
- Git Bash
- GitHub
- Visual Studio Code
- Kaggle Dataset

# 4. Dataset Download and Preparation.

# How to Download Sample Sales Dataset

1. Open Google Chrome.
2. Visit official website: ('https://www.kaggle.com/datasets').
3. Sign up or sign in to your Kaggle account.
4. Search for "Sample Superstore Sales Dataset".
5. Open a suitable dataset.
6. Click the Download button.
7. Extract the downloaded ZIP file.
8. Locate the CSV file.

# How to Import CSV into DB Browser for SQLite

1. Open DB Browser for SQLite.
2. Create a new database named (`sales.db`).
3. Select File → Import → Table from CSV file.
4. Browse and select the downloaded CSV file.
5. Enter the table name as (`Sales`).
6. Enable the option for the first row containing column names.
7. Check the column names and data types.
8. Click OK to import the data.
9. Click Write Changes to save the database.

Note: The CSV file is imported into SQLite as a database table. The (`.db`) file stores the imported data and table structure.

# 5. SQL Practice:

All SQL queries are maintained in:

(`sql_queries.sql`)

The following operations are practiced:

- Retrieve records using SELECT.
- Filter records using WHERE.
- Apply multiple conditions using AND and OR.
- Exclude records using NOT.
- Match multiple values using IN and NOT IN.
- Filter numeric or sales amount ranges using BETWEEN.
- Search patterns using LIKE.
- Identify missing values using IS NULL.

# 6. Project Folder Structure:


cynaris-internship-Abrar/
│
└── week1/
    └── day1/
        ├── README.md
        ├── sales.db
        ├── Sales_summary.csv
        └── sql_queries.sql


# 7. Git and GitHub Workflow:

  # Step 1: Clone the Repository:

    - Open ("Git Bash") and navigate to your working directory. 
        {cd /c/Users/Lenovo/Cynaris}

    -Clone the repository:
      {git clone https://github.com/MohammadAbrarAlam/cynaris-internship-Abrar.git}

    -Navigate into the repository:
      { `cd cynaris-internship-Abrar`}

   - Open the project in VS Code:
      {code . }


# Step 2: Check Repository Status:
* git status
* git branch -a
* git remote -v

# Step 3: Create the Main Branch:

- If the GitHub repository is completely empty, create the initial main branch:
  {`git checkout -b main`}

- Create an initial README or other project file, then:
* git add .
* git commit -m `"docs: initialize internship repository"`
* git push -u origin main

Note: This initial setup is performed only once.

# Step 4: Create a Feature Branch:

Create a separate branch for the Day 1 task:
  {`git checkout -b feature/week-1-day-1`}

    Alternative Command:
  {`git switch -c feature/week-1-day-1`}

# Step 5: Understand Different Branch Commands:
 - Create a new branch:
  * git branch branch-name

- Switch to an existing branch:
  * git checkout branch-name

    Alternative Command:
  {git switch branch-name}

- Create and switch to a new branch:
  * git checkout -b branch-name

1) List all branches:
  * git branch -a

2) Rename the current branch:
  * git branch -m new-branch-name

3) Delete a local branch:
  * git branch -d branch-name

# Step 6: Add and Commit Day 1 Files: 
  After completing the SQL queries, database and CSV export, check the changes:
  * git status 
  -- Stage all changes

  * git add .
  -- Commit using the required Conventional Commit message:

  * git commit -m ` "feat: sql-fundamentals week-1-day-1 complete" `

# Step 7: Push the Feature Branch:
* git push -u origin `feature/week-1-day-1`
* git add .
* git commit -m `"feat: update week-1-day-1 deliverables"`
* git push origin ` feature/week-1-day-1`

# Step 8: Create a Pull Request:
1. Open the GitHub repository.
2. Select the feature branch or click Compare & pull request.
3. Select the base branch as (`main`).
4. Select the compare branch as (`feature/week-1-day-1`.)
5. Enter the title: (`Week 1 Day 1 – SQL Fundamentals`)
6. Add a description of the completed tasks and deliverables.
7. Click Create pull request.
8. Copy the Pull Request URL and share it with the internship mentor.


# 9. Deliverables: 

| File              | Description          |
| ----------------- | -------------------- |
| README.md         | Task documentation   |
| sales.db          | SQLite database      |
| Sales_summary.csv | Exported SQL result  |
| sql_queries.sql   | SQL practice queries |

# 10. Learning Outcome

- Understood basic SQL commands and filtering operators.
- Practiced SQL queries using a sample sales database.
- Learned CSV import and export using DB Browser for SQLite.
- Practiced Git branching, staging, committing and pushing.
- Understood the GitHub Pull Request workflow.

`Status`: Week 1 – Day 1 documentation and deliverables.
