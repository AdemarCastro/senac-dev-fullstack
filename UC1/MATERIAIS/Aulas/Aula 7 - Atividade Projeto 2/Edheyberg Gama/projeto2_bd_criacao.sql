create database if not exists estudo_caso_aluguel
default character set utf8
default collate utf8_general_ci;

use estudo_caso_aluguel; 

#table cliente
create table if not exists cliente(
cnh varchar(11) not null primary key,
nome varchar(50) not null,
cartao varchar(12) not null unique
) default charset utf8;

#tabela telefone
create table if not exists cliente_telefone(
codigo int not null primary key,
cnh_cliente varchar(11) not null,
telefone varchar(11) not null,
foreign key(cnh_cliente) references cliente(cnh)
) default charset utf8;

#tabela agencia
create table if not exists agencia(
numAg int not null primary key,
nome varchar(40) not null
)default charset utf8;

#tabela agencia_endereco
create table if not exists agencia_endereco(
codigo int not null primary key,
cod_agencia int not null,
cep varchar(8) not null,
rua varchar(50) not null,
numero varchar(4) not null,
cidade varchar(50) not null,
foreign key(cod_agencia) references agencia(numAg)
)default charset utf8;

#tabela carro
create table if not exists carro(
placa varchar(9) not null primary key,
cod_agencia int not null,
ano_fabricado varchar(4) not null,
foreign key (cod_agencia) references agencia(numAg)
)default charset utf8;

#tabela aluguel
create table if not exists aluguel(
codigo int not null primary key,
cnh_cliente varchar(11) not null,
placa_carro varchar(9) not null,
data_aluguel date,
foreign key(cnh_cliente) references cliente(cnh),
foreign key(placa_carro) references carro(placa)
)default charset utf8;



