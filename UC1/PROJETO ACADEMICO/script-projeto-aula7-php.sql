# Criando um Banco de Dados
CREATE DATABASE academico
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci
;

# Visualizar Banco
SHOW DATABASES;

# Usar Banco de Dados
USE academico;

# Criando Tabela de Usuários
CREATE TABLE IF NOT EXISTS usuarios (
id INT NOT NULL PRIMARY KEY,
matricula VARCHAR(3) NOT NULL UNIQUE,
nome VARCHAR(120) NOT NULL,
email VARCHAR(120) NOT NULL,
senha VARCHAR(32) NOT NULL,
estatus VARCHAR(120) NOT NULL,
painel VARCHAR(80) NOT NULL, # administrador, professor e aluno
data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) DEFAULT CHARACTER SET utf8;

DROP TABLE usuarios;

SHOW TABLES;

# Inserindo Usuário
INSERT INTO usuarios (id, matricula, nome, email, senha, estatus, painel)
VALUES ('1', '001', 'Ademar Castro', 'ademar.castro@gmail.com', md5('1234'), 'Ativo', 'Administrador')
;

INSERT INTO usuarios (id, matricula, nome, email, senha, estatus, painel)
VALUES ('2', '002', 'João Gomes', 'joao.gomes@gmail.com', md5('12345'), 'Inativa', 'Aluno')
;

INSERT INTO usuarios (id, matricula, nome, email, senha, estatus, painel)
VALUES ('3', '003', 'Lucas Luco', 'lucas.luco@gmail.com', md5('123456'), 'Ativo', 'Professor')
;

# Visualizar os Usuários
SELECT * FROM usuarios;