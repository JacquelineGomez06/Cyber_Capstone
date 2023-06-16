import psycopg2
from SQL.config import params

conn = psycopg2.connect(**params)

with conn.cursor() as cursor:

    #with open('data/df_encoded.csv', 'r') as t:    
   #     cmd = 'COPY cyber.intrusions FROM STDIN WITH (FORMAT CSV, HEADER TRUE)'
    #    cursor.copy_expert(cmd, t)
   # conn.commit()


    with open('data/main_df.csv', 'r') as f:    
        cmd = 'COPY cyber.intrusions FROM STDIN WITH (FORMAT CSV, HEADER TRUE)'
        cursor.copy_expert(cmd, f)
    conn.commit()

    with open('data/Type_df.csv', 'r') as j:    
        cmd = 'COPY cyber.breaches FROM STDIN WITH (FORMAT CSV, HEADER TRUE)'
        cursor.copy_expert(cmd, j)
    conn.commit()

    with open('data/Location_df.csv', 'r') as f:    
        cmd = 'COPY cyber.locations FROM STDIN WITH (FORMAT CSV, HEADER TRUE)'
        cursor.copy_expert(cmd, f)
    conn.commit()

    
    