import mysql.connector
from config import USER, PASSWORD, HOST, DATABASE

class DBConnectionError(Exception):
    pass


def connect_to_db():
    connection = mysql.connector.connect(
        host = HOST,
        user = USER,
        password = PASSWORD,
        database = DATABASE,
        auth_plugin = "mysql_native_password"
    )
    return connection

def get_all_horror_games():
    db_connection = None
    try:
        db_connection = connect_to_db()
        cur = db_connection.cursor()
        print("Connection to DB: %s active." % DATABASE)
        print("To celebrate spooky season enjoy playing a horror board game")
        print("Here is a list of horror board games you might enjoy")

        query = """SELECT * FROM horror_board_games"""
        cur.execute(query)
        result = cur.fetchall()

        cur.close()
        return result

    except Exception:
        raise DBConnectionError("Failed to connect to DB")

    finally:
        if db_connection:
            db_connection.close()
            print("Connection to DB closed")


#
# def get_game_by_players(player):
#











if __name__ == "__main__":
    get_all_horror_games()