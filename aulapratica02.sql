

/* a) Exibir c�digo e nome de todos os funcion�rios que tenham �Silva� em qualquer parte do
nome*/  
select codigo, nome
from funcionario
where nome like'%silva%'
               
			   
/* b) Exibir c�digo e nome de todos os funcion�rios que tenham o nome come�ado por �Mar�,
seguido de um caractere qualquer entre �i� e �t�, logo depois a vogal �a�, mais uma
seq��ncia qualquer de caracteres*/
select codigo, nome
from funcionario
where nome like'Mar[i-t]a%'   

/*c) Exibir c�digo e nome de todos os clientes cujo nome n�o comece por �L� nem por �M�+*/
select codigo, nome
from cliente
where nome not like '[LM]%' 

/*d) Exibir a quantidade de produtos vendidos com pre�o de venda maior que R$ 10,00.*/  
select count (*)
from produto pr, itens i
where pr.codigo = i.produto and pr.venda > 10
/* com join*/
select count (*)
from produto pr join itens i on pr.codigo = i.produto
where pr.venda > 10

/*e) Mostre os nomes e as cidades que nasceram os funcion�rios que realizaram pedidos de
Liquidificador.*/
select f.nome, cid.nome
from cidade cid join funcionario f on cid.codigo = f.naturalidade 
join pedido pe on f.codigo = pe.vendedor join itens i on pe.codigo = i.pedido
join produto pr on pr.codigo = i.produto
where pr.nome = 'Liquidificador'
/*sem join*/
select f.nome, ci.nome
from cidade ci, funcionario f, pedido pe, itens i, produto pr
where ci.codigo = f.naturalidade and
	  f.codigo = pe.vendedor and
	  pe.codigo = i.pedido and
	  pr.codigo = i.produto and
	  pr.nome = 'Liquidificador'

/*f) Exiba nome e tipo dos clientes que foram atendidos por funcion�rios que n�o moram no
Bessa nem em Mana�ra.*/
select c.nome, c.tipo
from cliente c join pedido pe on c.codigo = pe.cliente
	 join funcionario f on f.codigo = pe.vendedor
where f.bairro not in ('Bessa', 'Manaira')

/*g) Mostre o nome dos funcion�rios que realizaram algum pedido para clientes com c�digo 1, 2
e 3.*/
select f.nome
from pedido pe join funcionario f on f.codigo = pe.vendedor
where pe.cliente in (1,2,3)
                   