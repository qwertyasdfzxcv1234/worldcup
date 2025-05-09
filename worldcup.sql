psql --username=freecodecamp --dbname=postgres;

CREATE DATABASE worldcup;

\c worldcup

CREATE TABLE teams (
    team_id SERIAL NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE games (
    game_id SERIAL NOT NULL,
    year INTEGER NOT NULL,
    round VARCHAR(20) NOT NULL,
    winner_id      INTEGER NOT NULL,
    opponent_id    INTEGER NOT NULL,
    winner_goals   INTEGER NOT NULL,
    opponent_goals INTEGER NOT NULL
);

ALTER TABLE teams ADD PRIMARY KEY (team_id);
ALTER TABLE games ADD PRIMARY KEY (game_id);
ALTER TABLE games ADD FOREIGN KEY (winner_id)   REFERENCES teams (team_id);
ALTER TABLE games ADD FOREIGN KEY (opponent_id) REFERENCES teams (team_id);

chmod +x insert_data.sh
chmod +x queries.sh

./insert_data.sh
./queries.sh

pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql
