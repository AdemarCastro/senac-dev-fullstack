#inserindo dados na tabela cliente

insert into cliente(cnh, nome, cartao)
values ('123123123123', 'João da silva', '12341111111');

delete from cliente where cnh='123.123.123.123';

insert into cliente(cnh, nome, cartao)
values ('222222222222', 'Maria chiquinha', '22222222222');

insert into cliente(cnh, nome, cartao)
values ('33333333333', 'Gervásio Silva', '45645645656');

select *from cliente;

insert into cliente_telefone(nro_principal, cnh_cliente, numero_2)
values ('1234567890', '123123123123', '0987654321');

insert into cliente_telefone(nro_principal, cnh_cliente, numero_2)
values ('7894561230', '222222222222', '0121454789');

insert into cliente_telefone(nro_principal, cnh_cliente, numero_2)
values ('000000000', '33333333333', '11111111111');

select *from cliente_telefone;

insert into agencia(numag, end_rua, end_cep, end_num, end_cidade)
values ('1111', 'rua 1', '12345678', '50', 'manaus');

insert into agencia(numag, end_rua, end_cep, end_num, end_cidade)
values ('2222', 'rua 2', '12378945', '100', 'Porto Ferreira');

insert into agencia(numag, end_rua, end_cep, end_num, end_cidade)
values ('3333', 'rua 3', '12345678', '4000', 'Manaus');

select *from agencia;

insert into carro(placa, modelo, ano, ag_nro)
values ('abc1234', 'gol', '2020', '1111');

insert into carro(placa, modelo, ano, ag_nro)
values ('def1234', 'corsa', '1995', '2222');

insert into carro(placa, modelo, ano, ag_nro)
values ('ghi1234', 'mustang', '2023', '3333');

insert into aluga(codigo, dia_locacao, cnh_cliente, placa_carro)
values ('12345', '25-10-23', '123123123123', 'abc1234');

insert into aluga(codigo, dia_locacao, cnh_cliente, placa_carro)
values ('98765', '10-11-23', '222222222222', 'def1234');

insert into aluga(codigo, dia_locacao, cnh_cliente, placa_carro)
values ('456123', '28-02-23', '33333333333', 'ghi1234');

select *from aluga;