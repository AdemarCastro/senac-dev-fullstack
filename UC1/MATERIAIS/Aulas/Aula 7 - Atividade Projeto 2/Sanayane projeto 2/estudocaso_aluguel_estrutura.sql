#criando o banco de dados

create database estudocaso_aluguel
default character set utf8
default collate utf8_general_ci;

show databases;

use estudocaso_aluguel;

show tables;
drop table cliente;
drop table cliente_telefone;
drop table agencia;
drop table carro;
drop table aluguel;

create table if not exists cliente (
CNH int not null primary key,
nome varchar(100) not null,
cartao varchar(20) not null unique
)default charset=utf8;

create table if not exists cliente_telefone (
id_telefone int not null primary key,
CNH int not null,
celular varchar(30) not null,
foreign key(CNH) references cliente(CNH)
)default charset=utf8;

create table if not exists agencia (
numAg int not null primary key,
end_rua VARCHAR(100) not null,
end_num varchar(20) not null,
end_cidade varchar(100) not null,
end_cep varchar(20) not null
)default charset=utf8;

create table if not exists carro (
placa varchar(10) not null primary key,
numAg int not null,
modelo varchar(100) not null,
ano int not null,
foreign key(numAg) references agencia(numAg)
)default charset=utf8;

create table if not exists aluguel (
CNH int not null,
placa varchar(10) not null,
data_aluguel date not null,
foreign key(CNH) references cliente(CNH),
foreign key(placa) references carro(placa)
)default charset=utf8;