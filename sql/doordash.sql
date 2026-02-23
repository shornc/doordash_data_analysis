CREATE DATABASE IF NOT EXISTS doordash;

USE doordash;

SELECT * FROM doordash;

SELECT COUNT(*) AS row_count FROM doordash;

SELECT COUNT(*) AS column_count
FROM information_schema.columns
WHERE table_schema = DATABASE()
AND table_name = 'doordash';

