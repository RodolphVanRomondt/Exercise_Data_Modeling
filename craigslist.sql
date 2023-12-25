-- DDL CRAIGSLIST

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) UNIQUE NOT NULL
);

INSERT INTO regions (name) VALUES
    ('San Francisco'), ('Atlanta'), ('Seattle');

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    region_id INTEGER REFERENCES regions (id)
);

INSERT INTO users (username, first_name, last_name, region_id) VALUES
    ('rvr', 'Rodolph', 'Van Romondt', 1),
    ('cs', 'Colt', 'Steele', 2),
    ('da', 'David', 'Adewole', 3);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) UNIQUE NOT NULL,
    text TEXT NOT NULL,
    user_id INTEGER REFERENCES users (id),
    location TEXT NOT NULL,
    region_id INTEGER REFERENCES regions (id)
);

INSERT INTO posts (title, text, user_id, location, region_id) VALUES
    ('Software Engineering', 'A REALLY LONG TEXT ABOUT SOFTWARE ENGINEERING', 1, 'USA', 1);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL
);

INSERT INTO categories (name) VALUES
    ('Computer Science'), ('Art'), ('Math');

CREATE TABLE posts_categories (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL
);

INSERT INTO posts_categories (post_id, category_id) VALUES
    (1, 1);
