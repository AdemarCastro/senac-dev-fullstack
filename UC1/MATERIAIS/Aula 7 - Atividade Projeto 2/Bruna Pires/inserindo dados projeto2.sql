insert into cliente(cnh, nome, cartao )
values ('445566', 'Bruna Pires', '123456789');

insert into cliente(cnh, nome, cartao )
values ('88524', 'Anne Freitas', '1456465');

insert into cliente(cnh, nome, cartao )
values ('48541122', 'Maria Helena', '9988755');

select * from cliente;
describe cliente;

insert into cliente_telefone(codigo,cnh_cliente,telefone)
values ('1', '445566', '98754212');

insert into cliente_telefone(codigo,cnh_cliente,telefone)
values ('2', '88524', '98542741');

insert into cliente_telefone(codigo,cnh_cliente,telefone)
values ('3', '48541122', '93952874');

select * from cliente_telefone;
describe cliente_telefone;

insert into agencia(num_age, end_rua, end_num, end_bairro, end_cidade, end_cep)
values ('1', 'Rua A', '12', 'JTEXAS', 'Manaus', '690888');

insert into agencia(num_age, end_rua, end_num, end_bairro, end_cidade, end_cep)
values ('2', 'Rua B', '10', 'PONTA NEGRA', 'Rio de Janeiro', '690888810');

insert into agencia(num_age, end_rua, end_num, end_bairro, end_cidade, end_cep)
values ('3', 'Rua C', '15', 'ALVORADA', 'SAO Paulo', '697411');

select * from agencia;
describe agencia;

insert into carro(placa,num_age,modelo,ano)
values ('BBB855','1', 'Tracker','2023');

insert into carro(placa,num_age,modelo,ano)
values ('ORK7547','2', 'Civic','2022');

insert into carro(placa,num_age,modelo,ano)
values ('JWK8345','3', 'Onix','2021');

select * from carro;
describe carro;

insert into aluga(cnh,placa,data_aluguel)
values ('445566','BBB855','2023-11-13');

insert into aluga(cnh,placa,data_aluguel)
values ('88524','ORK7547','2023-11-12');

insert into aluga(cnh,placa,data_aluguel)
values ('48541122','JWK8345','2023-11-11');

select * from aluga;
describe aluga;




