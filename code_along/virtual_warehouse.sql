-- List all available warehouses
SHOW WAREHOUSES;

-- Create a small demo warehouse with cost optimization settings
CREATE WAREHOUSE demo_warehouse
  WITH WAREHOUSE_SIZE = 'small'
  AUTO_SUSPEND = 300
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  COMMENT = 'Demo warehouse created for teaching purpose';

-- Switch to default compute warehouse
USE WAREHOUSE COMPUTE_WH;

-- Reduce costs by shortening auto-suspend time to 1 minute
ALTER WAREHOUSE demo_warehouse
SET AUTO_SUSPEND = 60; 

-- Clean up - remove demo warehouse when finished
DROP WAREHOUSE demo_warehouse;

-- Verify warehouse deletion
SHOW WAREHOUSES;