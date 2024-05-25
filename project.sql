CREATE DATABASE bollywood_movies;
USE bollywood_movies;

CREATE TABLE actor (
	actorId INT PRIMARY KEY,
    actorName VARCHAR(100),
    movieCount INT,
    ratingSum INT,
    normalizedMovieRank INT,
    googleHits INT,
    normalizedGoogleRank INT,
    normalizedRating INT
);

LOAD DATA INFILE "actor.csv"
INTO TABLE actor
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE director (
	directorId INT PRIMARY KEY,
    directorName VARCHAR(100),
    movieCount INT,
    ratingSum INT,
    normalizedMovieRank INT,
    googleHits INT,
    normalizedGoogleRank INT,
    normalizedRating INT
);

LOAD DATA INFILE "director.csv"
INTO TABLE director
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE movie (
	imdbId VARCHAR(100) PRIMARY KEY,
    title VARCHAR(100),
    releaseYear INT,
    releaseDate DATE,
    genre VARCHAR(100),
    writers VARCHAR(600),
    actors VARCHAR(200),
    directors VARCHAR(600),
    sequel INT,
    hitFlop INT,
    first_lead_actor VARCHAR(100),
    second_lead_actor VARCHAR(100)
);

LOAD DATA INFILE "movie.csv"
INTO TABLE movie
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DESCRIBE actor;
SHOW COLUMNS FROM director;
DESCRIBE movie;
SELECT * FROM actor;
SELECT * FROM director;
SELECT * FROM movie;
 
 -- Find the total number of movies in the dataset.
SELECT COUNT(*) AS totalMovies FROM movie;

-- Count the number of movies in each hit/flop category.
SELECT hitFlop, COUNT(*) AS count
FROM movie
GROUP BY hitFlop
ORDER BY count ASC;

-- Identify the top 10 directors with the highest number of blockbuster movies.
 SELECT directors, COUNT(*) AS blockbusterCount
 FROM movie
 WHERE hitflop >= 8
 GROUP BY directors
 ORDER BY blockbusterCount DESC
 LIMIT 10;
 
 -- Determine the most common genres among hit movies.
SELECT genre, COUNT(*) AS  hitCount
FROM movie
WHERE hitFlop > 6
GROUP BY genre
ORDER BY hitCount DESC;

