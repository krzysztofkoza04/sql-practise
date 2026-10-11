# 570. Managers with at Least 5 Direct Reports



## Description

Find managers who have at least five direct reports using a self join, aggregation, and a Common Table Expression (CTE).

## Database Schema

**Table: Employee**

| Column | Type |
|---|---|
| id | INT (PK) |
| name | VARCHAR |
| department | VARCHAR |
| managerId | INT |

## Solution

```sql
WITH cte1 AS (
    SELECT
        e1.id,
        e1.name,
        COUNT(e2.id) AS total
    FROM Employee e1
    JOIN Employee e2
        ON e1.id = e2.managerId
    GROUP BY e1.id, e1.name
)
SELECT
    name
FROM cte1
WHERE total >= 5;
```