CREATE DATABASE board_games;
USE board_games;

CREATE TABLE horror_board_games (
	game_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    min_players INT NOT NULL,
    max_players INT NOT NULL,
    rating FLOAT CHECK (rating > 0 AND rating <=10),
    description VARCHAR(250)
);

-- populating horror_board_games table
INSERT INTO horror_board_games (
	title,
    min_players,
    max_players,
    rating,
    description
)
VALUES
("Mansions of Madness (2nd ed.)", 1, 5, 8.1, "A Lovecraftian-themed, app-driven game where players explore haunted locations, solve puzzles, and fight eldritch horrors."),
("Arkham Horror (3rd ed.)", 1, 6, 7.6, "Players work together to stop cosmic horrors from destroying the world in this cooperative Lovecraftian adventure."),
("Eldritch Horror", 1, 8, 7.8, "A globe-trotting adventure where players must prevent an ancient evil from awakening and plunging the world into chaos."),
("Betrayal at House on the Hill", 3, 6, 7.0, "Players explore a haunted mansion until one turns traitor, changing the game into a tense battle of survival."),
("Nemesis", 1, 5, 8.5, "A sci-fi horror game where players must survive aboard a spaceship infested with deadly alien creatures."),
("The Bloody Inn", 1, 4, 7.0, "A darkly comedic game where players run an inn and murder guests to steal their money, while avoiding suspicion."),
("Abomination: The Heir of Frankenstein", 2, 4, 7.6, "Set in 19th century Paris, players compete to create the best human-like creature by harvesting body parts."),
("Fury of Dracula (4th ed.)", 2, 5, 7.9, "One player controls Dracula, moving secretly across Europe, while the others are vampire hunters trying to track him down."),
("Atmosfear", 3, 6, 8.0, "A thrilling horror board game that immerses players in a dark and eerie world where they must compete against each other and the fearsome Gatekeeper to escape."),
("Cthulhu: Death May Die", 1, 5, 8.2, "A cooperative game where players must disrupt cult rituals and battle Lovecraftian gods before they can destroy the world.");





