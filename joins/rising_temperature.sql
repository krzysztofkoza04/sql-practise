-- =====================================================
-- Problem: Rising Temperature
-- Source: LeetCode
-- Topic: Self Join + Date Comparison
-- =====================================================

-- Opis:
-- Znajdź dni, w których temperatura była wyższa
-- niż w dniu poprzednim (wczoraj).

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Weather (
    id INT PRIMARY KEY,
    recordDate DATE,
    temperature INT
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT t.id
FROM Weather t
JOIN Weather y
    ON t.recordDate = y.recordDate + INTERVAL '1 day'
WHERE t.temperature > y.temperature;

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- Zapytanie wykorzystuje tzw. self join, czyli połączenie
-- tabeli Weather z samą sobą.

-- Alias t reprezentuje bieżący dzień,
-- natomiast alias y reprezentuje dzień poprzedni.

-- Warunek w JOIN:
-- t.recordDate = y.recordDate + INTERVAL '1 day'
-- oznacza, że rekord t jest dokładnie o jeden dzień
-- późniejszy niż rekord y.

-- Dzięki temu porównujemy temperaturę dnia bieżącego
-- z temperaturą dnia poprzedniego.

-- Warunek WHERE:
-- t.temperature > y.temperature

-- wybiera tylko te dni, w których temperatura była
-- wyższa niż dzień wcześniej.