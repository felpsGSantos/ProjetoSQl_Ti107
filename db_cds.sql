-- excluido banco de dados caso exista

drop database db_CDS;

-- criando banco de dados

create database db_CDS;

use db_CDS;

create table tbArtistas(
cod_art int not null,
nome_art varchar(100) not null unique,
primary key(cod_art)
);

create table tbGravadoras(
cod_grav int not null,
nome_grav varchar(50) not null,
primary key(cod_grav)
);


create table tbCategorias(
cod_cat int not null,
nome_cat varchar (50) not null,
primary key(cod_cat)
);

create table tbEstados(
sigla_est char(2) not null,
nome_est varchar(50) not null,
primary key(sigla_est)
);



create table tbCidades(
cod_cid int not null,
sigla_est char(2) not null,
nome_cid varchar(50) not null,
primary key(cod_cid),
foreign key(sigla_est)references tbEstados(sigla_est)
);


create table tbClientes(
cod_cli int not null,
cod_cid int not null,
nome_cli varchar(50) not null,
end_cli varchar(100) not null,
renda_cli decimal(9,2) not null default 0 check(renda_cli >= 0),
sexo_cli char(1) not null default 'F' check(sexo_cli in('F','M')),
primary key(cod_cli),
foreign key(cod_cid)references tbCidades(cod_cid)

);


create table tbConjuge(
cod_conj int not null,
cod_cli int not null, 
nome_conj varchar(50) not null,
renda_conj decimal(9,2) not null default 0 check(renda_conj >= 0),
sexo_conj char(1) not null default 'F' check(sexo_conj in('F','M')),
primary key(cod_conj),
foreign key(cod_cli)references tbClientes(cod_cli)

);

create table tbFuncionarios(
cod_func int not null,
nome_func varchar(50) not null,
end_func Varchar(100) not null,
sal_func decimal(9,2) not null default 0 check(sal_func >= 0),
sexo_func char(1) not null default 'F' check(sexo_func in('F','M')),
primary key(cod_func)

);

create table tbDependentes(
cod_dep int not null,
cod_func int not null,
nome_dep varchar(100) not null,
sexo_dep char(1) not null default 'F' check(sexo_dep in('F','M')),
primary key(cod_dep),
foreign key(cod_func)references tbFuncionarios(cod_func)

);


create table tbTitulos(
cod_tit int not null,
cod_cat int not null,
cod_grav int not null,
nome_cd varchar(50) not null unique,
val_cd decimal(9,2) not null  check(val_cd > 0),
qtd_estq int not null  check(qtd_estq > 0),
primary key(cod_tit),
foreign key(cod_cat)references tbCategorias(cod_cat),
foreign key(cod_grav)references tbGravadoras(cod_grav)

);


create table tbPedidos(
num_ped int not null,
cod_cli int not null,
cod_func int not null,
data_ped datetime not null,
val_ped decimal(9,2) not null default 0 check(val_ped >= 0),
primary key(num_ped),
foreign key(cod_cli)references tbClientes(cod_cli),
foreign key(cod_func)references tbFuncionarios(cod_func)

);

create table tbTitulos_Pedido(
num_ped int not null,
cod_tit int not null,
qtd_cd int not null check(qtd_cd >= 1),
val_cd decimal(9,2) not null check(val_cd >= 0),
foreign key(num_ped)references tbPedidos(num_ped),
foreign key(cod_tit)references tbTitulos(cod_tit),
primary key(num_ped, cod_tit)



);

create table tbTitulos_Artista(
cod_tit int not null,
cod_art int not null,
foreign key(cod_tit)references tbTitulos(cod_tit),
foreign key(cod_art)references tbArtistas(cod_art)

);

-- valores da tabelas tbArtistas

insert into tbArtistas (cod_art,nome_art)
	values(1,'Marisa Monte'); 

insert into tbArtistas (cod_art,nome_art)
	values(2,'Gilberto Gil');

insert into tbArtistas (cod_art,nome_art)
	values(3,'Caetano veloso');

insert into tbArtistas (cod_art,nome_art)
	values(4,'Milton Nascimento');

insert into tbArtistas (cod_art,nome_art)
	values(5,'Legi??o Urbana');

insert into tbArtistas (cod_art,nome_art)
	values(6,'The Beatles');

insert into tbArtistas (cod_art,nome_art)
	values(7,'Rita Lee');


-- valores da tabelas tbGravadoras

insert into tbGravadoras (cod_grav,nome_grav)
	values(1,'Polygram');

insert into tbGravadoras (cod_grav,nome_grav)
	values(2,'Emi');

insert into tbGravadoras (cod_grav,nome_grav)
	values(3,'Som Livre');

insert into tbGravadoras (cod_grav,nome_grav)
	values(4,'Som Music');

-- valores da tabela tbCategorias

insert into tbCategorias (cod_cat,nome_cat)
	values(1,'MPB');

insert into tbCategorias (cod_cat,nome_cat)
	values(2,'Trilha sonora');

insert into tbCategorias (cod_cat,nome_cat)
	values(3,'Rock Internacional');

insert into tbCategorias (cod_cat,nome_cat)
	values(4,'Rock Nacional');


-- valores da tabela tbEstados

insert into tbEstados (sigla_est,nome_est)
	values('SP','S??o Paulo');

insert into tbEstados (sigla_est,nome_est)
	values('MG','Minas Gerais');

insert into tbEstados (sigla_est,nome_est)
	values('RJ','Rio de Janeiro');

insert into tbEstados (sigla_est,nome_est)
	values('ES','Espirito Santo');

-- valores da tabela tbCidades

 insert into tbCidades (cod_cid,sigla_est,nome_cid)
 	values(1,'SP','S??o Paulo');

insert into tbCidades (cod_cid,sigla_est,nome_cid)
	values(2,'SP','Sorocaba');

 insert into tbCidades (cod_cid,sigla_est,nome_cid)
	values(3,'SP','Jundia??');

 insert into tbCidades (cod_cid,sigla_est,nome_cid)
	values(4,'SP','Americana');

 insert into tbCidades (cod_cid,sigla_est,nome_cid)
	values(5,'SP','Araraguara');

 insert into tbCidades (cod_cid,sigla_est,nome_cid)
	values(6,'MG','Ouro Preto');

insert into tbCidades (cod_cid,sigla_est,nome_cid)
	values(7,'ES','Cachoeira do Itapemirin');

--  valores da tabela tbClientes

insert into tbClientes (cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)
	values(1,1,'Jos?? Nogueira','Rua A',1500.00,'M');

insert into tbClientes (cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)
	values(2,1,'??ngelo Pereira','Rua B',2000.00,'M');

insert into tbClientes (cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)
	values(3,1,'Al??m do mar Paranhos','Rua C',1500.00,'M');

insert into tbClientes (cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)
	values(4,1,'Catarina Souza','Rua D',892.00,'F');

insert into tbClientes (cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)
	values(5,1,'Vagner Costa','Rua E',950.00,'F');

insert into tbClientes (cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)
	values(6,1,'Antenor da Costa','Rua F',1582.00,'M');

insert into tbClientes (cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)
	values(7,2,'Maria Am??lia se Souza','Rua G',1152.00,'F');

insert into tbClientes (cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)
	values(8,2,'Paulo Roberto Silva','Rua H',3250.00,'M');


--valores da tabela tbConjuge

insert into tbConjuge (cod_conj,cod_cli,nome_conj,renda_conj,sexo_conj)
	values(1,1,'Carla Nogueira',2500.00,'F');

insert into tbConjuge (cod_conj,cod_cli,nome_conj,renda_conj,sexo_conj)
	values(2,2,'Emilia Pereira',5500.00,'F');

insert into tbConjuge (cod_conj,cod_cli,nome_conj,renda_conj,sexo_conj)
	values(3,6,'Altiva da Costa',3000.00,'F');

insert into tbConjuge (cod_conj,cod_cli,nome_conj,renda_conj,sexo_conj)
	values(4,7,'Carlos de Souza',3250.00,'M');


-- valores da tabela tbFuncionarios

insert into tbFuncionarios (cod_func,nome_func,end_func,sal_func,sexo_func)
	values(1,'V??nia Gabriela Pereira','Rua A',2500.00,'F');


insert into tbFuncionarios (cod_func,nome_func,end_func,sal_func,sexo_func)
	values(2,'Norberto Pereira da Silva','Rua B',300.00,'M');

insert into tbFuncionarios (cod_func,nome_func,end_func,sal_func,sexo_func)
	values(3,'Olavo Linhares','Rua C',580.00,'M');

insert into tbFuncionarios (cod_func,nome_func,end_func,sal_func,sexo_func)
	values(4,'Paula da Silva','Rua D',3000.00,'F');

insert into tbFuncionarios (cod_func,nome_func,end_func,sal_func,sexo_func)
	values(5,'Rolando Rocha','Rua E',2000.00,'M');

insert into tbFuncionarios (cod_func,nome_func,end_func,sal_func,sexo_func)
	values(6,'Rodinei Algusto','Rua H',1800.00,'M');

insert into tbFuncionarios (cod_func,nome_func,end_func,sal_func,sexo_func)
	values(7,'Agnaldo Edinaldo','Rua I',2100.00,'M');


-- valores da tabela tbDependentes

insert into tbDependentes (cod_dep,cod_func,nome_dep,sexo_dep)
	values(1,1,'Ana Pereira','F');

insert into tbDependentes (cod_dep,cod_func,nome_dep,sexo_dep)
	values(2,1,'Roberto pereira','M');

insert into tbDependentes (cod_dep,cod_func,nome_dep,sexo_dep)
	values(3,1,'Celso pereira','M');

insert into tbDependentes (cod_dep,cod_func,nome_dep,sexo_dep)
	values(4,3,'Brisa Linhares','F');

insert into tbDependentes (cod_dep,cod_func,nome_dep,sexo_dep)
	values(5,3,'Mari Sol Linhares','F');

insert into tbDependentes (cod_dep,cod_func,nome_dep,sexo_dep)
	values(6,4,'Sonia da Silva','F');


-- valores da tabela tbTitulos

insert into tbTitulos (cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)
	values(1,1,1,'Tribalistas',30.00,1500);

insert into tbTitulos (cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)
	values(2,1,2,'Tropic??lia',50.00,500);

insert into tbTitulos (cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)
	values(3,1,1,'Aquele abra??o',50.00,500);

insert into tbTitulos (cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)
	values(4,1,2,'Refazenda',60.00,100);

insert into tbTitulos (cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)
	values(5,1,3,'Totalmente demais',50.00,2000);

insert into tbTitulos (cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)
	values(6,1,3,'Travessia',55.00,500);

insert into tbTitulos (cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)
	values(7,1,2,'Courage',30.00,200);

insert into tbTitulos (cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)
	values(8,4,3,'Legi??o Urbana',20.00,100);

insert into tbTitulos (cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)
	values(9,3,2,'The Beatles',30.00,30);

insert into tbTitulos (cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)
	values(10,4,1,'Rita Lee',30.00,500);


-- valores da tabela tbPedidos

insert into tbPedidos (num_ped,cod_cli,cod_func,data_ped,val_ped)
	values(1,1,2,'02-05-02',1500.00);

insert into tbpedidos (num_ped,cod_cli,cod_func,data_ped,val_ped)
	values(2,3,4,'02-05-02',50.00);

insert into tbpedidos (num_ped,cod_cli,cod_func,data_ped,val_ped)
	values(3,4,7,'02-06-02',100.00);

insert into tbpedidos (num_ped,cod_cli,cod_func,data_ped,val_ped)
	values(4,1,4,'02-02-03',200.00);

insert into tbpedidos (num_ped,cod_cli,cod_func,data_ped,val_ped)
	values(5,7,5,'02-03-03',300.00);

insert into tbpedidos (num_ped,cod_cli,cod_func,data_ped,val_ped)
	values(6,4,4,'02-03-03',100.00);

insert into tbpedidos (num_ped,cod_cli,cod_func,data_ped,val_ped)
	values(7,5,5,'02-03-03',50.00);

insert into tbpedidos (num_ped,cod_cli,cod_func,data_ped,val_ped)
	values(8,8,2,'02-03-03',50.00);

insert into tbpedidos (num_ped,cod_cli,cod_func,data_ped,val_ped)
	values(9,2,2,'02-03-03',2000.00);

insert into tbpedidos (num_ped,cod_cli,cod_func,data_ped,val_ped)
	values(10,7,1,'02-03-03',3000.00);


-- valores da tabela

insert into tbTitulos_Artista (cod_tit,cod_art)
	values(1,1);

 insert into tbTitulos_Artista (cod_tit,cod_art)
	values(2,2);

 insert into tbTitulos_Artista (cod_tit,cod_art)
	values(3,2);

 insert into tbTitulos_Artista (cod_tit,cod_art)
	values(4,2);

 insert into tbTitulos_Artista (cod_tit,cod_art)
	values(5,3);

 insert into tbTitulos_Artista (cod_tit,cod_art)
	values(6,4);

 insert into tbTitulos_Artista (cod_tit,cod_art)
	values(7,4);

 insert into tbTitulos_Artista (cod_tit,cod_art)
	values(8,5);

 insert into tbTitulos_Artista (cod_tit,cod_art)
	values(9,6);

 insert into tbTitulos_Artista (cod_tit,cod_art)
	values(10,7);


-- valores da tabela tbTitulos_Pedido

 insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(1,1,2,30.00);

 insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(1,2,3,20.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(2,1,1,50.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(2,2,3,30.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(3,1,2,40.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(4,2,3,20.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(5,1,2,25.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(6,2,3,30.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(6,3,1,35.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(7,4,2,55.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(8,1,4,60.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(9,2,3,15.00);

insert into tbTitulos_Pedido (num_ped,cod_tit,qtd_cd,val_cd)
	values(10,7,2,15.00);

select * from tbArtistas;

select * from tbGravadoras;

select * from tbCategorias;

select * from tbEstados;

select * from tbCidades;

select * from tbClientes;

select * from tbConjuge;

select * from tbFuncionarios;

select * from tbDependentes;

select * from tbTitulos;

select * from tbPedidos;

select * from tbTitulos_Artista;

select * from tbTitulos_Pedido;



































































 






