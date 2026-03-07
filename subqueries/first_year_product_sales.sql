-- =====================================================
-- Problem: Product Sales Analysis II
-- Source: LeetCode
-- Topic: Correlated Subquery
-- =====================================================

-- Opis:
-- Znajdź sprzedaże, które wystąpiły w pierwszym roku,
-- w którym dany produkt pojawił się w tabeli Sales.

-- =====================================================
-- Schemat tabel
-- =====================================================

CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT
);

-- =====================================================
-- Rozwiązanie
-- =====================================================

SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM Sales s1
WHERE year =
(
    SELECT MIN(year)
    FROM Sales s2
    WHERE s2.product_id = s1.product_id
);

-- =====================================================
-- Wyjaśnienie
-- =====================================================

-- Subquery oblicza najwcześniejszy rok sprzedaży
-- dla danego produktu (MIN(year)).

-- Zapytanie zewnętrzne zwraca tylko te rekordy,
-- których rok jest równy pierwszemu rokowi sprzedaży
-- dla tego samego product_id.