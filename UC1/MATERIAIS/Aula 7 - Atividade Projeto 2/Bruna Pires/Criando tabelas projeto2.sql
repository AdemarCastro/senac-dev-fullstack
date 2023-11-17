create database projeto2;
use projeto2;


create table if not exists cliente(
cnh int not null primary key,
nome varchar(60) not null,
cartao varchar(20)
)default charset=utf8;

create table cliente_telefone(
codigo int not null primary key,
cnh_cliente int not null,
telefone varchar(60),
foreign key(cnh_cliente) references cliente(cnh)
)default charset=utf8;

show tables;

create table if not exists agencia(
num_age varchar(60) not null primary key,
end_rua varchar(60),
end_num varchar(45),
end_bairro varchar(45),
end_cidade varchar(45),
end_cep varchar(45)
)default charset=utf8;

create table if not exists carro(
placa varchar(60) not null primary key,
num_age varchar(60),
modelo varchar(60),
ano int not null,
foreign key (num_age) references agencia(num_age)
)default charset=utf8;

create table aluga(
cnh int not null,
placa varchar(60),
data_aluguel date,
foreign key(cnh) references cliente(cnh),
foreign key (placa) references carro (placa)
)default charset=utf8;


