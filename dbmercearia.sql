-- apagar o banco de de dados

drop database dbmercearia;

-- criando o banco de dados

create database dbmercearia;

-- acessando o banco de dados

use dbmercearia;

-- criar tabelas

create table tbfuncionarios(
codfunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telefone char(10),
cpf char(14) not null unique,
sexo char(1) default '?' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >= 0),
primary key(codfunc)
);

create table tbfornecedores(
codforn int not null auto_increment,
nome varchar(100),
cnpj char(18),
ie char(12) unique,
logradouro varchar(100),
numero char(5),
cep char(9),
bairro varchar(100),
cidade varchar(50),
estado varchar(50),
telefone char(10),
primary key(codforn)
);

create table tbclientes(
codcli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codcli)

);

create table tbusuarios(
codusu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codfunc int not null,
primary key(codusu),
foreign key(codfunc)references tbfuncionarios(codfunc)
);


 create table tbprodutos(
 codprod int not null auto_increment,
 descricao varchar(100),
 quantidade int default 0  check(quantidade>=0),
 valor decimal(9,2) default 0 check(valor>=0),
 dataEntrada date,
 horaEntrada time,
 codforn int not null,
 primary key(codprod),
 foreign key(codforn)references tbfornecedores(codforn)
 );

create table tbvendas(
codvend int not null auto_increment,
codcli int not null,
codprod int not null,
codusu int not null,
dataVenda date,
horaVenda time,
quantidade int default 0 check(quantidade>=0),
primary key(codvend),
foreign key(codcli)references tbclientes(codcli),
foreign key(codprod)references tbprodutos(codprod),
foreign key(codusu)references tbusuarios(codusu)

);

-- Visualizar a estrutura da tabela

desc tbfuncionarios;

desc tbusuarios;

desc tbfornecedores;

desc tbprodutos;

desc tbclientes;

desc tbvendas;





-- inserir registro nas tabelas

insert into tbfuncionarios(nome,email,telefone,cpf,sexo,salario)
 values('Agnaldo Palha','agnaldo.palha@gmail.com','97412-4875',
 	'258.247.258-88','M',1660.15
 	);

insert into tbfuncionarios(nome,email,telefone,cpf,sexo,salario)
 values('Ignaldo pereirinha','ignaldo.pereirinha@gmail.com','98841-4822',
 	   '256.256.264-77','M',1550.40
 	   );

 insert into tbusuarios(nome,senha,codfunc)
  values('agnaldo.palha','123456',1);
  
 insert into tbusuarios(nome,senha,codfunc)
  values('ignaldo.pereirinha','65421',2);	

-- Visualizando os registros da tabela

 select * from tbfuncionarios;
select * from tbusuarios;
select * from tbfornecedores;
 select * from tbprodutos;
 select * from tbclientes;
 select * from tbvendas;

