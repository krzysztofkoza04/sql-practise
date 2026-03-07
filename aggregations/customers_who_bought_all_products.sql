-- =====================================================
-- Problem: Customers Who Bought All Products
-- Source: LeetCode
-- Topic: GROUP BY + HAVING + Subquery
-- =====================================================

-- Opis:
-- Znajdź klientów, którzy kupili wszystkie produkty
-- dostępne w tabeli Product.

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Customer (
    customer_id INT,
    product_key INT
);

CREATE TABLE Product (
    product_key INT PRIMARY KEY
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) =
       (SELECT COUNT(*) FROM Product);

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- GROUP BY dzieli dane według customer_id.
-- COUNT(DISTINCT product_key) liczy ile różnych produktów kupił klient.
-- Subquery liczy ile produktów istnieje w tabeli Product.
-- Jeśli liczby są równe, klient kupił wszystkie produkty.