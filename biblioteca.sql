CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Criar tabela autores
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL
);

-- Criar tabela livros
CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES autores(id_autor)
);

-- Inserir dados na tabela autores
INSERT INTO autores (nome_autor) VALUES
('Machado de Assis'),
('Clarice Lispector'),
('Jorge Amado'),
('Jorge Amado Dois');

-- Inserir dados na tabela livros
INSERT INTO livros (titulo, autor_id) VALUES
('Dom Casmurro', 1),
('A Hora da Estrela', 2),
('Gabriela, Cravo e Canela', 3),
('Memórias Póstumas de Brás Cubas', 1),
('Dom Casmurro', NULL);

SELECT*FROM autores;
SELECT*FROM livros;

/*exiba os livros com nome dos autores correspondentes*/

SELECT autores.nome_autor AS autor, livros.titulo AS livro
FROM autores
INNER JOIN livros ON autores.id_autor= livros.autor_id
GROUP BY autores.nome_autor, livros.titulo;

/*exiba todos os livros, mostrando o autor quando houver, ou null quando não houver*/
SELECT livros.titulo AS livros, autores.nome_autor AS autor
FROM livros
LEFT JOIN autores ON livros.autor_id= autores.id_autor;

/*exiba todos os autores, com seus livros correspondentes*/
SELECT autores.nome_autor  AS autor, livros.titulo AS livros
FROM autores
LEFT JOIN livros ON  autores.id_autor=livros.autor_id;

/*liste todos os livros com seus autores em ordem alfabética pelo titulo do livro*/
SELECT autores.nome_autor AS autor, livros.titulo AS livro
FROM autores
INNER JOIN livros ON autores.id_autor=livros.autor_id
ORDER BY livros.titulo ASC;

/*liste todos os autores e a quantidade de livros que cada um possui*/
SELECT autores.nome_autor AS autor, COUNT(livros.id_livro) AS quantidade
FROM autores
INNER JOIN livros ON autores.id_autor=livros.autor_id
GROUP BY autores.nome_autor;


/**/
