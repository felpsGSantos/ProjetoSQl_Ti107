-- apagando o banco de dados criado
drop database dbloja;

-- criando banco de dados loja

create database dbloja;

-- acessanndo o banco de dados loja
use dbloja;

-- criando as tabelas no banco de dados

create table tbusuarios(
codusu int,
nome varchar(50),
senha varchar(50)
);



create table tbfuncionarios(
codfunc int,
nome varchar(100),
email varchar(100),
telefone char(10),
cpf char(14),
logradouro varchar(100),
numero char(10),
bairro varchar(50),
cidade varchar(50),
estado varchar(50),
cep char(9)
);

create table tbprodutos(
codProd int,
descricao varchar(100),
valor decimal(9,2),
dataEntrada date,
horaEntrada time,
quantidade int

);



-- visualizando a estrutura das tabelas

desc tbusuarios;
desc tbfuncionarios;
desc tbprodutos
-- inserindo registros nas tabelas


insert into tbusuarios(codusu,nome,senha)
values(1,'felipe.gomes','123456');	
insert into tbusuarios(codusu,nome,senha)
values(2,'maria.pao','78910');	

insert into tbfuncionarios(codfunc,nome,email,telefone,cpf,
logradouro,numero,bairro,cidade,estado,cep)
values (1,'marquinho.peixeira','marquinho.dopeixe@hotmail.com',
'99567-3123','277.344.267-77','Rua Dr. Rivelino da cunha','208',
'Santo Amaro','São Paulo','São Paulo','04455-225');

insert into tbfuncionarios(codfunc,nome,email,telefone,cpf,
logradouro,numero,bairro,cidade,estado,cep)
values (2,'irinel.nino','irinel.nino@hotmail.com',
'93371-2169','255.348.223.-55','Rua Pisadinha de riacho','255',
'Vale da Virtudes','São Paulo','São Paulo','02445-177');

insert into tbprodutos(codProd,descricao,valor,dataEntrada,
horaEntrada,quantidade)
values (100,'Abacate',80.12,'2022-10-31',
'12:30:12',12);

insert into tbprodutos(codProd,descricao,valor,dataEntrada,
horaEntrada,quantidade)
values (101,'Manga',12.25,'2022-10-31',
'13:00:00',4);



-- visualizando os reegitros das tabelas

select * from tbusuarios;
select * from tbfuncionarios;
select * from tbprodutos

select descricao, valor, valor * 1.10 as 'Aumento de 10%' from tbprodutos;

-- Alterando valores das colunas

update tbprodutos set valor = valor * 1.25
where codProd = 100;

update tbprodutos set valor = valor * 0.75
where codProd = 101;

select * from tbprodutos


-- Apagando registros das linhas


-- Pesquisa por nome


-- Pesquisa por código



