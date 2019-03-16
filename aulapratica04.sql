/*a) Quais os 30% distintos primeiros participantes que se inscreveram em eventos em 2014 com palestrantes
de área de pesquisa “Banco de Dados” ou “Programação” ? Ordene em ordem descendente pelo nome do
participante.*/
select distinct top 30 percent p.*
from participantes p join inscricoes i on p.cpf = i.participante
	 join eventos e on e.codigo = i.evento join palestrantes pa
	 on pa.codP = e.palestrante
where datepart(yy,e.data) = 2014 and pa.area_pesquisa in ('Banco de Dados', 'Programação')
order by p.nome desc

/*b) Mostre os títulos dos eventos e os nomes das cidades em que eles acontecem. Mostre também as cidades
que não tem eventos. Ordene pelo nome da cidade.*/
select e.titulo, ci.nome
from eventos e right join cidade ci on ci.codigo = e.cidade

/*c) Mostre o título e tipo da palestra, realizada entre janeiro e maio de 2014, que teve a maior
quantidade de inscritos.*/
select e.titulo, e.tipo, count(*) as qtd
into #resultd
from eventos e join inscricoes i on e.codigo = i.evento
where e.data between '01-01-2014' and '31-05-2014' and e.tipo = 'Palestra'
group by e.titulo, e.tipo

select * from #resultd

select titulo, tipo
from #resultd
where qtd = (select max(qtd) from #resultd)

/*d) Quais os números e tipos de salas que não abrigaram eventos no primeiro semestre de 2015?*/
 select num, tipo
 from salas
 where num not in (select sala from eventos where data between '01-01-2015' and '30-06-2015')

/*e) Mostre, para cada participante, o seu nome, a quantidade de eventos que ele se inscreveu 
e uma média de valor pago nestas inscrições. Mostre apenas os participantes que fizeram 
inscrições em mais do que 5 eventos do tipo Mini Curso, e que tenha “Ana” em qualquer parte do nome.*/
select p.nome, count(*) qtd_insc, avg(i.valor) mediaVaor
from participantes p join inscricoes i on p.cpf = i.participante 
	 join eventos e on e.codigo = i.evento
where p.nome like '%ana%' and e.tipo = 'Mini Curso'
group by p.nome
having count(*) > 5

/*f) Quais os números, tipos e capacidade das salas que irão abrigar os eventos ministrados 
por palestrantes de programação ? (sub consulta obrigatória)*/
select num, tipo, capacidade from salas where num in
	   (select sala from eventos where palestrante in
	   (select codP from palestrantes where area_pesquisa = 'Programação'))

