USE `projeto_locadora_carros`;


#inserindo clientes

insert into cliente(cnh, nome, cartao)
values('11111111111','Fulano','1234567891234567');

insert into cliente(cnh, nome, cartao)
values('22222222222','Siclano','2345678912345678');

insert into cliente(cnh, nome, cartao)
values('33333333333','Beltrano','3456789123456789');

select * from cliente;

#inserindo telefones cliente_telefone
insert into cliente_telefone(cod_telefone, numero, cnh)
values('1','92981818181','11111111111');

insert into cliente_telefone(cod_telefone, numero, cnh)
values('2','92992929292','22222222222');

insert into cliente_telefone(cod_telefone, numero, cnh)
values('3','92984848484','33333333333');

select * from cliente_telefone;


#inserindo agencias

insert into agencia(num_ag, end_cep, end_rua, end_num, end_cidade)
values('1','69000000','Rua 1','Casa 1','Cidade 1');

insert into agencia(num_ag, end_cep, end_rua, end_num, end_cidade)
values('2','69111111','Rua 2','Casa 2','Cidade 2');

insert into agencia(num_ag, end_cep, end_rua, end_num, end_cidade)
values('3','69222222','Rua 3','Casa 3','Cidade 3');

select * from agencia;


#inserindo carros

insert into carro(placa, modelo, ano, num_ag)
values('PHZ0000','GOL','2022','1');

insert into carro(placa, modelo, ano, num_ag)
values('QZB1111','MOBI','2023','2');

insert into carro(placa, modelo, ano, num_ag)
values('PCL2222','ONIX','2021','3');

select * from carro;

#inserindo alugueis

insert into aluguel(data_aluguel, placa, cnh)
values('2023-02-23 13:00:00','PHZ0000','11111111111');

insert into aluguel(data_aluguel, placa, cnh)
values('2023-03-24 14:00:00','QZB1111','22222222222');

insert into aluguel(data_aluguel, placa, cnh)
values('2023-04-25 15:00:00','PCL2222','33333333333');

select * from aluguel;


 





