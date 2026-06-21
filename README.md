# Customer Churn Analysis (SQL & Power BI)

## Project Overview

This project analyzes customer purchase behavior to identify churn risk, evaluate customer retention performance, and measure revenue impact across different customer segments.

Using SQL and Power BI, the analysis focuses on customer recency, purchase frequency, and revenue contribution to classify customers into different retention categories.

The goal of this project is to help businesses understand:

- Which customers are likely to churn
- How much revenue is currently at risk
- Which customer segments require retention efforts
- Which customers generate the highest value

The insights can support retention strategies such as targeted marketing campaigns, loyalty programs, and customer re-engagement initiatives.

---

## Problem Statement

Customer retention is critical for sustainable business growth. Acquiring new customers is often more expensive than retaining existing ones, making customer loyalty a key business objective.

This project answers the following questions:

- How many customers have churned?
- What percentage of customers are at risk?
- How much revenue is currently at risk?
- Which customer segments have the highest churn rates?
- Which product categories generate the most revenue?
- Who are the highest value customers?

---

## Tools Used

SQL (PostgreSQL) – Data aggregation, customer segmentation, and analysis

Power BI – Dashboard development and data visualization

---

## Dataset

The dataset contains simulated e-commerce transaction data.

Main fields used in the analysis:

- customer_id
- order_id
- order_date
- category
- revenue

Customer-level metrics were derived from order-level data.

---

## Key Analysis Steps

### 1. Customer Purchase Summary

Order-level data was aggregated to create customer-level metrics including:

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

Revenue contribution was analyzed across customer segments to understand which groups generate the most revenue and where revenue is at risk.

### 5. Top Customer Identification

The highest-value customers were identified based on total spending and purchase activity.

---

## Dashboard Metrics

Total Customers – total number of unique customers

Active Customers – customers classified as active based on recent purchases

Churn Rate – percentage of customers classified as churned

Revenue At Risk – revenue associated with at-risk customers

Total Revenue – total revenue generated from all orders

Average Revenue Per Customer – average revenue generated per customer

---

## Dashboard Features

- Customer Distribution Analysis
- Revenue by Customer Status
- Churn by Customer Segment
- Revenue by Product Category
- Monthly Revenue Trend
- Interactive Segment and Customer Status Filters

---

## Dashboard Insights

Key insights identified from the analysis:

- Active customers account for 58.2% of the customer base.
- 22.4% of customers are classified as At Risk and may require targeted retention efforts.
- The overall churn rate is 19.4%.
- Active customers contribute the largest share of total revenue ($4.6M).
- At Risk customers account for approximately $1.4M in revenue, representing a significant retention opportunity.
- Premium customers show lower churn rates compared to other customer segments.
- Electronics generated the highest revenue among all product categories.

These findings highlight the importance of customer retention strategies and proactive engagement with at-risk customers.

---

## Business Recommendations

Based on the analysis:

- Implement targeted promotions for At Risk customers.
- Launch re-engagement campaigns for Churned customers.
- Provide loyalty incentives for high-value customers.
- Monitor customer purchase recency to identify churn risk early.
- Focus retention efforts on customer segments with higher churn rates.

Improving customer retention can significantly increase long-term revenue and customer lifetime value.

---

## Project Outcome

This project demonstrates how customer transaction data can be transformed into actionable business insights using SQL and Power BI.

The dashboard provides a clear view of customer retention performance, revenue contribution, churn risk, and customer behavior patterns, helping businesses make data-driven retention decisions.
