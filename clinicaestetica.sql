CREATE DATABASE ClinicaEstetica;

CREATE TABLE Cliente(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)NOT NULL,
    cpf VARCHAR (100)NOT NULL,
    telefone VARCHAR(100)NOT NULL,
    email VARCHAR (100)NOT NULL,
    data_nascimento VARCHAR(50)NOT NULL,
	endereco VARCHAR(100) NOT NULL
);

CREATE TABLE Profissional(
	id_profissional INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR (100) NOT NULL,
    telefone VARCHAR(100)NOT NULL,
    especialidade VARCHAR (100)NOT NULL,
    email VARCHAR(50)NOT NULL
);

CREATE TABLE Procedimento(
	id_procedimento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)NOT NULL,
    descricao VARCHAR(200)NOT NULL,
    duracao VARCHAR(100),
    preco VARCHAR(30)
);

CREATE TABLE Agendamento(
	id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    data_agendamento VARCHAR(20) NOT NULL,
    hora VARCHAR(20) NOT NULL,
    status_agendamento VARCHAR(100) NOT NULL,
    id_cliente INT NOT NULL,
    id_profissional INT NOT NULL,
    id_procedimento INT NOT NULL,
	FOREIGN KEY(id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY(id_profissional) REFERENCES Profissional(id_profissional),
    FOREIGN KEY(id_procedimento) REFERENCES Procedimento(id_procedimento)
);

CREATE TABLE Pagamento(
	id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    data_pagamento VARCHAR(20) NOT NULL,
    valor VARCHAR(30) NOT NULL,
    forma_pagamento VARCHAR(20),
    status_pagamento VARCHAR(20),
    id_agendamento INT NOT NULL,
    FOREIGN KEY(id_agendamento) REFERENCES Agendamento(id_agendamento)
);
