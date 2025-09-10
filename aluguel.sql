CREATE DATABASE Empresa_aluguel;
USE Empresa_aluguel;
CREATE TABLE cliente(
codcliente INT PRIMARY KEY,
nome VARCHAR(50),
cidade VARCHAR(50),
sexo CHAR(1),
estado CHAR(2),
estadocivil CHAR(1)
);

CREATE TABLE marca(
codmarca INT PRIMARY KEY,
marca VARCHAR(30)
);

CREATE TABLE carro(
codcarro INT PRIMARY KEY,
codmarca INT,
modelo VARCHAR(30) NOT NULL,
valor FLOAT,
FOREIGN KEY (codmarca) REFERENCES marca (codmarca)
);

CREATE TABLE aluguel(
codaluguel INT PRIMARY KEY,
codcliente INT,
codcarro INT,
data_aluguel DATE,
FOREIGN KEY (codcliente) REFERENCES cliente (codcliente),
FOREIGN KEY (codcarro) REFERENCES carro (codcarro)
);

INSERT INTO cliente (codcliente, nome, cidade, sexo, estado, estadocivil)
VALUES
(1, 'Ana Silva', 'Duque de Caxias', 'F', 'RJ', 'C'),
(2, 'Bruna Pereira', 'Niterói', 'F', 'RJ', 'C'),
(3, 'Túlio Nascimento', 'Duque de Caxias', 'M', 'RJ', 'S'),
(4, 'Fernando Souza', 'Campinas', 'M', 'SP', 'S'),
(5, 'Lúcia Andrade', 'São Paulo', 'F', 'SP', 'C');

INSERT INTO marca (codmarca, marca) VALUES
(1, 'Ford'),
(2, 'Fiat'),
(3, 'Chevrolet'),
(4, 'Volkswagen'),
(5, 'Renault');

INSERT INTO carro (codcarro, modelo, codmarca, valor) VALUES
(1, 'Ka', 1, 100.00),
(2, 'Argo', 2, 150.00),
(3, 'Onix', 3, 170.00),
(4, 'Polo', 4, 150.00),
(5, 'Kwid', 5, 120.00);

INSERT INTO aluguel (codaluguel, codcliente, codcarro, data_aluguel)VALUES
(1, 3, 2, '2023-04-01'),
(2, 2, 1, '2023-04-02'),
(3, 2, 1, '2023-04-03'),
(4, 2, 3, '2023-04-04'),
(5, 1, 4, '2023-04-05'),
(6, 1, 4, '2023-04-13'),
(7, 1, 1, '2023-04-15'),
(8, 5, 2, '2023-04-19'),
(9, 5, 2, '2023-04-21'),
(10,3, 1, '2023-04-25');


SELECT nome, cidade FROM cliente WHERE cidade= 'São Paulo';

/*Cláusula WHERE é usada para filtrar os registros retornado por uma consulta 
SELECT,UPDATE, ou DELETE. Ela define consiç~es que os dados debe, satisfazer 
para serem incluídos no resultado */
/*SELECT coluna1, coluna2, ...
FROM nome_da_tabela
WHERE condiçao*/

/*liste todos os clientes do estado do RJ*/
SELECT nome, estado FROM cliente WHERE estado= 'RJ';

/*Exiba os carros com valor superior a 120 reais*/
SELECT modelo, valor FROM carro WHERE valor > 120;

/*mostre os cliestes do sexo feminino*/
SELECT nome, sexo FROM cliente WHERE sexo = 'F';

/*liste as marcas co codigo 3*/
SELECT codmarca, marca FROM marca WHERE codmarca = '3';

/*mostre todos os clientes que moram em Duque de Caxias*/
SELECT nome, cidade FROM cliente WHERE cidade = 'Duque de Caxias';

/*exiba os códigos de aluguéis realizados no dia 2023-04-02*/
SELECT codaluguel, data_aluguel FROM aluguel WHERE data_aluguel = '2023-04-02';

/*liste os carro cujo o valor seja igual a 150*/
SELECT modelo, valor FROM carro WHERE valor = 150;

/*exiba os aluguéis feitos pelos clientes do código 1*/
SELECT codaluguel, codcliente FROM aluguel WHERE codcliente = '1';

/*msotre todos os carros que não sao do modelo 'ka'*/
SELECT modelo FROM carro WHERE modelo != 'Ka'
/*WHERE X HAVING*/
/*WHERE: filtra linhas individuais antes da agregação
HAVING: filtra grupos após a agregação*/
/*agregação= uso de funções para cálculos em um conjunto de valores
de coluna, retornando um único valor resumido */

SELECT cliente.nome, COUNT(aluguel.codaluguel) AS total_alugueis
FROM cliente
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
GROUP BY cliente.nome
HAVING COUNT(aluguel.codaluguel)>2; 
/*JOIN: agrupa tabelas
GROUPY: agrupa os resultados por uma ou mais tabelas*/

/*mostrar marcas que pessuem um carro cadastrado*/
SELECT marca.marca, COUNT(carro.codcarro) AS total_carro
FROM marca
JOIN carro ON marca.codmarca = carro.codmarca
GROUP BY marca.marca 
HAVING COUNT(carro.codcarro) = 1;

/*atividade*/
/*conte quantos clientes existem na tabela cliente*/
SELECT COUNT(*) AS total_cliente FROM cliente;

/*liste o nome dos clientes e a quantidade total de aluguéis que cada um fez*/
SELECT cliente.nome, COUNT(aluguel.codaluguel) AS total_aluguel
FROM cliente 
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
GROUP BY cliente.nome;

/*mostre o gasto por cliente, considerando o valor dos carros alugados*/
SELECT cliente.nome, SUM(carro.valor) AS total_gastos
FROM cliente
JOIN aluguel ON cliente.codcliente= aluguel.codcliente
JOIN carro ON carro.codcarro= aluguel.codcarro
GROUP BY cliente.nome
HAVING SUM(carro.valor)>0;

/*exiba a média do valor dos carros disponíveis na tabela carro*/
SELECT MAX(valor) AS maior_valor FROM carro;

/*encontre o menor e o maior valor dos carros cadastrados*/
SELECT MAX(valor) AS maior, MIN(valor) AS menor FROM carro;

/*liste as marcas que possuem mais de um carro cadastrados*/
SELECT marca.marca, COUNT(carro.codcarro) AS quantidade_carros
FROM marca
JOIN carro ON marca.codmarca=carro.codmarca
GROUP BY marca.marca
HAVING COUNT(carro.codcarro) >1;

/*mostre os clientes que possuem mais de dois alugueis*/
SELECT cliente.nome, COUNT(aluguel.codaluguel) AS quantidade_aluguel
FROM cliente
JOIN aluguel ON cliente.codcliente=aluguel.codcliente
GROUP BY cliente.nome
HAVING COUNT(aluguel.codaluguel) >2;

/*exiba as marcas e o valor total dos seus carros*/
 SELECT marca.marca, SUM(carro.valor) AS soma_valor
 FROM marca
 JOIN carro ON marca.codmarca=carro.codmarca
 GROUP BY marca.marca;
 
 /*liste os clientes que gastaram mais de 300 reais no valor total dos aluguéis*/
 SELECT cliente.nome, SUM(carro.valor) AS soma
 FROM cliente
 JOIN aluguel ON cliente.codcliente=aluguel.codcliente
 JOIN carro ON aluguel.codcarro=carro.codcarro
 GROUP BY cliente.nome
 HAVING SUM(carro.valor) >300;
 
 /*mostre as cidades e a quantidade de clientes que moram em cada uma 
 exibindo apenas as cidades com mais de 1 cliente*/
 SELECT cliente.cidade, COUNT(cliente.codcliente) AS quantidade
 FROM cliente
 GROUP BY cliente.cidade
 HAVING COUNT(cliente.codcliente) >1;

