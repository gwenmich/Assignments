import requests


# Getting all games
def get_all_games_front_end():
    endpoint = "http://127.0.0.1:5000/horror-games"
    result = requests.get(endpoint).json()
    return result


# Getting games with specified number of players by user input
def get_game_player_num_front_end(player):
    endpoint = f"http://127.0.0.1:5000/horror-games/players/{player}"
    result = requests.get(endpoint).json()
    return result


# Adding a game with user input
def add_game_front_end(user_title, user_min_players, user_max_players, user_rating, user_description):
    endpoint = "http://127.0.0.1:5000/horror-games/add"
    game_data = {
        "title" : user_title,
        "min_players": user_min_players,
        "max_players": user_max_players,
        "rating": user_rating,
        "description": user_description
    }
    response = requests.post(endpoint, json=game_data)
    result = response.json()
    return result



# What runs at the front end to begin with
def run():
    print("----------------------------------")
    print("Welcome to the Board Games Records")
    print("----------------------------------")
    print("To celebrate spooky season enjoy playing a horror board game!")
    print("")
    print("Choose an option:")
    print("A: View all horror board games records")
    print("B: View all horror board games based on the number of players")
    print("C: Add a horror board game to our records")

    answer = input("What would you like to do: A, B, or C? ").strip().upper()

    if answer == "A":
        if get_all_games_front_end() is None:
            print("Unable to retrieve records. Try again later.")

        print(get_all_games_front_end())

    elif answer == "B":

        player_num = input("Great! How many players do you want to join the game? ")

        try:
            player_num = int(player_num)
            if player_num < 1:
                raise ValueError("Number of players must be at least 1.")
            elif player_num > 8:
                raise ValueError("Sorry, there are no games with that many players.")

            print(f"The following games can be played by {player_num} players:")
            print(get_game_player_num_front_end(player_num))

        except ValueError:
            print("Invalid input! Please enter a number, such as 2.")


    elif answer == "C":
        print("Great! Please give the details of the game you'd like to add")
        user_title = input("Title of the game: ")
        user_min_players = input("Minimum number of players that can play: ")
        user_max_players = input("Maximum number of players that can play: ")
        user_rating = input("Rating of game 1-10: ")
        user_description = input("Short one-sentence description of game: ")

        try:
            user_min_players = int(user_min_players)
            user_max_players = int(user_max_players)
            user_rating = float(user_rating)

            print("Thank you for your input!")
            print("---------------------")
            print("Game added to records")
            print("---------------------")

            add_game_front_end(user_title, user_min_players, user_max_players, user_rating, user_description)


        except ValueError:
            print("Invalid input!")

    else:
        print("Invalid choice! Please choose between A, B, or C.")



if __name__ == "__main__":
    run()