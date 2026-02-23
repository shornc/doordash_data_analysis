CREATE DATABASE IF NOT EXISTS doordash;

USE doordash;

SELECT * FROM doordash;

SELECT COUNT(*) AS row_count FROM doordash;

SELECT COUNT(*) AS column_count
FROM information_schema.columns
WHERE table_schema = DATABASE()
AND table_name = 'doordash';

-- remove duplicates 
CREATE TABLE temp_doordash AS SELECT DISTINCT * FROM doordash;

DROP TABLE doordash;

RENAME TABLE temp_doordash TO doordash;

SELECT COUNT(*) FROM doordash;

SELECT * FROM doordash;

-- adding column `CustomerID` to the right 

ALTER TABLE doordash 
ADD COLUMN CustomerId INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE doordash
MODIFY COLUMN CustomerId INT FIRST;

SELECT * FROM doordash;

-- filtering data based on campaign6 and sorting based MntTotal 

CREATE TABLE filtered_doordash AS
SELECT * FROM doordash 
WHERE AcceptedCmp6 = 1 
ORDER BY MntTotal DESC;

SELECT * FROM filtered_doordash;

-- Summary

-- Number of Customers
SELECT COUNT(*) FROM doordash AS `Number of Customers`;
SELECT COUNT(*) FROM filtered_doordash AS `Number of Customers`;

-- Oldest Customer
SELECT MAX(Age) FROM doordash AS `Oldest Customer`;
SELECT MAX(Age) FROM filtered_doordash AS `Oldest Customer`;

-- Average Spent
SELECT AVG(MntTotal) FROM doordash AS `Average Spent`;
SELECT AVG(MntTotal) FROM filtered_doordaash AS `Average Spent`;

-- Total Spent
SELECT SUM(MntTotal) FROM doordash AS `Total Spent`;
SELECT SUM(MntTotal) FROM filtered_doordash AS `Total Spent`;

-- Shortest Life of a Customer 
SELECT MIN(Customer_Days) FROM doordash AS `Shortest Life of Customer`;
SELECT MIN(Customer_Days) FROM filtered_doordash AS `Shortest Life of Customer`;


SELECT 
    'Number of Customers' AS Metric,
    (SELECT COUNT(*) FROM doordash) AS Original,
    (SELECT COUNT(*) FROM filtered_doordash) AS Cmp6
UNION ALL
SELECT 
    'Oldest Customer',
    (SELECT MAX(Age) FROM doordash),
    (SELECT MAX(Age) FROM filtered_doordash)
UNION ALL
SELECT 
    'Average Spent',
    (SELECT AVG(MntTotal) FROM doordash),
    (SELECT AVG(MntTotal) FROM filtered_doordash)
UNION ALL
SELECT 
    'Total Spent',
    (SELECT SUM(MntTotal) FROM doordash),
    (SELECT SUM(MntTotal) FROM filtered_doordash)
UNION ALL
SELECT 
    'Shortest Life of Customer',
    (SELECT MIN(Customer_Days) FROM doordash),
    (SELECT MIN(Customer_Days) FROM filtered_doordash);

