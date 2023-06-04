-- function 1
CREATE OR REPLACE FUNCTION schema.get_todays_date() RETURNS VARCHAR AS $$ 
    -- declare variables that you will use in your function
    DECLARE
    	today TIMESTAMP;
    -- begin the procedure
    BEGIN
        -- basic sql query to get today's date
        SELECT CURRENT_DATE INTO today;
        -- return date
        RETURN today;
    -- end procedure
    END; $$ 
-- specify language 
LANGUAGE plpgsql;

-- function 2
-- CREATE FUNCTION schema.function_name() RETURNS data_type AS $$
--      (code)
--    $$
-- LANGUAGE plpgsql; -- this a unique version of SQL
CREATE OR REPLACE FUNCTION cyber.largest_intrusions() RETURNS INT AS $$ 
    DECLARE
    	name_of_company VARCHAR(255);
    BEGIN
        SELECT title, max(...)
            FROM ...
            WHERE ... 
        INTO name_of_company;
        RETURN name_of_company;
    END; $$ 
LANGUAGE plpgsql;

-- function 3 
CREATE OR REPLACE FUNCTION cyber.type_of_breach_theft() RETURNS Float AS $$
DECLARE
      Median_breaches Float;
Begin
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY individuals_affected) AS median -- calculate median of number of individuals affected
    FROM cyber.breaches b JOIN cyber.intrusions i
    ON b.type_id = i.type_id
    WHERE type_of_breach_theft = 1 
	Into Median_breaches;
	Return Median_breaches;
END; $$
LANGUAGE plpgsql;


