# 1934. Confirmation Rate



## Description

Calculate the confirmation rate for each user by dividing the number of confirmed messages by the total number of confirmation requests, returning 0 for users without any requests.

## Database Schema

**Table: Signups**

| Column | Type |
|---|---|
| user_id | INT (PK) |
| time_stamp | DATETIME |

**Table: Confirmations**

| Column | Type |
|---|---|
| user_id | INT |
| time_stamp | DATETIME |
| action | ENUM |

**Primary Key:** (user_id, time_stamp)

## Solution

```sql
WITH cte AS (
    SELECT
        s.user_id,
        COALESCE(SUM(CASE WHEN c.action = 'confirmed' THEN 1 END), 0) AS confirmed,
        COUNT(c.action) AS total
    FROM Signups s
    LEFT JOIN Confirmations c
        ON s.user_id = c.user_id
    GROUP BY s.user_id
)
SELECT
    user_id,
    ROUND(COALESCE(confirmed * 1.0 / NULLIF(total, 0), 0), 2) AS confirmation_rate
FROM cte;
```