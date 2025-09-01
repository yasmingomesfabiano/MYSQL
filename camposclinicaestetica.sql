INSERT INTO Cliente (nome, cpf, telefone, email, data_nascimento, endereco) VALUES
('Isabelle', '219476876723', '(25)3739-23434', 'isabelle@gmail.com', '2006-08-04', 'rua A, n°03'),
('Nicolly', '199487544253', '(25)3739-95658', 'nicolly@gmail.com', '2009-07-03', 'rua B, n°09'),
('Clara', '2789454445513', '(25)7894-23489', 'clara@gmail.com', '2004-11-15', 'rua C, n°06');
SELECT * FROM Cliente;

INSERT INTO Profissional(nome, cpf, telefone, especialidade, email) VALUES
('Mariana Souza', '12345678901', '(25)91234-5678', 'Limpeza de Pele', 'mariana.souza@clinica.com'),
('Fernanda Lima', '98765432100', '(25)92345-6789', 'Massagem Modeladora', 'fernanda.lima@clinica.com'),
('Camila Ferreira', '45678912300', '(25)93456-7890', 'Peeling Químico', 'camila.ferreira@clinica.com'),
('Juliana Alves', '32165498700', '(25)94567-8901', 'Drenagem Linfática', 'juliana.alves@clinica.com'),
('Patrícia Mendes', '65498732100', '(25)95678-9012', 'Microagulhamento', 'patricia.mendes@clinica.com');
SELECT * FROM Profissional;

INSERT INTO Procedimento (nome, descricao, duracao, preco) VALUES
('Limpeza de Pele', 'Higienização profunda para remoção de impurezas e cravos', '60 minutos', 120.00),
('Massagem Modeladora', 'Técnica manual para reduzir medidas e melhorar a circulação', '50 minutos', 150.00),
('Peeling Químico', 'Aplicação de substâncias químicas para renovação da pele', '40 minutos', 200.00),
('Drenagem Linfática', 'Massagem suave que estimula o sistema linfático', '60 minutos', 130.00),
('Microagulhamento', 'Tratamento estético para estimular a produção de colágeno', '70 minutos', 250.00);
SELECT * FROM Procedimento;

INSERT INTO Agendamento (data_agendamento, hora, status_agendamento, id_cliente, id_profissional, id_procedimento) VALUES
('2025-09-01', '14:00:00', 'Agendado', 1, 2, 3),
('2025-09-02', '10:00:00', 'Agendado', 2, 1, 1),
('2025-09-03', '15:30:00', 'Confirmado', 3, 3, 5),
('2025-09-04', '09:00:00', 'Cancelado', 1, 4, 2),
('2025-09-05', '11:00:00', 'Agendado', 2, 5, 4);
SELECT * FROM Agendamento;

INSERT INTO Pagamento (data_pagamento, valor, forma_pagamento, status_pagamento, id_agendamento) VALUES
('2025-09-01', 200.00, 'Cartão crédito', 'Pago', 1),
('2025-09-02', 120.00, 'Dinheiro', 'Pago', 2),
('2025-09-12', 150.00, 'Cartão débito', 'Pago', 4),
('2025-09-03', 250.00, 'Pix', 'Pendente', 3);
SELECT * FROM Pagamento;
