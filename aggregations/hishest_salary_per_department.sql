-- =====================================================
-- Problem: Department Highest Salary
-- Source: LeetCode
-- Topic: Correlated Subquery + Aggregation
-- =====================================================

-- Opis:
-- Znajdź pracowników którzy mają najwyższą pensję
-- w swoim dziale.
--
-- Wynik powinien zawierać:
-- Department (nazwa działu)
-- Employee (imię pracownika)
-- Salary (pensja)

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
    e.name AS Employee,
    e.salary
FROM Employee e
JOIN Department d
    ON d.id = e.departmentId
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM Employee e2
    WHERE e2.departmentId = e.departmentId
);

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- Subquery oblicza maksymalną pensję w danym dziale.

-- Dla każdego pracownika sprawdzamy czy jego salary
-- jest równe maksymalnej pensji w jego dziale.

-- Jeśli kilku pracowników ma tę samą najwyższą pensję
-- w dziale, wszyscy zostaną zwróceni w wyniku.

-- JOIN z tabelą Department pozwala zwrócić nazwę działu
-- zamiast jego identyfikatora.