\c postgres

DROP DATABASE pi_iv;

CREATE DATABASE pi_iv;

\c pi_iv

CREATE TABLE Usuario (
    id_user SERIAL PRIMARY KEY,
    login VARCHAR,
    senha VARCHAR,
    situacao BOOLEAN,
    data_cad DATE,
    email VARCHAR(150)
);

CREATE TABLE Empresa (
    cnpj VARCHAR(18) UNIQUE,
    nome VARCHAR(255),
    telefone VARCHAR(50),
    email VARCHAR(50),
    responsavel VARCHAR(255),
    data_cadastro DATE,
    id SERIAL PRIMARY KEY,
    fk_Usuario_id_user SERIAL
);

CREATE TABLE Bens (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    data_compra DATE,
    vida_util INTEGER,
    valor_residual NUMERIC(11,2),
    tempo_uso INTEGER,
    situacao VARCHAR(20),
    categoria VARCHAR(20),
    turno_trabalhado INTEGER,
    data_baixa DATE,
    custo_bem NUMERIC(11,2),
    custo_venda NUMERIC(11,2),
    fk_Empresa_id SERIAL
);
 
ALTER TABLE Empresa ADD CONSTRAINT FK_Empresa_2
    FOREIGN KEY (fk_Usuario_id_user)
    REFERENCES Usuario (id_user);
 
ALTER TABLE Bens ADD CONSTRAINT FK_Bens_2
    FOREIGN KEY (fk_Empresa_id)
    REFERENCES Empresa (id);

INSERT INTO Usuario (login, senha, situacao, data_cad) VALUES ('admin', MD5('1'), true, '2018-11-28');

