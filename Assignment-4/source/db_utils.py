import mysql.connector
from config import USER, PASSWORD, HOST, DATABASE

class DBConnectionError(Exception):
    pass


# Connect to board games database
def connect_to_db():
    connection = mysql.connector.connect(
        host = HOST,
        user = USER,
        password = PASSWORD,
        database = DATABASE,
        auth_plugin = "mysql_native_password"
    )
    return connection


# Connect to db to get all horror board games
def get_all_horror_games():
    db_connection = None
    try:
        db_connection = connect_to_db()
        cur = db_connection.cursor()
        print("Connection to DB: %s active." % DATABASE)

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


# Connect to db to get board games that can be played with a user-specified number of players
def get_game_by_num_of_players(player):
    db_connection = None
    try:
        db_connection = connect_to_db()
        cur = db_connection.cursor()
        print("Connection to %s DB active" % DATABASE)

        player_query = f"""
            SELECT * 
            FROM horror_board_games
            WHERE {player} >= min_players AND {player} <= max_players
        """

        cur.execute(player_query)
        result = cur.fetchall()

        cur.close()
        return result

    except Exception:
        raise DBConnectionError("Failed to connect to DB")

    finally:
        if db_connection:
            db_connection.close()
            print("Closed connection to DB")


# Connect to db to add a horror board game
def add_horror_game(game_data):
    db_connection = None
    try:
        db_connection = connect_to_db()
        cur = db_connection.cursor()
        print("Connection to %s DB active" % DATABASE)

        add_query = ("""
            INSERT INTO horror_board_games (
                title,
                min_players,
                max_players,
                rating,
                description
            )
            VALUES
            (%s, %s, %s, %s, %s)
        """)

        parameters = (
            game_data["title"],
            game_data["min_players"],
            game_data["max_players"],
            game_data["rating"],
            game_data["description"]
        )
        cur.execute(add_query, parameters)
        db_connection.commit()

        # Return all games to show the addition
        select_query = """SELECT * FROM horror_board_games"""
        cur.execute(select_query)
        result = cur.fetchall()

        cur.close()
        return result

    except Exception:
        raise DBConnectionError("Failed to connect to DB")

    finally:
        if db_connection:
            db_connection.close()
            print("Closed connection to DB")




if __name__ == "__main__":
    get_all_horror_games()
    get_game_by_num_of_players()
    add_horror_game()