-- function 1
 function 1
CREATE OR REPLACE FUNCTION cyber.largest_intrusion() RETURNS VARCHAR AS $$ 
    -- declare variables that you will use in your function
    DECLARE
       company_name VARCHAR(255);
       num_breaches INT;
    -- begin the procedure
    BEGIN
        -- return name of company with most breaches
        SELECT Name_of_Covered_Entity, MAX(Individuals_Affected)
            FROM cyber.intrusions
            GROUP BY Name_of_Covered_Entity
            LIMIT 1
        INTO company_name;
        RETURN company_name;
    -- end procedure
    END; $$ 
-- specify language 
LANGUAGE plpgsql;

-- 
CREATE OR REPLACE FUNCTION cyber.breach() RETURNS INT AS $$ 
    DECLARE
    	name_of_company VARCHAR(255);
    BEGIN
        SELECT breaches, count (*) max(...)
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
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY individuals_affected) AS median 
    FROM cyber.breaches b JOIN cyber.intrusions i
    ON b.type_id = i.type_id
    WHERE type_of_breach_theft = 1 
	Into Median_breaches;
	Return Median_breaches;
END; $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cyber.type_of_breach_hacking_it_incident() RETURNS Float AS $$
DECLARE
      Median_breaches Float;
Begin
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY individuals_affected) AS median 
    FROM cyber.breaches b JOIN cyber.intrusions i
    ON b.type_id = i.type_id
    WHERE type_of_breach_hacking_it_incident = 1 
	Into Median_breaches;
	Return Median_breaches;
END; $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cyber.type_of_breach_improper_disposal() RETURNS Float AS $$
DECLARE
      Median_breaches Float;
Begin
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY individuals_affected) AS median 
    ON b.type_id = i.type_id
    WHERE type_of_breach_improper_disposal = 1 
	Into Median_breaches;
	Return Median_breaches;
END; $$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION cyber.type_of_breach_loss() RETURNS Float AS $$
DECLARE
      Median_breaches Float;
Begin
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY individuals_affected) AS median 
    FROM cyber.breaches b JOIN cyber.intrusions i
    ON b.type_id = i.type_id
    WHERE type_of_breach_loss = 1 
	Into Median_breaches;
	Return Median_breaches;
END; $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cyber.type_of_breach_unauthorized_access_disclosure() RETURNS Float AS $$
DECLARE
      Median_breaches Float;
Begin
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY individuals_affected) AS median 
    FROM cyber.breaches b JOIN cyber.intrusions i
    ON b.type_id = i.type_id
    WHERE type_of_breach_unauthorized_access_disclosure = 1 
	Into Median_breaches;
	Return Median_breaches;
END; $$
LANGUAGE plpgsql;


