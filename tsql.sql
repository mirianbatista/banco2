begin
declare @nome varchar(50), @codigo int, @data datetime
set @nome = (select nome from cliente where codigo = 1)
select @codigo = codigo from cliente where nome = 'Maria Helena Ferreira'
select data = getdate()
select @nome, @codigo, @data
end

create procedure teste if
@nomecli varchar(50)
as
	declare @somaprod float
	select @somaprod = sum (pr.venda) from produto pr join itens i on
		pr.codigo = i.produto join pedido pe on pe.codigo = i.pedido join 
		cliente c on c.codigo = pe.cliente where c.nome = @nomecli
	if (@somaprod > 10000)
		print('Cliente vip!')
	else
		if(@somaprod between 5000 and 10000)
			print('Cliente normal!')
		else
			print('Cliente popular!')
