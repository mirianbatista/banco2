/*d) Crie uma Stored Procedure que, passando como par�metro de entrada o c�digo do funcion�rio,

mostre como par�metro de sa�da a quantidade de vendas realizadas pelo mesmo, da seguinte manei-
ra:

a. Se o funcion�rio for natural de Jo�o Pessoa, o par�metro de sa�da deve conter a quantidade de
pedidos que o mesmo realizou, e deve ser impressa uma mensagem �O funcion�rio NOME realizou N
pedidos�;

b. Se o funcion�rio n�o for natural de Jo�o Pessoa, deve ser impressa uma mensagem �O funcion�-
rio NOME n�o nasceu em Jo�o Pessoa�, e o par�metro de sa�da n�o deve retornar nenhum valor.*/
alter procedure qd 
@codfunc int, @quantped int output
as
	declare @nome varchar(50), @naturalidade varchar(50)
	select @nome = f.nome, @naturalidade = ci.nome
	from funcionario f join cidade ci on ci.codigo = f.naturalidade
	where f.codigo = @codfunc
	if (@naturalidade = 'Jo�o Pessoa')
	begin
		select @quantped = count(*)
		from pedido 
		where vendedor = @codfunc
		print('O funcion�rio' + @nome + 'realizou' + convert(varchar(10), @quantped) + 'pedidos')
	end
	else
		print('O funcion�rio ' + @nome + 'n�o � de JP')
	
	declare @quantped int
	exec qd 1, @quantped output
	select @quantped


/*crie um trigger para que, sempre que um funcion�rio realizar um pedido, 
seu sal�rio seja aumentado em R$20,00.*/
create trigger aumentasal
on pedido  --aqui coloca o evento
for insert  --aqui coloca o evento
as
	--parte da condi��o e da a��o
	update funcionario
	set salario = salario + 20
	from funcionario f join inserted i on f.codigo = i.vendedor

select * from funcionario

insert into pedido values(200, 1, 2, getdate(), getdate(), 'T', 0)