-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE USUARIO (
	codigoUsuario 		int PRIMARY KEY,
	login 				varchar(20),
	senha 				varchar(20),
	dataCadastro 		date,
	dataNasc			date,
	areaAtuacao 		varchar(30),
	profissao 			varchar(30),
	areaFormacao		varchar(30),
	estadoCivil 		varchar(15),
	escolaridade 		varchar(30),
	estado 				char(2),
	nome	 			varchar(50),
	email 				varchar(100)
);

CREATE TABLE ENQUETE (
	codigoEnquete		int PRIMARY KEY,
	nome 				varchar(30),
	descricao 			varchar(50),
	dataInicial 		date,
	dataFinal 			date,
	codigoUsuario 		int, -- chave estrangeira
	FOREIGN KEY(codigoUsuario) REFERENCES USUARIO (codigoUsuario)
);

CREATE TABLE PERGUNTAS (
	codigoPergunta 		int PRIMARY KEY,
	descricao 			varchar(150),
	codigoEnquete 		int, -- chave estrangeira
	FOREIGN KEY(codigoEnquete) REFERENCES ENQUETE (codigoEnquete)
);

CREATE TABLE RESPOSTAS (
	codigoResposta 		int PRIMARY KEY,
	descricao 			varchar(150),
	codigoPergunta 		int, -- chave estrangeira
	FOREIGN KEY(codigoPergunta) REFERENCES PERGUNTAS (codigoPergunta)
);

CREATE TABLE responder (
	codigoUsuario 		int, -- chave estrangeira
	codigoEnquete 		int, -- chave estrangeira
	data 				date,
	PRIMARY KEY(codigoUsuario,codigoEnquete),
	FOREIGN KEY(codigoUsuario) REFERENCES USUARIO (codigoUsuario),
	FOREIGN KEY(codigoEnquete) REFERENCES ENQUETE (codigoEnquete)
);

