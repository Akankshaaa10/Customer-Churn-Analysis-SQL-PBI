# Customer Churn Analysis (SQL & POWER BI)

## Project Overview
This project analyzes customer purchase behavior to identify churn risk and evaluate customer retention performance.  
Using SQL and Power BI, the analysis focuses on customer recency, purchase frequency, and revenue contribution to classify customers into different retention segments.

The goal of this project is to help businesses understand:
- Which customers are likely to churn
- How much revenue is coming from churned customers
- Which customers are the most valuable

The insights can support retention strategies such as targeted marketing campaigns and loyalty programs.

---

## Problem Statement
Customer retention is critical for sustainable business growth. Many businesses lose customers after their first purchase without realizing the revenue impact.

This project answers the following questions:

- How many customers have churned?
- What percentage of total customers are at risk?
- How much revenue comes from churned customers?
- Who are the highest value customers?

---

## Tools Used
SQL (PostgreSQL) – Data aggregation and customer segmentation  
Power BI – Dashboard development and visualization

---

## Dataset
The dataset contains simulated e-commerce transaction data.

Main fields used in the analysis:

- customer_id
- order_id
- order_date
- revenue

Customer level metrics were derived from order level data.

---

## Key Analysis Steps

### 1. Customer Purchase Summary
Order level data was aggregated to create customer level metrics including:
- total orders
- total revenue spent
- last purchase date

This step converts transaction data into customer behavior insights.

### 2. Recency Calculation
Customer recency was calculated using the difference between the analysis date and the customer's last purchase date.

This metric indicates how recently a customer interacted with the business.

### 3. Customer Segmentation
Customers were classified into three groups based on recency:

Active – purchased within the last 30 days  
At Risk – no purchase for 31–90 days  
Churned – no purchase for more than 90 days

This segmentation helps identify customers requiring retention efforts.

### 4. Revenue Analysis
Revenue contribution was analyzed by customer segment to understand which customer groups generate the most revenue.

### 5. Top Customer Identification
The highest value customers were identified based on total spending and order frequency.

---

## Dashboard Metrics

Total Customers – number of unique customers in the dataset  
Total Revenue – total revenue generated from all orders  
Churn Rate – percentage of customers classified as churned

---

## Dashboard Insights

Key insights identified from the analysis:

- 64.6% of customers are classified as churned.
- Churned customers contributed a significant portion of total revenue.
- Active customers represent a small portion of the customer base.
- A small group of high-value customers contributes a large share of revenue.

These findings highlight the importance of retention strategies and targeted engagement for at-risk customers.

---

## Business Recommendations

Based on the analysis:

- Implement targeted promotions for **At Risk** customers.
- Launch re-engagement campaigns for **Churned** customers.
- Provide loyalty incentives for **high value customers** to improve retention.

Improving customer retention could significantly increase long-term revenue.

----

## Project Outcome
This project demonstrates how customer behavior data can be transformed into actionable insights using SQL and Power BI. The dashboard provides a clear view of customer retention performance and helps identify opportunities for improving customer lifetime value.
