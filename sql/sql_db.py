import psycopg2
import psycopg2.extras
from config import params
import csv
import os

conn = psycopg2.connect(**params)

with conn.cursor() as cursor:
    # READ FILES IN PYTHON
    with open('sql/schema.sql', 'r') as schema:
        # reads in entire file
        queries = schema.read()
        print(queries)
        # starting a transaction (or continuing)
        cursor.execute(queries)
    # commit changes
    conn.commit()

'''
with conn.cursor() as cursor:

    with open('/Users/Jackie/Desktop/GH_Clones/Cyber_Capstone/data/df_encoded.csv', 'r') as f:    
        cmd = 'COPY cyber.intrustions FROM STDIN WITH (FORMAT CSV, HEADER TRUE)'
        cursor.copy_expert(cmd, f)
    conn.commit()
'''

