import pandas as pd
import numpy as np
import random

# Number of rows
n = 1000

cities_data = [
    ("Mumbai", "Maharashtra", "West"), ("Pune", "Maharashtra", "West"),
    ("Bengaluru", "Karnataka", "South"), ("Chennai", "Tamil Nadu", "South"),
    ("Delhi", "Delhi", "North"), ("Jaipur", "Rajasthan", "North"),
    ("Kolkata", "West Bengal", "East"), ("Bhopal", "Madhya Pradesh", "Central")
]

products_data = [
    ("Electronics", "Wireless Earbuds", "SKU-EL-101", 1500, 900, 18),
    ("Electronics", "Smart Watch", "SKU-EL-102", 3500, 2100, 18),
    ("Clothing", "Cotton T-Shirt", "SKU-CL-201", 800, 350, 5),
    ("Clothing", "Denim Jeans", "SKU-CL-202", 2000, 950, 12),
    ("Home & Kitchen", "Mixer Grinder", "SKU-HK-301", 4200, 2600, 18),
    ("Beauty", "Face Serum", "SKU-BT-401", 650, 250, 18)
]

coupons = [("NONE", 0), ("WELCOME10", 0.10), ("FESTIVE15", 0.15), ("SAVE20", 0.20)]
payment_modes = ["UPI", "Credit Card", "Debit Card", "Net Banking", "COD"]
order_statuses = ["Delivered", "Delivered", "Delivered", "Returned", "Cancelled"]
sales_channels = ["Website", "Mobile App", "Amazon", "Flipkart"]
employees = ["Rahul Sharma", "Priya Verma", "Amit Singh", "Sneha Nair", "Online Self"]
delivery_partners = ["Delhivery", "BlueDart", "Ecom Express", "Shadowfax", "XpressBees"]

rows = []
for _ in range(n):
    age = random.randint(18, 65)
    city, state, zone = random.choice(cities_data)
    cat, prod, sku, unit_price, unit_cost, gst_rate = random.choice(products_data)
    qty = random.randint(1, 5)
    gross_sales = unit_price * qty
    
    coupon, disc_pct = random.choice(coupons)
    disc_amt = round(gross_sales * disc_pct, 2)
    net_sales = round(gross_sales - disc_amt, 2)
    gst_amt = round(net_sales * (gst_rate / 100), 2)
    
    pay_mode = random.choice(payment_modes)
    status = random.choice(order_statuses)
    channel = random.choice(sales_channels)
    emp = "Online Self" if channel in ["Website", "Mobile App"] else random.choice(employees[:-1])
    partner = random.choice(delivery_partners)
    del_days = random.randint(1, 8)
    rating = round(random.uniform(2.5, 5.0), 1) if status == "Delivered" else None
    
    cogs = unit_cost * qty
    profit = round(net_sales - cogs, 2)
    profit_margin = round((profit / net_sales) * 100, 2) if net_sales > 0 else 0
    shipping = 0 if net_sales > 1000 else 50
    invoice_amt = round(net_sales + gst_amt + shipping, 2)
    
    rows.append([
        age, city, state, zone, cat, prod, sku, qty, unit_price,
        gross_sales, coupon, f"{int(disc_pct*100)}%", disc_amt, gst_rate,
        net_sales, gst_amt, pay_mode, status, channel, emp, partner,
        del_days, rating, cogs, profit, profit_margin, shipping, invoice_amt
    ])

columns = [
    "Customer Age", "City", "State", "Zone", "Category", "Product", "SKU",
    "Quantity", "Unit Price", "Gross Sales", "Coupon Code", "Discount %",
    "Discount Amount", "GST Rate", "Net Sales", "GST Amount", "Payment Mode",
    "Order Status", "Sales Channel", "Sales Employee", "Delivery Partner",
    "Delivery Days", "Customer Rating", "COGS", "Profit", "Profit Margin %",
    "Shipping Charges", "Invoice Amount"
]

df = pd.DataFrame(rows, columns=columns)
df.to_csv("indian_ecommerce_sales_dataset.csv", index=False)
print("Dataset successfully generated!")