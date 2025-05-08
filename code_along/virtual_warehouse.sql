SHOW WAREHOUSES;

CREATE WAREHOUSE demo_warehouse
  WITH WAREHOUSE_SIZE = 'small'
  AUTO_SUSPEND = 300
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  COMMENT = 'Demo warehouse created for teaching purpose';

  USE WAREHOUSE COMPUTE_WH;

-- decrease cost by lowering time auto-suspension
  ALTER WAREHOUSE demo_warehouse
  SET AUTO_SUSPEND = 60; 

  DROP WAREHOUSE demo_warehouse; -- drop the warehouse when done

SHOW WAREHOUSES;