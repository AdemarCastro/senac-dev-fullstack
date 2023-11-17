#INSERINDO DADOS NAS TABELAS

insert into CLIENTE (CNH, nome,cartao) values ('11111111111','André Angelo','120365478995');

insert into CLIENTE (CNH, nome,cartao) values ('22222222222','Beatriz Bianca','1023659854523695');

insert into CLIENTE (CNH, nome,cartao) values ('33333333333','Carlos Caio','1456848745632102');

insert into telefone_CLIENTE (codigo,telefone,cnh_cliente) values (null,'945213687','11111111111');

insert into telefone_CLIENTE (codigo,telefone,cnh_cliente) values (null,'936485712','22222222222');

insert into telefone_CLIENTE (codigo,telefone,cnh_cliente) values (null,'992452355','33333333333');

insert into agencia (numero,rua,bairro,cep) values (null,'Rua Margaria','Lapa','691245836');

insert into agencia (numero,rua,bairro,cep) values (null,'Rua Dos Bobos','Zumbi','691244517');

insert into agencia (numero,rua,bairro,cep) values (null,'Rua São Pedro','Compesa','698365836');

insert into MODELO (codigo ,descricao,valor_diaria) values (null,'Fiat Uno', 150.00);

insert into MODELO (codigo ,descricao,valor_diaria) values (null,'GM-CHEVROLET / ONIX 1.0 LT', 154.00);

insert into MODELO (codigo ,descricao,valor_diaria) values (null,'FIAT / PALIO FIRE 1.0 4P', 138.00);

insert into MODELO (codigo ,descricao,valor_diaria) values (null,'GM- CHEVROLET / PRISMA 1.0 LT', 158.00);

insert into carro (placa,Ano,numero_agencia,codigo_modelo) values ('1111111','2012',1,1);

insert into carro (placa,Ano,numero_agencia,codigo_modelo) values ('2222222','2019',2,1);

insert into carro (placa,Ano,numero_agencia,codigo_modelo) values ('3333333','2021',3,1);

insert into Aluga_Cliente_Carro (codigo,dt_aluguel,total_dias,preco_total,cnh_cliente,placa_carro) values (null,NOW(),null,0,'11111111111','1111111');

insert into Aluga_Cliente_Carro (codigo,dt_aluguel,total_dias,preco_total,cnh_cliente,placa_carro) values (null,NOW(),null,0,'22222222222','2222222');

insert into Aluga_Cliente_Carro (codigo,dt_aluguel,total_dias,preco_total,cnh_cliente,placa_carro) values (null,NOW(),null,0,'33333333333','3333333');