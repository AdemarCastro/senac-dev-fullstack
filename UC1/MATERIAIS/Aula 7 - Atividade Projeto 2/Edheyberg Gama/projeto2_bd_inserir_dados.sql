use estudo_caso_aluguel;

insert into cliente(cnh,nome,cartao) values
('12345678901','André','123456789012');
insert into cliente(cnh,nome,cartao) values
('12345678902','Beto','223456789012');
insert into cliente(cnh,nome,cartao) values
('32345678901','Carlos','323456789012');

#select * from cliente;

insert into cliente_telefone(codigo,cnh_cliente,telefone) values
('1','12345678901','12345678901');
insert into cliente_telefone(codigo,cnh_cliente,telefone) values
('2','12345678902','22222222222');
insert into cliente_telefone(codigo,cnh_cliente,telefone) values
('3','12345678902','33333333333');

#select * from cliente_telefone;

insert into agencia(numAg,nome) values 
('1','Agencia 1');
insert into agencia(numAg,nome) values 
('2','Agencia B');
insert into agencia(numAg,nome) values 
('3','Terceira Agencia');

#select * from agencia;

insert into agencia_endereco(codigo,cod_agencia,cep,rua,numero,cidade) values
('1','1','12345678','Rua A','22','Manaus');
insert into agencia_endereco(codigo,cod_agencia,cep,rua,numero,cidade) values
('2','2','64002222','Rua Dois ','122','Manaus');
insert into agencia_endereco(codigo,cod_agencia,cep,rua,numero,cidade) values
('3','3','62003333','Rua Central','9','Manacapuru');

#select * from agencia_endereco;

insert into carro(placa,cod_agencia,ano_fabricado) values
('123456789','1','1994');
insert into carro(placa,cod_agencia,ano_fabricado) values
('222222222','2','2022');
insert into carro(placa,cod_agencia,ano_fabricado) values
('333333333','2','2020');

#select * from carro;

insert into aluguel(codigo,cnh_cliente,placa_carro,data_aluguel) values
('1','12345678902','222222222','2023-11-10');
insert into aluguel(codigo,cnh_cliente,placa_carro,data_aluguel) values
('2','32345678901','222222222','2023-11-09');
insert into aluguel(codigo,cnh_cliente,placa_carro,data_aluguel) values
('3','32345678901','333333333','2023-11-02');

#select * from aluguel;
