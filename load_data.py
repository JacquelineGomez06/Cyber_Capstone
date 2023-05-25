import psycopg2
from config import params

conn = psycopg2.connect(**params)

with conn.cursor() as cursor:

    with open('data/df_encoded.csv', 'r') as f:    
        cmd = 'COPY cyber.intrusions FROM STDIN WITH (FORMAT CSV, HEADER TRUE)'
        cursor.copy_expert(cmd, f)
    conn.commit()