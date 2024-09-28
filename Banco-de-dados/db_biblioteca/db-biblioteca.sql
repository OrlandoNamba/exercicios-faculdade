-- Tabela de Autores
CREATE TABLE Autor (
	IdAutor SMALLINT GENERATED ALWAYS AS IDENTITY,
	NomeAutor VARCHAR(50) NOT NULL,
	SobrenomeAutor VARCHAR(60) NOT NULL,
	CONSTRAINT pk_ID_Autor PRIMARY KEY (IdAutor)
);

-- Tabela de Editoras
CREATE TABLE Editora (
	IdEditora SMALLINT GENERATED ALWAYS AS IDENTITY,
	NomeEditora VARCHAR(50) NOT NULL,
	CONSTRAINT pk_ID_Editora PRIMARY KEY (IdEditora)
);

-- Tabela de Assuntos
CREATE TABLE Assunto (
	IdAssunto SMALLINT GENERATED ALWAYS AS IDENTITY,
	NomeAssunto VARCHAR(25) NOT NULL,
	CONSTRAINT pk_ID_Assunto PRIMARY KEY (IdAssunto)
);

-- Tabela de Livros
CREATE TABLE Livro (
	IdLivro SMALLINT GENERATED ALWAYS AS IDENTITY (START WITH 100 INCREMENT BY 1),
	NomeLivro VARCHAR(70) NOT NULL,
	ISBN13 CHAR(13) UNIQUE,
	DataPub DATE,
	PrecoLivro NUMERIC(10, 2) NOT NULL,
	NumeroPaginas SMALLINT NOT NULL,
	IdEditora SMALLINT NOT NULL,
	IdAssunto SMALLINT NOT NULL,
	CONSTRAINT pk_Id_Livro PRIMARY KEY (IdLivro),
	CONSTRAINT fk_id_editora FOREIGN KEY (IdEditora) REFERENCES Editora (IdEditora)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_id_assunto FOREIGN KEY (IdAssunto) REFERENCES Assunto (IdAssunto)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT verifica_preco CHECK (PrecoLivro >= 0)
);

-- Tabela Associativa LivroAutor
CREATE TABLE LivroAutor (
	IdLivro SMALLINT NOT NULL,
	IdAutor SMALLINT NOT NULL,
	CONSTRAINT pk_id_livro_autor PRIMARY KEY (IdLivro, IdAutor),
	CONSTRAINT fk_id_livros FOREIGN KEY (IdLivro) REFERENCES Livro (IdLivro)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_id_autores FOREIGN KEY (IdAutor) REFERENCES Autor (IdAutor)
	ON DELETE CASCADE ON UPDATE CASCADE
);

-- Verificar se existem registros na tabela de editoras:
SELECT * FROM Editora;

-- Inserir dados na tabela de editoras
INSERT INTO Editora (NomeEditora)
VALUES
('Prentice Hall');

INSERT INTO Editora (NomeEditora)
VALUES
('O Reilly'), ('Aleph'), ('Microsoft Press');

INSERT INTO Editora (NomeEditora)
VALUES
('Rocco'), ('Galera');

SELECT * FROM Editora;


-- Inserir dados na tabela de assuntos
SELECT * FROM Assunto;

-- Inserir dados na tabela de assuntos
INSERT INTO Assunto (NomeAssunto)
VALUES
('Romance'), ('Ficção'), ('Aventura'), ('Terror');

SELECT * FROM Assunto;


-- Inserir dados na tabela de autores
-- 1. Inserir uma linha única:
INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES ('Umberto', 'Eco');
INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES ('Mauricio', 'de Souza'), ('Joao', 'Mota'), ('Cleber', 'Machado'), ('Danilo', 'Gentili');

SELECT * FROM Autor;


-- Inserir dados na tabela de livros
-- 1. Inserir múltiplas linhas:
INSERT INTO Livro (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdAssunto, IdEditora)
VALUES ('A Arte da Eletrônica', '98989898989', '2017-09-09', 176.71, 1160, 3, 2);

--2. Inserir múltiplas linhas:
INSERT INTO Livro (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdAssunto, IdEditora)
VALUES ('Investidor Inteligente', '1421412419', '2019-11-27', 199.71, 260, 2, 1);

-- Verificar livros cadastrados
SELECT * FROM Livro;

-- Inserir dados na tabela LivroAutor
INSERT INTO LivroAutor (IdLivro, IdAutor)
VALUES
(100, 2),
(100, 3),
(101, 4);

SELECT * FROM Livro;