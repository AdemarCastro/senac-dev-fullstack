#ADICIONANDO DADOS NAS TABELAS

#Inserindo dados na tabela CLIENTE

INSERT INTO cliente(cnh_cliente, nome_cliente, cartao_cliente)
VALUES ('00001', 'Cliente A', 'Cartao-01' );

INSERT INTO cliente(cnh_cliente, nome_cliente, cartao_cliente)
VALUES ('00002', 'Cliente B', 'Cartao-02' );

INSERT INTO cliente(cnh_cliente, nome_cliente, cartao_cliente)
VALUES ('00003', 'Cliente C', 'Cartao-03' );

select *from cliente;


#Inserindo dados na tabela CLIENTE_TELEFONE

INSERT INTO cliente_telefone(codigotelefone_cliente, cnh_cliente, numero_telefone_cliente)
VALUES ('1', '00001', '92999999991');

INSERT INTO cliente_telefone(codigotelefone_cliente, cnh_cliente, numero_telefone_cliente)
VALUES ('2', '00002', '92999999992');

INSERT INTO cliente_telefone(codigotelefone_cliente, cnh_cliente, numero_telefone_cliente)
VALUES ('3', '00003', '92999999993');

select *from cliente_telefone;


#Inserindo dados na tabela AGENCIA

INSERT INTO agencia(num_agencia, end_cep, end_rua, end_num, end_cidade)
VALUES ('11', '69060661', 'Rua A', 'A-01', 'Cidade A' );

INSERT INTO agencia(num_agencia, end_cep, end_rua, end_num, end_cidade)
VALUES ('22', '69060662', 'Rua B', 'B-02', 'Cidade B' );

INSERT INTO agencia(num_agencia, end_cep, end_rua, end_num, end_cidade)
VALUES ('33', '69060663', 'Rua C', 'C-03', 'Cidade C' );

select *from agencia;


#Inserindo dados na tabela CARRO

INSERT INTO carro(placa_carro, num_agencia, modelo_carro, ano_carro)
VALUES ('100', '11', 'Modelo A', '2001');

INSERT INTO carro(placa_carro, num_agencia, modelo_carro, ano_carro)
VALUES ('200', '22', 'Modelo B', '2002');

INSERT INTO carro(placa_carro, num_agencia, modelo_carro, ano_carro)
VALUES ('300', '33', 'Modelo C', '2003');

select *from carro;


#Inserindo dados na tabela aluguel_cliente_carro

INSERT INTO aluguel_cliente_carro(cod_aluguel, cnh_cliente, placa_carro, data_aluguel)
VALUES ('11000', '00001', '100', '10/11/2021');

INSERT INTO aluguel_cliente_carro(cod_aluguel, cnh_cliente, placa_carro, data_aluguel)
VALUES ('22000', '00002', '200', '10/11/2022');

INSERT INTO aluguel_cliente_carro(cod_aluguel, cnh_cliente, placa_carro, data_aluguel)
VALUES ('33000', '00003', '300', '10/11/2023');

select *from aluguel_cliente_carro;