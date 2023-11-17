/* DDL - BANCO DE DADOS - SENAC FULL STACK DEVELOPER */

# Inserindo dados na tabela Cliente
INSERT INTO cliente (codigo, nome, cpf, end_cep, end_bairro, end_rua, end_numero) 
VALUES ('1', 'ADEMAR ALVES CASTRO FILHO', '12345678910', '00000000', 'Jorge Teixeira', 'Avenida dos Lagos', '1433');

# Verificar se o Cliente foi cadastrado
SELECT * FROM cliente;

# Inserindo outros Clientes
INSERT INTO cliente (codigo, nome, cpf, end_cep, end_bairro, end_rua, end_numero)
VALUES ('2', 'BRUNO VIEIRA ALVES', '12345678911', '78066220', 'Colônia Terra Nova', 'Rua dos Trambiques', '1556');

INSERT INTO cliente(codigo, nome, cpf, end_cep, end_bairro, end_rua, end_numero)
VALUES ('3', 'JORGE DA CRUZ', '12345678912', '79077330', 'Bairro da Paz', 'Avenida do Balão', '1465');

# Pesquisar apenas o Nome e CPF dos Clientes
SELECT nome, cpf FROM cliente;

# Apenas o Nome e Endereço
SELECT nome, end_cep, end_bairro, end_rua, end_numero FROM cliente;

# Apenas o Codigo e o CPF dos Clientes
SELECT codigo, cpf FROM cliente;

# Pesquisar por um Codigo Especifico
SELECT * FROM cliente
WHERE codigo = 3
;

# Inserindo Dados na Tabela Cliente Telefone
INSERT INTO cliente_telefone (codigo, numero, cod_cli)
VALUES (1, '(92) 9999-9999', 1);

# Cadastrando Numeros para os outros Clientes
INSERT INTO cliente_telefone (codigo, numero, cod_cli)
VALUES (2, '(92) 9999-9990', 2);

INSERT INTO cliente_telefone (codigo, numero, cod_cli)
VALUES (3, '(92) 9999-9991', 3);

INSERT INTO cliente_telefone (codigo, numero, cod_cli)
VALUES (4, '(92) 9999-9922', 1);

# Verificar se o Número foi inserido
SELECT * FROM cliente_telefone
WHERE cod_cli = 1
;