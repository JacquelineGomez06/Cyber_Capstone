import psycopg2
import psycopg2.extras
from config import params
import csv
import os

# ** --> dictionary unpacking!

conn = psycopg2.connect(**params)


with conn.cursor() as cursor:

    # READ FILES IN PYTHON

    with open('sql/foreign_keys.sql', 'r') as schema:

        # read --> reads in entire file

        queries = schema.read()
        print(queries)

        # we are starting a transaction (or continuing)

        cursor.execute(queries)

    # commit your changes

    conn.commit()