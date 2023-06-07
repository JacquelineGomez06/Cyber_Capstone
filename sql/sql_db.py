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
    


