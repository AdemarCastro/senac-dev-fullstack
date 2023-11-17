create database projeto2
default character set utf8
default collate utf8_general_ci;

use projeto2;

create table if not exists cliente(
cnh int not null primary key,
nome varchar(100) not null,
cartao varchar(20) not null
)default charset=utf8;

create table if not exists agencia(
num_ag varchar(45) not null primary key,
end_cep varchar(45) not null,
end_rua varchar(45) not null,
end_num varchar(45) not null,
end_cidade varchar (45) not null
)default charset=utf8;


create table if not exists carro(
placa varchar(45) not null primary key,
num_ag varchar(45) not null,
modelo varchar(45) not null,
ano varchar(10) not null,
foreign key(num_ag) references agencia(num_ag)
)default charset=utf8;


create table if not exists cliente_telefone(
codigo_telefone int not null primary key,
cnh int not null,
foreign key(cnh) references cliente(cnh)
)default charset=utf8;

create table if not exists aluga(
cnh int not null,
placa varchar(45) not null, 
data_aluguel date not null,
foreign key(cnh) references cliente(cnh),
foreign key(placa) references carro(placa)
)default charset=utf8;


