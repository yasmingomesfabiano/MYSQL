CREATE DATABASE Aluno;
USE Aluno;

/*criando table Alunos*/
CREATE TABLE Alunos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR (50) NOT NULL
);
/*criando table Disciplina*/
CREATE TABLE Disciplinas(
	id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_disciplina VARCHAR(50) NOT NULL UNIQUE,
    nome_disciplina VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

/*criando table professores*/
CREATE TABLE Professores(
	id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_professor VARCHAR(50) NOT NULL UNIQUE,
    nome VARCHAR (100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR (50) NOT NULL
);

/*criando table Turma*/
CREATE TABLE Turma(
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo_disciplina_id INT NOT NULL,
    codigo_da_turma VARCHAR(20) NOT NULL,
    codigo_professor_id INT NOT NULL,
    ano VARCHAR(10) NOT NULL,
    horario INT NOT NULL,
    FOREIGN KEY (codigo_disciplina_id) REFERENCES Disciplinas(id),
	FOREIGN KEY (codigo_professor_id) REFERENCES Professores(id)
);
/*criando table histórico*/
CREATE TABLE Historico(
	id INT PRIMARY KEY AUTO_INCREMENT,
    matricula_id INT NOT NULL,
    codigo_disciplina_id INT NOT NULL,
    codigo_turma_id INT NOT NULL,
    codigo_professor_id INT NOT NULL,
    ano_id INT NOT NULL,
    frequencia VARCHAR(10) NOT NULL,
    nota FLOAT(5) NOT NULL,
	FOREIGN KEY (codigo_disciplina_id) REFERENCES Disciplinas(id),
	FOREIGN KEY (codigo_professor_id) REFERENCES Professores(id),
    FOREIGN KEY (codigo_turma_id) REFERENCES Turma(id)
);

