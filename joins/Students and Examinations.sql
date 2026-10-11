# 1280. Students and Examinations



## Description

Find the number of exams attended by each student for every subject, including students who have not attended any exams.

## Database Schema

**Table: Students**

| Column | Type |
|---|---|
| student_id | INT (PK) |
| student_name | VARCHAR |

**Table: Subjects**

| Column | Type |
|---|---|
| subject_name | VARCHAR (PK) |

**Table: Examinations**

| Column | Type |
|---|---|
| student_id | INT |
| subject_name | VARCHAR |

## Solution

```sql
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON s.student_id = e.student_id
    AND e.subject_name = sub.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id,
    sub.subject_name;
```