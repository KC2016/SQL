# 1- Lab | SQL Intro (Ironhack Bootcamp)

In this lab, you will be using the [Sakila](https://dev.mysql.com/doc/sakila/en/) database of movie rentals. You can follow the steps listed here to get the data locally: [Sakila sample database - installation](https://dev.mysql.com/doc/sakila/en/sakila-installation.html). You can work with two sql query files - `sakila-schema.sql` (creates the schema) + `sakila-data.sql` which inserts the data.

The ERD is pictured below - not all tables are shown, but many of the key fields you will be using are visible:

<br>

![DB schema](images/sakila_diagram.png)

<br><br>

### Instructions

1. Select all the actors with the first name ‘Scarlett’.
2. How many films (movies) are available for rent and how many films have been rented?
3. What are the shortest and longest movie duration? Name the values `max_duration` and `min_duration`.
4. What's the average movie duration expressed in format (hours, minutes)?
5. How many distinct (different) actors' last names are there?
6. Since how many days has the company been operating (check DATEDIFF() function)?
7. Show rental info with additional columns month and weekday. Get 20 results.
8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
9. How many rentals were in the last month of activity?

```
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
```

# 2.05 Activity 1

*(Some of the file names are not matching since the same exercises fall on different days in FT and PT bootcamp.)*

Keep working on the `bank` database. (_In case you need to load data again, refer to `files_for_lessons_and_activities` to get the database._)

#### Simple queries

1. Select districts and salaries (from the `district` table) where salary is greater than 10000. Return columns as `district_name` and `average_salary`.
2. Select those loans whose contract finished and were not paid. **Hint**: You should be looking at the `loan` column and you will need the extended case study information to tell you which value of status is required.
3. Select cards of type `junior`. Return just first 10 in your query.
4. Select those loans whose contract finished and not paid back. Return the debt value from the status you identified in the last activity, together with loan id and account id.
5. Calculate the urban population for all districts. Hint: You are looking for the number of inhabitants and the % of urban inhabitants in each district. Return columns as district_name and urban_population.
6. On the previous query result - rerun it but filtering out districts where the rural population is greater than 50%.


# 2.05 Activity 2

#### Simple queries

1. Get all junior cards issued last year. Hint: Use the numeric value (980000).

2. Get the first 10 transactions for withdrawals that are not in cash. You will need the extended case study information to tell you which values are required here, and you will need to refer to conditions on two columns.

3. Refine your query from last activity on loans whose contract finished and not paid back - filtered to loans where they were left with a debt bigger than 1000.
  Return the debt value together with loan id and account id. Sort by the highest debt value to the lowest.

4. Get the biggest and the smallest transaction with non-zero values in the database (use the trans table in the bank database).

5. Get account information with an extra column year showing the opening year as 'YY'. Eg., 1995 will show as 95. Hint: Look at the first two characters of the string date in the account table. You would have to use function `substr`. Google is your friend.

# 2.05 Activity 3

Keep working on the `bank` database. (_In case you need to load data again, refer to the previous lab and `files_for_activities` folder to get the database._)

#### Queries

1. Get `card_id` and `year_issued` for all **gold** cards.
2. When was the first gold card **issued**? (Year)
3. Get issue date as:

   - date_issued: 'November 7th, 1993'
   - fecha_emision: '07 of November of 1993'

# 2.05 Activity 4

- Null or empty values are usually a problem. Think about why those null values can appear and think of ways of dealing with them.
- Check for transactions with null or empty values for the column `amount`.
- Count how many transactions have empty and non-empty `k_symbol` (in one query).

# 2.07 Activity 1

Keep working on the `bank` database.

1. In the `loan` table (which is part of the `bank` database), there's column status A, B, C, and D. Using the `case` statement we will create a new column with the values there with a brief description:

    - 'A' : 'Good - Contract Finished'
    - 'B' : 'Defaulter - Contract Finished'
    - 'C' : 'Good - Contract Running'
    - 'D' : 'In Debt - Contract Running'


2. In the lesson, we talked about the reasons why normalization is critical in a database design. One of the reasons we talked about was data anomalies. We will discuss data anomalies in more detail in the next lesson. Here are a couple of resources that you can use to read more about data anomalies. Go through these links and then we will have a discussion in class:

    - https://beginnersbook.com/2015/05/normalization-in-dbms/
    - https://databasemanagement.fandom.com/wiki/Data_Anomalies


# 2.07 Activity 2

1. What could be possible anomalies in a table?

2. In the class, we looked at an example where the problem statement was -> "What is the average loan amount taken by customers in each of the status categories?     Arrange them from highest to lowest"
  The query is shown below:

    ```sql
    select avg(amount) as Average, status from bank.loan
    group by Status
    order by Average asc;
    ```

    Your objective is to find the **maximum** and the **minimum** in each `Status` category.

# 2.07 Activity 3

In this activity, we will be using the `bank` database.

1. Find out how many cards of each type have been issued.
2. Find out how many customers there are by the district.
3. Find out average transaction value by type.
4. As you might have seen in the query shown below, there are 19 rows returned by this query. But there a few places where the column `k_symbol` is an empty string. Your task it to use a filter to remove those rows of data. After the filter gets applied, you would see that the number of rows have reduced.

    ```sql
    select type, operation, k_symbol, round(avg(balance),2)
    from bank.trans
    group by type, operation, k_symbol
    order by type, operation, k_symbol;

# 2.07 Activity 4

Keep using the `bank` database.

1. Find the districts with more than 100 clients.
2. Find the transactions (type, operation) with a mean amount greater than 10000.





````
-- 2.05 Activity 2
-- 1. Get release years.
select * from bank.card
where type = "junior" and
convert(date(issue) = 980000,UNSIGNED INTEGER);



select account_id, trans_id,
date_format(convert(date,datetime), "%D-%M-%Y")
from bank.trans;


-- 2. Get all films with ARMAGEDDON in the title.
select *
from bank.trans
where type = "VYDAJ"   -- withdraw
and operation <> "VKLAD"   -- not in cash
limit 10;

-- 3. Get all films which title ends with APOLLO.
select loan_id, amount, payments
from bank.loan
where status="B"
and amount > 1000   -- contract finished and not paid back
order by amount desc;

-- 4. Get 10 the longest films.
select min(amount) as bigger_transaction,
       max(amount) as smaller_transaction
from bank.trans
where amount > 0;
```

```
2.6

Get release years.
Get all films with ARMAGEDDON in the title.
Get all films which title ends with APOLLO.
Get 10 the longest films.

How many films include Behind the Scenes content?
Drop column picture from staff.
A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
Use similar method to get inventory_id, film_id, and staff_id.

Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

Check if there are any non-active users
Create a table backup table as suggested
Insert the non active users in the table backup table
Delete the non active users from the table customer
```