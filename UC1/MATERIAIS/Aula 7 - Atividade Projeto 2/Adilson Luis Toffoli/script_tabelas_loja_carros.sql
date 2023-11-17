create database atividade_avaliativa
default charset utf8
default collate utf8_general_ci;

show databases;

use atividade_avaliativa;

#criando a tabela CLIENTE
create table if not exists cliente(
cnh varchar(20) not null primary key,
nome varchar(100) not null,
cartao varchar(11) not null
)default charset=utf8;

show tables;

#criando a tabela cliente_telefone
create table if not exists cliente_telefone(
nro_principal varchar(25) not null primary key,
cnh_cliente varchar(20) not null,
numero_2 varchar(25),
foreign key(cnh_cliente) references cliente(cnh)
)default charset utf8;

show tables;

#criando a tabela agencia
create table if not exists agencia(
numag int not null primary key,
end_rua varchar(200) not null,
end_cep varchar(12) not null,
end_num varchar(5) not null,
end_cidade varchar(100) not null
)default charset utf8;

show tables;

#criando a tabela carro
create table if not exists carro(
placa varchar(7) not null primary key,
modelo varchar(100) not null,
ano varchar(4) not null,
ag_nro int not null,
foreign key(ag_nro) references agencia(numag)
)default charset utf8;

show tables;

#criando a tabela ALUGA
create table if not exists aluga(
codigo int not null primary key,
dia_locacao varchar(8) not null,
cnh_cliente varchar(20) not null,
placa_carro varchar(7) not null,
foreign key(cnh_cliente) references cliente(cnh),
foreign key(placa_carro) references carro(placa)
)default charset utf8;

show tables;