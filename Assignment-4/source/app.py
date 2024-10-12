from flask import Flask, jsonify
from db_utils import get_all_horror_games

app = Flask(__name__)

@app.route("/horror-games", methods = ["GET"])
def get_all_games():
    return jsonify(get_all_horror_games())



if __name__ == "__main__":
    app.run(debug = True)
    get_all_games()