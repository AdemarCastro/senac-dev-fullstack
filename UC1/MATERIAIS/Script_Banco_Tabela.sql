#Criando o Banco de Dados do Sistema Acadêmico
create database academico
default character set utf8
default collate utf8_general_ci;

show databases;

use academico;
#Criando a Tabela de Usuários
create table if not exists usuarios(
id int not null auto_increment primary key,
matricula int not null unique,
nome varchar(120) not null,
email varchar(120) not null,
senha varchar(32) not null,
estatus varchar(120) not null,
painel varchar(80) not null,
dtcadastro timestamp not null default current_timestamp
) default charset=utf8;

show tables;

desc usuarios;

select *from usuarios;

#Inserindo dados na tabela usuários
insert into usuarios(id, matricula, nome, email, senha, estatus, painel)
values
('1', '001', 'Raimundo Martins', 'martins@yahoo.com.br', md5('1234'), 'Ativo', 'Administrador');

insert into usuarios(id, matricula, nome, email, senha, estatus, painel)
values
(default, '002', 'Rafael Guilherme', 'rafael@gmail.com', md5('12345'), 'Inativo', 'Aluno');

insert into usuarios(id, matricula, nome, email, senha, estatus, painel)
values
('3', '003', 'Paula Angela', 'paula@gmail.com', md5('123456'), 'Ativo', 'Professor');



















