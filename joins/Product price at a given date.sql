# 1164. Product Price at a Given Date

## Description

Find the price of each product on August 16, 2019, using its latest price change before or on that date, with a default price of 10 for products without previous changes.

## Database Schema

**Table: Products**

| Column | Type |
|---|---|
| product_id | INT |
| new_price | INT |
| change_date | DATE |

**Primary Key:** (product_id, change_date)

## Solution

```sql
WITH cte1 AS (
    SELECT
        product_id,
        new_price AS price,
        ROW_NUMBER() OVER (
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
),
cte2 AS (
    SELECT DISTINCT
        product_id
    FROM Products
),
cte3 AS (
    SELECT
        product_id,
        price
    FROM cte1
    WHERE rn = 1
)
SELECT
    c2.product_id,
    COALESCE(c3.price, 10) AS price
FROM cte2 c2
LEFT JOIN cte3 c3
    ON c2.product_id = c3.product_id;
```