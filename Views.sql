CREATE VIEW customer_status AS

WITH last_purchase AS
(
    SELECT
        customer_id,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    last_order_date,
    CASE
        WHEN last_order_date >= DATE '2024-12-01' THEN 'Active'
        WHEN last_order_date >= DATE '2024-10-02' THEN 'At Risk'
        ELSE 'Churned'
    END AS customer_status
FROM last_purchase;

