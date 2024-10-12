import requests

def get_all_games_front_end():
    endpoint = "http://127.0.0.1:5000/horror-games"
    result = requests.get(endpoint).json()
    return result




if __name__ == "__main__":
    print(get_all_games_front_end())
