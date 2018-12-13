--A
select f.codigo,f.nome,f.salario, f.salario *1.3 from funcionario f

--B
select p.codigo, p.nome,p.custo, p.venda, p.venda - p.custo from produto p

--C
select top 3 c.nome from cliente c

--D
select f.nome,datename(mm,datanasc) from funcionario f

--E
select top 50 percent p.codigo as CodigoDoPedido from pedido p

--F
select p.descricao, round(custo,1), round(venda,1) from produto p

--G
select lower(substring(sigla,1,1)) from setor

--H
select * from pedido where datediff(dd,datapedido,getdate()) <= 200

--I
select max(datapedido) from pedido

--J
select power(preco,3) from itens

--K
select avg(salario) from funcionario

--L
select * from pedido

--M
select count(email) from funcionario