drop database dbCasadeApostas;

create database dbCasadeApostas;

	use dbCasadeApostas;

	create table tbTimes(
codtime int not null auto_increment,
nome varchar(100),
localidade varchar(100),
serie char(1),
primary key(codtime)
);


create table tbUsuarios(
codusu int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique
primary key(codusu)
);




create table tbJogadores(
codjog int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codjog)
);


create table tbApostas(
codApt int not null auto_increment,
codTime int not null,
data date,
hora time,
valor decimal(9,2) defaut 0 check(valor > 0),
codusu int not null,
primary key(codApt),
foreing key(codTime)references tbTimes(codTime),
foreign(codusu)references tbUsuarios(codusu)
);