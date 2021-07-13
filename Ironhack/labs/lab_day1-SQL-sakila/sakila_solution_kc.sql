
-- 1. Review the tables in the database.
show tables;

-- 2. Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from actor;
select title from film where title = "AFRICAN EGG";

-- 3. Select one column from a table. Get film titles.
select * from film;

-- 4. Select one column from a table and alias it. Get unique list of film languages under the alias language. 
-- Note that we are not asking you to obtain the language per each film, but this is a good time to think about 
-- how you might get that information in the future.
select * from language;
select distinct(l.name)as language  from language l;

-- 5. Using the select statements and reviewing how many records are returned, can you find out how many stores and staff does the company have? Can you return a list of employee first names only?
select count(*) as n_of_records, count(store_id) as n_of_stores, count(staff_id) as n_of_staff
from staff;
select first_name from staff;
select count(actor_id) as n_of_actors from actor;

-- 6.Bonus: How many unique days did customers rent movies in this dataset?
select count(distinct(rental_date)) as n_rental_days from rental;