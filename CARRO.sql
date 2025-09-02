CREATE DATABASE Carro_teste;

CREATE TABLE Carro(
	id_carro INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(20) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT NOT NULL
);

INSERT INTO Carro(placa,marca,modelo,ano_fabricacao) VALUES
	('DAE4578', 'ford','fiesta', 1999),
	('DLK7895','volksvagen','gol',2001),
	('DKL5161', 'ford','fiesta',2001),
	('JMÇ5214', 'volksvargen','santana',2002),
	('JJM1235','chevrolet','corsa',1999);

SELECT*FROM Carro;

/*UPDATE= atualizar algum campo*/
UPDATE Carro SET modelo = 'new fiesta' WHERE placa = 'DAE4578';
SET SQL_SAFE_UPDATES = 0;
SELECT*FROM Carro;

/*DELETE: deletar algum campo*/
DELETE FROM Carro WHERE placa = 'DLK7895';
SELECT*FROM Carro;

/*Create view: tabela virtual*/
CREATE VIEW View_Carros_dois AS
SELECT marca, modelo, ano_fabricacao
FROM Carro WHERE ano_fabricacao >= 2000;

SELECT * FROM View_Carros_dois;

/* DDL= modifica a tabela
DML= modifica a coluna */

/*ADD COLUMN: adiciona coluna*/
ALTER TABLE carro
ADD COLUMN Tabela_Fipe FLOAT(10) AFTER modelo;
SELECT*FROM Carro;


/*adicionar a alteração em apenas uma linha*/
UPDATE Carro SET Tabela_Fipe = 15000 WHERE placa= 'DKL5161';

/*mais de uma linha*/
UPDATE Carro 
SET Tabela_Fipe= CASE
	WHEN placa='DAE4578' THEN 8000
    WHEN placa= 'DKL5161' THEN 15000
    WHEN placa= 'JJM1235' THEN 12000 
END;
SELECT*FROM Carro;


