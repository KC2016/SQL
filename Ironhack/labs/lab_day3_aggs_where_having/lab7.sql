-- Lab | SQL Queries 7

-- 1 In the actor table, 
-- which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor 
-- by last_name, you would see that there is 
--  Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. 
-- So we do not want to include this last name in our output.
-- Last name "Astaire" is present only one time with actor 
-- "Angelina Astaire", 
--  we would want this in our output list.

* from sakila.actor as a ;

-- option1
WITH T AS
(
SELECT *, 
       COUNT(*) OVER (PARTITION BY last_name) as cnt
FROM sakila.actor
)
SELECT * /*TODO: Add column list. Don't use "*"                   */
FROM T
WHERE cnt = 1;

-- option2

SELECT last_name, COUNT(*)
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) =1 ;

-- 2 Which last names appear more than once? 
-- We would use the same logic as in the previous 
-- question but this time we want to include the last 
-- names of the actors where the last name was present 
-- more than once.

SELECT last_name, COUNT(*)
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- 3 Using the rental table, find out how many rentals 
-- were processed by each employee.
select * from sakila.rental as r ;

select count(*), r.staff_id
from sakila.rental as r
group by r.staff_id;

-- 4 Using the film table, find out how many films were released 
-- each year
select * from sakila.film ;

select release_year, count(*) as n_movies
from sakila.film as f
group by release_year;

-- 5 Using the film table, find out for each rating how many films 
-- were there.
select rating, count(*) as n_movies_rating
from sakila.film as f
group by rating;

-- 6 What is the average length of films for each rating? 
-- Round off the average lengths to two decimal places

select rating, round(avg(length),2) as avg_length
from sakila.film as f
group by rating;


-- 7 Which kind of movies (based on rating) have an average 
-- duration of two hours or more?

select rating, avg(length) as avg_length
from sakila.film as f
group by rating
having avg(length) > 120.0;



select * from sakila.film ;



