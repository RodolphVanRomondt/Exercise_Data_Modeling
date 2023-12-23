-- DDL CRAIGSLIST

DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) UNIQUE NOT NULL,
)

CREATE TABLE users (
    username VARCHAR(15) UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
    region INTEGER REFERENCES regions (id)
)

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) UNIQUE NOT NULL,
    text TEXT NOT NULL,
    user_id INTEGER REFERENCES users (username),
    location TEXT NOT NULL,
    region_id INTEGER REFERENCES regions (id)
)

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) UNIQUE NOT NULL,
)

CREATE TABLE posts_categories (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL
)
