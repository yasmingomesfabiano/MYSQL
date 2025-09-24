
CREATE DATABASE escola_db;
USE escola_db;


CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero ENUM('M','F','Outro'),
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    endereco VARCHAR(200),
    data_cadastro DATE
);

CREATE TABLE professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    salario DECIMAL(10,2),
    data_admissao DATE
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    descricao TEXT
);

CREATE TABLE turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    id_professor INT NOT NULL,
    ano_letivo YEAR NOT NULL,
    semestre ENUM('1','2') NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
);

-- ======================================
-- TABELA DE MATRÍCULAS
-- ======================================
CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES turmas(id_turma),
    UNIQUE (id_aluno, id_turma)
);

CREATE TABLE disciplinas (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    id_disciplina INT NOT NULL,
    nota DECIMAL(5,2),
    data_avaliacao DATE,
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina),
    UNIQUE (id_matricula, id_disciplina)
);

CREATE TABLE presencas (
    id_presenca INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    id_disciplina INT NOT NULL,
    data_aula DATE NOT NULL,
    presente BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
);

INSERT INTO alunos (nome, data_nascimento, genero, cpf, telefone, email, endereco)
VALUES 
('Ana Souza', '2005-03-12', 'F', '123.456.789-00', '(24) 98888-1111', 'ana.souza@email.com', 'Rua das Flores, 123'),
('Carlos Pereira', '2004-07-25', 'M', '987.654.321-00', '(24) 97777-2222', 'carlos.pereira@email.com', 'Av. Central, 456'),
('Mariana Lima', '2006-11-05', 'F', '111.222.333-44', '(24) 96666-3333', 'mariana.lima@email.com', 'Rua do Sol, 789'),
('João Oliveira', '2005-01-18', 'M', '555.666.777-88', '(24) 95555-4444', 'joao.oliveira@email.com', 'Travessa Esperança, 12'),
('Beatriz Mendes', '2004-09-30', 'F', '999.888.777-66', '(24) 94444-5555', 'beatriz.mendes@email.com', 'Rua Verde, 34');


INSERT INTO professores (nome, especialidade, telefone, email, salario, data_admissao)
VALUES
('Ricardo Almeida', 'Matemática', '(24) 93333-1111', 'ricardo.almeida@escola.com', 3500.00, '2020-02-10'),
('Fernanda Costa', 'Português', '(24) 92222-2222', 'fernanda.costa@escola.com', 3600.00, '2019-08-15'),
('Paulo Santos', 'História', '(24) 91111-3333', 'paulo.santos@escola.com', 3400.00, '2021-01-20');


INSERT INTO cursos (nome_curso, carga_horaria, descricao)
VALUES
('Ensino Médio', 3000, 'Curso regular do ensino médio'),
('Curso Técnico em Informática', 1200, 'Curso técnico com foco em desenvolvimento de sistemas'),
('Curso de Inglês', 800, 'Curso de língua inglesa para alunos do ensino médio');


INSERT INTO turmas (id_curso, id_professor, ano_letivo, semestre)
VALUES
(1, 1, 2025, '1'),
(2, 2, 2025, '1'),
(3, 3, 2025, '2');

-- DISCIPLINAS
INSERT INTO disciplinas (nome_disciplina, carga_horaria, id_curso)
VALUES
('Matemática Básica', 200, 1),
('Português', 180, 1),
('História Geral', 150, 1),
('Programação em Python', 200, 2),
('Banco de Dados', 150, 2),
('Conversação em Inglês', 120, 3);


INSERT INTO matriculas (id_aluno, id_turma)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3);


INSERT INTO notas (id_matricula, id_disciplina, nota, data_avaliacao)
VALUES
(1, 1, 8.5, '2025-06-10'),
(2, 2, 7.0, '2025-06-10'),
(3, 4, 9.2, '2025-06-15'),
(4, 5, 6.8, '2025-06-15'),
(5, 6, 8.0, '2025-06-20');


INSERT INTO presencas (id_matricula, id_disciplina, data_aula, presente)
VALUES
(1, 1, '2025-06-01', TRUE),
(2, 2, '2025-06-01', FALSE),
(3, 4, '2025-06-02', TRUE),
(4, 5, '2025-06-02', TRUE),
(5, 6, '2025-06-03', TRUE);

/*Liste o nome de todos os alunos e o curso em que eles estão matriculados*/
SELECT alunos.nome AS aluno, cursos.nome_curso AS curso
FROM alunos 
INNER JOIN matriculas ON alunos.id_aluno = matriculas.id_aluno
INNER JOIN turmas ON matriculas.id_turma = turmas.id_turma
INNER JOIN cursos ON turmas.id_curso = cursos.id_curso;

/*Mostre o nome do professor e todas as turmas que ele leciona.*/
SELECT professores.nome AS professor, turmas.id_turma AS turma, cursos.nome_curso AS curso
FROM professores
INNER JOIN turmas ON professores.id_professor=turmas.id_professor
INNER JOIN cursos ON turmas.id_curso= cursos.id_curso;

/*Traga o nome do aluno, disciplina e nota de cada avaliação.*/
SELECT alunos.nome AS aluno, disciplinas.nome_disciplina AS disciplina,
notas.nota AS nota, cursos.nome_curso AS curso
FROM alunos
INNER JOIN matriculas ON alunos.id_aluno= matriculas.id_aluno
INNER JOIN notas ON matriculas.id_matricula= notas.id_matricula
INNER JOIN disciplinas ON notas.id_disciplina=  disciplinas.id_disciplina
INNER JOIN cursos ON cursos.id_curso= disciplinas.id_curso;

/*liste todos os alunos e suas matrículas, incluindo os que ainda não possuem matrícula.*/
SELECT alunos.nome AS aluno, matriculas.id_matricula AS matricula
FROM alunos
LEFT JOIN matriculas ON alunos.id_aluno= matriculas.id_aluno;

/*Exiba o nome do curso e todas as disciplinas que pertencem a ele.*/
SELECT cursos.nome_curso AS curso, disciplinas.nome_disciplina AS disciplinas
FROM cursos
INNER JOIN disciplinas ON cursos.id_curso= disciplinas.id_curso;

/*Mostre o nome do aluno e sua frequência (presente/faltou) em cada aula registrada.*/
SELECT alunos.nome AS aluno, presencas.presente AS presenca
FROM alunos
INNER JOIN matriculas ON matriculas.id_aluno= alunos.id_aluno
INNER JOIN presencas ON presencas.id_matricula= matriculas.id_matricula;

/*Traga o nome do aluno e a média das suas notas em todas as disciplinas.*/
SELECT alunos.nome AS alunos, AVG(notas.nota) AS media, disciplinas.nome_disciplina
FROM alunos
JOIN matriculas ON matriculas.id_aluno= alunos.id_aluno
JOIN notas ON notas.id_matricula= matriculas.id_matricula
JOIN disciplinas ON disciplinas.id_disciplina= notas.id_disciplina
GROUP BY alunos.nome, disciplinas.nome_disciplina;

/*Liste o nome dos professores e os cursos que eles lecionam.*/
SELECT professores.nome AS professor, cursos.nome_curso AS curso
FROM professores
INNER JOIN turmas ON turmas.id_professor= professores.id_professor
INNER JOIN cursos ON cursos.id_curso= turmas.id_curso;


/*Mostre o nome do aluno, o curso, a disciplina e a nota em uma única consulta.*/
SELECT alunos.nome AS aluno, cursos.nome_curso AS curso, 
disciplinas.nome_disciplina AS disciplina, notas.nota AS notas
FROM alunos
INNER JOIN matriculas ON matriculas.id_aluno= alunos.id_aluno
INNER JOIN turmas ON turmas.id_turma= matriculas.id_turma
INNER JOIN cursos ON cursos.id_curso= turmas.id_curso
INNER JOIN disciplinas ON disciplinas.id_curso= cursos.id_curso
INNER JOIN notas ON notas.id_disciplina= disciplinas.id_disciplina;

/*Traga todos os alunos matriculados na turma 1, junto com o nome da disciplina e a nota.*/
SELECT alunos.nome AS alunos, turmas.id_turma AS turmas
FROM alunos
INNER JOIN matriculas ON matriculas.id_aluno= alunos.id_aluno
INNER JOIN turmas ON turmas.id_turma= matriculas.id_turma
WHERE turmas.id_turma =1;