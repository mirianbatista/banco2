--convert: converte no reusltado
select convert(varchar(10), venda)
from produto

--qd o convert for do tipo datetime, ele aceita um terceiro argumento
select convert(varchar(10), getdate(), 103)
from produto

print('Hoje é ' + convert(varchar(10), getdate(), 103) + ' ah que festaaaaaaa!')

--feio feinho
select getdate()

--funções agregadas são específicas do select

--ltrim retira os espaços à esquerda, rtrim à direita

--distinct tira os resultados repetidos

--like compara strings

--mostre os nomes dos funcionários que nasceram no ano de 1970, e que informaram
--o email. Ordene em ordem descendente pelo nome do funcionário.
select nome from funcionario
where datanasc between '01-01-1970' and '31-12-1970' and email is not null
order by nome desc
--ou
select nome from funcionario
where datepart(yy,datanasc)=1970 and email is not null
order by nome desc
--datepart é apenas do sqlserver, between é ANSI

--quais os nomes dos clientes, que são de João Pessoa ou recife, e que 
--fizeram pedido no primeiro semestre de 2017?
select c.nome
from cliente c, cidade ci, pedido p
where ci.codigo = c.cidade and c.codigo = p.cliente and ci.nome in('João Pessoa','Recife') 
and p.dataPedido between '01-01-2017' and '30-12-2017'

--quais são os dados dos funcionários cujo nome comece com a letra 'L'?
select *
from funcionario
where nome like 'L%'

--quais são os dados dos funcionários cujo nome termine com a letra 'a'?
select *
from funcionario
where nome like '%a'

