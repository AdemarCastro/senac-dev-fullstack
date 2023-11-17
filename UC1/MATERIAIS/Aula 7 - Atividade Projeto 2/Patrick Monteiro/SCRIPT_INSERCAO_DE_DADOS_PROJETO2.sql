#---------- PATRICK MONTEIRO -----------------------
#INSERINDO DADOS------------------------------------
use projeto2_locadora;

#CLIENTE---------------------------------------------
insert into cliente(cnh, nome, cartao)
values ('111111111','Alex Silva','2222222222222');

insert into cliente(cnh, nome, cartao)
values ('333333333','Beatriz Monteiro','4444444444444');

insert into cliente(cnh, nome, cartao)
values ('555555555','Carlos Morais','6666666666666');

select * from cliente;

#CLIENTE TELEFONE---------------------------------------------
insert into cliente_telefone(cod_telefone, cod_cnh, numero)
values ('1','111111111','092111111111');

insert into cliente_telefone(cod_telefone, cod_cnh, numero)
values ('2','333333333','092222222222');

insert into cliente_telefone(cod_telefone, cod_cnh, numero)
values ('3','555555555','092333333333');

select * from cliente_telefone;

#AGENCIA--------------------------------------------------------
insert into agencia(n_agencia)
values ('123');

insert into agencia(n_agencia)
values ('213');

insert into agencia(n_agencia)
values ('321');

select * from agencia;

#ENDERECO AGENCIA-----------------------------------------------------------------
insert into agencia_endereco(cep, cod_agencia, end_num, end_rua, end_cidade)
values ('69043567','123','12', 'Rua A','Cidade W');

insert into agencia_endereco(cep, cod_agencia, end_num, end_rua, end_cidade)
values ('69043001','213','37', 'Rua B','Cidade Y');

insert into agencia_endereco(cep, cod_agencia, end_num, end_rua, end_cidade)
values ('69043453','321','99', 'Rua C','Cidade Z');

select * from agencia_endereco;

#CARRO------------------------------------------------------------------
insert into carro(placa, cod_agencia, modelo, ano)
values ('A1G4544','123','Modelo A', '2020');

insert into carro(placa, cod_agencia, modelo, ano)
values ('B749DHH','213','Modelo B', '2016');

insert into carro(placa, cod_agencia, modelo, ano)
values ('CK56OFG','321','Modelo C', '2009');

select * from carro;

#ALUGA-------------------------------------------------------------------------
insert into aluga(cod_cnh, cod_placa, data_aluguel)
values ('111111111','A1G4544','09/2020');

insert into aluga(cod_cnh, cod_placa, data_aluguel)
values ('333333333','B749DHH','02/2023');

insert into aluga(cod_cnh, cod_placa, data_aluguel)
values ('555555555','CK56OFG','08/2022');

select * from aluga;