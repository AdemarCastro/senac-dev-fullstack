create database atividade;
use atividade;

#criando tabela CLIENTE
create table if not exists cliente(
cnh int not null primary key,
cartao varchar(12) not null unique,
telefone varchar(12)
)default charset=utf8;

#criando tabela ALUGA
create table if not exists ALUGA(
cnh int not null primary key,
placa varchar (12)not null unique,
data varchar (14)
)default charset=utf8;
#criando tabela CARRO
create table if not exists CARRO(
placa int not null primary key,
num_ag varchar(14),
modelo varchar(100),
ano varchar(10)
)default charset=utf8;
#criando tabela AGENCIA
create table if not exists AGENCIA(
 num_ag int not null primary key,
 endereco varchar(100),
 end_rua varchar(100),
 end_num varchar(50),
 end_cidade varchar(100)
 )default charset=utf8;
 #criando tabela CLIENTE_TELEFONE
 create table if not exists CLIENTE_TELEFONE(
 codigo_telefone int not null primary key,
 cnh varchar(20),
 data_aluguel varchar(30)
 )default charset=utf8;
 show tables;
 

 
 
 
 








