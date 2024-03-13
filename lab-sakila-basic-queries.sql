USE sakila;

-- 1. Display all available tables in the Sakila database.
SHOW TABLES;
-- =====================================================================================================================================

-- 2. Retrieve all the data from the tables actor, film and customer.

SELECT * FROM sakila.actor;
SELECT * FROM sakila.film;
SELECT * FROM sakila.customer;

-- =====================================================================================================================================
-- 3. Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
-- 3.2 List of languages used in films, with the column aliased as language from the language table
-- 3.3 List of first names of all employees from the staff table

SELECT title FROM sakila.film;
SELECT name AS 'language' FROM sakila.language;
SELECT first_name FROM sakila.staff;

-- =====================================================================================================================================

-- 4. Retrieve unique release years.

SELECT DISTINCT release_year FROM sakila.film;

-- =====================================================================================================================================
-- 5. Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.
-- 5.2 Determine the number of employees that the company has.
-- 5.3 Determine how many films are available for rent and how many have been rented.
-- 5.4 Determine the number of distinct last names of the actors in the database.

SELECT COUNT(store_id) FROM sakila.store;  -- 2 stores but 600 cities..

SELECT COUNT(staff_id) FROM sakila.staff;  -- 2 employees

SELECT COUNT(DISTINCT film_id) FROM sakila.inventory;  -- there are 958 films available for rent in the inventory (without considering duplicates)
SELECT COUNT(film_id) FROM sakila.inventory; -- there are 4581 films (considering duplicates available in different stores)

SELECT COUNT(DISTINCT inventory_id) FROM sakila.rental;  -- 4580 films have been rented

SELECT COUNT(DISTINCT last_name) FROM sakila.actor;  -- 121 distinct last names of the actors

-- =====================================================================================================================================

-- 6. Retrieve the 10 longest films.
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- =====================================================================================================================================

-- 7. Use filtering techniques in order to:

-- 7.1 retrieve all actors with the first name "SCARLETT".

SELECT * FROM sakila.actor
WHERE first_name = "SCARLETT";

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.

SELECT * FROM sakila.film
WHERE title LIKE "ARMAGEDDON%" AND length > 100;  -- the only film having in the title "ARMAGEDDON" has a duration of 99 minutes

-- 7.3 Determine the number of films that include Behind the Scenes content

SELECT * FROM sakila.film
WHERE special_features IN ("Behind the Scenes");

