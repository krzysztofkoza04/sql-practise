-- =====================================================
-- Problem: Delete Duplicate Emails
-- Source: LeetCode
-- Topic: DELETE + Self Join
-- =====================================================

-- Opis:
-- Usuń duplikaty emaili z tabeli Person,
-- pozostawiając tylko rekord z najmniejszym id
-- dla każdego emaila.

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

DELETE FROM Person p1
USING Person p2
WHERE p1.email = p2.email
AND p1.id > p2.id;

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- Zapytanie używa self join, czyli łączy tabelę Person z samą sobą.
-- p1 reprezentuje potencjalny duplikat, a p2 rekord z mniejszym id.

-- Warunek p1.email = p2.email znajduje rekordy z tym samym emailem.

-- Warunek p1.id > p2.id oznacza, że rekord p1 jest duplikatem
-- (ma większe id), więc zostaje usunięty.

-- Dzięki temu dla każdego emaila zostaje tylko rekord
-- z najmniejszym id.