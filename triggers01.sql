/*d) Crie uma Stored Procedure que, passando como parâmetro de entrada o código do funcionário,

mostre como parâmetro de saída a quantidade de vendas realizadas pelo mesmo, da seguinte manei-
ra:

a. Se o funcionário for natural de João Pessoa, o parâmetro de saída deve conter a quantidade de
pedidos que o mesmo realizou, e deve ser impressa uma mensagem “O funcionário NOME realizou N
pedidos”;

b. Se o funcionário não for natural de João Pessoa, deve ser impressa uma mensagem “O funcioná-
rio NOME não nasceu em João Pessoa”, e o parâmetro de saída não deve retornar nenhum valor.*/
alter procedure qd 
@codfunc int, @quantped int output
as
	declare @nome varchar(50), @naturalidade varchar(50)
	select @nome = f.nome, @naturalidade = ci.nome
	from funcionario f join cidade ci on ci.codigo = f.naturalidade
	where f.codigo = @codfunc
	if (@naturalidade = 'João Pessoa')
	begin
		select @quantped = count(*)
		from pedido 
		where vendedor = @codfunc
		print('O funcionário' + @nome + 'realizou' + convert(varchar(10), @quantped) + 'pedidos')
	end
	else
		print('O funcionário ' + @nome + 'não é de JP')
	
	declare @quantped int
	exec qd 1, @quantped output
	select @quantped


/*crie um trigger para que, sempre que um funcionário realizar um pedido, 
seu salário seja aumentado em R$20,00.*/
create trigger aumentasal
on pedido  --aqui coloca o evento
for insert  --aqui coloca o evento
as
	--parte da condição e da ação
	update funcionario
	set salario = salario + 20
	from funcionario f join inserted i on f.codigo = i.vendedor

select * from funcionario

insert into pedido values(200, 1, 2, getdate(), getdate(), 'T', 0)