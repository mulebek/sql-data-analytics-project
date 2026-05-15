/*
=======================================================================
Date Range Exploration
=======================================================================
Purpose:
    - To determmine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
*/

--Find the date of the first order date and last order date and the total duration in months
SELECT 
MIN(order_date) first_order_date,
MAX(order_date) last_order_date,
DATEDIFF(year, MIN(order_date), MAX(order_date)) as order_range_year,
DATEDIFF(month, MIN(order_date), MAX(order_date)) as order_range_months
FROM gold.fact_sales

--Find the youngest and oldest customer based on the birthdate
SELECT
MIN(birthdate) as oldest_birthdate,
MAX(birthdate) as youngest_birthdate,
DATEDIFF(year, MIN(birthdate), GETDATE()) as oldest_age,
DATEDIFF(year, MAX(birthdate), GETDATE()) as youngest_age,
MAX(birthdate) as youngest_birthdate
FROM gold.dim_customers
