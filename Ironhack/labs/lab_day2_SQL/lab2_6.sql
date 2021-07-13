-- Lab | SQL Queries - Lesson 2.6

-- 1 Get release years
select release_year from sakila.film;

-- Get all films with ARMAGEDDON in the title.
select title from sakila.film
where title like '%ARMAGEDDON%';

-- 3 Get all films which title ends with APOLLO.
select title from sakila.film
where title like '%APOLLO';

-- 4 Get 10 the longest films.
select film_id, title, length from sakila.film
group by film_id, title
order by length desc
limit 1;

-- 5 How many films include Behind the Scenes content?
select * from sakila.film
where special_features like "Behind the Scenes";

-- 6 Drop column picture from staff.
select * from sakila.staff;
ALTER TABLE sakila.staff
DROP COLUMN picture;

-- 7 A new person is hired to help Jon. 
-- Her name is TAMMY SANDERS, and she is a customer. 
-- Update the database accordingly.
INSERT INTO sakila.customer(first_name,last_name) VALUES ('TAMMY','SANDERS');

select * from sakila.customer;
where first_name='Jon';

-- 8 Add rental for movie "Academy Dinosaur" by Charlotte Hunter 
-- from Mike Hillyer at Store 1. You can use current date for the 
-- rental_date column in the rental table. Hint: Check the columns i
-- n the table rental and see what information you would need to add there. 
-- You can query those pieces of information. 
-- For eg., you would notice that you need customer_id information as well. 
-- To get that you can use the following query:
-- select customer_id from sakila.customer
-- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- Use similar method to get inventory_id, film_id, and staff_id.

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; -- 130
select film_id from sakila.film
where title = 'Academy Dinosaur';   -- 1

select * from sakila.staff;
select staff_id from sakila.staff
where first_name = 'Mike' and last_name='Hillyer';  -- 1

select max(inventory_id) from sakila.inventory; -- max 4581
select max(rental_id) from sakila.rental; -- max 16049

insert into sakila.inventory(inventory_id) values('4582');

insert into sakila.rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values('16050','2021-04-08', '4582','130', null,'1','2021-04-08');



-- 9 Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, 
-- and the date for the users that would be deleted. Follow these steps:

-- Check if there are any non-active users
-- Create a table backup table as suggested
-- Insert the non active users in the table backup table
-- Delete the non active users from the table customer







