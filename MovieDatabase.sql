-- ==============================
-- Movie Database Project
-- ==============================

-- 1️⃣ Create Database
CREATE DATABASE movie_db;
USE movie_db;

-- 2️⃣ Create Tables

-- Movies table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_year INT
);

-- Actors table
CREATE TABLE actors (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    birth_year INT
);

-- Movie Cast table (many-to-many relationship)
CREATE TABLE movie_cast (
    movie_id INT,
    actor_id INT,
    role VARCHAR(50),
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);

-- 3️⃣ Insert Sample Data

-- Movies
INSERT INTO movies (title, genre, release_year) VALUES
('Inception', 'Sci-Fi', 2010),
('The Dark Knight', 'Action', 2008),
('Titanic', 'Romance', 1997);

-- Actors
INSERT INTO actors (name, birth_year) VALUES
('Leonardo DiCaprio', 1974),
('Joseph Gordon-Levitt', 1981),
('Christian Bale', 1974),
('Kate Winslet', 1975);

-- Movie Cast
INSERT INTO movie_cast (movie_id, actor_id, role) VALUES
(1, 1, 'Cobb'),
(1, 2, 'Arthur'),
(2, 3, 'Bruce Wayne / Batman'),
(3, 1, 'Jack Dawson'),
(3, 4, 'Rose DeWitt Bukater');

-- 4️⃣ Example Queries

-- a) List all movies with their actors
SELECT m.title AS Movie, a.name AS Actor, mc.role
FROM movie_cast mc
JOIN movies m ON mc.movie_id = m.movie_id
JOIN actors a ON mc.actor_id = a.actor_id
ORDER BY m.title;

-- b) Find all movies in a specific genre (e.g., Sci-Fi)
SELECT title, release_year
FROM movies
WHERE genre = 'Sci-Fi';

-- c) Find all movies released after a certain year (e.g., 2000)
SELECT title, release_year
FROM movies
WHERE release_year > 2000;

-- d) Find all movies an actor starred in (e.g., Leonardo DiCaprio)
SELECT m.title, m.genre, m.release_year
FROM movie_cast mc
JOIN movies m ON mc.movie_id = m.movie_id
JOIN actors a ON mc.actor_id = a.actor_id
WHERE a.name = 'Leonardo DiCaprio';

-- e) Count number of actors in each movie
SELECT m.title, COUNT(mc.actor_id) AS total_actors
FROM movies m
JOIN movie_cast mc ON m.movie_id = mc.movie_id
GROUP BY m.movie_id;
