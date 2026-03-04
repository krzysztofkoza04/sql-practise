-- =====================================================
-- Problem: Find Users With Valid Emails
-- Source: LeetCode
-- Topic: String Filtering / Regular Expressions
-- =====================================================

-- Opis:
-- Znajdź użytkowników którzy mają poprawny email.
--
-- Warunki:
-- prefix:
-- - musi zaczynać się literą
-- - może zawierać litery, cyfry, '_', '.', '-'
--
-- domain:
-- - musi być dokładnie '@leetcode.com'

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255),
    mail VARCHAR(255)
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT 
    u.user_id,
    u.name,
    u.mail
FROM Users u
WHERE u.mail ~ '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$';

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- ^                     -> początek stringa
-- [A-Za-z]              -> email musi zaczynać się literą
-- [A-Za-z0-9_.-]*       -> dozwolone znaki w prefixie
-- @leetcode\.com        -> wymagany domain
-- $                     -> koniec stringa