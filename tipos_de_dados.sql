
/*Tipos de dados:
VARCHAR(n) --nº numero de caracteres
INT: inteiro
DECIMAL: números decimais, precisão fixa
FLOAT e DOUBLE: números decimais com precisão variável

Textos:
CHAR: cadeia de caracteres de tamanho FIXO
VARCHAR: cadeia de caractere de tamanho variável
TEXT: texto longo 

Tipos de datas e hora:
DATE: armazena datas
DATETIME: armazenar data e hora juntas
*/

CREATE DATABASE TipodeDados;
USE TipodeDados;
CREATE TABLE IF NOT EXISTS tbl_livro(
	id_livro INT AUTO_INCREMENT PRIMARY KEY,
    nome_livro VARCHAR(50) NOT NULL,
    data_publicacao DATE NOT NULL,
    preco_livro DECIMAL(10,2)
);

INSERT INTO tbl_livro(nome_livro, data_publicacao, preco_livro)
VALUES ('Dom Casmurro','1899-01-01',29.90);

INSERT INTO tbl_livro(nome_livro, data_publicacao, preco_livro)
VALUES
	('Grande Sertão: Veredas', '1956-01-01',39.90),
    ('Memórias Póstumas de Brás Cubas', '1881-01-01', 24.50),
    ('Vidas Secas','1938-01-01', 27.80);
    
/*selecionar todas as colunas*/    
SELECT * FROM tbl_livro;

/*selecionar algumas colunas especificadas*/
SELECT nome_livro, preco_livro FROM tbl_livro;
SELECT nome_livro, data_publicacao FROM tbl_livro;

/*Trocar o nome do título da coluna*/
SELECT nome_livro AS 'Nome do livro', 
	DATE_FORMAT(data_publicacao, '%d/%m/%Y') AS 'Data de Publicação'
FROM tbl_livro;

/*Livros om preço maior que 30 reais */
SELECT * FROM tbl_livro WHERE preco_livro > 30;

/*Ordenar os livros do menor para o maior preço*/
SELECT * FROM tbl_livro ORDER BY preco_livro ASC;

/*Selecionar apenas 3 primeiros livros com preço maior que 20*/
SELECT * FROM tbl_livro WHERE preco_livro >20 ORDER BY preco_livro ASC LIMIT 3; 
