-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

create database LOCADORA_CARRO default character set utf8
default collate utf8_general_ci;

USE LOCADORA_CARRO;

create table if not exists cliente (
cnh VARCHAR(11) not null PRIMARY KEY,
Nome VARCHAR(90) not null,
Cartao VARCHAR(16) not null
)default charset=utf8;

create table if not exists telefone_CLIENTE (
codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
telefone VARCHAR(9),
cnh_cliente VARCHAR(11) not null,
FOREIGN KEY(cnh_cliente) REFERENCES cliente (cnh)
)default charset=utf8;

create table if not exists agencia (
numero INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
rua VARCHAR(90) not null,
bairro VARCHAR(30) not null,
cep VARCHAR(9) not null
)default charset=utf8;

create table if not exists MODELO (
codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(90) not null,
valor_diaria Float(10,2) not null
)default charset=utf8;


create table if not exists carro (
placa VARCHAR(7) PRIMARY KEY,
Ano CHAR(4) not null,
numero_agencia INTEGER,
codigo_modelo INTEGER,
CONSTRAINT FK_AGENCIA_CARRO FOREIGN KEY(numero_agencia) REFERENCES agencia (numero),
CONSTRAINT FK_MODELO_CARRO FOREIGN KEY(codigo_modelo) REFERENCES MODELO (codigo)
)default charset=utf8;

create table if not exists Aluga_Cliente_Carro (
codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
dt_aluguel DATETIME not null,
total_dias INTEGER,
preco_total Float(10,2),
cnh_cliente VARCHAR(11) not null,
placa_carro VARCHAR(7) not null,
CONSTRAINT FK_CLIENTE_ALUGA FOREIGN KEY(cnh_cliente) REFERENCES cliente (cnh),
CONSTRAINT FK_CARRO_ALUGA FOREIGN KEY(placa_carro) REFERENCES carro (placa)
)default charset=utf8;
