-- Select the database containing Crunchbase company data
USE DATABASE CRUNCHBASE_BASIC_COMPANY_DATA;
-- Show all available schemas in the database
SHOW SCHEMAS;
-- Switch to the PUBLIC schema (default schema)
USE SCHEMA PUBLIC;
-- List all tables in the current schema
SHOW TABLES;
-- List all views in the current schema
SHOW VIEWS;
-- Retrieve the first 5 rows from the organization_summary view to see sample data
SELECT * FROM organization_summary LIMIT 5;
-- Describe the structure of the organization_summary view (columns, data types, etc.)
DESC VIEW organization_summary;

SELECT COUNT(*) AS number_rows FROM organization_summary;

SELECT DISTINCT type
FROM organization_summary;

-- check number unique names
SELECT COUNT(DISTINCT name) AS number_unique_names
FROM organization_summary LIMIT 5;

-- check unique countries
SELECT COUNT(DISTINCT COUNTRY_CODE) FROM organization_summary;

-- check number of organizations in different countries
SELECT
    country_code,
    COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code
ORDER BY number_organizations DESC;

-- check organizations in nordic countries 
SELECT
    country_code,
    COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code
HAVING country_code IN ('SWE', 'DNK', 'NOR', 'FIN', 'ISL')
ORDER BY number_organizations DESC;

-- check organizations in regions in nordic countries
SELECT
    country_code,
    region,
    COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code, region
HAVING country_code IN ('SWE', 'DNK', 'NOR', 'FIN', 'ISL')
ORDER BY number_organizations DESC;