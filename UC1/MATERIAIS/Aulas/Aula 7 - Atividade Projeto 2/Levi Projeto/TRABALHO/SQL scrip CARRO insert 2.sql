# ----------------- INSERIR COMANDOS -----------------

insert into cliente(cnh, nome, cartao) values
('111', 'roberto','1111-1'),
('222', 'erika','2222-2'),
('333', 'carlitu', '3333-3');


insert into telefone_cliente(cod_telefone_cliente, nome, cnh) values
('1111', 'roberto', '111'),
('2222', 'erika', '222'),
('3333', 'carlitu', '333');


insert into agencia(cod_agencia,end_num,end_cep,end_rua,end_cidade) values
('1', 'num1', 'cep1', 'rua1', 'cidadeA'),
('2', 'num2', 'cep2', 'rua2', 'cidadeB'),
('3', 'num3', 'cep3', 'rua3', 'cidadeC');


insert into carro(placa,cod_agencia,modelo,ano) values
('placa_1', '1', 'fusca', '2000'),
('placa_2', '2', 'fusca', '2000'),
('placa_3', '3', 'fusca', '2000');


insert into aluga(cod_alugel,placa,cnh,dia) values
('1', 'placa_1', '111' , '2004/02/10'),
('2', 'placa_2', '222' , '2004/02/11'),
('3', 'placa_3', '333' , '2004/02/12');

