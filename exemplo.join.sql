CREATE DATABASE exemplo_join;
USE exemplo_join;

CREATE TABLE departamentos (
    depto_id INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE empregados (
    emp_id INT PRIMARY KEY,
    nome VARCHAR(50),
    depto_id INT,
    FOREIGN KEY (depto_id) REFERENCES departamentos(depto_id)
);

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    valor DECIMAL(10,2)
);

INSERT INTO departamentos VALUES
(1, 'Vendas'),
(2, 'Financeiro'),
(3, 'TI');

INSERT INTO empregados VALUES
(101, 'Ana', 1),
(102, 'Bruno', 1),
(103, 'Carlos', 3),
(104, 'Diana', NULL);

INSERT INTO clientes VALUES
(201, 'Cliente A'),
(202, 'Cliente B'),
(203, 'Cliente C'),
(204, 'Cliente D');

INSERT INTO pedidos VALUES
(301, 201, 1500.00),
(302, 202, 250.00),
(303, 202, 450.00),
(304, 205, 300.00); -- cliente_id 205 não existe para testar join

/*inner join: pegar a interseção entre as tabelas: as coisas em comum
exemplo: retornar spmente os empregados com departamento associado*/
SELECT empregados.emp_id, empregados.nome AS empregado, departamentos.nome AS departamento
FROM empregados
INNER JOIN departamentos ON empregados.depto_id= departamentos.depto_id;

/*left join*/
SELECT clientes.cliente_id, clientes.nome AS cliente, pedidos.pedido_id, pedidos.valor
FROM clientes
LEFT JOIN pedidos ON clientes.cliente_id= pedidos.cliente_id;

/*right join*/
/*listar todos os pedidos e os clientes correspondentes, incluido pedidos com cliente ausente*/
SELECT pedidos.pedido_id, pedidos.valor, clientes.cliente_id, clientes.nome AS cliente
FROM clientes
RIGHT JOIN pedidos ON clientes.cliente_id=pedidos.cliente_id;

/*full join*/
/*liste todos os empregados e departamentos
SELECT empregados.emp_id, empregados.nome AS empregado, departamentos.depto_id, departamentos.nome
AS departamento
FROM empregados
FULL JOIN departamentos ON empregados.depto_id=departamentos.depto_id;*/

SELECT empregados.emp_id, empregados.nome AS empregado, departamentos.depto_id, departamentos.nome AS departamento
FROM empregados
LEFT JOIN departamentos ON empregados.depto_id = departamentos.depto_id
UNION
SELECT empregados.emp_id, empregados.nome AS empregado, departamentos.depto_id, departamentos.nome AS departamento
FROM empregados
RIGHT JOIN departamentos ON empregados.depto_id = departamentos.depto_id
