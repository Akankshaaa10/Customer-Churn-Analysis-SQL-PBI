-- ==========================================
-- CUSTOMER CHURN ANALYSIS (SQL + POWER BI)
-- ==========================================

-- Q1. What is the overall churn rate?

WITH churn_summary AS
(
    SELECT
        customer_status,
        COUNT(*) AS customers
    FROM customer_status
    GROUP BY customer_status
)

SELECT
ROUND(
100.0 *
SUM(CASE WHEN customer_status='Churned' THEN customers ELSE 0 END)
/
SUM(customers)
,2) AS churn_rate
FROM churn_summary;

-- Q2. How many customers are Active, At Risk, and Churned?

SELECT
customer_status,
COUNT(*) AS total_customers
FROM customer_status
GROUP BY customer_status
ORDER BY total_customers DESC;

-- Q3. How much revenue comes from each customer status?

SELECT
cs.customer_status,
ROUND(SUM(o.revenue),2) AS total_revenue
FROM orders o
JOIN customer_status cs
ON o.customer_id = cs.customer_id
GROUP BY cs.customer_status
ORDER BY total_revenue DESC;

-- Q4. Which customer segment has the highest churn?

SELECT
c.segment,
cs.customer_status,
COUNT(*) AS customers
FROM customers c
JOIN customer_status cs
ON c.customer_id = cs.customer_id
GROUP BY c.segment, cs.customer_status
ORDER BY c.segment;

-- Q5. How much revenue is at risk?

SELECT
ROUND(SUM(o.revenue),2) AS revenue_at_risk
FROM orders o
JOIN customer_status cs
ON o.customer_id = cs.customer_id
WHERE cs.customer_status = 'At Risk';

-- Q6. Which product category generates the most revenue?

SELECT
category,
ROUND(SUM(revenue),2) AS total_revenue
FROM orders
GROUP BY category
ORDER BY total_revenue DESC;

-- Q7. Who are the Top 10 customers by spending?

SELECT
c.customer_name,
ROUND(SUM(o.revenue),2) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- Q8. What is the average revenue per customer?

SELECT
ROUND(
SUM(revenue) /
COUNT(DISTINCT customer_id)
,2) AS avg_revenue_per_customer
FROM orders;

-- Q9. Monthly Revenue Trend

SELECT
DATE_TRUNC('month', order_date)::date AS month,
ROUND(SUM(revenue),2) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Q10. Which cities generate the highest revenue?

SELECT
c.city,
ROUND(SUM(o.revenue),2) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY revenue DESC;