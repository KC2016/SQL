/* Tarefa!!
Ex1. Faça uma query que apresente o tamanho médio, 
máximo e mínimo da descrição do objeto por categoria

Ex2. Faça uma query que apresente o tamanho médio, 
máximo e mínimo do nome do objeto por categoria

Ex3. Faça uma query que apresente o tamanho médio, 
máximo e mínimo do nome do objeto por categoria. 
Considere apenas os objetos que tenham a descrição 
maior ou igual a 100.

Ex4. Faça uma query que apresente o tamanho médio, 
máximo e mínimo do nome do objeto por categoria. 
Considere apenas os objetos que tenham a descrição 
maior que 100. Exiba apenas as categorias com tamanho 
médio de descrição do objeto maior que 500 caracteres. */

select product_category_name,
       avg(product_description_lenght), 
       max(product_description_lenght), 
       min(product_description_lenght)
from tb_products
group by product_category_name;

select product_category_name,
       avg(product_name_lenght),
       max(product_name_lenght), 
       min(product_name_lenght)
from tb_products
group by product_category_name;

select avg(product_name_lenght), 
       max(product_name_lenght), 
       min(product_name_lenght)
from tb_products
where product_description_lenght >= 100
group by product_category_name;

select avg(product_name_lenght), 
       max(product_name_lenght), 
       min(product_name_lenght)
from tb_products
where product_description_lenght > 100
group by product_category_name
having avg(product_description_lenght) > 500;


/* NAO FUNCIONOU NO MAC selecionar o q quero cometar, seleciono 
ctl+shift+a e se repetir a selecao ele tira o comentario */

/* NAO FUNCIONOU NO MAC para escrever uma coisa em varias linhas : seleciono o 
local onde quero inserir algo, seguro a tecla alt e
 seleciono outras linhas e escrevo*/

/* em sql, comentarios na ultima linha precisam estar entre 
parenteses e asteristicos */