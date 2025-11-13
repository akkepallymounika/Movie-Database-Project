# Movie-Database-Project
Movie Database Project
Project Overview

The Movie Database project manages movies, actors, and the roles actors play in movies. It demonstrates a many-to-many relationship using a linking table movie_cast.

This project covers:

Database creation and table design

Primary and foreign keys

Many-to-many relationships

Joins (INNER JOIN)

Filtering and aggregate queries

Database Tables
1. movies

Stores movie details.

movie_id INT PRIMARY KEY AUTO_INCREMENT

title VARCHAR(100) NOT NULL

genre VARCHAR(50)

release_year INT

2. actors

Stores actor details.

actor_id INT PRIMARY KEY AUTO_INCREMENT

name VARCHAR(50) NOT NULL

birth_year INT

3. movie_cast

Links movies and actors (many-to-many).

movie_id INT (FK → movies)

actor_id INT (FK → actors)

role VARCHAR(50) – optional role name

Composite primary key (movie_id, actor_id)

Sample Data Description

Movies: Inception (2010, Sci-Fi), The Dark Knight (2008, Action), Titanic (1997, Romance)

Actors: Leonardo DiCaprio, Joseph Gordon-Levitt, Christian Bale, Kate Winslet

Movie Cast: Example roles include Cobb (Inception), Arthur (Inception), Bruce Wayne / Batman (The Dark Knight), Jack Dawson (Titanic), Rose DeWitt Bukater (Titanic)

Example Queries

1. List movies with actors and roles

SELECT m.title AS Movie, a.name AS Actor, mc.role
FROM movie_cast mc
JOIN movies m ON mc.movie_id = m.movie_id
JOIN actors a ON mc.actor_id = a.actor_id
ORDER BY m.title;


2. Find movies by genre

SELECT title, release_year
FROM movies
WHERE genre = 'Sci-Fi';


3. Find movies released after a year

SELECT title, release_year
FROM movies
WHERE release_year > 2000;


4. Find all movies for a specific actor

SELECT m.title, m.genre, m.release_year
FROM movie_cast mc
JOIN movies m ON mc.movie_id = m.movie_id
JOIN actors a ON mc.actor_id = a.actor_id
WHERE a.name = 'Leonardo DiCaprio';


5. Count number of actors in each movie

SELECT m.title, COUNT(mc.actor_id) AS total_actors
FROM movies m
JOIN movie_cast mc ON m.movie_id = mc.movie_id
GROUP BY m.movie_id;

Learning Outcomes

Designing relational databases

Implementing many-to-many relationships

Writing queries using JOIN, WHERE, GROUP BY

Understanding primary and foreign key constraints

Applying SQL in a real-world scenario
