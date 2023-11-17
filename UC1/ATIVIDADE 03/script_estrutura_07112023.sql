/* BANCO DE DADOS - SENAC FULL STACK DEVELOPER */

# Mostrar Banco de Dados do meu SGDB
SHOW DATABASES
;

# Colocar Banco de Dados em Uso
USE estudocaso_vendas
;

# Verificando Tabelas no Banco de Dados
SHOW TABLES
;

# Como Ver Toda a Estrutura de uma Tabela
DESCRIBE cliente
;

# Excluir uma Tabela
DROP TABLE IF EXISTS cliente
;

# Excluir o Banco
DROP DATABASE IF EXISTS estudocaso_vendas
;

# Criar Banco de Dados - Loja
CREATE DATABASE estudocaso_vendas
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci
;

# Colocar Banco de Dados em Uso
USE estudocaso_vendas
;

# Criando a Tabela Cliente
CREATE TABLE IF NOT EXISTS cliente (
codigo INT NOT NULL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(11) NOT NULL UNIQUE,
end_cep VARCHAR(9),
end_bairro VARCHAR(40),
end_rua VARCHAR(60),
end_numero VARCHAR(10)
) DEFAULT CHARSET = utf8;

# Criar Tabela Cliente Telefone
CREATE TABLE IF NOT EXISTS cliente_telefone (
codigo INT NOT NULL PRIMARY KEY,
numero VARCHAR(16),
cod_cli INT NOT NULL,
FOREIGN  KEY (cod_cli) REFERENCES cliente(codigo)
) DEFAULT CHARSET = utf8;

# Criar a Tabela Fornecedor
CREATE TABLE IF NOT EXISTS fornecedor (
codigo INT NOT NULL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
telefone VARCHAR(16)
) DEFAULT CHARSET = utf8;

# Criar a Tabela Departamento
CREATE TABLE IF NOT EXISTS departamento (
codigo INT NOT NULL PRIMARY KEY,
descricao VARCHAR(300) NOT NULL
) DEFAULT CHARSET = utf8;

# Criar a Tabela de Funcionário
CREATE TABLE IF NOT EXISTS funcionario (
codigo INT NOT NULL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(11) NOT NULL UNIQUE,
telefone VARCHAR(16),
cod_dep INT NOT NULL, # Eu poderia informar que o funcionário não tem um departamento deixando a opção NULL habilitada
FOREIGN KEY (cod_dep) REFERENCES departamento(codigo)
) DEFAULT CHARSET = utf8;

# Criar a Tabela Compra
CREATE TABLE IF NOT EXISTS compra (
codigo INT NOT NULL PRIMARY KEY,
quantidade_produtos INT NOT NULL,
cod_cli INT NOT NULL,
cod_fun INT NOT NULL,
FOREIGN KEY (cod_cli) REFERENCES cliente(codigo),
FOREIGN KEY (cod_fun) REFERENCES funcionario(codigo)
)DEFAULT CHARSET = utf8;

# Criar a Tabela Produto
CREATE TABLE IF NOT EXISTS produto (
codigo INT NOT NULL PRIMARY KEY,
descricao VARCHAR(300) NOT NULL,
valor DECIMAL(6,2) NOT NULL,
cod_for INT NOT NULL,
FOREIGN KEY (cod_for) REFERENCES fornecedor(codigo)
)DEFAULT CHARSET = utf8;

# Criar a Tabela Produto Compra
CREATE TABLE IF NOT EXISTS produto_compra (
cod_pro INT NOT NULL,
cod_com INT NOT NULL,
data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (cod_pro) REFERENCES produto(codigo),
FOREIGN KEY (cod_com) REFERENCES compra(codigo)
)DEFAULT CHARSET = utf8;