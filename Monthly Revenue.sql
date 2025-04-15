-- 1. Monthly Revenue and order volume
SELECT
extract(MONTH from orders.order_date) AS month,
extract(YEAR from orders.order_date) AS year,
count(DISTINCT orders.order_id) AS total_orders,
round(sum(orders.total_price * order_items.quantity),2) AS total_revenue
FROM orders 
JOIN order_items 
  ON orders.order_id = order_items.order_id
GROUP BY 
extract(YEAR FROM order_date),
extract(MONTH FROM order_date)
ORDER BY
year, month;

