from flask import Flask, jsonify, request
from db_utils import get_all_horror_games, get_game_by_num_of_players, add_horror_game

app = Flask(__name__)


# Getting all horror board games
@app.route("/horror-games", methods = ["GET"])
def get_all_games():
    return jsonify(get_all_horror_games())



# Getting board games playable with user-decided number of players
@app.route("/horror-games/players/<int:player>", methods = ["GET"])
def get_game_player_num(player):
    return jsonify(get_game_by_num_of_players(player))



# Adding a horror board game
@app.route("/horror-games/add", methods = ["POST"])
def add_game():
    game_info = request.get_json()
    add_horror_game(
        title = game_info["title"],
        min_players = game_info["min_players"],
        max_players = game_info["max_players"],
        rating = game_info["rating"],
        description = game_info["description"]
    )
    return game_info



if __name__ == "__main__":
    app.run(debug = True)
