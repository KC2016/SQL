
SELECT COUNT(*), 
    COUNT(product_id), 
    COUNT(DISTINCT product_id)
FROM tb_products
WHERE product_category_name = 'artes';

SELECT COUNT (product_id )
FROM tb_products
WHERE product_weight_g > 5000;
 
SELECT *,
       (product_length_cm * product_height_cm * product_width_cm)/1000000 AS product_volum_m3
FROM tb_products;

SELECT COUNT(*)
FROM tb_products
WHERE product_category_name = 'beleza_saude' 
AND product_weight_g < 1000;

-- Ex1: Quantos produtos temos da categoria 'artes'?
-- Ex2: Quantos produtos tem mais de 5 litros?
-- Ex3: Crie uma coluna nova que contenha a informação de volume em m3
-- Ex4: Quantos produtos de 'beleza_saude' com menos de 1 litro? /*