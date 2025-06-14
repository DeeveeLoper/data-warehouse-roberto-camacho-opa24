-- SYSADMIN is responsible for creating warehouse and databases
USE ROLE SYSADMIN;

-- Create the Ice Cream database
CREATE DATABASE ice_cream_db;

-- Create development warehouse with cost-optimized settings
CREATE WAREHOUSE dev_wh
WITH
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = 'Warehouse for development and analysis database.';

-- Create a table for ice cream flavors
CREATE TABLE flavors (
    flavor_id INT AUTOINCREMENT,
    flavor_name STRING,
    price DECIMAL(5, 2),
    PRIMARY KEY (flavor_id)
);

-- Create a table for customers
CREATE TABLE customers (
    customer_id INT AUTOINCREMENT,
    customer_name STRING,
    email STRING,
    PRIMARY KEY (customer_id)
);

-- Create a table for transactions with foreign key relationships
CREATE TABLE transactions (
    transaction_id INT AUTOINCREMENT,
    customer_id INT,
    flavor_id INT,
    quantity INT,
    transaction_date TIMESTAMP,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (flavor_id) REFERENCES flavors (flavor_id)
);

-- Set context to use the database and warehouse
USE DATABASE ice_cream_db;
USE WAREHOUSE dev_wh;

-- Show all databases
SHOW DATABASES;

-- Show all tables in current database
SHOW TABLES;

-- Describe table structure
DESC TABLE flavors;
DESC TABLE customers;
DESC TABLE transactions;