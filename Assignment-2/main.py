import requests
import random

endpoint = "https://www.freetogame.com/api/games"
response = requests.get(endpoint)
database = response.json()


results_path = "/Users/gwenmichailidis/CFGdegree/CFG-Assignments/Assignment-2/game_suggestion.txt"


def random_game_gen():
    print("Welcome to our Free-to-play Game suggestion app!")
    user_platform = input("Would you prefer a PC or Web based game suggestion? ")

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

        with open(results_path, "a") as results:
            results.write(pc_suggestion + "\n\n")

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

        with open(results_path, "a") as results:
            results.write(web_suggestion + "\n\n")

        return web_suggestion

    else:
        print("Invalid platform choice. Please choose between PC and Web.")
        random_game_gen()



def loop_suggestion():
    continuous = True
    with open(results_path, "w") as results:
        results.write("")
    random_game_gen()

    while continuous:
        continue_prompt = input("Would you like another suggestion? (Y/N) ")

        if continue_prompt.lower() == "y":
            random_game_gen()
        elif continue_prompt.lower() == "n":
            continuous = False
        else:
            print("I'm sorry I didn't understand that. Please type Y for yes or N for no.")

    with open(results_path, "a") as results:
        results.write("Thank you for choosing us for your gaming recommendations. Happy gaming!")

    return "Thank you for choosing us for your gaming recommendations. Happy gaming!"


loop_suggestion()
