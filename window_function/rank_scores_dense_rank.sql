-- =====================================================
-- Problem: Rank Scores
-- Source: LeetCode
-- Topic: Window Functions (DENSE_RANK)
-- =====================================================

-- Opis:
-- Oblicz ranking wyników w tabeli Scores.
--
-- Zasady rankingu:
-- 1. Wyniki są sortowane od najwyższego do najniższego.
-- 2. Jeśli dwa wyniki są takie same, otrzymują ten sam rank.
-- 3. Po remisie kolejne miejsce jest następną liczbą
--    (brak "dziur" w numeracji rankingu).

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Scores (
    id INT PRIMARY KEY,
    score DECIMAL(3,2)
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM Scores
ORDER BY score DESC;

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- DENSE_RANK() to funkcja okna (window function),
-- która przypisuje ranking do wierszy.

-- OVER (ORDER BY score DESC) oznacza, że ranking
-- obliczany jest na podstawie kolumny score,
-- od najwyższej wartości do najniższej.

-- Jeśli kilka wierszy ma ten sam score,
-- otrzymują ten sam rank.


-- ORDER BY score DESC na końcu zapytania
-- sortuje wynik końcowy tak, aby najwyższe
-- wyniki były wyświetlane na początku.