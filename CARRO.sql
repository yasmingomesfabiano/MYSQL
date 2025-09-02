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

