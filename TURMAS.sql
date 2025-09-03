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
INSERT INTO Alunos(matricula, nome, endereco, cidade) VALUES
('2015010101', 'José de Alencar','Rua das Almas', 'Natal'),
('2015010102', 'João José','Avenida Ruy Carneiro', 'João Pessoa'),
('2015010103', 'Maria Joaquina','Rua das Carrossel', 'Recife'),
('2015010104', 'Maria das Dores','Rua das Ladeiras', 'Fortaleza'),
('2015010105', 'José Claudino dos Santos','Centro', 'Natal'),
('2015010106', 'Josuélisson Claudino dos santos','Centro', 'Natal');


INSERT INTO Disciplinas(codigo_disciplina, nome_disciplina, carga_horaria) VALUES
('BD', 'Banco de Dados',100),
('POO', 'Programação com acesso de banco de dados', 100),
('WEB', 'Autoria Web', 50),
('ENG', 'Engenharia de sofware', 80);

INSERT INTO Professores(codigo_professor, nome, endereco, cidade) VALUES
('212131', 'Nickerson Ferreira', 'Rua Manaíba', 'João Pessoa'),
('212135', 'Adorilson Bezerra', 'Avenida Salgado Filho', 'Natal'),
('192011', 'Diego Oliveira', 'Avenida Roberto Freire', 'Natal');

INSERT INTO Turma(codigo_disciplina_id, codigo_turma, codigo_professor_id, ano, horario)
VALUES
('BD', 1, '212131', 2015, '11H-12H'),
('BD', 2, '212131', 2015, '13H-14H'),
('POO', 1, '192011', 2015, '08H-09H'),
('WEB', 1, '192011', 2015, '07H-08H'),
('ENG', 1, '122135', 2015, '10H-11H');


/*a) Encontre a MAT dos alunos com nota em BD em 2015 
menor que 5 (obs: BD =
código da disciplinas).*/
SELECT


/*Encontre quantos alunos não são de Natal.*/
SELECT*FROM Alunos WHERE cidade != 'Natal';



