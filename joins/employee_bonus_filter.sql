-- =====================================================
-- Problem: Employee Bonus
-- Source: LeetCode
-- Topic: LEFT JOIN + NULL handling
-- =====================================================

-- Opis:
-- Zwróć name i bonus dla pracowników:
-- 1) którzy mają bonus < 1000
-- 2) albo nie mają w ogóle wpisu w tabeli Bonus

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Employee (
    empId INT PRIMARY KEY,
    name VARCHAR(255),
    supervisor INT,
    salary INT
);

CREATE TABLE Bonus (
    empId INT PRIMARY KEY,
    bonus INT
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT 
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empId = b.empId
WHERE 
    b.bonus < 1000
    OR b.bonus IS NULL;

-- =====================================================
-- Wyjaśnienie:
-- LEFT JOIN pozwala zachować wszystkich pracowników.
-- Jeśli pracownik nie ma bonusu → wartości z tabeli Bonus są NULL.
-- Warunek filtruje:
-- - bonus < 1000
-- - brak bonusu (NULL)
-- =====================================================