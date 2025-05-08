SHOW DATABASES;

CREATE DATABASE demo_db;

CREATE SCHEMA demo_db.staging;

CREATE TABLE customer (
    customer_id integer PRIMARY KEY,
    first_name STRING,
    last_name STRING,
    email VARCHAR
);