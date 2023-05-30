DROP SCHEMA IF EXISTS cyber CASCADE;
CREATE SCHEMA cyber ;

CREATE TABLE cyber.intrusions(
    Intrusion_ID INT PRIMARY KEY,
    Name_of_Covered_Entity VARCHAR(255),
    State VARCHAR(255),
    Individuals_Affected INT,
    Date_of_Breach DATE,
    Date_Posted_or_Updated DATE,
    breach_start DATE,
    year INT,
    Location_ID INT,
    Type_ID INT
);

CREATE TABLE cyber.breaches(
    Intrusion_ID INT,
    Type_ID INT PRIMARY KEY,
    Type_of_Breach_Hacking_IT_Incident INT,
    Type_of_Breach_Improper_Disposal INT,
    Type_of_Breach_Loss INT,
    Type_of_Breach_Other INT,
    Type_of_Breach_Theft INT,
    Type_of_Breach_Unauthorized_Access_Disclosure INT,
    Location_ID INT,
);

CREATE TABLE cyber.locations(
    Intrusion_ID INT,
    Location_ID INT PRIMARY KEY,
    Location_of_Breached_Information_Desktop_Computer INT,
    Location_of_Breached_Information_Laptop INT,
    Location_of_Breached_Information_Network_Server INT,
    Location_of_Breached_Information_Other INT,
    Location_of_Breached_Information_Other_Portable_Electronic_Device INT,
    Location_of_Breached_Information_Paper INT,
    Type_ID INT,
);

ALTER TABLE cyber.intrusions
ADD CONSTRAINT fk_breaches FOREIGN KEY (Type_ID) REFERENCES cyber.breaches(Type_ID),
ADD CONSTRAINT fk_locations FOREIGN KEY (Location_ID) REFERENCES cyber.locations(Location_ID);

ALTER TABLE cyber.breaches
ADD CONSTRAINT fk_intrusions FOREIGN KEY (Intrusion_ID) REFERENCES cyber.intrusions(Intrusion_ID),
ADD CONSTRAINT fk_locations FOREIGN KEY (Location_ID) REFERENCES cyber.locations(Location_ID);
    
ALTER TABLE cyber.locations
ADD CONSTRAINT fk_intrusions FOREIGN KEY (Intrusion_ID) REFERENCES cyber.intrusions(Intrusion_ID),
ADD CONSTRAINT fk_breaches FOREIGN KEY (Type_ID) REFERENCES cyber.breaches(Type_ID);

GRANT ALL PRIVILEGES ON all tables in SCHEMA cyber TO postgres;

