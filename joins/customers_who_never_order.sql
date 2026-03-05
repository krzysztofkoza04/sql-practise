-- =====================================================
-- Problem: Customers Who Never Order
-- Source: LeetCode
-- Topic: LEFT JOIN + NULL filtering
-- =====================================================

-- Opis:
-- Znajdź klientów którzy nigdy nic nie zamówili.
-- Jeśli klient nie ma dopasowania w tabeli Orders,
-- oznacza to że nigdy nie złożył zamówienia.

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customerId INT
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT 
    c.name
FROM Customers c
LEFT JOIN Orders o
    ON c.id = o.customerId
WHERE o.id IS NULL;

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- LEFT JOIN zwraca wszystkich klientów z tabeli Customers.
-- Jeśli klient nie ma zamówienia w tabeli Orders,
-- kolumny z Orders przyjmują wartość NULL.
-- Filtr WHERE o.id IS NULL wybiera tylko tych klientów
-- którzy nie mają żadnego zamówienia.