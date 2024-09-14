import requests
import random

endpoint = "https://www.freetogame.com/api/games"
response = requests.get(endpoint)
database = response.json()


def random_game_gen():
    user_platform = input("Welcome to our Free-to-play Game suggestion app!"
                          "\nWould you prefer a PC or Web based game suggestion? ")

    if user_platform.lower() == "pc":
        pc_games_list = []

        for game in database:
            if game["platform"] == "PC (Windows)":
                pc_games_list.append(game["title"])

        pc_game = random.choice(pc_games_list)

        for game in database:
            if pc_game == game["title"]:
                pc_game_url = game["game_url"]
                pc_game_year = game["release_date"][0 : 4]
                pc_game_info = game["short_description"]
                break

        pc_suggestion = (f"""Based on your platform choice, here is a game that you might enjoy! 
        \n{pc_game} ({pc_game_year}), url: {pc_game_url}
        \n{pc_game_info}""")


        # return pc_suggestion
        print(pc_suggestion)


random_game_gen()

