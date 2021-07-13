-- Lab | SQL Joins on multiple tables

-- 1 Using multiple JOIN() clauses display the store ID, city, and country 
-- of each store.
use sakila;
select s.store_id, c.city, co.country
from store s
join address a on a.address_id = s.address_id
join city c on c.city_id = a.city_id
join country co on co.country_id = c.country_id;

-- 2 
use sakila;
select s.store_id, sum(p.amount) as total_payment_amount
from store s
join staff st on st.store_id = s.store_id
join payment p on st.staff_id = p.staff_id
group by s.store_id;

-- 3 What is the average film length per each category?
-- Which category of films are the longest?
use sakila;
select c.name, avg(f.length) as avg_len
from film_category fc
join category c on c.category_id = fc.category_id
join film f on f.film_id = fc.film_id
group by c.name
order by avg_len desc;

-- 4 Display the 2 most frequently rented movies 
-- in descending order.
use sakila;
select f.title, count(r.rental_id)
from inventory i
join rental r on r.inventory_id = i.inventory_id
join film f on f.film_id = i.film_id
group by f.title
order by 2 desc
limit 2;


-- 5 Display the top 5 categories with highest revenue 
-- (payment amount) in descending order.

-- START USING RENTAL, BECAUSE THE PAYMENT

use sakila;
select sum(p.amount) as volum_amount
from film_category fc

join category c 
on c.category_id = fc.category_id

join film f 
on f.film_id = fc.film_id

join inventory i 
on i.film_id = i.film_id

join rental r 
on i.inventory_id = i.inventory_id

join payment p 
on p.rental_id = r.rental_id

order by volum_amount desc
limit 5;

SELECT
	name AS categoty,
	SUM(amount) AS 'gross revenue
FROM sakila.payment
	JOIN (sakila.rental
		JOIN (sakila.inventory
			JOIN (sakila.film_category
				JOIN sakila.category USING (category_id))
			USING (film_id))
		USING (inventory_id))
	USING (rental_id)
GROUP BY category_id
ORDER BY `gross revenue` DESC
LIMIT 5;


-- 6 Is the Academy Dinosaur movie available for rent from Store 1?
use sakila;
select * from inventory;
select f.title, i.store_id
from inventory i
join store s on s.store_id = i.store_id
join film f on i.film_id = f.film_id
where title = 'Academy Dinosaur' and s.store_id = 1;


-- If yes, display the title, store_id and 
-- inventory_id of the available copies of that movie.

use sakila;
select f.title, s.store_id, sum(i.inventory_id) as n_copies
from inventory i
join store s on s.store_id = i.store_id
join film f on i.film_id = f.film_id
where title = 'Academy Dinosaur' and s.store_id = 1
group by f.title, s.store_id;


