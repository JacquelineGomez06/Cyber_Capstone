-- FUNCTION 1--return name of company with most breaches

CREATE OR REPLACE FUNCTION cyber.largest_intrusion() RETURNS VARCHAR AS $$ 
    -- declare variables for function
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


--FUNCTION 2--Return name of the breach that occurs most often

CREATE OR REPLACE FUNCTION cyber.top_breach() RETURNS VARCHAR AS $$ 
    --decalre variables for function
    DECLARE
        breach_type VARCHAR(255);
 
    BEGIN
        
        SELECT CASE GREATEST(hacked,improper_disposal,loss,other,theft,unauthorized_access)
            WHEN hacked THEN 'hacked'
            WHEN improper_disposal THEN 'improper_disposal'
            WHEN loss THEN 'loss'
            WHEN other THEN 'other'
            WHEN theft THEN 'theft'
            WHEN unauthorized_access THEN 'unauthorized_access' 
        END AS freq_breach

        FROM
            (SELECT
                SUM(Type_of_Breach_Hacking_IT_Incident) AS hacked,
                SUM(Type_of_Breach_Improper_Disposal) AS improper_disposal,
                SUM(Type_of_Breach_Loss) AS loss,
                SUM(Type_of_Breach_Other) AS other,
                SUM(Type_of_Breach_Theft) AS theft,
                SUM(Type_of_Breach_Unauthorized_Access_Disclosure) AS unauthorized_access
            FROM cyber.breaches
            ) as total_breaches
        INTO breach_type;
        RETURN breach_type;
    END; $$ 
LANGUAGE plpgsql;


--FUNCTION 3 -- return median number of breaches for ALL types of breaches

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
    FROM cyber.breaches b JOIN cyber.intrusions i
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

