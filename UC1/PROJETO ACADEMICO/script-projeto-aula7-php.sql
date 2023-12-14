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
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
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

SELECT * FROM usuarios;

# Inserindo Usuário
INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('001', 'Ademar Castro', 'ademar.castro@gmail.com', md5('1234'), 'Ativo', 'Administrador')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('002', 'João Gomes', 'joao.gomes@gmail.com', md5('12345'), 'Inativa', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('003', 'Lucas Luco', 'lucas.luco@gmail.com', md5('123456'), 'Ativo', 'Professor')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('004', 'Maria Silva', 'maria.silva@gmail.com', md5('password123'), 'Ativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('005', 'Pedro Almeida', 'pedro.almeida@gmail.com', md5('abcde789'), 'Inativo', 'Professor')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('006', 'Ana Sousa', 'ana.sousa@gmail.com', md5('senha123'), 'Ativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('007', 'Carlos Oliveira', 'carlos.oliveira@gmail.com', md5('789xyz'), 'Ativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('008', 'Mariana Santos', 'mariana.santos@gmail.com', md5('senha456'), 'Inativo', 'Professor')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('009', 'Rafaela Costa', 'rafaela.costa@gmail.com', md5('costa123'), 'Ativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('010', 'Fernando Vieira', 'fernando.vieira@gmail.com', md5('123abc'), 'Inativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('011', 'Patrícia Ferreira', 'patricia.ferreira@gmail.com', md5('ferreira456'), 'Ativo', 'Professor')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('012', 'Gabriel Ramos', 'gabriel.ramos@gmail.com', md5('ramos123'), 'Ativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('013', 'Sofia Martins', 'sofia.martins@gmail.com', md5('martins789'), 'Inativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('014', 'Daniel Costa', 'daniel.costa@gmail.com', md5('costa1234'), 'Ativo', 'Professor')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('015', 'Laura Fernandes', 'laura.fernandes@gmail.com', md5('fernandes567'), 'Ativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('016', 'Mateus Lima', 'mateus.lima@gmail.com', md5('lima123'), 'Inativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('017', 'Camila Pereira', 'camila.pereira@gmail.com', md5('pereira789'), 'Ativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('018', 'Gustavo Oliveira', 'gustavo.oliveira@gmail.com', md5('oliveira123'), 'Inativo', 'Professor')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('019', 'Isabela Rodrigues', 'isabela.rodrigues@gmail.com', md5('rodrigues456'), 'Ativo', 'Aluno')
;

INSERT INTO usuarios (matricula, nome, email, senha, estatus, painel)
VALUES ('020', 'Henrique Sousa', 'henrique.sousa@gmail.com', md5('sousa123'), 'Ativo', 'Aluno')
;

# Visualizar os Usuários
SELECT * FROM usuarios;

DELETE FROM usuarios
WHERE id = 5;