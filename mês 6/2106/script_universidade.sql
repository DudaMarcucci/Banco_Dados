-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE DEPARTAMENTO (
	NumeroDepto int NOT NULL PRIMARY KEY,
	Nome varchar(50) NOT NULL,
);

CREATE TABLE PROFESSOR (
	NumeroProfessor int NOT NULL PRIMARY KEY,
	Nome varchar(50), NOT NULL
	Titulo varchar(50), NOT NULL
);

CREATE TABLE DISCIPLINA (
	NumeroDisciplina int NOT NULL PRIMARY KEY,
	Nome varchar(50), NOT NULL
	CargaHoraria int, NOT NULL
);

CREATE TABLE CURSO (
	NumeroCurso int NOT NULL PRIMARY KEY,
	Nome varchar(50), NOT NULL,
	NumeroDepto int, NOT NULL, -- Chave estrangeira
	FOREIGN KEY(NumeroDepto) REFERENCES DEPARTAMENTO (NumeroDepto)
);

CREATE TABLE ALUNO (
	NumeroRaAluno int NOT NULL PRIMARY KEY,
	Nome varchar(50), NOT NULL,
	Status varchar(20), NOT NULL,
	NumeroCurso int, NOT NULL, -- Chave estrangeira
	FOREIGN KEY(NumeroCurso) REFERENCES CURSO (NumeroCurso)
);

CREATE TABLE HISTORICO (
	IDHistorico int NOT NULL PRIMARY KEY,
	Nota decimal(9,2), NOT NULL,
	Falta decimal(9,2), NOT NULL,
	NumeroRaAluno int, NOT NULL, -- Chave estrangeira
	NumeroProfessor int, NOT NULL, -- Chave estrangeira
	NumeroDisciplina int, NOT NULL, -- Chave estrangeira
	FOREIGN KEY(NumeroRaAluno) REFERENCES ALUNO (NumeroRaAluno)
	FOREIGN KEY(NumeroProfessor) REFERENCES PROFESSOR (NumeroProfessor)
	FOREIGN KEY(NumeroDisciplina) REFERENCES DISCIPLINA (NumeroDisciplina)
	FOREIGN KEY(NumeroDisciplina) REFERENCES DISCIPLINA (NumeroDisciplina)
);

CREATE TABLE lecionar (
    ID int NOT NULL PRIMARY KEY,
	NumeroProfessor int, NOT NULL -- Chave estrangeira
	NumeroDisciplina int, NOT NULL -- Chave estrangeira
	FOREIGN KEY(NumeroProfessor) REFERENCES PROFESSOR (NumeroProfessor),
	FOREIGN KEY(NumeroDisciplina) REFERENCES DISCIPLINA (NumeroDisciplina)
);

ALTER TABLE HISTORICO ADD 
ALTER TABLE HISTORICO ADD 

