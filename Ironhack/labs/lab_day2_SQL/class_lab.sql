select * 
from bank.order o
where o.amount>1000 and o.k_symbol='SIPO'
order by o.amount desc
limit 50;


select *, round((l.amount/l.payments) * 100,2) as "balance%"
from bank.loan as l;


-- 2.05 Activity1
-- https://github.com/ironhack-edu/data_case_study_2/blob/master/case_study_extended.pdf
-- 01
select A2 as district_name, A11 as average_salaries
from bank.district
where A11 > 10000;
-- 02
select * from bank.loan l
where status='B';
-- 03
select * from bank.card
where type = 'junior'
limit 10;
-- 04
select * from bank.loan;
select loan_id, account_id, amount
from loan
where status='B';
-- 05
select A2 as district_name, sum(A4) as urban_population
from bank.district
group by 1;
-- 06 
select A2 as district_name, sum(A4) as urban_population
from bank.district
where A10 <= 50.0
group by 1;

-- 2.05 Activity 2
-- 1 ?????   IN DEVELOPMENT
select * from bank.card
where type = "junior" and 
convert(date(issue) = 980000,UNSIGNED INTEGER);



select account_id, trans_id, 
date_format(convert(date,datetime), "%D-%M-%Y") 
from bank.trans;




-- 2
select *
from bank.trans
where type = "VYDAJ"   -- withdraw
and operation <> "VKLAD"   -- not in cash
limit 10;

-- 3
select loan_id, amount, payments
from bank.loan
where status="B"
and amount > 1000   -- contract finished and not paid back 
order by amount desc;

-- 4
select min(amount) as bigger_transaction,
       max(amount) as smaller_transaction
from bank.trans
where amount > 0;

-- 5 IN DEVELOPMENT


select * from bank.trans;

--  FROM LAB
-- what is the avg movie duration expressed in format (hours, minutes)?
select floor(avg(length/60)) + avg(length)%60 as avgdur
from sakila.film f
order by length;

-- last month of rental
-- find the month with the max value
select rental_id, date_format(rental_date, '%m') as monthren from sakila.rental;


-- CLASS
-- aggregates sum, min, max, count, avg, distinct
select account_id, sum(amount) from bank.loan
group by account_id
order by account_id;

select year(max(r.rental_date)) as lastrent_year, month(max(r.rental_date)) as lastrent_month from sakila.rental as r;

select sum(payments) from bank.loan;


select status, avg(payments) from bank.loan
group by status order by status;

select round(avg(l.payments),2) as avgpaid, l.status, l.duration from bank.loan l
group by l.status, l.duration;

select round(avg(l.amount-l.payments),2) as avgbal, l.status, l.duration 
from bank.loan l
where l.status in ('B','D')
group by l.status, l.duration
order by l.status, l.duration;

select round(avg(l.amount-l.payments),2) as avgbal, l.status, l.duration 
from bank.loan l
where l.status not in ('B','D') -- where l.status <>  'A' and l.status <>  'B' 
group by l.duration, l.status
order by l.duration, l.status;

SELECT addate(day,6,curdate()) as return_date; -- CHECK
-- SELECT date_add(day,6,curdate()) as return_date;


-- 1. how many days has the company been operating (DATEDIFF())?

-- 3
select datediff(min(rental_date), max(rental_date)) as operatingdur
from sakila.rental;

select datediff(day, max(rental_date), min(rental_date)) as operatingdur
from sakila.rental;



-- 2.07 Activity 3
-- source
-- https://github.com/ironhack-edu/%C3%A5/blob/master/lesson_2.07_activity_3.md

-- 1 Find out how many cards of each type have been issued.
select c.type, count(c.type) as n_types
from bank.card c
group by type;

-- 2 Find out how many customers there are by the district.
select d.A3, count(d.A4) as n_cust_dist
from bank.district d
group by 1;

-- 3 Find out average transaction value by type.
select avg(t.amount) as avg_trans, t.type 
from bank.trans t
group by t.type;

-- 4 As you might have seen in the query shown below, 
-- there are 19 rows returned by this query. 
-- But there a few places where the column k_symbol
-- is an empty string. Your task it to use a filter 
-- to remove those rows of data. After the filter gets 
-- applied, you would see that the number of rows have reduced.
-- original
select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
group by type, operation, k_symbol
order by type, operation, k_symbol;

-- solution
select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
where k_symbol <> ' ' -- there are spaces, they are not null
group by type, operation, k_symbol
order by type, operation, k_symbol;


-- CLASS
-- errors
-- 1111: invalid use of group by
-- 1054 

select c.district_id, count(*) as num_customers
from bank.client c
group by c.district_id 
having count(*) > 100
order by num_customers desc

-- CHECK, NOT WORKING
select l.loan_id, round(l.amount - l.payment,2) as bal
from bank.loan as l
where round(l.amount-l.payment,2) > 10000
group by l.account_id;


select  account_id, sum(round(amount-payments,2)) as bal
from loan 
where round(amount-payments,2) > 10000
group by account_id
having sum(round(amount-payments,2)) > 22000;

select l.duration,  sum(l.amount-l.payments) as totalbal
from bank.loan l
where  l.status in ('B','D')
group by l.duration
having  totalbal > 1000000;
-- having  sum(l.amount-l.payments) > 10000000;

select l.duration, sum(l.amount-l.payments) as totalbal
from bank.loan l 
where l.status in ('B','D') 
group by l.duration 
having totalbal > 1000000;

select * from bank.loan as l;

if(condition, value_if_true, value_if_false)


select * from bank.loan;


-- CHECK
select loan_id, account_id, amount, payment, duration, (amount-payment) as bal, 
round(avg(amount-payments) over (partition by duration) ) as 'avg_bal'
from bank.loan l
where amount > 100000
order by duration, bal desc;



