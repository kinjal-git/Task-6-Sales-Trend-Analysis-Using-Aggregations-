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