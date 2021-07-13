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
