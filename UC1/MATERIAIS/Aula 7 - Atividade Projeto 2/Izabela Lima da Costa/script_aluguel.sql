# Criando um banco de Dados - aluguel
create database estudocaso_vendas
default character set utf8
default collate utf8_general_ci;

show databases;

#Colocar o Banco de Bados em uso
use aluguel;

#Verificacao de tabelas no banco de dados;
show tables;

#Criacao de tabela CLIENTE se nao existe
create table if not exists cliente(
	cnh int not null primary key,
    nome varchar(60) not null,
    cartao varchar(20) not null
    ) default charset=utf8;
    
#Criacao de tabela AGENCIA se nao existe
create table if not exists agencia(
	numAg int not null primary key,
    enderenco varchar(45)
    ) default charset=utf8;
    
#Criacao de tabela CARRO se nao existe
create table if not exists carro(
	placa int not null primary key,
    num_agencia int not null,
    modelo varchar(30) not null,
    ano int not null,
    foreign key (num_agencia) references agencia(numAg)
    ) default charset=utf8;
    
#Criacao tabela CLIENTE_CARRO
 create table if not exists cliente_carro(
	cnh_cliente int not null,
	placa_carro int not null,
    dataAluguel date not null,
    foreign key (cnh_cliente) references cliente(cnh),
    foreign key (placa_carro) references carro(placa)
	)default charset=utf8;
    
#Criacao dde tabela CLIENTE_TELEFONE
 create table if not exists cliente_telefone(
	telefone varchar(11) not null primary key,
    cnh_cliente int not null,
    foreign key (cnh_cliente) references cliente(cnh)
    ) default charset=utf8;
    


#Inserindo dados da tabela cliente
INSERT INTO cliente(cnh, nome, cartao) VALUES
	('1238456745', 'Maria', '854621301285');
INSERT INTO cliente(cnh, nome, cartao) VALUES
	('51248932', 'Joao', '845219756232'),
    ('85462139', 'Jose', '854698452132');

select * from cliente;

#Inserindo dados na agencia
INSERT INTO agencia(numAg, enderenco) VALUES
	('1100', 'Rua A'),
    ('1200', 'Rua B'),
    ('1300', 'Rua c');

select * from agencia;


#Inserindo dados na carro
INSERT INTO carro(placa, num_agencia, modelo, ano) VALUES
	('111111', '1100','ford','2020';

    


    
    
    

    
    
    
    
    