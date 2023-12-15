#Criando um Banco de Dados
create database estudocaso_vendas
default character set utf8
default collate utf8_general_ci;

show databases;

#Colocar o Banco de Dados em uso
use estudocaso_vendas;

#Verificando tabelas no Banco de Dados
show tables;

#Criando a tabela CLIENTE
create table if not exists cliente(
codigo int not null primary key,
nome varchar(100) not null,
cpf varchar(11) not null unique,
end_rua varchar(60),
end_num varchar(5),
end_bairro varchar(40),
end_cep varchar(9)
)default charset=utf8;

show tables;

desc cliente;

drop table if exists cliente;

#Criando a tabela cliente_telefone
create table if not exists cliente_telefone(
codigo int not null primary key,
cod_cli int not null,
numero varchar(13),
foreign key(cod_cli) references cliente(codigo)
)default charset=utf8;

show tables;

#Criando a tabela fornecedor
create table if not exists fornecedor(
codigo int not null primary key,
nome varchar(100) not null,
telefone varchar(13)
)default charset=utf8;

#Criando a tabela departamento
create table if not exists departamento(
codigo int not null primary key,
descricao varchar(100) not null
)default charset=utf8;

show tables;

#Criando a tabela produto
create table if not exists produto(
codigo int not null primary key,
cod_forn int not null,
descricao varchar(100) not null,
valor decimal(5,2),
foreign key(cod_forn) references fornecedor(codigo)
)default charset=utf8;

show tables;

#Criando a tabela funcionario
create table if not exists funcionario(
codigo int not null primary key,
cod_depto int not null,
nome varchar(100) not null,
cpf varchar(11) not null unique,
foreign key(cod_depto) references departamento(codigo)
)default charset=utf8;

show tables;

#Criando a tabela compra
create table if not exists compra(
codigo int not null primary key,
cod_cli int not null,
cod_func int not null,
qtd_prod int not null,
foreign key(cod_cli) references cliente(codigo),
foreign key(cod_func) references funcionario(codigo)
)default charset=utf8;

show tables;

#Criando a tabela prod_compra
create table if not exists prod_compra(
cod_prod int not null,
cod_compra int not null,
foreign key(cod_prod) references produto(codigo),
foreign key(cod_compra) references compra(codigo)
)default charset=utf8;

show tables;







































