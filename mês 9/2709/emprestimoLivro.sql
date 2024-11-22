-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE database emprestimoLivro;
use emprestimoLivro;

CREATE TABLE LIVRO (
	idLivro int PRIMARY KEY NOT NULL,
	genero 	varchar(30) NOT NULL,
	titulo 	varchar(255)NOT NULL,
	editora varchar(100)NOT NULL,
	autor 	varchar(255)NOT NULL,
	anoPublicacao int NOT NULL
);

CREATE TABLE USUARIO (
	idUsuario 	int PRIMARY KEY NOT NULL,
	telefone 	varchar(15) NOT NULL,
	nome 		varchar(100)NOT NULL,
	endereco 	varchar(100)NOT NULL,
	email 		varchar(100)NOT NULL
);

CREATE TABLE EMPRESTIMO (
	idEmprestimo 	int  PRIMARY KEY NOT NULL,
	idUsuario 		int	 NOT NULL, -- CHAVE ESTRANGEIRA
	idExemplar 		int  NOT NULL, -- CHAVE ESTRANGEIRA
	dataEmprestimo 	date NOT NULL,
	dataDevolucao 	date NULL,	
	FOREIGN KEY(idUsuario) REFERENCES USUARIO (idUsuario),
	FOREIGN KEY(idExemplar) REFERENCES EXEMPLAR (idExemplar)
);

CREATE TABLE EXEMPLAR (
	idExemplar 		int PRIMARY KEY NOT NULL,
	idLivro 		int NOT NULL, -- CHAVE ESTRANGEIRA
	codigoExemplar 	int NOT NULL,
	estado 			varchar(10) NOT NULL,	
	FOREIGN KEY(idLivro) REFERENCES LIVRO (idLivro)
);


