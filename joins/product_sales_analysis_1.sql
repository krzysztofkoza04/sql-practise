-- =====================================================
-- Problem: Product Sales Analysis I
-- Source: LeetCode
-- Topic: JOIN
-- =====================================================

-- Opis:
-- Połącz tabelę Sales z tabelą Product,
-- aby zwrócić nazwę produktu, rok sprzedaży i cenę.

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT
    p.product_name,
    s.year,
    s.price
FROM Sales s
LEFT JOIN Product p
    ON s.product_id = p.product_id;

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- JOIN łączy sprzedaż z informacją o produkcie po product_id.
-- Dzięki temu można zwrócić nazwę produktu razem z rokiem i ceną sprzedaży.