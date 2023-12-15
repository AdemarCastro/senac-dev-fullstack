CREATE DATABASE IF NOT EXISTS `projeto_locadora_carros` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `projeto_locadora_carros`;

#Criando tabela cliente

CREATE TABLE IF NOT EXISTS cliente(
  cnh varchar(11) NOT NULL PRIMARY KEY,
  nome varchar(100) NULL,
  cartao varchar(16) NULL  
)DEFAULT CHARSET=utf8;

show tables;

#Criando tabela cliente_telefone

CREATE TABLE IF NOT EXISTS cliente_telefone(
  cod_telefone int(11) NOT NULL PRIMARY KEY,
  numero varchar(11) NULL,
  cnh varchar(11) NOT NULL,
  FOREIGN KEY(cnh) REFERENCES cliente(cnh)
)DEFAULT CHARSET=utf8;

show tables;

#Criando tabela agencia

CREATE TABLE IF NOT EXISTS agencia(
  num_ag int NOT NULL PRIMARY KEY,
  end_cep varchar(8) NOT NULL,
  end_rua varchar(45) NOT NULL,
  end_num varchar(10) NOT NULL,
  end_cidade varchar(80) NOT NULL
)DEFAULT CHARSET=utf8;

show tables;

#Criando tabela carro


CREATE TABLE IF NOT EXISTS carro(
  placa varchar(7) NOT NULL PRIMARY KEY,
  modelo varchar(50) NOT NULL,
  ano varchar(4) NOT NULL,
  num_ag int NOT NULL,
  FOREIGN KEY(num_ag) REFERENCES agencia(num_ag)
)DEFAULT CHARSET=utf8;

show tables;

#Criando tabela aluguel

CREATE TABLE IF NOT EXISTS aluguel(
	data_aluguel datetime NOT NULL,
    placa varchar(11) NOT NULL,
	cnh varchar(11) NOT NULL,
	FOREIGN KEY(cnh) REFERENCES cliente(cnh),
    FOREIGN KEY(placa) REFERENCES carro(placa)
)DEFAULT CHARSET=utf8;

show tables;

desc agencia;
desc aluguel;
desc carro;
desc cliente;
desc cliente_telefone;









