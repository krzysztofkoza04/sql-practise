# 585. Investments in 2016

## Description

Calculate the sum of investment values in 2016 for policyholders who share the same investment value in 2015 with at least one other policyholder but have a unique geographical location.

## Database Schema

**Table: Insurance**

| Column | Type |
|---|---|
| pid | INT (PK) |
| tiv_2015 | FLOAT |
| tiv_2016 | FLOAT |
| lat | FLOAT |
| lon | FLOAT |

## Solution

```sql
WITH cte AS (
    SELECT
        pid,
        tiv_2016
    FROM Insurance i1
    WHERE EXISTS (
        SELECT 1
        FROM Insurance i2
        WHERE i2.tiv_2015 = i1.tiv_2015
          AND i2.pid <> i1.pid
    )
    AND NOT EXISTS (
        SELECT 1
        FROM Insurance i2
        WHERE i2.lat = i1.lat
          AND i2.lon = i1.lon
          AND i2.pid <> i1.pid
    )
)
SELECT
    ROUND(SUM(tiv_2016)::NUMERIC, 2) AS tiv_2016
FROM cte;
```