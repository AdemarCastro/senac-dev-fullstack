/* INSERÇÃO DE DADOS - AGENCIA */

# Inserindo Clientes
INSERT INTO cliente (CNH, nome, cartao)
VALUES ('123456781', 'ADEMAR CASTRO', '1234568791-1')
;

INSERT INTO cliente (CNH, nome, cartao)
VALUES ('123456782', 'JOSE DA SILVA', '1234568791-2')
;

INSERT INTO cliente (CNH, nome, cartao)
VALUES ('123456783', 'GUILHERME DA CRUZ', '1234568791-3')
;

# Inserindo Agencias
INSERT INTO agencia(numAg, end_cep, end_rua, end_num, end_cidade)
VALUES ('1', '56991-001', 'Avenida A', '001', 'Cidade A')
;

INSERT INTO agencia(numAg, end_cep, end_rua, end_num, end_cidade)
VALUES ('2', '56991-002', 'Avenida B', '002', 'Cidade B')
;

INSERT INTO agencia(numAg, end_cep, end_rua, end_num, end_cidade)
VALUES ('3', '56991-003', 'Avenida C', '003', 'Cidade C')
;

# Inserindo Carros
INSERT INTO carro(placa, modelo, ano, cod_numAg)
VALUES ('ABC-001', 'MODELO A', '2001', '1')
;

INSERT INTO carro(placa, modelo, ano, cod_numAg)
VALUES ('ABC-002', 'MODELO B', '2002', '1')
;

INSERT INTO carro(placa, modelo, ano, cod_numAg)
VALUES ('ABC-003', 'MODELO C', '2003', '2')
;

# Inserindo a Relação entre Cliente e Carro
INSERT INTO cliente_carro(cli_CNH, car_placa) # data_aluguel irá se inserir sozinho
VALUES ('123456781', 'ABC-001')
;

INSERT INTO cliente_carro(cli_CNH, car_placa) 
VALUES ('123456782', 'ABC-002')
;

INSERT INTO cliente_carro(cli_CNH, car_placa) 
VALUES ('123456783', 'ABC-003')
;

# Inserindo Telefone de Clientes
INSERT INTO cliente_telefone(codigo, telefone, cli_CNH)
VALUES ('1', '(92) 9 5555-0001', '123456781')
;

INSERT INTO cliente_telefone(codigo, telefone, cli_CNH)
VALUES ('2', '(92) 9 5555-0002', '123456782')
;

INSERT INTO cliente_telefone(codigo, telefone, cli_CNH)
VALUES ('3', '(92) 9 5555-0003', '123456783')
;

# Verificando Dados
SELECT * FROM cliente;
SELECT * FROM carro;
SELECT * FROM agencia;
SELECT * FROM cliente_carro;
SELECT * FROM cliente_telefone;