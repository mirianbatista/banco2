--convert: converte no reusltado
select convert(varchar(10), venda)
from produto

--qd o convert for do tipo datetime, ele aceita um terceiro argumento
select convert(varchar(10), getdate(), 103)
from produto

print('Hoje � ' + convert(varchar(10), getdate(), 103) + ' ah que festaaaaaaa!')

--feio feinho
select getdate()

--fun��es agregadas s�o espec�ficas do select

--ltrim retira os espa�os � esquerda, rtrim � direita

--distinct tira os resultados repetidos

--like compara strings

--mostre os nomes dos funcion�rios que nasceram no ano de 1970, e que informaram
--o email. Ordene em ordem descendente pelo nome do funcion�rio.
select nome from funcionario
where datanasc between '01-01-1970' and '31-12-1970' and email is not null
order by nome desc
--ou
select nome from funcionario
where datepart(yy,datanasc)=1970 and email is not null
order by nome desc
--datepart � apenas do sqlserver, between � ANSI

--quais os nomes dos clientes, que s�o de Jo�o Pessoa ou recife, e que 
--fizeram pedido no primeiro semestre de 2017?
select c.nome
from cliente c, cidade ci, pedido p
where ci.codigo = c.cidade and c.codigo = p.cliente and ci.nome in('Jo�o Pessoa','Recife') 
and p.dataPedido between '01-01-2017' and '30-12-2017'

--quais s�o os dados dos funcion�rios cujo nome comece com a letra 'L'?
select *
from funcionario
where nome like 'L%'

--quais s�o os dados dos funcion�rios cujo nome termine com a letra 'a'?
select *
from funcionario
where nome like '%a'

