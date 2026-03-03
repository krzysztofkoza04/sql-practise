-- =====================================================
-- Problem: Combine Two Tables (LeetCode)
-- Topic: LEFT JOIN
-- =====================================================

-- Opis:
-- Dla każdej osoby pokaż:
-- firstName, lastName, city, state
-- Jeśli osoba nie ma adresu → city i state = NULL

-- Schemat tabel

CREATE TABLE Person (
    personId INT PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255)
);

CREATE TABLE Address (
    addressId INT PRIMARY KEY,
    personId INT,
    city VARCHAR(255),
    state VARCHAR(255)
);

-- Rozwiązanie

SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId;

-- Dlaczego LEFT JOIN?
-- Bo chcemy pokazać wszystkie osoby,
-- nawet jeśli nie mają wpisu w tabeli Address.