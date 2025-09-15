CREATE DATABASE Cadastro_cliente;
USE Cadastro_cliente;


CREATE TABLE Cliente(
	cod_cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome_cliente VARCHAR(50) NOT NULL,
    Genero_cliente CHAR(01) NOT NULL CHECK(Genero_cliente IN('F', 'M', 'O')) DEFAULT 'O',
	Renda_cliente DECIMAL(10,2) CHECK(Renda_cliente>=0) DEFAULT 0,
    RG_cliente CHAR(12) NOT NULL UNIQUE
);

CREATE TABLE Funcionarios(
	cod_funcionarios INT NOT NULL PRIMARY KEY,
    nome_funcionarios VARCHAR(50) NOT NULL,
    genero_funcionarios CHAR(01) NOT NULL CHECK(genero_funcionarios IN('F', 'M', 'O')) 
    DEFAULT 'F',
    salario_funcionarios DECIMAL(10,2) NOT NULL CHECK(salario_funcionarios>=0),
    data_cadastro_funcionarios DATETIME NOT NULL DEFAULT NOW()
);

INSERT INTO Cliente 