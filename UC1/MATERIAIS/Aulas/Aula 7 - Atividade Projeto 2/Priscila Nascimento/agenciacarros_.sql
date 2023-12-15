#Criando Banco de Dados
create database projeto_agenciacarros
default character set utf8
default collate utf8_general_ci;

show databases;

#Colocar o Banco de Dados em uso
use projeto_agenciacarros;

#Verificando tabelas no Banco de Dados
show tables;

desc cliente;

select *from cliente;

#Criando a tabela CLIENTE
create table if not exists cliente(
cnh varchar(20) not null primary key,
nome varchar(100) not null,
cartao varchar(20) not null
) default charset=utf8;

#Criando a tabela AGENCIA
create table if not exists agencia(
num_ag varchar(20) not null primary key, 
end_cep varchar(9),
end_rua varchar(60),
end_num varchar(5),
end_cidade varchar(50)
)default charset=utf8;

select *from agencia;


#Criando a tabela CARRO
create table if not exists carro(
placa varchar(10) not null primary key,
carro_num_ag varchar(20),
modelo varchar(20) not null,
ano int not null,
foreign key(carro_num_ag) references agencia(num_ag)
) default charset=utf8;

select *from carro;


#Criando a tabela CLIENTE_TELEFONE
create table if not exists cliente_telefone(
codigo int not null primary key,
cnh_cliente varchar(20) not null,
numero varchar(13),
foreign key(cnh_cliente) references cliente(cnh)
)default charset=utf8;

select *from cliente_telefone;


#Criando a tabela ALUGA
create table if not exists aluga(
cnh_cliente varchar(20) not null,
placa_carro varchar(10) not null,
data varchar(10),
foreign key(cnh_cliente) references cliente(cnh),
foreign key(placa_carro) references carro(placa)
)default charset=utf8;

select *from aluga;















