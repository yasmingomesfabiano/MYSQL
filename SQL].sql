CREATE DATABASE ClicaMedica;
CREATE TABLE Especialidade (
	id_especialidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Medico(
	id_crm VARCHAR(20) PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    codigo_especialidade INT NOT NULL,
    FOREIGN KEY	(codigo_especialidade) REFERENCES Especialidade(id_especialidade)
);

CREATE TABLE Paciente (
	id_cpf VARCHAR (50) PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR (20) NOT NULL,
	email VARCHAR (40),
	endereco VARCHAR(200)
);

CREATE TABLE Consulta(
	id_conculta INT PRIMARY KEY AUTO_INCREMENT,
    data_consulta DATE NOT NULL,
    crm VARCHAR(20) NOT NULL,
    cPF VARCHAR(20) NOT NULL,
    diagnostico VARCHAR(100) NOT NULL,
    FOREIGN KEY(crm) REFERENCES Medico(id_crm),
    FOREIGN KEY(cpf) REFERENCES Paciente(id_cpf)
);

SHOW TABLES FROM ClicaMedica;

