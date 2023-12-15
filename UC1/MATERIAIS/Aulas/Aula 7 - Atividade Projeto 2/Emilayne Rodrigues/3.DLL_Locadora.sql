#AULA 7 - DLL PROJETO 2 _ LOCADORA DE CARROS 

#criando banco de dados projeto_Locadora
create database projeto_Locadora DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

#colocando db em uso
use projeto_Locadora;

#criando tabela CLIENTE
create table if not exists CLIENTE(
	cnh int not null primary key,
    nome varchar(100) not null,
    cartao varchar(20) not null unique
) default charset=utf8;

#criando tabela CLIENTE_TELEFONE
create table if not exists CLIENTE_TELEFONE(
	codigo int not null primary key,
    cnh_cliente int not null,
    numero varchar(13),
	foreign key(cnh_cliente) references cliente(cnh)
) default charset=utf8;

#criando tabela AGENCIA
create table if not exists AGENCIA(
	num_ag int not null primary key,
    end_rua varchar(30),
    end_num varchar(10),
    end_cep varchar(10),
    end_cidade varchar(25)
)default charset=utf8;

#criando tabela CARRO
create table if not exists CARRO(
	placa varchar(10) not null primary key,
    num_agencia int not null,
    modelo varchar(40) not null,
    ano varchar(4) not null,
    foreign key(num_agencia) references agencia(num_ag)
)default charset=utf8; 

#criando tabela ALUGA
create table if not exists ALUGA(
	cnh_cliente int not null,
    placa_carro varchar(10)  not null,
    data_aluguel date not null,
    foreign key(cnh_cliente) references cliente(cnh),
    foreign key(placa_carro) references carro(placa)
)default charset=utf8;

#mostrando tabelas
show tables;



