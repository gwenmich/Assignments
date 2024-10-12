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
    game_data = request.get_json()
    add_game(
        title = game_data["title"],
        min_players = game_data["min_players"],
        max_players = game_data["max_players"],
        rating = game_data["rating"],
        description = game_data["description"]
    )
    return jsonify(add_horror_game())



if __name__ == "__main__":
    app.run(debug = True)
