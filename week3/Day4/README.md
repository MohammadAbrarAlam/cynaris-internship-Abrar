# 📊 Week 3 — Day 4: Looker Studio Dashboard

Part of the **Cynaris Solutions Pvt. Ltd. – Data Analyst Internship** learning program.

## 1. Project Overview

Build an interactive business dashboard using Google Looker Studio connected to Google Sheets to analyze sales, profit, product performance, and business trends.

## 2. Learning Objectives

- Import Excel datasets into Google Sheets.
- Clean and prepare data for analysis.
- Connect Google Sheets to Looker Studio.
- Create Scorecards, Bar, Line, Pie charts, and Tables.
- Add date range controls and interactive filters.
- Customize dashboard themes and layouts.
- Publish and share dashboards.

## 3. Tools & Technologies

- Microsoft Excel (.xlsx)
- Google Sheets
- Google Looker Studio
- Data Cleaning & ETL
- Data Visualization
- Git & GitHub

## 4. Dataset Overview

**Dataset:** Superstore Sales Dataset

| Column | Description |
|---|---|
| Order Date | Order date |
| Ship Date | Shipping date |
| Customer Name | Customer details |
| Segment | Customer segment |
| Region | Sales region |
| Category | Product category |
| Sub-Category | Product subcategory |
| Product Name | Product name |
| Sales | Revenue |
| Quantity | Units sold |
| Discount | Discount applied |
| Profit | Profit or loss |

## 5. Import Excel (.xlsx) into Google Sheets

1. Open [Google Sheets](https://sheets.google.com/).
2. Create a blank spreadsheet.
3. Go to **File → Import → Upload**.
4. Select your `.xlsx` file.
5. Choose the import location (new spreadsheet or insert sheet).
6. Click **Import Data**.
7. Verify columns, dates, numeric values, and formatting.

**Workflow:**

`Excel (.xlsx) → Google Sheets → Data Preparation`

## 6. Data Cleaning & Preparation

Prepare the dataset before connecting it to Looker Studio:

- Remove blank rows and unnecessary columns.
- Check duplicates and missing values.
- Correct column names.
- Verify date and numeric formats.
- Ensure Sales, Profit, Quantity, and Discount are valid.
- Maintain a clean tabular structure.

## 7. Import Google Sheets into Looker Studio

1. Open [Looker Studio](https://datastudio.google.com/u/0/reporting/645303b6-ff2d-41bf-b929-e76cdcbf7da0/page/IGAEG).
2. Click **Create → Report → Add Data**.
3. Select **Google Sheets** connector.
4. Choose your spreadsheet.
5. Select the worksheet containing your dataset.
6. Verify field names and data types.
7. Click **Add → Add to Report**.

### Field Configuration

| Field | Type |
|---|---|
| Order Date | Date Dimension |
| Category | Dimension |
| Region | Dimension |
| Segment | Dimension |
| Sales | Metric |
| Profit | Metric |
| Quantity | Metric |

**Workflow:**

`Google Sheets → Add Data → Select Worksheet → Connect → Add to Report`

## 8. ETL Process

ETL means **Extract, Transform, Load**.

- **Extract:** Import the Excel dataset into Google Sheets.
- **Transform:** Clean data, handle missing values, verify formats, and prepare fields.
- **Load:** Connect the prepared Google Sheets data to Looker Studio.

```text
Excel Dataset
     ↓
Google Sheets
     ↓
Data Cleaning & Transformation
     ↓
Looker Studio Connection
     ↓
Charts & KPI Cards
     ↓
Interactive Dashboard
     ↓
Business Insights
```

## 9. Calculated Fields & Business Metrics

### Total Sales

```text
SUM(Sales)
```

### Total Profit

```text
SUM(Profit)
```

### Total Orders

```text
COUNT_DISTINCT(Order ID)
```

### Total Quantity

```text
SUM(Quantity)
```

### Profit Margin %

```text
SUM(Profit) / SUM(Sales)
```

### Average Order Value (AOV)

```text
SUM(Sales) / COUNT_DISTINCT(Order ID)
```

## 10. Dashboard Development

**Dashboard Name:** Superstore Sales Analysis Dashboard

### KPI Scorecards

- Total Sales
- Total Profit
- Total Orders
- Total Quantity
- Profit Margin %

### Visualizations

| Chart | Dimension | Metric | Purpose |
|---|---|---|---|
| Scorecard | — | Sales | Total Revenue |
| Bar Chart | Category | Sales | Category comparison |
| Line Chart | Order Date | Sales | Sales trend |
| Pie Chart | Segment | Sales | Segment contribution |
| Table | Product Name | Sales, Profit, Quantity | Product performance |

## 11. Interactive Filters

Add controls for:

- Date Range
- Region
- Category
- Segment

**Steps:** Add a control → Select Dropdown List or Date Range → Choose the field → Position on dashboard → Test filters.

## 12. Dashboard Theme & Design

- Apply Cynaris brand colors.
- Use a consistent theme and typography.
- Highlight KPIs.
- Use clear chart titles.
- Maintain proper spacing and alignment.
- Avoid unnecessary charts and clutter.
- Keep the dashboard readable and professional.

## 13. Dashboard Sharing

1. Open the completed dashboard.
2. Click **Share**.
3. Configure access permissions.
4. Enable public access if permitted.
5. Copy and test the dashboard link.

**Dashboard Link:** [View Dashboard](ADD_PUBLIC_DASHBOARD_LINK)

## 14. Business Insights

Analyze the dashboard to identify:

- Highest-revenue category.
- Most profitable region.
- Best-performing customer segment.
- Monthly sales trends.
- Top-selling products.
- Loss-making products.
- Impact of discounts on profit.
- Overall profit margin.

Document actual insights based on dashboard results.

## 15. Viva Questions

**Q1. What is Looker Studio?**  
A data visualization and BI tool used to create interactive reports and dashboards.

**Q2. What data sources can Looker Studio connect to?**  
Google Sheets, Google Analytics, BigQuery, Google Ads, databases, CSVs, and third-party connectors.

**Q3. How is Looker Studio different from Power BI?**  
Looker Studio is web-based and integrates well with Google services, while Power BI offers advanced data modeling, DAX, and enterprise analytics.

**Q4. What is a Scorecard?**  
A visualization used to display a single KPI, such as Sales or Profit.

**Q5. What is a Dimension?**  
A descriptive field used to categorize data, such as Region or Category.

**Q6. What is a Metric?**  
A numerical value used for measurement, such as Sales or Profit.

**Q7. What is data blending?**  
Combining data from multiple sources using common fields for analysis.

**Q8. What is a Filter?**  
A control used to limit data displayed in reports based on selected conditions.

**Q9. What is ETL?**  
Extract, Transform, and Load — a process of collecting, cleaning, and loading data for analysis.

**Q10. Why are dashboards important?**  
They help businesses monitor KPIs, identify trends, and make data-driven decisions.

## 16. Git & GitHub Workflow

### Create Feature Branch

```bash
git checkout main
git pull origin main
git checkout -b feature/week-3-day-4
```

### Commit & Push

```bash
git add .
git commit -m "feat: looker-studio week-3-day-4 complete"
git push -u origin feature/week-3-day-4
```

**Pull Request Title:**

`Week 3 Day 4 – Interactive Looker Studio Dashboard`

## 17. Project Structure

```text
cynaris-internship-Abrar/
└── week3/
    └── Day4/
        ├── README.md
        │── Super_Store_Dashboard2.pdf
        ├── Superstore_dataset.csv
        ├── Superstore_dataset2-Sheet.html
        └── interactive_filters.png
```

## 18. Learning Outcomes

Learned how to import Excel files into Google Sheets, clean and prepare datasets, connect Google Sheets to Looker Studio, create KPIs and multiple chart types, implement interactive filters, design dashboards, and share reports.

This practical strengthened my skills in **Data Visualization, Business Intelligence, ETL, Dashboard Development, and Data-Driven Decision Making**.

## 19. References

- [Cynaris Learning Portal](https://cynarissolutions.com/candidate/learn)
- [Google Sheets](https://sheets.google.com/)
- [Google Looker Studio](https://lookerstudio.google.com/)
- [Looker Studio Tutorial – YouTube](https://www.youtube.com/watch?v=1CXgd4pm1dA)
- [Microsoft Power BI Learn](https://learn.microsoft.com/en-us/power-bi/)
- [Tableau Public Gallery](https://public.tableau.com/en-us/gallery)

---

**Internship:** Cynaris Solutions Pvt. Ltd.  
**Program:** Data Analyst Intern  
**Week:** 3  
**Day:** 4  
**Topic:** Looker Studio  
**Dataset:** Superstore Sales Dataset  
**Repository:** `cynaris-internship-Abrar`  
**Technologies:** Excel, Google Sheets, Looker Studio, ETL, Data Visualization, Git & GitHub  

**Project Status:** Practical implementation and GitHub submission in progress.

#DataAnalytics #LookerStudio #GoogleSheets #DataVisualization #Dashboard #BusinessIntelligence #ETL #Cynaris #GitHub
