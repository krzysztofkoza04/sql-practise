# 181. Employees Earning More Than Their Managers

## Description

Find employees who earn more than their direct managers using a self join on the Employee table.

## Database Schema

**Table: Employee**

| Column | Type |
|---|---|
| id | INT (PK) |
| name | VARCHAR |
| salary | INT |
| managerId | INT |

## Solution

```sql
SELECT
    e1.name AS Employee
FROM Employee e1
JOIN Employee e2
    ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;
```