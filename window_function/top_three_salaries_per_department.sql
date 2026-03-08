-- =====================================================
-- Problem: Department Top Three Salaries
-- Source: LeetCode
-- Topic: Window Functions (DENSE_RANK)
-- =====================================================

-- Opis:
-- Znajdź pracowników, którzy mają jedną z trzech
-- najwyższych unikalnych pensji w swoim dziale.

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary INT,
    departmentId INT
);

CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT
    d.name AS Department,
    ranked.name AS Employee,
    ranked.salary AS Salary
FROM
(
    SELECT
        e.name,
        e.salary,
        e.departmentId,
        DENSE_RANK() OVER (
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC
        ) AS salary_rank
    FROM Employee e
) ranked
JOIN Department d
    ON ranked.departmentId = d.id
WHERE ranked.salary_rank <= 3;

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- DENSE_RANK tworzy ranking pensji w obrębie każdego department.
-- PARTITION BY departmentId powoduje, że ranking liczony jest osobno dla każdego działu.
-- ORDER BY salary DESC sortuje pensje od najwyższej.
-- salary_rank <= 3 wybiera trzy najwyższe unikalne poziomy pensji w każdym dziale.