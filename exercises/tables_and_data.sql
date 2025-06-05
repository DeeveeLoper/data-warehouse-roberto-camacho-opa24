-- Display all roles and privileges granted to user ROBCAM
SHOW GRANTS TO USER ROBCAM;
-- List all roles currently available to the active user
SELECT current_available_roles();



-- Switch to SECURITYADMIN to manage role grants
USE ROLE SECURITYADMIN;

-- Grant both custom roles to your user
GRANT ROLE ice_cream_reader TO USER ROBCAM;
GRANT ROLE ice_cream_writer TO USER ROBCAM;

-- Verify the grants were successful
SHOW GRANTS TO USER ROBCAM;

SELECT current_available_roles();



-- Switch to ice_cream_writer role to perform CRUD operations
USE ROLE ice_cream_writer;
USE WAREHOUSE dev_wh;
USE SCHEMA ice_cream_db.public;

-- Create flavors table with auto-incrementing ID
CREATE TABLE flavors (
    flavor_id INT AUTOINCREMENT,
    flavor_name STRING,
    price DECIMAL(5, 2),
    PRIMARY KEY (flavor_id)
);

-- Create customers table with auto-incrementing ID
CREATE TABLE customers (
    customer_id INT AUTOINCREMENT,
    customer_name STRING,
    email STRING,
    PRIMARY KEY (customer_id)
);

-- Create transactions table with foreign key relationships
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

-- Step 5: Insert sample data into flavors table
INSERT INTO flavors (flavor_name, price) VALUES
('Vanilla', 2.50),
('Chocolate', 2.75),
('Strawberry', 2.50),
('Mint Chocolate Chip', 3.00),
('Cookie Dough', 3.25);

-- Insert sample customers
INSERT INTO customers (customer_name, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Alice Johnson', 'alice.johnson@example.com');

-- Insert sample transactions with current timestamp
INSERT INTO transactions (
    customer_id, flavor_id, quantity, transaction_date
) VALUES
(1, 1, 2, CURRENT_TIMESTAMP),
(2, 2, 1, CURRENT_TIMESTAMP),
(3, 3, 3, CURRENT_TIMESTAMP),
(1, 4, 1, CURRENT_TIMESTAMP),
(2, 5, 2, CURRENT_TIMESTAMP);

-- View inserted flavors data
SELECT * FROM flavors;

-- Switch to ice_cream_reader role to test read-only access
USE ROLE ice_cream_reader;

-- Reader can view customer data
SELECT * FROM customers;

-- Test: This will fail - ice_cream_reader cannot insert data
INSERT INTO customers (customer_name, email) VALUES
('John Doe2', 'john.doe@example.com');

-- Reader can view transaction data
SELECT * FROM transactions;