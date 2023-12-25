-- SOCCER LEAGUE

DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL
);

INSERT INTO teams (name) VALUES
    ('Inter Miami CF'), ('Al Nassr');

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams (id)
);

INSERT INTO players (name, team_id) VALUES
    ('Cristiano Ronaldo', 1), ('Lionel Messi', 2);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    date_started DATE UNIQUE NOT NULL,
    date_ended DATE UNIQUE NOT NULL
);

INSERT INTO seasons (date_started, date_ended) VALUES
    ('2022-01-01', '2022-12-31'), ('2023-01-01', '2023-12-31');

INSERT INTO referees (name) VALUES
    ('Rodolph Van Romondt');

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    match_date DATE NOT NULL,
    home_team INTEGER REFERENCES teams (id),
    away_team INTEGER REFERENCES teams (id),
    referee_id INTEGER REFERENCES referees (id),
    season_id INTEGER REFERENCES seasons (id)
);

INSERT INTO matches (match_date, home_team, away_team, referee_id, season_id) VALUES
    ('2023-12-25', 1, 2, 1, 2), ('2023-12-31', 2, 1, 1, 2);

CREATE TABLE points (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams (id),
    match_id INTEGER REFERENCES matches (id),
    point_num INTEGER NOT NULL CHECK (point_num = 0 OR point_num = 1 OR point_num = 3)
);

INSERT INTO points (team_id, match_id, point_num) VALUES
    (1, 1, 0), (2, 1, 3), (1, 2, 0), (2, 2, 3);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches (id),
    player_id INTEGER REFERENCES players (id)
);

INSERT INTO goals (match_id, player_id) VALUES
    (1, 1), (1, 2);