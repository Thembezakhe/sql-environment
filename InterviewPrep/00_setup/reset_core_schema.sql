-- Reset script for core interview schema
-- Drops and recreates the practice schema

BEGIN;

DROP SCHEMA IF EXISTS practice CASCADE;

CREATE SCHEMA practice;

COMMIT;

-- End of reset_core_schema.sql
