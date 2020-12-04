select distinct
           coalesce(product_category_name, 'outros') as categoria_fillna

from tb_products

-- qdo encontrar um null value na coluna product_categoty_name, 
-- vai preencher com öutros" e salvar como categoria_fillna */