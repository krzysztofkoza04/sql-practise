-- =====================================================
-- Problem: Managers and Direct Reports
-- Source: LeetCode
-- Topic: SELF JOIN + GROUP BY + Aggregation
-- =====================================================

-- Opis:
-- Znajdź wszystkich managerów (pracowników którzy mają
-- przynajmniej jednego reporta).
-- Zwróć:
-- employee_id
-- name
-- liczba raportujących pracowników
-- średni wiek raportujących (zaokrąglony)

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    reports_to INT,
    age INT
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT 
    e.employee_id,
    e.name,
    COUNT(r.employee_id) AS reports_count,
    ROUND(AVG(r.age)) AS average_age
FROM Employees e
JOIN Employees r
    ON r.reports_to = e.employee_id
GROUP BY e.employee_id, e.name
ORDER BY e.employee_id;

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- Self join łączy tabelę Employees z samą sobą.
-- e = manager
-- r = pracownicy raportujący do managera.
-- COUNT liczy ilu pracowników raportuje do managera.
-- AVG oblicza średni wiek tych pracowników.