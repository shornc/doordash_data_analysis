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

-- adding column `CustomerID` to the right 

ALTER TABLE doordash 
ADD COLUMN CustomerId INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE doordash
MODIFY COLUMN CustomerId INT FIRST;

SELECT * FROM doordash;
