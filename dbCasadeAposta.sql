drop database dbCasadeApostas;

create database dbCasadeApostas;

use dbCasadeApostas;



create table tbUsuarios(
codusu int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codusu)
);



create table tbJogadores(
codjog int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codjog)
);



create table tbTimes(
codtime int not null auto_increment,
nome varchar(100),
localidade varchar(100),
serie char(1),
codjog  int not null,
primary key (codtime),
foreign key(codjog)references tbJogadores(codjog)
);


create table tbApostas(
codApt int not null auto_increment,
codTime int not null,
data date,
hora time,
valor decimal(9,2) default 0 check(valor > 0),
codusu int not null,
primary key(codApt),
foreign key(codtime)references tbTimes(codtime),
foreign key (codusu)references tbUsuarios(codusu)
);


-- visualizando a estrututa da tabela

desc tbUsuarios;

desc tbJogadores;

desc tbTimes;

desc tbApostas;

-- inserindo registros nas tabelas

insert into tbUsuarios(nome,email,cpf)
	values('Adilson meireles',"adilson.meireles@gmail.com",
		'256.122.256-77');

insert into tbUsuarios(nome,email,cpf)
values('Felipe Gomes','felipe.gomes@gmail.com',
		'277.178.233-62');	

insert into tbJogadores(nome,email,cpf)
	values('Miranda Gomes ','Miranda.gomes@gmail.com',
		'255.125.127-88');

insert into tbJogadores(nome,email,cpf)
 	values('Carlos Henrique Casimiro','Carlos122@gmail.com',
 	'233.255.242-75');	

insert into tbTimes(nome,localidade,serie,codjog)
	values('São Paulo FC','São Paulo-SP','A',1);


insert into tbTimes(nome,localidade,serie,codjog)
	values('Real Madrid','Madrid-ES','A',2);	


insert into tbApostas(codtime,data,hora,valor,codusu)
	values(1,'2022-11-28','11:30:00',10.00,1);

-- visualizando registros das tabelas

select * from tbUsuarios;

select * from tbJogadores;

select * from tbTimes;

select * from tbApostas;

