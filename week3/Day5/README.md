# Week 3 – Day 5: KPI Design | Indian E-commerce Sales Dashboard

## 1. Project Overview

**Project Name:** Indian E-commerce KPI Dashboard  
**Dataset:** `indian_ecommerce_sales_dataset.csv`  
**Tools:** Power BI, DAX, CSV, Git & GitHub

### Objective

Design a meaningful KPI framework for an Indian e-commerce business and build a single-page Power BI dashboard to monitor sales performance, orders, customers, discounts, GST, shipping, and profitability.

## 2. What is a KPI?

A **Key Performance Indicator (KPI)** is a measurable value used to evaluate how effectively a business achieves its objectives.

**Why do businesses use KPIs?**
- Monitor business performance.
- Identify problems and opportunities.
- Track sales and profitability.
- Support data-driven decisions.
- Measure progress toward business goals.

## 3. Dataset Overview

The dataset contains the following columns:

| Category | Columns |
|---|---|
| Order Details | Order ID, Order Date, Order Status |
| Customer | Customer ID, Customer Name, Customer Age |
| Location | City, State, Zone |
| Product | Category, Product, SKU, Quantity |
| Sales | Unit Price, Gross Sales, Net Sales |
| Discount | Coupon Code, Discount%, Discount Amount |
| Tax | GST Rate, GST Amount |
| Payment | Payment Mode, Invoice Amount |
| Operations | Sales Channel, Sales Employees, Delivery Partner, Delivery Days |
| Performance | Customer Rating, COSG, Profit, Profit Margin%, Shipping Charges |

## 4. KPI Framework – 10 Important KPIs

| KPI | Formula / Definition | Owner | Frequency | Target |
|---|---|---|---|---|
| Total Revenue | Sum of Net Sales | Sales Manager | Daily | Increase 10% |
| Total Orders | Distinct Count of Order ID | Operations Manager | Daily | Increase 10% |
| Delivered Orders | Count of Delivered Orders | Operations Manager | Daily | Above 95% |
| Cancelled Orders | Count of Cancelled Orders | Operations Manager | Daily | Below 5% |
| Returned Orders | Count of Returned Orders | Sales Manager | Monthly | Below 3% |
| Total Profit | Sum of Profit | Finance Manager | Monthly | Increase 10% |
| Profit Margin % | Total Profit / Total Revenue × 100 | Finance Manager | Monthly | Above 20% |
| Average Order Value | Revenue / Delivered Orders | Sales Manager | Monthly | Increase 10% |
| Discount % | Total Discount / Gross Sales × 100 | Marketing Manager | Monthly | Below 15% |
| Customer Count | Distinct Count of Customer ID | CRM Manager | Monthly | Increase 10% |

*Note: Targets are illustrative business targets, not actual dataset results. They should be adjusted using historical performance and business objectives.*

## 5. Leading vs. Lagging Indicators

### Leading Indicators

Leading indicators help predict future business performance.

Examples:
- Average Discount Percentage
- Average Delivery Days
- Customer Rating
- Order Volume
- Customer Acquisition

### Lagging Indicators

Lagging indicators measure past business performance.

Examples:
- Total Revenue
- Total Profit
- Delivered Orders
- Cancelled Orders
- Returned Orders
- Profit Margin %

## 6. Power BI – DAX Measures

**Step 1:** Import `indian_ecommerce_sales_dataset.csv` into Power BI.

**Step 2:** Rename the table to:

`Sales Data`

**Step 3:** Go to Modeling → New Measure and create the following measures.

### A. Order KPIs

**1. Total Orders**
```dax
Total Orders =
DISTINCTCOUNT('Sales Data'[order id])
```

**2. Delivered Orders**
```dax
Delivered Orders =
CALCULATE(
    [Total Orders],
    'Sales Data'[order status] = "Delivered"
)
```

**3. Cancelled Orders**
```dax
Cancelled Orders =
CALCULATE(
    [Total Orders],
    'Sales Data'[order status] = "Cancelled"
)
```

**4. Returned Orders**
```dax
Returned Orders =
CALCULATE(
    [Total Orders],
    'Sales Data'[order status] = "Returned"
)
```

### B. Sales KPIs

**5. Gross Sales**
```dax
Gross Sales =
SUM('Sales Data'[gross sales])
```

**6. Total Sales / Revenue**

Revenue is calculated using Net Sales for delivered orders.

```dax
Revenue =
CALCULATE(
    SUM('Sales Data'[net sales]),
    'Sales Data'[order status] = "Delivered"
)
```

**7. Total Profit**
```dax
Total Profit =
CALCULATE(
    SUM('Sales Data'[Profit]),
    'Sales Data'[order status] = "Delivered"
)
```

**8. Total COGS**

If the actual column name is `COSG`, use that exact name:

```dax
Total COGS =
CALCULATE(
    SUM('Sales Data'[COSG]),
    'Sales Data'[order status] = "Delivered"
)
```

### C. Discount KPIs

**9. Total Discount**
```dax
Total Discount =
SUM('Sales Data'[discount amount])
```

**10. Discount Percentage**
```dax
Discount % =
DIVIDE(
    [Total Discount],
    [Gross Sales],
    0
)
```

Format this measure as Percentage.

### D. GST and Shipping KPIs

**11. Total GST**
```dax
Total GST =
SUM('Sales Data'[gst amount])
```

**12. Total Shipping Charges**
```dax
Total Shipping =
SUM('Sales Data'[shipping charges])
```

### E. Customer KPIs

**13. Total Customers**
```dax
Total Customers =
DISTINCTCOUNT('Sales Data'[customer id])
```

**14. Average Customer Rating**
```dax
Average Customer Rating =
AVERAGE('Sales Data'[Customer rating])
```

### F. Profitability KPIs

**15. Profit Margin Percentage**
```dax
Profit Margin % =
DIVIDE(
    [Total Profit],
    [Revenue],
    0
)
```

Format as Percentage.

### G. Average Order Value

**16. Average Order Value (AOV)**
```dax
Average Order Value =
DIVIDE(
    [Revenue],
    [Delivered Orders],
    0
)
```

### H. Additional Measures

**17. Average Delivery Days**
```dax
Average Delivery Days =
CALCULATE(
    AVERAGE('Sales Data'[Delivery Days]),
    'Sales Data'[order status] = "Delivered"
)
```

**18. Total Quantity Sold**
```dax
Total Quantity =
CALCULATE(
    SUM('Sales Data'[quantity]),
    'Sales Data'[order status] = "Delivered"
)
```

**19. Cancellation Rate**
```dax
Cancellation Rate =
DIVIDE(
    [Cancelled Orders],
    [Total Orders],
    0
)
```

**20. Return Rate**
```dax
Return Rate =
DIVIDE(
    [Returned Orders],
    [Total Orders],
    0
)
```

**Important:** All status values must match the actual values in your dataset. Check spelling and capitalization before creating measures. For financial KPIs, apply consistent order-status filters to avoid counting cancelled or returned transactions as completed sales.

## 7. Power BI Dashboard Design

### Recommended Dashboard Layout

**Dashboard Title:** Indian E-commerce Sales Performance Dashboard

### Row 1 – KPI Cards

Display these KPI cards:

1. Total Revenue
2. Total Orders
3. Delivered Orders
4. Cancelled Orders
5. Total Profit
6. Profit Margin %

### Row 2 – Sales Analysis

- Line Chart: Revenue by Month
- Bar Chart: Revenue by State
- Donut Chart: Orders by Order Status

### Row 3 – Business Performance

- Bar Chart: Sales by Category
- Column Chart: Profit by Product
- Donut Chart: Sales by Payment Mode
- Bar Chart: Orders by Sales Channel

### Row 4 – Operational Analysis

- Card: Returned Orders
- Card: Average Order Value
- Card: Average Delivery Days
- Card: Discount %

### Slicers

Add interactive slicers for:

- Order Date
- State
- Zone
- Category
- Order Status
- Payment Mode
- Sales Channel

## 8. KPI Narrative – Business Insights

### Objective

Explain business performance using KPI trends and identify areas that require management attention.

### Key Business Questions

1. Which state generates the highest revenue?
2. Which product category generates the highest profit?
3. What percentage of orders are cancelled?
4. How much revenue is lost due to returns?
5. Which payment mode is most commonly used?
6. How do discounts affect profitability?
7. Which sales channel generates the highest revenue?
8. What is the average delivery time?
9. Which products have low profit margins?
10. How can the business improve customer satisfaction?

### Management Recommendations

- Reduce cancellations by identifying common cancellation reasons.
- Improve delivery performance by monitoring delivery partners.
- Optimize discount strategies to protect profit margins.
- Focus on high-performing products and categories.
- Improve customer experience to reduce product returns.

*Actual trends and anomalies should be documented after analyzing the Power BI dashboard.*

## 9. SMART Criteria for KPI Design

SMART stands for:

- **S – Specific:** Clearly define what you want to measure.
- **M – Measurable:** Use numerical values to track performance.
- **A – Achievable:** Set realistic business targets.
- **R – Relevant:** Connect KPIs with business objectives.
- **T – Time-bound:** Set a specific time period for achieving targets.

**Example:**

Increase monthly revenue by 10% within the next three months.

## 10. KPI vs Metric vs Measure

| Term | Meaning | Example |
|---|---|---|
| KPI | Measures progress toward a business goal | Profit Margin % |
| Metric | A measurable business value | Total Orders |
| Measure | A calculated value, often created using DAX in Power BI | Total Revenue |

## 11. Learning Resources

- [Power BI Documentation](https://learn.microsoft.com/en-us/power-bi/)
- [Google Looker Studio](https://lookerstudio.google.com/)
- [Tableau Public Gallery](https://public.tableau.com/en-us/gallery)
- [Power BI KPI Cards – Video Tutorial](https://www.youtube.com/watch?v=rbWZllXMGYU)

## 12. Git & GitHub Workflow

# Create the feature branch:
git checkout main
git pull origin main
git checkout -b feature/week-3-day-5
```
```

Add your deliverables:

```bash
git add .
```

Commit:

```bash
git commit -m "feat: kpi-design week-3-day-5 complete"
```

Push:

```bash
git push origin feature/week-3-day-5
```

Create a Pull Request on GitHub.

### Expected Deliverables

```text
week3/
└── Day5/
    ├── README.md
    ├── indian_ecommerce_sales_dataset.csv
    └── dashboard/
        └── indian_ecommerce_kpi_dashboard.png
```

## 13. Viva Questions & Answers

**Q1. What is the difference between leading and lagging KPIs?**

Leading KPIs predict future performance, while lagging KPIs measure past performance.

**Q2. How do you set KPI targets?**

I analyze historical data, business objectives, available resources, and industry benchmarks to set realistic targets.

**Q3. What is SMART criteria?**

SMART means Specific, Measurable, Achievable, Relevant, and Time-bound.

**Q4. Why are KPI dashboards important?**

They help managers monitor performance, identify problems, and make data-driven decisions.

**Q5. What is Average Order Value?**

AOV measures the average revenue generated per completed order.

Formula: Revenue / Delivered Orders.

**Q6. What is Profit Margin?**

It measures how much profit a business earns from its revenue.

Formula: (Total Profit / Total Revenue) × 100.

---

## 14. Final Learning Outcome

Through this task, I learned how to:

- Understand business KPIs and their importance.
- Design a KPI framework for an e-commerce business.
- Differentiate leading and lagging indicators.
- Create DAX measures in Power BI.
- Design a single-page interactive KPI dashboard.
- Analyze sales, orders, customers, discounts, GST, and profitability.
- Communicate business insights through KPI narratives.

**Project Status:** In Progress / Completed

**Week:** 3  
**Day:** 5  
**Topic:** KPI Design  
**Organization:** Cynaris Solutions
