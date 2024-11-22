-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.


CREATE TABLE FUNCIONÁRIO (
	matriculaFunc Int PRIMARY KEY,
	nome Varchar(50),
	dataNasc date,
	nacionalidade Varchar(30),
	sexo Varchar(10),
	estadoCivil Varchar(15),
	RG Varchar(15),
	CPF Varchar(15),
	endereco Varchar(50),
	telefone Varchar(15),
	dataAdmissao date
);


CREATE TABLE DEPENDENTE (
	idDependente Int PRIMARY KEY,
	nome Varchar(50),
	dataNasc date,
	matriculaFunc Int -- chave estrangeira
	FOREIGN KEY (matriculaFunc) REFERENCES FUNCIONARIO (matriculaFunc)
);



CREATE TABLE CARGO (
	idCargo Int PRIMARY KEY,
	nomeCargo Varchar(50),
	dataFim date,
	dataInicio date
);

CREATE TABLE ocupar (
	idCargo Int,         	-- chave estrangeira
	matriculaFunc Int,		-- chave estrangeira
	PRIMARY KEY(idCargo,matriculaFunc),  -- chave primaria composta 
	FOREIGN KEY(idCargo) REFERENCES CARGO (idCargo),
	FOREIGN KEY(matriculaFunc) REFERENCES FUNCIONÁRIO (matriculaFunc)
)

ALTER TABLE DEPENDENTE ADD FOREIGN KEY(matriculaFunc) REFERENCES FUNCIONÁRIO (matriculaFunc)
