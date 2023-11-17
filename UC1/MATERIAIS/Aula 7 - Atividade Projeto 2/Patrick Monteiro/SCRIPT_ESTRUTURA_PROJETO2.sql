#---------PATRICK MONTEIRO -------------------

#CRIANDO BANCO DE DADOS

create database projeto2_locadora
default character set utf8
default collate utf8_general_ci;

#COLOCANDO O BANCO DE DADOS EM USO
use projeto2_locadora;

#CRIANDO TABELAS DO BANCO DE DADOS------------

#CLIENTE--------------------------------------
create table if not exists cliente(
cnh int not null primary key,
nome varchar(100) not null,
cartao varchar(16) not null
)default charset=utf8;

show tables;
desc cliente;

#CLIENTE_TELEFONE----------------------------
create table if not exists cliente_telefone(
cod_telefone int not null primary key,
cod_cnh int not null,
numero varchar(12) not null,
foreign key (cod_cnh) references cliente(cnh)
)default charset=utf8;

show tables;
desc cliente_telefone;

#AGENCIA--------------------------------------
create table if not exists agencia(
n_agencia int not null primary key
)default charset=utf8;

show tables;
desc agencia;

#AGENCIA_ENDERECO-----------------------------
create table if not exists agencia_endereco(
cep int not null primary key,
cod_agencia int not null,
end_num varchar(5),
end_rua varchar(50) not null,
end_cidade varchar(50) not null,
foreign key (cod_agencia) references agencia(n_agencia)
)default charset=utf8;

show tables;
desc agencia_endereco;

#CARRO-------------------------------------------
create table if not exists carro(
placa varchar(7) not null primary key,
cod_agencia int not null,
modelo varchar(50) not null,
ano varchar(10) not null,
foreign key (cod_agencia) references agencia(n_agencia)
)default charset=utf8;

show tables;
desc carro;

#ALUGA--------------------------------------------
create table if not exists aluga(
cod_cnh int not null,
cod_placa varchar(7) not null,
data_aluguel varchar(10) not null,
foreign key (cod_cnh) references cliente(cnh),
foreign key (cod_placa) references carro(placa)
)default charset=utf8;

show tables;


