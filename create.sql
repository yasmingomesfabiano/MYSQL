INSERT INTO Especialidade(nome) VALUES('pediatra'),('clínico geral'),('gastroenterologia'),
('dermatologista');
SELECT * FROM Especialidade;

INSERT INTO Medico (id_crm, nome, telefone, codigo_especialidade) VALUES
('085355', 'Dr. Silva', '4004-3864', 2),
('123432', 'Dr. Souza', '7654-3084', 1);

SELECT*FROM Medico;

INSERT INTO Paciente (cpf, nome, telefone, email, endereco) VALUES
('11123335566', 'João Oliveira', '37236478342', 'joao@gmail.com', 'rua C, 400'),
('11123335566', 'Ana Silva', '9859478342', 'ana@gmail.com', 'rua D, 900');

SELECT * FROM Paciente;