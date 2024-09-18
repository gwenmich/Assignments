# Assignment 2

### Description

For this assignment I created a console app that offers the 
user a random game suggestion based on their choice of PC or 
Web platform. 

For the random element of the game suggestion I imported the 
random module which did not need any further installing. 

The app loops until the user doesn't want any more 
recommendations.

The game suggestion(s) and the goodbye message are written to 
the game_suggestion.txt file the contents of which are erased 
at the beginning of each program run.

### API use

The API endpoint I used to get data from is: 
https://www.freetogame.com/api/games , and is free to use. All
necessary information about it is here: 
https://www.freetogame.com/api-doc.

I used the API to create a list of games based on the user's
platform preference, from which I created a random game
suggestion.
