#AULA 7 - DML PROJETO 2 _ LOCADORA DE CARROS 

#inserindo dados na tabela CLIENTE
insert into CLIENTE(cnh, nome, cartao) 
values ('123456789','Barbara Matos','2323151565658989');

insert into CLIENTE(cnh, nome, cartao) 
values ('987654321','Emerson William','1010252587876363');

insert into CLIENTE(cnh, nome, cartao) 
values ('369258147','Sabrina Oliveira','6363989874741212');

select * from CLIENTE;

#inserindo dados na tabela CLIENTE_TELEFONE;
-- Bárbara
insert into CLIENTE_TELEFONE(codigo, cnh_cliente, numero)
values ('1','123456789','92993020439');

-- Emerson
insert into CLIENTE_TELEFONE(codigo, cnh_cliente, numero)
values ('2','987654321','92994087280');

-- Emerson - numero 2
insert into CLIENTE_TELEFONE(codigo, cnh_cliente, numero)
values ('3','987654321','92993058575');

select * from CLIENTE_TELEFONE;

#inserindo dados na tabela AGENCIA
insert into AGENCIA(num_ag, end_rua, end_num, end_cep, end_cidade)
values ('1','Barroso','101','69030-010','Manaus');

insert into AGENCIA(num_ag, end_rua, end_num, end_cep, end_cidade)
values ('2','Carvalho Leal','20','69050-151','Manaus');

insert into AGENCIA(num_ag, end_rua, end_num, end_cep, end_cidade)
values ('3','Japiim','3219','69800-171','Minas Gerais');

select * from AGENCIA;

#inserindo dados na tabela CARRO
insert into CARRO(placa, num_agencia, modelo, ano)
values ('JIS025S','2','Toyota Yaris Sedan','2018');

insert into CARRO(placa, num_agencia, modelo, ano)
values ('0PAB4R9','1','Honda City','2009');

insert into CARRO(placa, num_agencia, modelo, ano)
values ('P9IEM3R','2','Renault Logan','2004');

select * from CARRO;

#inserindo dados na tabela ALUGA
-- Bárbara
insert into ALUGA(cnh_cliente, placa_carro, data_aluguel)
values ('123456789', '0PAB4R9', '2023-10-09');

-- Emerson
insert into ALUGA(cnh_cliente, placa_carro, data_aluguel)
values ('987654321', 'P9IEM3R', '2023-05-15');

-- Sabrina
insert into ALUGA(cnh_cliente, placa_carro, data_aluguel)
values ('369258147', 'JIS025S','2017-05-26');

select * from ALUGA;

