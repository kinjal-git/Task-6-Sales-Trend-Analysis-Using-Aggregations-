# Task-6-Sales-Trend-Analysis-Using-Aggregations-
The goal is to analyze **monthly revenue** and **order volume** from the Online Shop 2024 dataset using SQL.

---

## 🧰 Tools Used
1. MySQL Workbench
2. SQL for data analysis

---

## 📊 Objectives
1. Group sales data by **month** and **year**
2. Calculate **monthly revenue** and **order volume**
3. Identify the **top 5 months** by total revenue

---

## 📝 SQL Queries Used

```sql
-- 1. Monthly revenue and order volume
SELECT 
    EXTRACT(MONTH FROM orders.order_date) AS month,
    EXTRACT(YEAR FROM orders.order_date) AS year,
    COUNT(DISTINCT orders.order_id) AS total_orders,
    ROUND(SUM(orders.total_price * order_items.quantity),
             2) AS total_revenue
FROM
    orders
        JOIN
    order_items ON orders.order_id = order_items.order_id
GROUP BY EXTRACT(YEAR FROM order_date) , EXTRACT(MONTH FROM order_date)
ORDER BY year, month;

-- 2. Top 5 months by revenue

SELECT 
    EXTRACT(MONTH FROM orders.order_date) AS month,
    EXTRACT(YEAR FROM orders.order_date) AS year,
    ROUND(SUM(orders.total_price * order_items.quantity),
            2) AS total_revenue
FROM
    orders
        JOIN
    order_items ON orders.order_id = order_items.order_id
GROUP BY EXTRACT(YEAR FROM order_date) , EXTRACT(MONTH FROM order_date)
ORDER BY total_revenue DESC
LIMIT 5;
```

---

## 📂 Files Included
1. `Monthly_Revenue.sql`: SQL script with queries
2. `Top 5_months.sql`: SQL script with queries
3. `Monthly_Revenue_Results.csv`: Results of monthly revenue and order volume
4. `Top 5_Results.csv`: Results of Top 5 months by revenue
5. `Results.png`:  Result of top 5 revenue months, monthly volume, and order volume
6. `README.md`: This file

