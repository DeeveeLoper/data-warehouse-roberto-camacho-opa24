SHOW DATABASES;

CREATE DATABASE demo_db;
CREATE DATABASE demo_db2;

CREATE SCHEMA demo_db.staging;

CREATE SCHEMA demo_db2.staging;

CREATE TABLE customer (
    customer_id integer PRIMARY KEY,
    first_name STRING,
    last_name STRING,
    email VARCHAR
);