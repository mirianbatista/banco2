/*a) Crie uma Stored Procedure que, passando como parâmetro de entrada o nome do cliente, mostre
como parâmetro de saída a quantidade de pedidos que este cliente realizou no ano de 2012.*/
create procedure qa
@nomecli varchar(50), @quantped int output
as 
	select @quantped = count(*)
	from pedido p join cliente c on p.cliente = c.codigo
	where @nomecli = c.nome and datepart(yy, p.datapedido) = 2012

	declare @quantped int
	exec qa 'Larissa Maia', @quantped output
	select @quantped

/*b) Crie uma Stored Procedure que receba o código do cliente como parâmetro de entrada, e imprima
seus dados da seguinte maneira:
**** Clientes da Loja ****
==================
Nome do Cliente: Larissa Maia
Estado: PB
Tipo de Cliente: PF
Data de Hoje: 14/03/2019*/

create procedure imprimetext
@codcli int
as
	declare @nome varchar(50), @estado varchar(2), @tipocli varchar(2), @data datetime
	select @nome = c.nome, @estado = ci.uf, @tipocli = c.tipo, @data = getdate()
	from cliente c join cidade ci on ci.codigo = c.cidade
	where c.codigo = @codcli
	print('**** Clientes da Loja ****')
	print('==================')
	print('Nome do Cliente: ' + @nome)
	print('Estado: ' + @estado)
	print('Tipo de Cliente: ' + @tipocli)
	print('Data de Hoje: ' + convert(varchar(20), @data, 103))

exec imprimetext 1


/*c) Crie uma Stored Procedure que, passando como parâmetro de entrada o código do produto, mostre
os nomes dos funcionários que venderam este produto, apenas se a compra do produto tiver sido rea-
lizada em 2016. Caso contrário, deverá ser emitida uma mensagem.*/
alter procedure qc
@codprod int
as
	if ((select pe.datapedido
		from pedido pe join itens i on pe.codigo = i.pedido join produto pr on pr.codigo = i.produto
		where pr.codigo = @codprod) between '01-01-2016' and '21-12-2016')

		select f.nome 
		from funcionario f join pedido pe on f.codigo = pe.vendedor join intens i on pe.codigo = i.pedido join
			 produto pr on pr.codigo = i.produto
		where pr.codigo = @codprod
	else
		print('Produto não comprado em 2016')