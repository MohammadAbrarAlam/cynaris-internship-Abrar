# Week 2 – Day 6: Data Governance – Quality, Contracts & Great Expectations

Welcome to the repository for **Week 2 – Day 6: Data Governance – Quality, Contracts & Great Expectations** as part of the **Cynaris Learning Data Analyst Internship** program.

## 1. Objective

The objective of this practical is to apply data governance principles and evaluate a Student Dataset using the six DAMA-DMBOK data quality dimensions.

I worked on automating data validation using Great Expectations, injecting intentional data quality errors, creating a machine-readable YAML Data Contract, and identifying Personally Identifiable Information (PII).

## 2. Learning Objectives

- Understand data governance concepts, roles, and responsibilities.
- Understand India's Digital Personal Data Protection (DPDP) Act 2023.
- Evaluate datasets using the six DAMA-DMBOK data quality dimensions.
- Automate data validation using Great Expectations.
- Create and execute eight automated data quality expectations.
- Inject intentional data quality errors and verify their detection.
- Create a YAML Data Contract between producer and consumer.
- Identify and classify PII columns.
- Recommend masking and tokenisation strategies.

## 3. Tools & Technologies

- Python 3.11
- Pandas
- NumPy
- Great Expectations (GX)
- YAML
- PyYAML
- ReportLab
- HTML
- Git & GitHub

## 4. Dataset Overview

**Dataset:** Student Sample Dataset

The dataset contains student information used to evaluate data quality and implement governance practices.

| Property | Details |
|---|---|
| Dataset Name | student_sample_data.csv |
| Total Records | 20 |
| Total Columns | 10 |
| Dataset Type | Student Information |
| Producer | Data Analyst (Abrar) |
| Consumer | BI Dashboard – Cynaris Learning |

### Dataset Columns

| Column | Description | Classification |
|---|---|---|
| roll_no | Student identification number | Internal |
| name | Student name | Personal |
| email | Student email address | Personal |
| contact | Contact information | Personal |
| mobile | Mobile number | Personal |
| address | Residential address | Sensitive Personal Data |
| dob | Date of birth | Personal |
| age | Student age | Personal |
| course | Enrolled course | Internal |
| doj | Date of joining | Internal |

## 5. Data Governance Overview

Data Governance defines the policies, processes, standards, and responsibilities required to manage organizational data securely and effectively.

**Core Formula:**

Data Governance = Right Data + Right People + Right Rules

### Need for Data Governance

- Data Security: Protect sensitive information from unauthorized access.
- Data Compliance: Follow applicable data protection regulations.
- Data Quality: Maintain accurate, complete, and reliable data.
- Remove Data Silos: Enable standardized data sharing.
- Decision Making: Ensure BI dashboards use trustworthy data.
- Improve Efficiency: Reduce manual data correction.

### Roles and Responsibilities

| Role | Responsibility |
|---|---|
| Data Owner | Overall accountability for the dataset |
| Data Steward | Maintains data quality and standards |
| Data Custodian | Manages storage and access security |
| Data Governance Council | Establishes governance policies |
| Data Users | Use data responsibly |
| Data Analyst | Performs validation and prepares reports |

## 6. Six DAMA-DMBOK Data Quality Dimensions

I evaluated the Student Dataset using six data quality dimensions.

| Dimension | Description | Validation Example |
|---|---|---|
| Completeness | Required values should not be missing | Check NULL values |
| Accuracy | Values should reflect real-world information | Age between 1 and 100 |
| Consistency | Data should follow consistent rules | Standardised course names |
| Timeliness | Data should be available within the required time | Check dataset freshness |
| Uniqueness | Duplicate records should be avoided | Unique roll numbers |
| Validity | Values should follow defined formats | Valid email format |

### Data Quality Scoring

Each dimension is evaluated using a score from 0 to 100.

**Formula:**

Score = (Passed Checks / Total Checks) × 100

The overall data quality score is calculated using the average of the six dimension scores.

The final scorecard documents:

- Data quality score for each dimension.
- Identified data quality issues.
- Validation results.
- Improvement recommendations.

## 7. Great Expectations – Automated Data Validation

Great Expectations is a Python-based data quality validation framework used to define and execute expectations against datasets.

### Step 1: Install Required Libraries

```bash
pip install pandas numpy great_expectations pyyaml reportlab
```

### Step 2: Import Libraries and Load Dataset

```python
import pandas as pd
import great_expectations as gx

df = pd.read_csv(
    "data/student_sample_data.csv"
)

print(df.head())
print(df.info())
```

### Step 3: Create Data Quality Expectations

The validation process includes eight automated rules:

1. Roll numbers should not contain NULL values.
2. Student names should not contain NULL values.
3. Email addresses should not contain NULL values.
4. Roll numbers should be unique.
5. Email addresses should follow a valid email format.
6. Student ages should be within the defined range.
7. Course values should not contain empty strings.
8. Date of joining should contain valid date values.

**Purpose:** Identify data quality problems before the dataset is used in downstream BI dashboards.

**Note:** The exact Great Expectations API depends on the installed version. The validation script should use the API supported by the installed version.

## 8. Inject Intentional Data Quality Errors

To test the validation process, I created a separate dataset containing intentional errors.

**Original Dataset:**

`data/student_sample_data.csv`

**Dataset with Errors:**

`data/student_sample_data_with_errors.csv`

### Types of Errors Injected

1. Missing student name.
2. Duplicate roll number.
3. Invalid email address.

### Error Injection Example

```python
import pandas as pd

df = pd.read_csv(
    "data/student_sample_data.csv"
)

# Inject missing name
df.loc[0, "name"] = None

# Inject duplicate roll number
df.loc[1, "roll_no"] = df.loc[0, "roll_no"]

# Inject invalid email
df.loc[2, "email"] = "invalid-email"

df.to_csv(
    "data/student_sample_data_with_errors.csv",
    index=False
)

print("Intentional errors injected successfully!")
```

### Expected Validation Outcome

| Error | Expected Detection |
|---|---|
| Missing student name | Completeness failure |
| Duplicate roll number | Uniqueness failure |
| Invalid email | Validity failure |

The validation report should identify the failed expectations and help prevent poor-quality data from reaching the BI dashboard.

## 9. Data Contract – YAML

A Data Contract is a machine-readable agreement between a data producer and a data consumer.

It defines:

- Dataset schema.
- Column names and data types.
- Required fields.
- Uniqueness constraints.
- Data quality rules.
- Freshness requirements.
- PII classification.

### Producer and Consumer

| Property | Details |
|---|---|
| Producer | Data Analyst (Abrar) |
| Consumer | BI Dashboard – Cynaris Learning |
| Dataset | Student Sample Dataset |
| Contract Format | YAML |
| Contract Version | 1.0 |

### Example Data Contract

File: `contracts/student-data-contract.yaml`

```yaml
dataContractSpecification: 0.9.3

id: student-data-v1

info:
  title: Student Data Contract
  version: 1.0
  owner: Data Analyst - Abrar
  consumer: Cynaris Learning BI Dashboard
  description: Student information data quality agreement

models:
  students:
    type: table
    fields:
      roll_no:
        type: string
        required: true
        unique: true
        classification: internal

      name:
        type: string
        required: true
        classification: personal

      email:
        type: string
        required: true
        format: email
        classification: personal

      contact:
        type: string
        classification: personal

      mobile:
        type: string
        classification: personal

      address:
        type: string
        classification: personal

      dob:
        type: string
        classification: personal

      age:
        type: integer
        minimum: 1
        maximum: 100
        classification: personal

      course:
        type: string
        required: true
        classification: internal

      doj:
        type: string
        format: date
        classification: internal

quality:
  freshness:
    maximum: 24 hours

  rules:
    - roll_no must be unique
    - name must not be null
    - email must follow valid email format
    - age must be between 1 and 100

security:
  pii_protection:
    enabled: true
    masking_required: true
```

**Note:** This is an illustrative YAML contract. Its custom quality and security fields require separate validation logic; they are not automatically enforced by Great Expectations.

## 10. PII Classification and Protection

Personally Identifiable Information (PII) refers to information that can identify an individual directly or indirectly.

### PII Classification

| Column | Classification | Protection Strategy |
|---|---|---|
| roll_no | Internal | Restricted access |
| name | Personal | Masking |
| email | Personal | Partial masking |
| contact | Personal | Masking |
| mobile | Personal | Partial masking |
| address | Personal | Restricted access |
| dob | Personal | Date generalisation |
| age | Personal | Limit access |
| course | Internal | Standard access |
| doj | Internal | Standard access |

### Masking Example

```python
def mask_email(email):
    if pd.isna(email):
        return email

    username, domain = email.split("@")

    return username[:2] + "****@" + domain


df["email"] = df["email"].apply(mask_email)
```

### Mobile Number Masking

```python
def mask_mobile(mobile):
    if pd.isna(mobile):
        return mobile

    mobile = str(mobile)

    return "*" * max(0, len(mobile) - 4) + mobile[-4:]
```

### Protection Strategies

- Masking: Hide part of sensitive information.
- Tokenisation: Replace original identifiers with generated tokens.
- Encryption: Protect information during storage and transmission.
- Access Control: Restrict sensitive data to authorised users.
- Data Minimisation: Collect only necessary information.

**Important:** Masked data is not automatically anonymous. Personal data must be processed according to applicable privacy requirements.

## 11. DPDP Act 2023 – Data Protection

India's Digital Personal Data Protection Act, 2023 establishes a framework for protecting digital personal data.

Important principles include:

- Lawful processing of personal data.
- Appropriate security safeguards.
- Accuracy and completeness where personal data is used for decisions or disclosed.
- Data principal rights.
- Compliance with applicable retention and deletion requirements.
- Responsibility of Data Fiduciaries.

The project applies basic data protection practices by identifying personal information, recommending masking, and defining access controls.

## 12. Project Folder Structure

```text
cynaris-internship-Abrar/
│
└── week2/
    │
    └── Day6/
        │
        ├── data/
        │   ├── student_sample_data.csv
        │   └── student_sample_data_with_errors.csv
        │
        ├── src/
        │   ├── data_quality_checks.py
        │   └── inject_errors.py
        │
        ├── contracts/
        │   └── student-data-contract.yaml
        │
        ├── reports/
        │   ├── great_expectations_report.html
        │   └── data_quality_scorecard.pdf
        │
        ├── tests/
        │   └── test_data_quality.py
        │
        └── README.md
```

## 13. Git & GitHub Workflow

### Create Feature Branch

```bash
git checkout main

git pull origin main

git checkout -b feature/week-2-day-6
```

### Commit Changes

```bash
git add .

git commit -m "feat: data-governance week-2-day-6 complete"
```

### Push Branch

```bash
git push -u origin feature/week-2-day-6
```

**Pull Request Title:**

Week 2 Day 6 – Data Governance, Quality, Contracts & Great Expectations

**PR Description:**

Completed the Data Governance practical using Python, Pandas, and Great Expectations. Evaluated the Student Dataset across six DAMA-DMBOK quality dimensions, implemented eight automated validation rules, injected intentional data quality errors, created a YAML Data Contract, and documented PII classification and protection strategies.

## 14. CIA Activities

- **Research:** Explored data governance principles, DAMA-DMBOK quality dimensions, and India's DPDP Act 2023.
- **Career:** Studied the importance of data quality and governance in Data Analyst roles.
- **Review:** Reviewed validation results and identified data quality improvements.
- **Documentation:** Prepared the YAML Data Contract and data quality scorecard.

## 15. Viva Questions

**Q1. What is Data Governance?**

Data Governance is the process of managing data through rules, policies, responsibilities, and standards.

**Q2. What are the six DAMA-DMBOK data quality dimensions?**

Completeness, Accuracy, Consistency, Timeliness, Uniqueness, and Validity.

**Q3. What is Great Expectations?**

Great Expectations is a Python framework used to automate data quality validation.

**Q4. What is a Data Contract?**

A Data Contract is an agreement between a data producer and consumer that defines schema, quality rules, and data requirements.

**Q5. What is PII?**

PII is information that can identify an individual, such as their name, email, mobile number, or address.

**Q6. What is Data Masking?**

Data Masking hides sensitive information to prevent unauthorised access.

**Q7. What is Tokenisation?**

Tokenisation replaces sensitive information with a unique generated token.

**Q8. What is Data Completeness?**

Completeness checks whether required values are present in a dataset.

**Q9. What is Data Uniqueness?**

Uniqueness ensures that records or identifiers are not unnecessarily duplicated.

**Q10. Why is Data Governance important for BI dashboards?**

It ensures dashboards use reliable, accurate, consistent, and secure data.

## 16. Learning Outcome

Through this practical, I gained hands-on experience in Data Governance and automated data quality validation.

I learned how to evaluate datasets using the six DAMA-DMBOK dimensions, create validation rules using Great Expectations, inject intentional errors, and identify data quality issues.

I also learned how to create YAML Data Contracts, classify PII columns, and recommend suitable data protection strategies.

This practical improved my understanding of data quality, data governance, privacy, and reliable BI reporting.

---

**Internship:** Cynaris Solutions Pvt. Ltd.  
**Program:** Data Analyst Intern  
**Week:** 2  
**Day:** 6  
**Topic:** Data Governance – Quality, Contracts & Great Expectations  
**Repository:** `cynaris-internship-Abrar`  
**Technologies:** Python, Pandas, NumPy, Great Expectations, YAML, ReportLab, Git & GitHub