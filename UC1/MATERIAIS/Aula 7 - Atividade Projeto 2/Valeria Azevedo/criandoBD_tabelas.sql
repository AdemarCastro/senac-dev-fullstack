#Criando um Banco de Dados
create database estudocaso_locadora
default character set utf8
default collate utf8_general_ci;

show databases;

#Colocar o Banco de Dados em uso
use estudocaso_locadora;

#Verificando tabelas no Banco de Dados
show tables;

#Criando a tabela CLIENTE
create table if not exists cliente(
cnh_cliente int not null primary key,
nome_cliente varchar(100) not null,
cartao_cliente varchar(20) not null unique
)default charset=utf8;

show tables;

desc cliente;

#Criando a tabela cliente_telefone
create table if not exists cliente_telefone(
codigotelefone_cliente int not null primary key,
cnh_cliente int not null,
numero_telefone_cliente varchar(13),
foreign key(cnh_cliente) references cliente(cnh_cliente)
)default charset=utf8;

show tables;

#Criando a tabela agencia
create table if not exists agencia(
num_agencia int not null primary key,
end_cep varchar(8) not null,
end_rua varchar(100) not null,
end_num varchar(10) not null,
end_cidade varchar(80) not null
)default charset=utf8;

show tables;

#Criando a tabela carro
create table if not exists carro(
placa_carro int not null primary key,
num_agencia int not null,
modelo_carro varchar(50) not null,
ano_carro varchar(4) not null,
foreign key(num_agencia) references agencia(num_agencia)
)default charset=utf8;

show tables;

#Criando a tabela aluguel_cliente_carro
create table if not exists aluguel_cliente_carro(
cod_aluguel int not null primary key,
cnh_cliente int not null,
placa_carro int not null,
data_aluguel varchar(10) not null,
foreign key(cnh_cliente) references cliente(cnh_cliente),
foreign key(placa_carro) references carro(placa_carro)
)default charset=utf8;

show tables;