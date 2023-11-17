CREATE database aluguel;

use  aluguel;

create table if not exists cliente(
	cnh INT not null primary key,
	nome varchar(50) not null,
    cartao varchar(11) not null
);

create table if not exists telefone(
	id int not null primary key,
    cnh_cliente int not null,
    telefone_1 varchar(45) not null,
    telefone_2 varchar(45),
    foreign key(cnh_cliente) references cliente(cnh)
);
create table if not exists agencia(
	id int not null primary key,
    cep varchar(45) not null,
    rua varchar(45) not null,
    cidade varchar(45) not null
);
create table if not exists carro(
	placa varchar(50) not null primary key,
    id_agencia int not null,
    foreign key(id_agencia) references agencia(id)
);
alter table carro add column modelo varchar(45);
alter table carro add column ano varchar(45);

create table if not exists aluga(
	id int not null primary key,
    cnh_cliente int not null,
    data_aluguel varchar(45) not null,
    placa varchar(50) not null,
    foreign key(cnh_cliente) references cliente(cnh),
    foreign key(placa) references carro(placa)
);
alter table agencia add column numero varchar(45);
insert into cliente(codigo , nome , cpf , end_rua , end_numero , end_bairro , end_cep)
values('2' , 'caue' ,  '0127427230' , 'rua b' , '11' , 'sol' , '99949999');
insert into agencia(id , cep , rua , cidade , numero)
values( 1 , '88745-652' , 'Sao Sebastiao' ,  'Manaus' , '11');
insert into agencia(id , cep , rua , cidade , numero)
values( 2 , '88215-612' , 'Sao Francisco' ,  'Manaus' , '12');

insert into carro(placa , id_agencia , modelo , ano)
values('ZBT93232301', '2' ,'onix','2023');
insert into carro(placa , id_agencia , modelo , ano)
values('12T93232301', '1' ,'camaro','2027');
insert into cliente(cnh , nome , cartao)
values('05127427230', 'Caue Jose' ,'854712147852');

insert into cliente(cnh , nome , cartao)
values('17427230', 'Gilce' ,'15471212152');

insert into aluga(id , cnh_cliente , data_aluguel , placa)
values(1, '17427230' ,'20230401' , 'ZBT93232301');
insert into aluga(id , cnh_cliente , data_aluguel , placa)
values(2, '05127427230' ,'20230403' , '12T93232301');



