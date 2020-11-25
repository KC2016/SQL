

SELECT t1.product_id, 
       t1.product_category_name, 
       t1.product_photos_qty
FROM tb_products AS t1
WHERE (t1.product_category_name = 'bebes'
   AND t1.product_photos_qty >1)
   OR (t1.product_category_name = 'perfumaria'
AND product_photos_qty > 5)

