select * from loan;

select account_id as account, duration as dur, status 
from loan
where status = 'A';

select count(*) from loan;
select count(*) from trans;

select "Hello World";
select 25+32 ;

select distinct(type) from card;

select * from card;

select distinct(*) from account, card, client,disp,
district,order,trans ;

Select distinct c.type as id from card as c;

select d.A2 as district_name, d.A3 as region 
from district d
order by district_name ASC
limit 30;

show tables;