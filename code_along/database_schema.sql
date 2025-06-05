-- List all databases
SHOW DATABASES;

-- Create demo database (idempotent with IF NOT EXISTS)
CREATE DATABASE IF NOT EXISTS DEMO_DB;

-- Verify database creation
SHOW DATABASES;

-- Create staging schema in DEMO_DB
CREATE SCHEMA IF NOT EXISTS DEMO_DB.STAGING;

-- Show schemas in DEMO_DB
SHOW SCHEMAS IN DATABASE DEMO_DB;

-- Set DEMO_DB as active database
USE DATABASE DEMO_DB;

-- Create warehouse schema (no database prefix needed now)
CREATE SCHEMA IF NOT EXISTS WAREHOUSE;

-- Won't create duplicate - idempotent behavior
CREATE SCHEMA IF NOT EXISTS STAGING;

-- This will error - schema already exists without IF NOT EXISTS
CREATE SCHEMA STAGING;

-- Show all schemas in current database
SHOW SCHEMAS;

-- Create customer table in current schema (WAREHOUSE)
CREATE TABLE IF NOT EXISTS customer (
    customer_id integer PRIMARY KEY,
    age integer,
    email varchar(50)
);

-- Show tables in current schema
SHOW TABLES;

-- Insert sample data
INSERT INTO CUSTOMER (customer_id, age, email)
VALUES
(1, 32, 'abc@gmail.com'),
(2, 23, 'cdc@gmail.com');

-- View inserted data
SELECT * FROM CUSTOMER;

-- Create staging table using schema-qualified name
CREATE TABLE IF NOT EXISTS staging.stg_customer (
    customer_id integer PRIMARY KEY,
    age integer,
    email varchar(50)
);

-- Show all tables across all schemas
SHOW TABLES IN DATABASE DEMO_DB;

-- Clean up - remove entire database
DROP DATABASE DEMO_DB;

-- Confirm deletion
SHOW DATABASES;