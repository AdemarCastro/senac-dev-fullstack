create database atividade_aluguel_carro
default character set utf8
default collate utf8_general_ci;
use atividade_aluguel_carro;

create table if not exists cliente(
CNH INT PRIMARY KEY,
nome varchar(100) not null, 
cartao varchar(20) not null)default charset=utf8;

create table if not exists agencia(
NumAg int primary key,
cep int,
rua varchar(50),
num int,
cidade varchar(50))default charset=utf8;

show tables;

create table if not exists carro(
placa varchar(10) primary key,
modelo varchar(20) not null,
ano int not null,
codigo_agencia int not null,
foreign key(codigo_agencia) references agencia(NumAg)
)default charset=utf8;

desc carro;

create table if not exists cliente_telefone(
codigo int primary key,
cnh_cliente int  not null,
numero varchar(20) not null,
foreign key(cnh_cliente) references cliente(CNH)
)default charset=utf8;

create table if not exists aluga(
codigo int primary key,
CNH int not null,
placa varchar(10) not null,
dia date,
foreign key(CNH) references cliente(CNH),
foreign key(placa) references carro(placa)
);

desc aluga;

insert into cliente(CNH, nome, cartao)
values ('11111','Anabele','123123-321');

insert into cliente(CNH, nome, cartao)
values ('222222','Bruce','2225558788');

insert into cliente(CNH, nome, cartao)
values ('33333','Cristian','3141632');

select * from cliente;

INSERT INTO cliente_telefone(codigo, cnh_cliente, numero)
VALUES ('3', '33333', '0800151516');

select * from cliente_telefone;

insert into agencia(NumAg,cep,rua,num,cidade)
values('1','69090544','rua conde do visconde','5','manaus');

insert into agencia(NumAg,cep,rua,num,cidade)
values('2','69090544','rua conde de intanhaein','10','manaus');

insert into agencia(NumAg,cep,rua,num,cidade)
values('3','70707029','alameda das decepcoes','4545','manacapuru');

insert into carro(placa,modelo,ano,codigo_agencia)
values('JXB-5656','FIAT UNICO','1940','1');

insert into carro(placa,modelo,ano,codigo_agencia)
values('AAA-0000','XEVET','2024','2');

insert into carro(placa,modelo,ano,codigo_agencia)
values('B4T3U0WO','ROLLS ROYCE','754','3');

insert into aluga(codigo,CNH,placa,dia)
values('1','11111','JXB-5656','2023/11/11');

insert into aluga(codigo,CNH,placa,dia)
values('2','33333','B4T3U0WO','2023/10/09');

insert into aluga(codigo,CNH,placa,dia)
values('3','222222','B4T3U0WO','2023/12/10');

select * from aluga;

