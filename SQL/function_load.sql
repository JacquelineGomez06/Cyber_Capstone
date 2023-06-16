import psycopg2
import psycopg2.extras
from config import params

# ** --> dictionary unpacking!
conn = psycopg2.connect(**params)


with conn.cursor() as cursor:
    # READ FILES IN PYTHON
    with open('file_path', 'r') as functions:
        # read --> reads in entire file
        queries = functions.read()
        # we are starting a transaction (or continuing)
        cursor.execute(functions)
    # commit changes (try)
    try:
        conn.commit()
    except Exception as e:
        print(e)
        conn.rollback()