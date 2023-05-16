DROP SCHEMA IF EXISTS cyber CASCADE;
CREATE SCHEMA cyber ;

CREATE TABLE cyber.intrusions(
    Unamed INT,
    Name_of_Covered_Entity VARCHAR(255),
    State VARCHAR(255),
    Individuals_Affected INT,
    Date_of_Breach INT,
    Date_Posted_or_Updated VARCHAR(255),
    breach_start VARCHAR(255),
    year INT,
    Type_of_Breach_Hacking/IT Incident VARCHAR(255),
    Type_of_Breach_Improper Disposal VARCHAR(255),
    Type_of_Breach_Loss VARCHAR(255),
    Type_of_Breach_Other VARCHAR(255),
    Type_of_Breach_Theft VARCHAR(255),
    Type_of_Breach_Unauthorized Access/Disclosure VARCHAR(255),
    Location_of_Breached_Information_Desktop Computer VARCHAR(255),
    Location_of_Breached_Information_Laptop VARCHAR(255),
    Location_of_Breached_Information_Network Server VARCHAR(255),
    Location_of_Breached_Information_Other VARCHAR(255),
    Location_of_Breached_Information_Other Portable Electronic Device VARCHAR(255),
    Location_of_Breached_Information_Paper VARCHAR(255),
    
);

GRANT ALL PRIVILEGES ON all tables in SCHEMA cyber.intrusions TO postgres;
