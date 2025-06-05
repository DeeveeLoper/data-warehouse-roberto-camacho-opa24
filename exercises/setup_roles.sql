-- NOTE: use the right role to perform the right actions
-- USERADMIN is responsible for user and role management
USE ROLE USERADMIN;

-- Check current role and user context
SELECT current_role();
SELECT current_user();

-- Demo: privileges inheritance
-- Create 3 hierarchical roles for ice cream database access
CREATE ROLE ice_cream_reader COMMENT = 'Able to read ice_cream database';
CREATE ROLE ice_cream_writer COMMENT = 'Able to do CRUD operations on ice_cream database';
CREATE ROLE ice_cream_analyst COMMENT = 'Able to create views on ice_cream database';

-- Switch to SECURITYADMIN to manage grants and privileges
USE ROLE SECURITYADMIN;

-- Grant basic access privileges to ice_cream_reader
GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_reader;
GRANT USAGE ON DATABASE ice_cream_db TO ROLE ice_cream_reader;

-- Grant schema access (gets ability to reference schemas but not objects)
GRANT USAGE ON ALL SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_reader;

-- Grant SELECT privileges on existing and future tables
GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;
GRANT SELECT ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;

-- Verify reader role grants
SHOW GRANTS TO ROLE ice_cream_reader;
SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

-- Grant ice_cream_reader role to ice_cream_writer (inheritance)
GRANT ROLE ice_cream_reader TO ROLE ice_cream_writer;

-- Verify writer role inherits reader privileges
SHOW GRANTS TO ROLE ice_cream_writer;

-- Grant CRUD operations to ice_cream_writer on existing tables
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

-- Grant CRUD operations on future tables
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

-- Grant table creation privilege
GRANT CREATE TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

-- Verify all future grants
SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

------- Create User

-- Switch to USERADMIN to create users
USE ROLE USERADMIN;

-- Create the user kokchun
CREATE USER kokchun 
PASSWORD = 'TempPassword123!' 
MUST_CHANGE_PASSWORD = TRUE
DEFAULT_ROLE = 'ice_cream_reader'
COMMENT = 'Demo user for ice cream database';

-- Then grant the role
USE ROLE SECURITYADMIN;
GRANT ROLE ice_cream_writer TO USER kokchun;









-- Assign ice_cream_writer role to user kokchun
GRANT ROLE ice_cream_writer TO USER kokchun;