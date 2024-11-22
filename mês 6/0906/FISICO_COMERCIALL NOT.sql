-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
	idCliente 	Int PRIMARY KEY, NOT NULL, PRIMARY KEY
	nome 		Varchar(50),  NOT NULL
	endere�o 	Varchar(30),  NOT NULL
	telefone 	Varchar(15),  NOT NULL
	email 		Varchar(100), NOT NULL
)

CREATE TABLE Pedido  (
	idPedido 	Int PRIMARY KEY,
	 idCliente 	Int,
	dataPedido 	date ,
	status 		Varchar(20),
	FOREIGN KEY( idCliente) REFERENCES Cliente (idCliente)
)

CREATE TABLE Fatura (
idFatura int  PRIMARY KEY,
idPedido Int,
dataFatura date,
valorTotal Decimal(9,2),
FOREIGN KEY(idPedido) REFERENCES Pedido  (idPedido)
)

CREATE TABLE Item_Pedido (
idItemPedido Int PRIMARY KEY,
idPedido Int,
idProduto Int,
pre�o Decimal(9,2),
quantidade Int,
FOREIGN KEY(idPedido) REFERENCES Pedido  (idPedido)
)

CREATE TABLE Produto (
idProduto Int PRIMARY KEY,
nome Varchar(50),
descri��o Varchar(100),
pre�o Decimal(9,2),
estoque Numeric
)

ALTER TABLE Item_Pedido ADD FOREIGN KEY(idProduto) REFERENCES Produto (idProduto)
