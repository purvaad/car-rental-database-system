-- update.sql
-- Set environment settings
SET ECHO ON
SET FEEDBACK ON
SET LINESIZE 100
SET PAGESIZE 100
SET SERVEROUTPUT ON
SPOOL update_log.txt



-- Update car locations for relocated cars

UPDATE Fall24_S003_T1_Cars
SET Location_id = 3
WHERE Car_id = 2;

UPDATE Fall24_S003_T1_Cars
SET Location_id = 4
WHERE Car_id = 4;

-- Update rental rates 
PROMPT Updating rental rates...
UPDATE Fall24_S003_T1_Cars
SET Rental_rate = 5500.00
WHERE Car_type = 'Sedan' AND Make = 'Toyota';

-- Insert additional cars to inventory

INSERT ALL
    INTO Fall24_S003_T1_Cars VALUES(
        91, 'Audi', 18000.00, 'Luxury', 'A4', 2023, 3)
    INTO Fall24_S003_T1_Cars VALUES(
        95, 'Toyota', 4800.00, 'Sedan', 'Corolla', 2023, 1)


-- Verify updates

SELECT COUNT(*) FROM Fall24_S003_T1_Cars;

COMMIT;

