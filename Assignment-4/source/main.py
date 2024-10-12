import requests

def get_all_games_front_end():
    endpoint = "http://127.0.0.1:5000/horror-games"
    result = requests.get(endpoint).json()
    return result

def get_game_player_num_front_end(player):
    endpoint = f"http://127.0.0.1:5000/horror-games/players/{player}"
    result = requests.get(endpoint).json()
    return result

def add_game_front_end(title, min_players, max_players, rating, description):
    endpoint = "http://127.0.0.1:5000/horror-games/add"
    result = requests.post(endpoint).json()
    return result




if __name__ == "__main__":
    # print(get_all_games_front_end())
    # print(get_game_player_num_front_end(6))
    pass