-- =====================================================
-- Problem: Game Play Analysis I
-- Source: LeetCode
-- Topic: GROUP BY + Aggregation
-- =====================================================

-- Opis:
-- Znajdź pierwszą datę logowania dla każdego gracza.

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT 
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- GROUP BY dzieli dane według player_id.
-- MIN(event_date) zwraca najwcześniejszą datę logowania dla każdego gracza.