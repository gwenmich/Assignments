from flask import Flask, jsonify
from db_utils import get_all_horror_games, get_game_by_num_of_players

app = Flask(__name__)

@app.route("/horror-games", methods = ["GET"])
def get_all_games():
    return jsonify(get_all_horror_games())


@app.route("/horror-games/players/<int:player>", methods = ["GET"])
def get_game_player_num(player):
    return jsonify(get_game_by_num_of_players(player))



if __name__ == "__main__":
    app.run(debug = True)
