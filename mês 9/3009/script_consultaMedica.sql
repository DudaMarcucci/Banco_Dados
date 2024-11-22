-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.


CREATE TABLE PACIENTE (
	numPaciente int PRIMARY KEY,
	nome 		varchar(50),
	endereco 	varchar(50),
	telefone 	varchar(15),
	dataNasc 	date,
	RG 			varchar(15),
	sexo 		char,
	estadoCivil varchar(20),
	convenio 	varchar(100)
);

CREATE TABLE MEDICO (
	crmMedico 		int PRIMARY KEY,
	nome 			varchar(50),
	especialidade 	varchar(100),
	telefone 		varchar(15)
);

CREATE TABLE EXAME (
	idExame 	int PRIMARY KEY,
	nome 		varchar(100),
	descricao 	varchar(255)
);

CREATE TABLE CONSULTA (
	numConsulta 	int PRIMARY KEY,
	dataConsulta 	date,
	diagnostico 	varchar(255),
	numPaciente 	int,	-- chave estrangeira
	crmMedico 		int,	-- chave estrangeira
	FOREIGN KEY(numPaciente) REFERENCES PACIENTE (numPaciente),
	FOREIGN KEY(crmMedico)   REFERENCES MEDICO (crmMedico)
);

CREATE TABLE proceder (
	idListaExames 	int PRIMARY KEY,
	dataExame 		date,
	idExame 		int,  	-- chave estrangeira
	numConsulta 	int,	-- chave estrangeira
	FOREIGN KEY(idExame) REFERENCES EXAME (idExame),
	FOREIGN KEY(numConsulta) REFERENCES CONSULTA (numConsulta)
);



