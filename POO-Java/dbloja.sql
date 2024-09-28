-- A linha abaixo cria um banco de dados
CREATE DATABASE dbloja;

-- A linha abaixo mostra os bancos de dados
SHOW DATABASES;

-- a linha abaixo seleciona o banco de dados "dbloja"
USE dbloja;

CREATE TABLE tbcliente(
idcliente int PRIMARY KEY, 
nome varchar(30),
endereco varchar(40),
tel varchar(15)
);

INSERT INTO tbcliente(idcliente, nome, endereco, tel)
values (1, 'Romulo', 'Rua dos maltas, 15', '9999-9999');

SELECT * FROM tbcliente;

SHOW TABLES;

DESCRIBE tbcliente;

