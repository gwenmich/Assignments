import requests
import random

endpoint = "https://www.freetogame.com/api/games"
response = requests.get(endpoint)
database = response.json()

