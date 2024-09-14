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

        return pc_suggestion


    elif user_platform.lower() == "web":
        web_games_list = []

        for game in database:
            if game["platform"] == "Web Browser":
                web_games_list.append(game["title"])

        web_game = random.choice(web_games_list)

        for game in database:
            if web_game == game["title"]:
                web_game_url = game["game_url"]
                web_game_year = game["release_date"][0 : 4]
                web_game_info = game["short_description"]
                break

        web_suggestion = (f"""Based on your platform choice, here is a game that you might enjoy! 
        \n{web_game} ({web_game_year}), url: {web_game_url}
        \n{web_game_info}""")

        return web_suggestion

    else:
        return "Invalid platform choice. Please choose between PC and Web."



def loop_suggestion():
    continuous = True
    random_game_gen()
    while continuous:
        continue_prompt = input("Would you like another suggestion? (Y/N) ")

        if continue_prompt.lower() == "y" or continue_prompt.lower() == "yes":
            continue
        elif continue_prompt.lower() == "n" or continue_prompt.lower() == "no":
            continuous = False
        else:
            input("I'm sorry I didn't understand that. Try again.")

    return "Thank you for choosing us for your gaming recommendations. Happy gaming!"



loop_suggestion()
