with t4 as (select t2.product_category_name,
    1 as flag_categoria
from tb_order_items as t1
left join tb_products as t2
on t1.product_id = t2.product_id
group by t2.product_category_name
order by count(*) desc
limit 3)


select * from t4