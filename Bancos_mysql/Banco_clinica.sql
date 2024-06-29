CREATE TABLE Pacientes (
    ID_Paciente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Genero CHAR(1) NOT NULL,
    Endereco VARCHAR(100),
    Telefone VARCHAR(11),
    Email VARCHAR(100)
);

-- Criar tabela de Médicos
CREATE TABLE Medicos (
    ID_Medico INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(100),
    Telefone VARCHAR(11),
    Email VARCHAR(100)
);

-- Criar tabela de Consultas
CREATE TABLE Consultas (
    ID_Consulta INT PRIMARY KEY AUTO_INCREMENT,
    ID_Paciente INT NOT NULL,
    ID_Medico INT NOT NULL,
    Data_Consulta DATE NOT NULL,
    Hora_Consulta TIME NOT NULL,
    Motivo VARCHAR(100),
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente),
    FOREIGN KEY (ID_Medico) REFERENCES Medicos(ID_Medico)
);

-- Criar tabela de Histórico Médico
CREATE TABLE Historico_Medico (
    ID_Historico INT PRIMARY KEY AUTO_INCREMENT,
    ID_Paciente INT NOT NULL,
    Data_Historico DATE NOT NULL,
    Descricao TEXT NOT NULL,
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente)
);

-- Criar tabela de Procedimentos
CREATE TABLE Procedimentos (
    ID_Procedimento INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(200) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);

-- Criar tabela de Consultas_Procedimentos
CREATE TABLE Consultas_Procedimentos (
    ID_Consulta INT NOT NULL,
    ID_Procedimento INT NOT NULL,
    FOREIGN KEY (ID_Consulta) REFERENCES Consultas(ID_Consulta),
    FOREIGN KEY (ID_Procedimento) REFERENCES Procedimentos(ID_Procedimento),
    PRIMARY KEY (ID_Consulta, ID_Procedimento)
);

-- Inserir registros nas tabelas
-- Inserir registros na tabela Pacientes
INSERT INTO Pacientes (Nome, Data_Nascimento, Genero, Endereco, Telefone, Email)
VALUES 
('Ana Silva', '1985-06-15', 'F', 'Rua A, 123', '123456789', 'ana.silva@example.com'),
('João Pereira', '1990-09-10', 'M', 'Rua B, 456', '987654321', 'joao.pereira@example.com'),
('Maria Oliveira', '1975-01-20', 'F', 'Rua C, 789', '456789123', 'maria.oliveira@example.com'),
('Carlos Souza', '1980-03-25', 'M', 'Rua D, 101', '789123456', 'carlos.souza@example.com'),
('Lucia Mendes', '1995-12-30', 'F', 'Rua E, 202', '321654987', 'lucia.mendes@example.com');

-- Inserir registros na tabela Medicos
INSERT INTO Medicos (Nome, Especialidade, Telefone, Email)
VALUES 
('Dr. Paulo Lima', 'Cardiologia', '1122334455', 'paulo.lima@example.com'),
('Dra. Fernanda Costa', 'Dermatologia', '2233445566', 'fernanda.costa@example.com'),
('Dr. Roberto Santos', 'Pediatria', '3344556677', 'roberto.santos@example.com'),
('Dra. Carla Almeida', 'Ortopedia', '4455667788', 'carla.almeida@example.com'),
('Dr. Pedro Rocha', 'Neurologia', '5566778899', 'pedro.rocha@example.com');

-- Inserir registros na tabela Consultas
INSERT INTO Consultas (ID_Paciente, ID_Medico, Data_Consulta, Hora_Consulta, Motivo)
VALUES 
(1, 1, '2023-05-10', '10:00:00', 'Consulta de rotina'),
(2, 2, '2023-05-11', '11:00:00', 'Alergia na pele'),
(3, 3, '2023-05-12', '12:00:00', 'Consulta pediátrica'),
(4, 4, '2023-05-13', '14:00:00', 'Dor nas costas'),
(5, 5, '2023-05-14', '15:00:00', 'Dor de cabeça');

-- Inserir registros na tabela Historico_Medico
INSERT INTO Historico_Medico (ID_Paciente, Data_Historico, Descricao)
VALUES 
(1, '2023-05-10', 'Consulta de rotina. Paciente saudável.'),
(2, '2023-05-11', 'Alergia tratada com pomada XYZ.'),
(3, '2023-05-12', 'Consulta pediátrica. Tudo normal.'),
(4, '2023-05-13', 'Dor nas costas. Recomendada fisioterapia.'),
(5, '2023-05-14', 'Dor de cabeça. Prescrito medicamento ABC.');

-- Inserir registros na tabela Procedimentos
INSERT INTO Procedimentos (Descricao, Preco)
VALUES 
('Exame de sangue', 50.00),
('Raio-X', 80.00),
('Ultrassonografia', 120.00),
('Eletrocardiograma', 100.00),
('Consulta de rotina', 70.00);

-- Inserir registros na tabela Consultas_Procedimentos
INSERT INTO Consultas_Procedimentos (ID_Consulta, ID_Procedimento)
VALUES 
(1, 5),
(2, 1),
(3, 5),
(4, 2),
(5, 3);


INSERT INTO Pacientes (Nome, Data_Nascimento, Genero, Endereco, Telefone, Email) VALUES 
('Bruno Alves', '1992-11-05', 'M', 'Rua F, 303', '123123123', 'bruno.alves@example.com'),
('Clara Vieira', '1986-02-17', 'F', 'Rua G, 404', '321321321', 'clara.vieira@example.com');


INSERT INTO Procedimentos (Descricao, Preco) VALUES 
('Exame de visão', 150.00),
('Terapia ocupacional', 200.00);

-- Exclusão do paciente com ID 6 (Bruno Alves)
DELETE FROM Pacientes WHERE ID_Paciente = 6;

-- Exclusão do médico com ID 6 (Dr. Lucas Ferreira)
DELETE FROM Medicos WHERE ID_Medico = 6;


SELECT * FROM Pacientes;

SELECT * FROM Medicos;

SELECT * FROM Consultas;

-- Consulta de Procedimentos Realizados em uma Consulta Específica

SELECT CP.ID_Consulta, P.Descricao, P.Preco FROM Consultas_Procedimentos CP 
JOIN Procedimentos P ON CP.ID_Procedimento = P.ID_Procedimento
WHERE CP.ID_Consulta = 6;