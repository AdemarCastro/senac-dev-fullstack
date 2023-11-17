create database projetoaula07;
use projetoaula07;

create table if not exists cliente (
cnh int not null primary key,
nome varchar(50) not null,
cartao varchar(11) not null unique key,
cod_fone int not null,
foreign key (cod_fone) references telefone_cliente(codigo)
)default charset=utf8;

insert into cliente (cnh, nome, cartao, cod_fone) values (9999999999, 'Dalmacio', 999999999, 001);
insert into cliente (cnh, nome, cartao, cod_fone) values (8888888, 'Naruto', 8888888, 002);
insert into cliente (cnh, nome, cartao, cod_fone) values (777777777, 'Goku', 777777777, 001);
insert into cliente (cnh, nome, cartao, cod_fone) values (666666666, 'Jaspion', 666666666, 001);
insert into cliente (cnh, nome, cartao, cod_fone) values (555555555, 'Hercules', 555555555, 001);


create table if not exists telefone_cliente (
codigo int primary key not null,
numero int not null 
)default charset=utf8;

insert into telefone_cliente (codigo, numero) values (001, 98989898);
insert into telefone_cliente (codigo, numero) values (002, 97979797);
insert into telefone_cliente (codigo, numero) values (003, 96969696);
insert into telefone_cliente (codigo, numero) values (004, 95959595);
insert into telefone_cliente (codigo, numero) values (005, 94949494);


create table if not exists agencia(
cod_agencia int primary key not null,
end_cep varchar(10),
end_rua varchar(20),
end_numero varchar (5),
end_cidade varchar (20)
)default charset=utf8;

insert into agencia (cod_agencia, end_cep, end_rua, end_numero, end_cidade) values (10, 69042150, 'Djalma Batista', 101, "Manaus");
insert into agencia (cod_agencia, end_cep, end_rua, end_numero, end_cidade) values (11, 69042150, 'COnstantino Nery', 102, "Manaus");
insert into agencia (cod_agencia, end_cep, end_rua, end_numero, end_cidade) values (12, 69042150, ' Anhanguera', 103, "Sao Paulo");
insert into agencia (cod_agencia, end_cep, end_rua, end_numero, end_cidade) values (13, 69042150, 'Anahia Melo', 104, "Sao Paulo");
insert into agencia (cod_agencia, end_cep, end_rua, end_numero, end_cidade) values (14, 69042150, 'Rodoanel', 105, "Rio de Janeiro");


create table if not exists carro(
placa varchar(7) primary key not null,
modelo varchar (15) not null,
ano int not null,
cod_age int,
foreign key (cod_age) references agencia(cod_agencia)
)default charset=utf8;

insert into carro (placa, modelo, ano, cod_age) values ("adr2010", "ltz completo", 2023, 10);
insert into carro (placa, modelo, ano, cod_age) values ("uyt1119", "hibrido", 2020, 11);
insert into carro (placa, modelo, ano, cod_age) values ("ujf3h55", "sedan 1.0 turbo", 2024, 12);
insert into carro (placa, modelo, ano, cod_age) values ("opi8987", "hatch 1.5 eletrico", 2018, 13);
insert into carro (placa, modelo, ano, cod_age) values ("aer6543", " retrô", 1850, 14);


create table if not exists reserva (
cod_reserva int not null primary key,
data_reserva varchar(20) not null,
cnh_cli int,
placa_carro varchar (7),
foreign key (cnh_cli) references cliente(cnh),
foreign key (placa_carro) references carro(placa)
)default charset=utf8;

insert into reserva (cod_reserva, data_reserva, cnh_cli, placa_carro) values (999, "10/01/2023", 9999999999, "adr2010");
insert into reserva (cod_reserva, data_reserva, cnh_cli, placa_carro) values (888, "10/10/2020", 8888888, "uyt1119");
insert into reserva (cod_reserva, data_reserva, cnh_cli, placa_carro) values (666, "12/12/2020", 666666666, "aer6543");

select * from reserva;



