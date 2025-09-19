CREATE DATABASE Mundo;
USE Mundo;

CREATE TABLE Pais(
	id_pais INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(35) NOT NULL,
    continente VARCHAR(35) NOT NULL,
    pop REAL,
    pip REAL,
    expec_vida REAL
);

CREATE TABLE Cidade(
	id_cidade INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(35) NOT NULL,
    pais VARCHAR(35) NOT NULL,
    pop REAL,
    capital VARCHAR(1)
);

CREATE TABLE Rio(
	id_rio INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(35) NOT NULL,
    nascente VARCHAR(35) NOT NULL,
    pais VARCHAR(35) NOT NULL,
    comprimento INTEGER
);

START TRANSACTION;
SAVEPOINT ponto1;
INSERT INTO Pais(nome, continente, pop, pip, expec_vida) VALUES
('Canada', 'Am. Norte', 30.1, 658, 77.08),
('Mexico', 'Am. Norte', 107.5, 694, 69.1),
('Brasil', 'Am. Sul', 183.3, 10004, 65.2),
('USA', 'Am. Norte', 270.0, 8003, 75.5);

SAVEPOINT ponto2;
INSERT INTO Cidade(nome, pais, pop, capital) VALUES
('Washington', 'USA', 3.3, 'S'),
('Monterrey', 'Mexico', 2.0, 'N'),
('Brasilia', 'Brasil', 1.5, 'S'),
('São Paulo', 'Brasil', 15.0, 'N'),
('Ottawa', 'Canada', 0.8, 'S'),
('Cid. Mexico', 'Mexico', 14.1, 'S');

SAVEPOINT ponto3;
INSERT INTO Rio(nome, nascente, pais, comprimento) VALUES
('St. Lawrence', 'USA', 'USA', 3.3),
('Grande', 'USA', 'Mexico', 2.0),
('Parana', 'Brasil', 'Brasil', 1.5),
('Mississipi', 'USA', 'USA', 15.0);

/*Liste todas as cidades e os países aos quais pertencem*/
SELECT nome, pais FROM cidade;

/*liste todas as cidades que são capitais.*/
SELECT nome, capital FROM cidade
WHERE capital = 'S';

/*Liste todos os atributos dos países 
onde a expectativa de vida é menor que 70 anos.*/
SELECT nome, expec_vida FROM pais
WHERE expec_vida > 70;

/*liste todas as capitais e as populações dos países
 cujos PIB é maior que 1 trilhão de dólares*/
 SELECT capital, pop FROM cidade
 WHERE capital = 'S' AND pop > 1;
 
 /*. Quais é o nome e a população da capital do país 
 onde o rio St. Lawrence tem sua nascente.*/
 SELECT nome, pop FROM pais
 WHERE nome = 'USA';
 
 /*Qual é a média da população das cidades que não são capitais.*/
 SELECT AVG(pop) AS pop_media
 FROM cidade
 WHERE capital = 'N';

/*Para cada continente retorne o PIB médio de seus países.*/
SELECT continente, AVG(pip) AS media 
FROM pais
GROUP BY continente;

/*. Para cada país onde pelo menos 
2 rios tem nascente, encontre o comprimento do menor rio*/
 SELECT pais, COUNT(nascente), MIN(comprimento)
 FROM rio
 GROUP BY pais
 HAVING COUNT(nascente) >1;
 
 
 /*Liste os países cujo PIB é maior que o PIB é do Canada*/
 SELECT nome, pip
 FROM pais
 WHERE pip > 'canada';


