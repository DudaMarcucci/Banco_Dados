-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
	NumeroID 	int PRIMARY KEY NOT NULL,
	nome 		Varchar(100) NOT NULL,
	endereço 	Varchar(100) NOT NULL,
	telefone 	Varchar(15)  NOT NULL,
	email 		Varchar(100) NOT NULL,
	dataCadastro date NOT NULL,
	status 		Varchar(15) NOT NULL
); 

CREATE TABLE Pessoa Física (
	sexo  			char NOT NULL,
	estadoCivil 	Varchar(10) NOT NULL,
	habilitação 	Varchar(15) NOT NULL,
	cpf 			Varchar(15) NOT NULL,
	profissão 		Varchar(50) NOT NULL,
	rg 				varchar(15) NOT NULL,
	faixaRenda 		decimal(9,2) NOT NULL,
	dataNasc 		date NOT NULL,
	NumeroID 		int NOT NULL,
	FOREIGN KEY(NumeroID) REFERENCES Cliente (NumeroID)
);

CREATE TABLE Pessoa Jurídica (
	razãoSocial 		Varchar(100) NOT NULL,
	cnpj 				varchar(15) NOT NULL,
	inscriçãoEstadual 	varchar(15) NOT NULL,
	contatoResponsável 	varchar(100) NULL,
	ramoAtividade 		Varchar(50) NULL,
	NumeroID 			int NOT NULL,
	FOREIGN KEY(NumeroID) REFERENCES Cliente (NumeroID)
);

CREATE TABLE Veiculo (
	NumeroRegistro 		int PRIMARY KEY,
	marca 				Varchar(20) NOT NULL
	modelo 				Varchar(20) NOT NULL
	anoFabricação		int NOT NULL,
	tipo 				varchar(20) NOT NULL
	placa 				Varchar(10) NOT NULL
	IDCliente       	int NOT NULL -- chave estrangeira
	FOREIGN KEY(NumeroID) REFERENCES Cliente (NumeroID)
);

CREATE TABLE Acidente (
	NumeroID 		int PRIMARY KEY NOT NULL
	dataAcidente 	date NOT NULL,
	hora 			time NOT NULL,
	locaAcidente    Varchar(100) NOT NULL,
	descrição		Varchar(200) NOT NULL,
	NumeroVeiculo   int NOT NULL, -- chave estrangeira
	FOREIGN KEY(NumeroRegistro) REFERENCES Veiculo (NumeroRegistro)
);

CREATE TABLE Apólice (
	NúmeroApólice 	int PRIMARY KEY NOT NULL,
	descrição 		Varchar(100)NOT NULL,
	valor 			decimal(9,2)NOT NULL,
	NumeroVeiculo 	int NOT NULL, -- chave estrangeira
	FOREIGN KEY(NumeroRegistro) REFERENCES Veiculo (NumeroRegistro)
);

