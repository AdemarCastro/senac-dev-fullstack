# --------------------- PROJETO CARROS 2 -------------------/
create database projeto_carro 
default character set utf8
default collate utf8_general_ci;
#------------------------ utilidade ------------------------/
drop table cliente;
drop table telefone_cliente;
drop table aluga;
#select ;
#desc ;
#default charset utf8;

#----- TABELA CLIENTE ------------/
create table if not exists cliente(
cnh int primary key,
nome varchar(50) not null,
cartao varchar(30) not null
)default charset utf8;


#----- TABELA NUMERO CLIENTE -----/
create table if not exists telefone_cliente(
cod_telefone_cliente int primary key,
nome varchar(50) not null,
cnh int not null,
foreign key(cnh) references cliente(cnh)
)default charset utf8;


#----- TABELA AGENCIA ------------/
create table if not exists agencia(
cod_agencia int primary key,
end_num varchar(10) not null,
end_cep varchar(8) not null,
end_rua varchar(50) not null,
end_cidade varchar(50) not null
)default charset utf8;


#----- TABELA CARRO --------------/
create table if not exists carro(
placa varchar(15)primary key,
cod_agencia int not null,
modelo varchar(40) not null,
ano varchar(4) not null,
foreign key(cod_agencia) references agencia(cod_agencia)
)default charset utf8;

drop table carro;
drop table aluga;

#------ TABELA ALUGA--------------/
create table if not exists aluga(
cod_alugel int primary key,
placa varchar(15) not null,
cnh int not null,
dia date not null,
foreign key(placa) references carro(placa),
foreign key(cnh) references cliente(cnh)
)default charset utf8;






