from sqlalchemy import create_engine
from sqlalchemy import func
from sqlalchemy.orm import Session
from config import connection


def main():
    print("Welcome to the Cyber Capstone database.")

    # set up sqlalchemy session
    engine = create_engine(connection)
    session = Session(engine)

    entry = ''
    while True:
        entry = input("What information would you like to extract? Enter respective keys listed below \n \
                       1: Company with most breaches \n\
                       2: Type of Breach that occurs most often \n\
                       3: Type of Breach Medians \n\
                       E: Exit ")                


        
        result = ''
        if entry == '1':
            result = session.query(func.cyber.largest_intrusion()).all()
        elif entry == '2':
            result = session.query(func.cyber.top_breach()).all()
        elif entry == '3':
           result = session.query(func.cyber.type_of_breach_theft()).all()
        elif entry == 'E':
            print("Exiting")
            break
        else:
            print("Unrecognized key. Try again.")

        print(result)
    
if __name__ == "__main__":
    main()
