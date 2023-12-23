-- SOCCER LEAGUE

DROP DATABASE IF EXISTS soccer_league_db;
CREATE DATABASE soccer_league_db;

\c soccer_league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) UNIQUE NOT NULL,
    creation DATE NOT NULL,
    stadium VARCHAR(20) NOT NULL,
)

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team INTEGER REFERENCES teams (id),
    
)