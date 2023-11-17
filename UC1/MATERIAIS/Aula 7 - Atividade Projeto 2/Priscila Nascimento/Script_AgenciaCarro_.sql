#ADICIONANDO DADOS NAS TABELAS 

#Inserindo dados na tabela CLIENTE
INSERT INTO cliente(cnh, nome, cartao)
VALUES ('1111111111', 'Ana', '5555555555555');

INSERT INTO cliente(cnh, nome, cartao)
VALUES ('2222222222', 'Bruno', '6666666666666');

INSERT INTO cliente(cnh, nome, cartao)
VALUES ('3333333333', 'Cristian', '7777777777777');

#Inserindo dados na tabela AGENCIA
INSERT INTO agencia(num_ag, end_cep, end_rua, end_num, end_cidade)
VALUES ('1212121212', '111111111', 'Rua A', '100', 'manaus');

INSERT INTO agencia(num_ag, end_cep, end_rua, end_num, end_cidade)
VALUES ('3131313131', '222222222', 'Rua B', '200', 'manacapuru');

INSERT INTO agencia(num_ag, end_cep, end_rua, end_num, end_cidade)
VALUES ('4141414141', '333333333', 'Rua C', '300', 'tefe');







#Inserindo dados na tabela CARRO

INSERT INTO carro(placa, carro_num_ag, modelo, ano)
VALUES ('KLJ123','1212121212', 'SUV', '2019');

INSERT INTO carro(placa, carro_num_ag, modelo, ano)
VALUES ('XML456','4141414141', 'SUV', '2021');

select *from carro;

INSERT INTO carro(placa, carro_num_ag, modelo, ano)
VALUES ('ANT1236', 3131313131, 'SUV', '2022');

#Inserindo dados na tabela CLIENTE_TELEFONE

INSERT INTO cliente_telefone(codigo, cnh_cliente, numero)
VALUES ('123456', '1111111111', '9999999999');

INSERT INTO cliente_telefone(codigo, cnh_cliente, numero)
VALUES ('654321', '2222222222', '888888888');

INSERT INTO cliente_telefone(codigo, cnh_cliente, numero)
VALUES ('789456', '3333333333', '777777777');


#Inserindo dados na tabela ALUGA 
INSERT INTO aluga(cnh_cliente, placa_carro)
VALUES ('1111111111', 'KLJ123');

INSERT INTO aluga(cnh_cliente, placa_carro)
VALUES ('2222222222','ANT1236');

INSERT INTO aluga(cnh_cliente, placa_carro)
VALUES ('3333333333','XML456');




