insert into cliente(CNH, nome, cartao)
values('123456789', 'Valdo', '0000000000000');

select*from cliente;
select*from cliente_telefone;
select*from agencia;
select*from carro;
select*from aluguel;
delete from carro where placa= '0';
delete from aluguel where CNH= '123456789';

insert into cliente_telefone(id_telefone, CNH, celular)
values('1', '123456789', '92 994876522');

insert into agencia(numAg, end_rua, end_num, end_cidade, end_cep)
values('12', 'rua natal', '100', 'manaus', '69033-789');

insert into carro(placa, numAg, modelo, ano)
values('PHY12B7', '12', 'chevrolet prisma', '2019');

insert into aluguel(CNH, placa, data_aluguel)
values('123456789', 'PHY12B7', '2024-11-10');