EXPLORATORY SQL ANALYSIS

1. Total number of customers?
SELECT COUNT(*) AS total_customers
FROM customers;

2. Total number of orders?
SELECT COUNT(*) AS total_orders
FROM orders;

3. Total revenue generated?
SELECT SUM(revenue) AS total_revenue
FROM orders;

4. Average order value?
SELECT 
SUM(revenue) / COUNT(order_id) AS
avg_order_value
FROM orders;

5. How many orders does each customer place?  
SELECT
customer_id,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

CUSTOMER PURCHASE SUMMARY

1. For each customer calculate:
   - total_orders
   - total_spent
   - last_purchase_date
SELECT
     customer_id,
	 COUNT(order_id) AS total_orders,
	 SUM(revenue) AS total_spent,
	 MAX(order_date) AS last_purchase_date
FROM orders
GROUP BY customer_id;


2. Show customers sorted by highest total_spent.
SELECT
     customer_id,
	 COUNT(order_id) AS total_orders,
	 SUM(revenue) AS total_spent,
	 MAX(order_date) AS last_purchase_date
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;


3. Find the customer who placed the most orders.
SELECT
     customer_id,
	 COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 1;

4. Find the customer who spent the most money.
SELECT
     customer_id,
	 SUM(revenue) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;

RECENCY ANALYSIS

SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(revenue) AS total_spent,
    MAX(order_date) AS last_purchase_date,
    DATE '2024-05-15' - MAX(order_date) AS days_since_last_purchase
FROM orders
GROUP BY customer_id;

CUSTOMER CHURN SEGMENTATION

SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(revenue) AS total_spent,
    MAX(order_date) AS last_purchase_date,
    DATE '2024-05-15' - MAX(order_date) AS days_since_last_purchase,
    CASE
        WHEN DATE '2024-05-15' - MAX(order_date) <= 30 THEN 'Active'
        WHEN DATE '2024-05-15' - MAX(order_date) <= 90 THEN 'At Risk'
        ELSE 'Churned'
    END AS customer_status
FROM orders
GROUP BY customer_id;


INSIGHTS FOR DASHBOARD

SELECT
    customer_status,
    COUNT(*) AS total_customers
FROM (
    SELECT
        customer_id,
        DATE '2024-05-15' - MAX(order_date) AS days_since_last_purchase,
        CASE
            WHEN DATE '2024-05-15' - MAX(order_date) <= 30 THEN 'Active'
            WHEN DATE '2024-05-15' - MAX(order_date) <= 90 THEN 'At Risk'
            ELSE 'Churned'
        END AS customer_status
    FROM orders
    GROUP BY customer_id
) AS customer_table
GROUP BY customer_status;


REVENUE CONTRIBUTION BY SEGMENT

SELECT
    customer_status,
    SUM(total_spent) AS total_revenue
FROM (
    SELECT
        customer_id,
        SUM(revenue) AS total_spent,
        DATE '2024-05-15' - MAX(order_date) AS days_since_last_purchase,
        CASE
            WHEN DATE '2024-05-15' - MAX(order_date) <= 30 THEN 'Active'
            WHEN DATE '2024-05-15' - MAX(order_date) <= 90 THEN 'At Risk'
            ELSE 'Churned'
        END AS customer_status
    FROM orders
    GROUP BY customer_id
) AS customer_table
GROUP BY customer_status
ORDER BY total_revenue DESC;

TOP CUSTOMERS

SELECT
    customer_id,
    SUM(revenue) AS total_spent,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;