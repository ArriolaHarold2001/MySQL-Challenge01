CREATE DATABASE react_challenge_one;

USE react_challenge_one;

-- ---------
-- VERY EASY
-- ----------

-- Create a table with your top three cars and include make, model, year.
-- Create a query to add in two more cars

CREATE TABLE cars(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
make VARCHAR(80),
model VARCHAR(80),
year INT
);

INSERT INTO cars(make, model, year)
VALUES("Ford", "Mustang", 1999),
("Honda", "Civic", 2020),
("Tesla", "Model 3", 2018);

-- ---------
-- EASY
-- ----------

-- Create a table with your top five favorite books with Title, Publish Date, and Author First/Last name
-- Create a query to add in two new books Remove the oldest book Provide an additional query giving the sum of all books

CREATE TABLE books (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(80),
publish_date DATE,
author_first_name VARCHAR(80),
author_last_name VARCHAR(80)
);


INSERT INTO books(title, publish_date, author_first_name, author_last_name)
VALUES("Eloquent JavaScript", "2018-12-04", "Marijn", "Haverbeke"),
("Learning C# by Developing Games with Unity 2021", "2019-10-29", "Harrison", "Ferrone"),
("JavaScript the Definitive Guide", "2020-06-09", "David", "Flanagan");


DELETE FROM books
WHERE id = 1;

SELECT * FROM books;

-- ---------
-- MEDIUM
-- ----------

-- Create a table with your top 10 movies. Include title, release date, and rating 
-- Create a query that pulls all movies,
--  in order of release date, where the title includes the letter “s”.

CREATE TABLE movies(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(80),
release_date DATE,
rating ENUM("1","2","3","4","5","6","7","8","9","10")
);

INSERT INTO movies(title, release_date, rating)
VALUES("Sleepaway Camp", "1983-11-18", "6"),
("Mirrors", "2008-08-15", "6"),
("I Am Legend", "2007-12-14", "7"),
("Zombieland", "2009-10-02", "7"),
("The Batman", "2022-03-04", "8"),
("Suicide Squad 2", "2021-08-06", "7"),
("Jason X", "2002-04-26", "4"),
("Iron Man", "2008-05-02", "8"),
("Halloween", "2018-10-19", "6"),
("Demon Slayer: Kimetsu no Yaiba the Movie: Mugen Train", "2021-04-23", "8");

SELECT * FROM movies
WHERE title LIKE("%s%")
ORDER BY release_date ASC;

-- ---------
-- HARD
-- ----------

-- Make a copy of your Medium Challenge Write out the queries that would add the director’s 
-- First Name and Last Name into two separate columns.
-- Create a query that puts the names together. 
-- Create a query to put the list in alphabetical order by the last name from A-Z After you order the list,
-- remove the Movies where the Last Name ends with ”R-Z” Write a query where the first three appear

CREATE TABLE movies_copy(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(80),
release_date DATE,
rating ENUM("1","2","3","4","5","6","7","8","9","10"),
director_first_name VARCHAR(80),
director_last_name VARCHAR(80)
);

INSERT INTO movies_copy(title, release_date, rating, director_first_name, director_last_name)
VALUES("Sleepaway Camp", "1983-11-18", "6", "Robert", "Hiltzik"),
("Mirrors", "2008-08-15", "6", "Víctor", "García"),
("I Am Legend", "2007-12-14", "7", "Francis", "Lawrence"),
("Zombieland", "2009-10-02", "7", "Ruben", "Fleischer"),
("The Batman", "2022-03-04", "8", "Matt", "Reeves"),
("Suicide Squad 2", "2021-08-06", "7", "James", "Gunn"),
("Jason X", "2002-04-26", "4", "James", "Isaac"),
("Iron Man", "2008-05-02", "8", "Jon", "Favreau"),
("Halloween", "2018-10-19", "6", "Rob", "Zombie"),
("Demon Slayer: Kimetsu no Yaiba the Movie: Mugen Train", "2021-04-23", "8", "Haruo", "Sotozaki");

SELECT CONCAT(`director_first_name`, " " , `director_last_name`) AS "Full Name" , title, release_date, rating FROM movies_copy;

SELECT * FROM movies_copy
ORDER BY director_last_name ASC;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM movies_copy WHERE
REGEXP_LIKE (director_last_name, '[r-z]$','i');

SELECT * FROM movies_copy LIMIT 3;

-- ---------
-- VERY HARD
-- ----------

-- Copy the table from your Very Easy Challenge Write a query to add in three cars at once Write a query to add
-- in prices and colors for each of these cars Write a query to put the Make and Model together in one column
-- Create a new query that adds an additional column to the results to show how many cars have the same Make.

CREATE TABLE cars_copy(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
make VARCHAR(80),
model VARCHAR(80),
year INT
);

INSERT INTO cars_copy(make, model, year)
VALUES("Ford", "Mustang", 1999),
("Honda", "Civic", 2020),
("Tesla", "Model 3", 2018);

ALTER TABLE cars_copy
ADD COLUMN color VARCHAR(80),
ADD COLUMN price DECIMAL(8,2);

UPDATE cars_copy
SET color = "Blue", price = 500000.00
WHERE id = 1;

UPDATE cars_copy
SET color = "Red", price = 300000.00
WHERE id = 2;

UPDATE cars_copy
SET color = "White", price = 700000.00
WHERE id = 3;

SELECT CONCAT(`make`, " ", `model`) AS "Make / Model", year, color, price FROM cars_copy;

ALTER TABLE cars_copy
ADD COLUMN make_num INT;

-- UPDATE cars_copy
-- SET make_num
























