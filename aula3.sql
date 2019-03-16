/*nome dos clientes e das cidades q eles moram*/
select c.nome as cliente, ci.nome as cidade
from cliente c join cidade ci on ci.codigo = c.cidade

/*nome dos clientes e das cidades q eles moram. 
mostre as cidades mesmo qn tenham clientes morando nelas*/
select c.nome as cliente, ci.nome as cidade
from cliente c right join cidade ci on ci.codigo = c.cidade

/*mostre o produto mais caro*/
select nome
from produto
where venda in (select max(venda) from produto)

--quais os nomes dos clientes que realizaram pedidos em 2018?
select nome 
from cliente 
where codigo in (select cliente from pedido where datepart (yy, datapedido) = 2018)

