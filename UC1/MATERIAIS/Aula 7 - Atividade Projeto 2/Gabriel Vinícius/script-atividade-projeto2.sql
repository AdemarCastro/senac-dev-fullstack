create database locadora
default character set utf8
default collate utf8_general_ci;

USE locadora;

create table if not exists cliente(
cnh int not null primary key,
nome varchar(80) not null,
cartao varchar(16) not null unique
)default charset=utf8;

create table if not exists tel_cli(
cod_tel_cli int not null primary key,
cod_cli int not null,
numero varchar(13),
foreign key(cod_cli) references cliente(cnh)
)default charset=utf8;

create table if not exists aluguel(
cod_aluguel int not null primary key,
cnh int not null,
placa varchar(7) not null,
data_aluguel datetime,
foreign key(cnh) references cliente(cnh),
foreign key(placa) references carro(placa)
)default charset=utf8;

create table if not exists carro(
placa int not null primary key,
cod_ag int not null,
modelo varchar(20) not null,
ano int(4),
foreign key(cod_ag) references agencia(cod_ag)
)default charset=utf8;

create table if not exists agencia(
cod_ag int not null primary key,
end_cep varchar(9) not null,
end_rua varchar(60) not null,
end_num varchar(5) not null,
end_bairro varchar(40) not null,
end_cidade varchar(30) not null
)default charset=utf8;

ALTER TABLE cliente MODIFY COLUMN cnh INT(9);
ALTER TABLE carro MODIFY COLUMN placa VARCHAR(7);
DROP TABLE aluguel;

INSERT INTO cliente(cnh, nome, cartao)
VALUES('111111111', 'Gabriel', '1111111111111');

INSERT INTO cliente(cnh, nome, cartao)
VALUES('222222222', 'Turing', '2222222222222');

INSERT INTO cliente(cnh, nome, cartao)
VALUES('333333333', 'Boole', '3333333333333');

SELECT * FROM cliente;

INSERT INTO tel_cli(cod_tel_cli, cod_cli, numero)
VALUES('1', '111111111', '4444444444444');

INSERT INTO tel_cli(cod_tel_cli, cod_cli, numero)
VALUES('2', '222222222', '5555555555555');

INSERT INTO tel_cli(cod_tel_cli, cod_cli, numero)
VALUES('3', '333333333', '6666666666666');

SELECT * FROM tel_cli;

INSERT INTO agencia(cod_ag, end_cep, end_rua, end_num, end_bairro, end_cidade)
VALUES('1', '000000000', 'Rua 1', '10', 'Bairro A', 'Manaus');

INSERT INTO agencia(cod_ag, end_cep, end_rua, end_num, end_bairro, end_cidade)
VALUES('2', '999999999', 'Rua 2', '11', 'Bairro B', 'São Paulo');

INSERT INTO agencia(cod_ag, end_cep, end_rua, end_num, end_bairro, end_cidade)
VALUES('3', '888888888', 'Rua 3', '12', 'Bairro C', 'Rio de Janeiro');

SELECT * FROM agencia;

INSERT INTO carro(placa, cod_ag, modelo, ano)
VALUES('1234567', '1', 'Modelo A', '2020');

INSERT INTO carro(placa, cod_ag, modelo, ano)
VALUES('1111111', '2', 'Modelo B', '2021');

INSERT INTO carro(placa, cod_ag, modelo, ano)
VALUES('2222222', '3', 'Modelo C', '2022');

SELECT * FROM carro;

INSERT INTO aluguel(cod_aluguel, cnh, placa)
VALUES('4', '111111111', '1234567');

INSERT INTO aluguel(cod_aluguel, cnh, placa)
VALUES('5', '222222222', '1111111');

INSERT INTO aluguel(cod_aluguel, cnh, placa)
VALUES('6', '333333333', '2222222');

SELECT * FROM aluguel;




