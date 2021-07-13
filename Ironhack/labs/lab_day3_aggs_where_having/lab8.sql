-- Lab | SQL Queries 8

-- 0 Inspect the database structure and find the best-fitting table to analyse for the next task.

-- 1 Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.

select *
from sakila.film;


select f.title, f.length, f.rank() over (order by f.length DESC) as ‘Rank’
from sakila.film f
where f.length <> ' ' or f.length is not null;


-- 2 Build on top of the previous query and rank films by length within the
-- rating category (filter out the rows that have nulls or 0s in length 
-- column). In your output, only select the columns title, length, 
-- rating and the rank.

select f.title, f.length, f.rating, rank() over (
       order by f.length DESC, f.rating) as ‘Rank’
from sakila.film f
where length <> ' ' or length is not null;


-- 3 How many films are there for each of the categories? Inspect the
-- database structure and use appropriate join to write this query.

-- option 1
select count(c.category_id) as n_categories
from sakila.film_category fc
join sakila.category c
on fc.category_id = c.category_id;

-- option 2
select count(c.category_id) as n_categories
from sakila.film_category fc, sakila.category c
where fc.category_id = c.category_id;


-- 4 Which actor has appeared in the most films?

-- option 1
select a.actor_id, a.first_name, a.last_name, count(fa.film_id) as actors
from sakila.film_actor fa
join sakila.actor a
on fa.actor_id = a.actor_id
group by a.actor_id, a.first_name, a.last_name
order by actors desc;

-- option 2
select a.actor_id, a.first_name, a.last_name, count(fa.film_id) as actors
from sakila.film_actor fa, sakila.actor a
where fa.actor_id = a.actor_id
group by a.actor_id, a.first_name, a.last_name
order by actors desc;


-- 5 Most active customer (the customer that has rented the most number of films)

-- option 1
select c.customer_id, c.first_name, c.last_name, count(i.film_id) as n_filmes
from sakila.rental r
join sakila.customer c
on r.customer_id = c.customer_id
join sakila.inventory i
on r.inventory_id = i.inventory_id
group by c.customer_id, c.first_name, c.last_name
order by n_filmes desc;

-- option 2
select c.customer_id, c.first_name, c.last_name, count(i.film_id) as n_filmes
from sakila.rental r, sakila.customer c, sakila.inventory i
where r.customer_id = c.customer_id and r.inventory_id = i.inventory_id
group by c.customer_id, c.first_name, c.last_name
order by n_filmes desc;



-- Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might 
-- require using more than one join statement. 
-- Give it a try. We will talk about queries with multiple join statements later in the lessons.
-- ???
select count(r.inventory_id) from sakila.rental r;

select i.inventory_id, i.film_id from sakila.inventory i;

select f.film_id, f.title from sakila.film f;

select f.film_id, f.title, i.inventory_id
from sakila.film f, sakila.inventory i
where f.film_id = i.film_id
and (select count(r.inventory_id) from sakila.rental r) ;

select t1.film_id, t1.title, t1.inventory_id, t1.film_id, max(r.inventory_id)
from sakila.rental r,
     (select f.film_id, f.title, i.inventory_id
     from sakila.film f, sakila.inventory i
     where f.film_id = i.film_id) t1 
where r.inventory_id = i. inventory_id;


-- Example of selfjoin
SELECT m1.title as movietitle , m1.released as movieyear , m2.title as sequeltitle, m2.released as sequelyear
FROM Harry.movies m1 
left join Harry.movies m2
on m1.sequel_id = m2.movie_id

SELECT s1.title, s2.title as sequel  
FROM movies s1, movies s2  
WHERE s1.sequel_id = s2.movie_id;
