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

