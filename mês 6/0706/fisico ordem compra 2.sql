-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Fornecedor (
	codigoForn 		Int PRIMARY KEY not null,
	nome 			Varchar(50) not null,
	endere�o 		Varchar(50) not null,
	cidade			Varchar(30) not null,
	estado 			Char(2) not null,
	telefone 		Varchar(15) not null,
);

CREATE TABLE Ordem_Compra (
	codigoOC 		Int PRIMARY KEY not null,
	data 			Date not null,
	valorTotal 		Decimal(9,2) not null,
	nomeRespons�vel Varchar(50) not null,
	codigoForn 		Int not null,
	FOREIGN KEY(codigoForn) REFERENCES Fornecedor (codigoForn) not null,
);

CREATE TABLE Material (
	codigoMaterial 	Int PRIMARY KEY not null,
	descri��o 		Varchar(100) not null,
	qtde 			Int not null,
	valorUnit�rio 	Decimal(9,2) not null,
	valorTotal 		Decimal(9,2) not null,
);

CREATE TABLE Item_Compra (
	codigoIC 		Int PRIMARY KEY not null,
	codigoMaterial 	Int not null,
	codigoOC 		Int not null,
	FOREIGN KEY(codigoMaterial) REFERENCES Material (codigoMaterial) not null,
	FOREIGN KEY(codigoOC) REFERENCES Ordem_Compra (codigoOC) not null,
);

