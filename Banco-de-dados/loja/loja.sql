USE loja;

CREATE TABLE Cliente (
    cod_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(20) NOT NULL,
    sobrenome_cliente VARCHAR(40) NOT NULL
);

DROP TABLE produtos;

-- Tabela de Produto
CREATE TABLE Produto (
	cod_produto int PRIMARY KEY,
    nome_produto varchar(30) NOT NULL,
    descricao text NULL,
    preco numeric CHECK(preco > 0) NOT NULL,
    qtde_estoque smallint DEFAULT 0
);

-- Tabela de Pedido
CREATE TABLE Pedido (
	cod_pedido SERIAL PRIMARY KEY,
    cod_cliente int NOT NULL REFERENCES cliente(cod_cliente),
    cod_produto int NOT NULL,
    qtde smallint NOT NULL,
    FOREIGN KEY(cod_produto) REFERENCES produto(cod_produto)
);

-- Consulta simples
SELECT * FROM Cliente;

-- Inserir um registro com INSERT INTO
INSERT INTO Cliente(cod_cliente, nome_cliente, sobrenome_cliente)
VALUES (1, 'Fábio', 'dos Reis');

INSERT INTO Cliente(cod_cliente, nome_cliente, sobrenome_cliente)
VALUES
(2, 'Mario', 'Silva'),
(3, 'Klebson', 'Martins'),
(4, 'Jucelino', 'Kubtchek'),
(5, 'Cléber', 'Machado')
;

SELECT * FROM Produto;

INSERT INTO Produto (cod_produto, nome_produto, descricao, preco, qtde_estoque)
VALUES (1, 'Chivas 18 anos', 'Coisa fina', 320.00, 12);

-- Inserir pedido
SELECT * FROM Pedido;

INSERT INTO Pedido(cod_cliente, cod_produto, qtde)
VALUES
(1, 1, 10);

INSERT INTO Pedido(cod_cliente, cod_produto, qtde)
VALUES
(2, 1, 2);