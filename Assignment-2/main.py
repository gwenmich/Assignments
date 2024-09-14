import requests
import random

endpoint = "https://www.freetogame.com/api/games"
response = requests.get(endpoint)
database = response.json()

# app to welcome user
# to ask if they want a pc or web based game
# to ask if they would like a specific genre
# make variable that stores all genres (set)?
# provide list of genres
# give suggestion

# def random_game_gen():
#     print("Welcome to our Free Game suggestion app")
#     platform = input("")
# for game in database:
#     # title = random.choice(list(game.values()))
#     print(game)

