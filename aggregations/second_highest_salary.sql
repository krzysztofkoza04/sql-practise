-- =====================================================
-- Problem: Second Highest Salary
-- Source: LeetCode
-- Topic: DISTINCT + ORDER BY + OFFSET
-- =====================================================

-- Opis:
-- Znajdź drugą najwyższą unikalną pensję z tabeli Employee.
-- Jeśli druga najwyższa pensja nie istnieje, zwróć NULL.

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    OFFSET 1
    LIMIT 1
) AS SecondHighestSalary;

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- DISTINCT usuwa duplikaty wynagrodzeń.
-- ORDER BY salary DESC sortuje wynagrodzenia malejąco.
-- OFFSET 1 pomija najwyższą pensję.
-- LIMIT 1 zwraca kolejną wartość, czyli drugą najwyższą pensję.
-- Jeśli druga najwyższa pensja nie istnieje, zapytanie zwróci NULL.