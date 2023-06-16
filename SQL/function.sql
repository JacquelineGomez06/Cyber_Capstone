-- function 1
CREATE OR REPLACE FUNCTION cyber.largest_intrusion() RETURNS VARCHAR AS $$ 
    -- declare variables used in function
    DECLARE
       Name_of_Covered_Entity VARCHAR(255)
       Individuals_Affected INT;
    -- begin the procedure
    BEGIN
        -- basic sql query to get name of company with most breaches
        SELECT Name_of_Covered_Entity, MAX(Individuals_Affected)
            FROM cyber
            LIMIT 1;
        INTO Name_of_Covered_Entity;
        RETURN Name_of_Covered_Entity;
    -- end procedure
    END; $$ 
-- specify language 
LANGUAGE plpgsql;