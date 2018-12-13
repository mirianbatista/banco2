select * from Cliente

select * from Produto

select * from Pedido

--percent é opcional, retorna o percentual da tabela. top e percent só do sql server
select top 50 percent nome from cliente

--as opcional, espaço funciona. coloca as aspas simples se tiver caracter especial
select venda * 2 as dobro_venda
from produto

select round(power(venda,2),2)
from produto

select lower(substring(nome,3,8)) testinho
from cliente

--parte da data q eu especificar
select datepart(yy, dataPedido)
from pedido

--retorna a data do sistema
select getdate()

select datepart(dd, getdate()) hoje

select datename(mm, getdate()) mês

select datename(dw, getdate()) dia_semana

select datediff(yy, datapedido, getdate())
from pedido

select dateadd(dd, 5, getdate())
