ALTER TABLE cyber.intrusions
ADD CONSTRAINT fk_breaches FOREIGN KEY (Type_ID) REFERENCES cyber.breaches(Type_ID),
ADD CONSTRAINT fk_locations FOREIGN KEY (Location_ID) REFERENCES cyber.locations(Location_ID);

ALTER TABLE cyber.breaches
ADD CONSTRAINT fk_intrusions FOREIGN KEY (Intrusion_ID) REFERENCES cyber.intrusions(Intrusion_ID),
ADD CONSTRAINT fk_locations FOREIGN KEY (Location_ID) REFERENCES cyber.locations(Location_ID);
    
ALTER TABLE cyber.locations
ADD CONSTRAINT fk_intrusions FOREIGN KEY (Intrusion_ID) REFERENCES cyber.intrusions(Intrusion_ID),
ADD CONSTRAINT fk_breaches FOREIGN KEY (Type_ID) REFERENCES cyber.breaches(Type_ID);