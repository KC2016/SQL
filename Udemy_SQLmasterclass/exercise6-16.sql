/* exercise 6
1. In the database Supermart_DB, find the following
a. Get the list of all cities where the region is South or east without any
duplicates using IN statement
b. Get the list of all orders where the ‘sales’ value is between 100 and
500 using the BETWEEN operator
c. Get the list of customers whose last name contains only 4 characters
using like
*/

select distinct city, region
from customer 
where region in ('North', 'East')
group by region, city;

-- soluction
-- select distinct city from customer where region in ('South','East');

select *
from sales
where sales between 100 and 500;

-- soluction
-- select * from sales where sales between 100 and 500;

select customer_id, customer_name
from customer
where customer_name like '% ____';

-- soluction
-- select * from customer where customer_name like '% ____';

/* exercise 7
1. Retrieve all orders where ‘discount’ value is greater than zero ordered
in descending order basis ‘discount’ value
2. Limit the number of results in above query to top 10 */

select *
from sales
where discount > 0
order by discount desc;

select *
from sales
where discount > 0
order by discount desc
limit 10;
/* exercise 8
1. Find the sum of all ‘sales’ values.
2. Find count of the number of customers in north region with age
between 20 and 30
3. Find the average age of East region customers
4. Find the Minimum and Maximum aged customer from Philadelphia
*/

select sum(sales) from sales; -- 2297200.86

select count(customer_id) 
from customer
where region= 'North' and age between 20 and 30; -- 0

-- soluction: I desagree because it does not consider the North region as required
-- select count(*) from customer where age between 20 and 30;--150
-- I could say 
select count(*) from customer where region= 'North'and age between 20 and 30; -- 0

select avg(age) 
from customer
where region = 'East'; -- 44.33

select city, min(age) as younger, max(age) as older
from customer 
where city='Philadelphia'
group by city; -- 70, 18

-- soluction:
-- select min (age) as min_age , max(age) as max_age from customer
-- where city = 'Philadelphia';--18,70
 

select * from sales;

/* 
exercise 9
1. Make a dashboard showing the following figures for each product ID
a) Total sales (in $) order by this column in descending
b) Total sales quantity
c) Number of orders
d) Max Sales value
e) Min Sales value
f) Average sales value
2. Get the list of product ID’s where the quantity of product sold is greater than 10
*/

select product_id, 
	sum(sales) as total_sales, 
	sum(quantity) as total_quantity, 
	count(order_id) as total_orders, 
	min(sales) as min_sales,
	max(sales) as max_sales, 
	avg(sales) as avg_sales
from sales 
group by product_id 
order by total_sales desc;

select product_id, 
	sum(quantity) as total_quantity 
from sales 
group by product_id
having sum(quantity) > 10;

-- lessons
create table sales_2015 as select * from sales where ship_date between '2015-01-01'and '2015-12-31';

select * from sales_2015;

select count (*) from sales_2015;

select count(distinct customer_id) from sales_2015;

create table customer_20_60 as select * from customer where age between 20 and 60;

select * from customer_20_60;

select * from sales_2015;

/* exercise 10
1. Find the total sales done in every state for customer_20_60 and
sales_2015 table
Hint: Use Joins and Group By command
2. Get data containing Product_id, product name, category, total sales
value of that product and total quantity sold. (Use sales and product
table)
*/

select t1.state, sum(t2.sales) as total_sales 
from sales_2015 as t1 
left join customer_20_60 as t2 
on t1.customer_id = t2.customer_id 
group by state;

-- soluction:
-- select b.state, sum(sales) as total_sales
-- from sales_2015 as a left join customer_20_60 as b
-- on a.customer_id = b.customer_id
-- group by b.state;

-- select count(*) from customer_20_60; -- 597
-- select count(*) from sales_2015; -- 2131

select t1.product_id, 
	t1.product_name, 
	t1.category, 
	sum(t2.sales) as total_sales_value, 
	count(t2.sales) as number_sales 
from product as t1 left join sales as t2 on t1.product_id=t2.product_id 
group by t1.product_id;

-- oficial solution: I desagree because the question does not ask for the sub_category
-- select a.*, sum(b.sales) as total_sales, sum(quantity) as total_quantity
-- from product as a left join sales as b
-- on a.product_id = b.product_id
-- group by a.product_id;

-- from lesson 
select * from sales where customer_id in (select customer_id from customer where age > 60);

/* exercise 11
1. Get data with all columns of sales table, and customer name, customer
age, product name and category are in the same result set. (use JOIN in
subquery)
*/

with t4 as (
select sales.*, customer.customer_name, customer.age, product.product_name, product.category
from sales left join customer on sales.customer_id = customer.customer_id 
left join product  on sales.product_id = product.product_id)
select * from t4;

-- select count(*) from t4; -- 9994

-- Solution  (these seems better)
select c.customer_name, c.age, sp.* 
from customer as c
right join (select s.*, p.product_name, p.category
from sales as s
left join product as p
on s.product_id = p.product_id) as sp
on c.customer_id = sp.customer_id

-- with t5 as (
-- select c.customer_name, c.age, sp.* from
-- customer as c
-- right join (select s.*, p.product_name, p.category
-- from sales as s
-- left join product as p
-- on s.product_id = p.product_id) as sp
-- on c.customer_id = sp.customer_id)

-- select count(*) from t5; -- 994

select * from customer;
select * from product;
select * from sales;

/* exercise 12:
1. Create a View which contains order_line, Product_id, sales and discount
value of the first order date in the sales table and name it as
“Daily_Billing”
2. Delete this View */
select * from sales;

create view daily_billing as
select order_line, product_id, sales, discount
from sales
where order_date in (select max(order_date) from sales;


drop view daily_billing;

/* exercise 13 
1. Find Maximum length of characters in the Product name string from Product table
2. Retrieve product name, sub-category and category from Product table and an
additional column named “product_details” which contains a concatenated string of
product name, sub-category and category
3. Analyze the product_id column and take out the three parts composing the product_id
in three different columns
4. List down comma separated product name where sub-category is either Chairs or
tables */

select * from product;

select max(length(product_name)) from product;

select product_name, 
	sub_category, 
	category,
	(product_name ||', ' ||  sub_category || ', ' || category) as product_details
from product; 


select product_id, substring(product_id for 3) as category_short, substring(product_id from 5 for 3)

select product_id, 
	substring(product_id for 3) as category_short, 
	substring(product_id from 5 for 2) as sub_short, 
	substring(product_id from 8) as id 
from product;

select string_agg(product_name,',') from product where sub_category in ('Chairs', 'Tables');

/*
exercise 14
1. You are running a lottery for your customers. So, pick a list of 5 Lucky customers from
customer table using random function
2. Suppose you cannot charge the customer in fraction points. So, for sales value of 1.63,
you will get either 1 or 2. In such a scenario, find out
a) Total sales revenue if you are charging the lower integer value of sales always
b) Total sales revenue if you are charging the higher integer value of sales always
c) Total sales revenue if you are rounding-off the sales always
*/

select customer_id, random() as random_n 
from customer
order by random_n  limit 5;

select sum(floor(sales)) as lower_int_sales, 
	sum(ceil(sales)) as higher_int_sales, 
	sum(round(sales)) as round_int_sales 
from sales
group by sales;

select * from sales;
select * from customer;

-- lessons
select power(age,2), age from customer;
select current_date, current_time, current_time(1), current_time(3), current_timestamp;
select age('2018-12-27', '2017-06-03');
select order_line,
	ship_date,
	order_date,
	age(ship_date, order_date) as time_taken
from sales 
order by time_taken desc;

select extract(day from current_date);
select current_timestamp, extract(hour from current_timestamp);

select order_date,
	ship_date,
	extract (epoch from ship_date) - extract(epoch from order_date) as sec_taken
from sales;


/* exercise 15
-- 1. Find out the current age of “Batman” who was born on “April 6, 1939” in Years, months
-- and days
-- 2. Analyze and find out the monthly sales of sub-category chair. Do you observe any
-- seasonality in sales of this sub-category */

select age(timestamp '1939-04-06');

-- soluction:
-- select age(current_date,'1939-04-06');

select extract(month from order_date) as month_n, sum(sales) as total_sales from sales
where product_id in (select product_id from product where sub_category = 'Chairs')
group by month_n
order by month_n ;

/* -- 1. Find out all customers who have first name and last name of 5 characters each and last
name starts with “a/b/c/d”
2. Create a table “zipcode” and insert the below data in it
PIN/ZIP codes
234432
23345
sdfe4
123&3
67424
7895432
12312
Find out the valid zipcodes from this table (5 or 6 Numeric characters) */

select * 
from customer
where customer_name ~* '^[a-z]{5}\s(a|b|c|d)[a-z]{4}$';

create table zipcode(zip varchar);
insert into zipcode values('234432');
insert into zipcode values('23345');
insert into zipcode values('sdfe4');
insert into zipcode values('123&3');
insert into zipcode values('67424');
insert into zipcode values('7895432');
insert into zipcode values('12312');

select * from zipcode
where zip ~* '^[0-9]{5,6}$';

-- lesson
select current_date;
select current_time;
select current_time(1);
select current_timestamp;

select age('2014-04-25', '2014-01-01');

select order_line, 
	order_date, 
	ship_date, 
	age(ship_date, 
	order_date) as  time_taken
from sales 
order by time_taken desc;

select extract(day from '2014-04-25'); -- does not work, I fix it below

SELECT EXTRACT(day from date '2014-04-25');

select extract (day from timestamp '2014-04-25 08:44:21');

-- example SELECT to_char('2016-08-12 16:40:32'::timestamp, 'DD Mon YYYY HH:MI:SSPM')

-- SELECT EXTRACT(YEAR FROM TIMESTAMP '2016-12-31 13:30:15');

SELECT EXTRACT(minute from time '08:44:21');

SELECT ship_date, order_date,
	extract ((epoch from ship_date) - (epoch from order_date)) 
FROM sales;    -- this suggestion from the Q/A did not work.

select extract(epoch from order_date) as seconds_order,
extract(epoch from ship_date) as seconds_ship,
extract(epoch from ship_date) - extract(epoch from order_date) as seconds_between_order_ship
from sales;

select date_part('second', (ship_date::date - order_date::date)) from sales;

SELECT ship_date, order_date,
	extract (('epoch' from (ship_date::date) - ('epoch' from (order_date::date))) 
FROM sales;    -- 

SELECT EXTRACT(EPOCH FROM TIMESTAMP '2016-12-31 13:30:15');

select extract('epoch' from ('2013-12-31'::date) - ('2013-12-31'::date - '5184000 seconds'::interval))
			
SELECT sales, TO_CHAR(sales, '9999.99') FROM sales;
SELECT sales, TO_CHAR(sales, 'L9,999.99') FROM sales;
SELECT order_date, TO_CHAR(order_date, 'MMDDYY') FROM sales;
SELECT order_date, TO_CHAR(order_date, 'Month DD, YYYY') FROM sales;
SELECT TO_DATE('2014/04/25', 'YYYY/MM/DD');
SELECT TO_DATE('033114', 'MMDDYY');
SELECT TO_NUMBER ('1210.73', '9999.99');
SELECT TO_NUMBER ('$1,210.73', 'L9,999.99');

explain select * from customer;
explain select distinct * from customer;
create schema test;
