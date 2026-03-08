-- =====================================================
-- Problem: Nth Highest Salary
-- Source: LeetCode
-- Topic: Function + DISTINCT + OFFSET
-- =====================================================

-- Opis:
-- Napisz funkcję, która zwraca N-tą najwyższą unikalną
-- pensję z tabeli Employee. Jeśli N jest mniejsze lub
-- równe 0 albo taka pensja nie istnieje, funkcja zwraca NULL.

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

CREATE OR REPLACE FUNCTION NthHighestSalary(N INT)
RETURNS TABLE (Salary INT) AS $$
BEGIN

    IF N <= 0 THEN
        RETURN QUERY SELECT NULL::INT;
        RETURN;
    END IF;

    RETURN QUERY (
        SELECT DISTINCT e.salary
        FROM Employee e
        ORDER BY e.salary DESC
        OFFSET N-1
        LIMIT 1
    );

END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- IF N <= 0 zabezpiecza funkcję przed błędnym OFFSET
-- (OFFSET nie może być ujemny).

-- DISTINCT usuwa duplikaty pensji.

-- ORDER BY salary DESC sortuje pensje od najwyższej.

-- OFFSET N-1 pomija pierwsze N-1 pensji.

-- LIMIT 1 zwraca N-tą najwyższą pensję.