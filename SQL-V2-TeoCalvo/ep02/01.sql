select seller_state,
       count(*) as qty_sellers
from tb_sellers
group by seller_state

