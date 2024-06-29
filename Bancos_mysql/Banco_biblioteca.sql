-- Criação das tabelas
CREATE TABLE Autor (
    ID_autor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) not null,
    Pais VARCHAR(30) not null
);

CREATE TABLE Livro (
    ID_livro INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(50) not null,
    ISBN VARCHAR(20) not null,
    Ano_Publicacao INT not null,
    Status VARCHAR(50) not null,
    Editora VARCHAR(50) not null,
    Categoria VARCHAR(50) not null
);

CREATE TABLE Livro_Autor (
    Livro_ID INT,
    Autor_ID INT,
    PRIMARY KEY (Livro_ID, Autor_ID),
    FOREIGN KEY (Livro_ID) REFERENCES Livro(ID_livro),
    FOREIGN KEY (Autor_ID) REFERENCES Autor(ID_autor)
);

CREATE TABLE Membro (
    ID_menbro INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) not null,
    Endereco VARCHAR(30) not null,
    Email VARCHAR(30) not null,
    Data_Associacao DATE not null,
    Telefone VARCHAR(15) not null
);

CREATE TABLE Emprestimo (
    ID_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    Livro_ID INT,
    Membro_ID INT,
    Data_Emprestimo DATE not null,
    Data_Devolucao DATE not null,
    FOREIGN KEY (Livro_ID) REFERENCES Livro(ID_livro),
    FOREIGN KEY (Membro_ID) REFERENCES Membro(ID_menbro)
);

-- Inserção de dados
INSERT INTO Autor (Nome, Pais) VALUES
('Machado de Assis', 'Brasil'),
('Gabriel García Márquez', 'Colômbia'),
('Haruki Murakami', 'Japão');

INSERT INTO Livro (Titulo, ISBN, Ano_Publicacao, Status, Editora, Categoria) VALUES
('Dom Casmurro', '978-8535910337', 1899, 'Disponível', 'Editora A', 'Romance'),
('Cem Anos de Solidão', '978-8535904435', 1967, 'Emprestado', 'Editora B', 'Ficção'),
('Kafka à Beira-Mar', '978-8535906569', 2002, 'Disponível', 'Editora C', 'Ficção');

INSERT INTO Livro_Autor (Livro_ID, Autor_ID) VALUES
(1, 1), 
(2, 2),
(3, 3); 

INSERT INTO Membro (Nome, Endereco, Email, Data_Associacao, Telefone) VALUES
('Maria Silva', 'Rua das Flores, 123', 'maria@email.com', '2023-05-15', '11111-2222'),
('João Oliveira', 'Av. Principal, 456', 'joao@email.com', '2023-06-20', '33333-4444'),
('Ana Santos', 'Travessa da Paz, 789', 'ana@email.com', '2023-07-10', '55555-6666');

INSERT INTO Emprestimo (Livro_ID, Membro_ID, Data_Emprestimo, Data_Devolucao) VALUES
(1, 1, '2024-04-10', '2024-04-24'),
(2, 2, '2024-05-05', '2024-05-20'),
(3, 3, '2024-06-01', '2024-06-15');

-- Consultas de exemplo

-- Adicionando um novo livro com múltiplos autores
INSERT INTO Livro (Titulo, ISBN, Ano_Publicacao, Status, Editora, Categoria)
VALUES ('Pode pá', '978-1234567890', 2023, 'Disponível', 'Bereia', 'Ficção');

-- Obter o ID do novo livro
SET @Livro_ID = LAST_INSERT_ID();

-- Associar o novo livro aos seus autores
INSERT INTO Livro_Autor (Livro_ID, Autor_ID) VALUES (@Livro_ID, 1), (@Livro_ID, 2);

-- Adicionando um novo membro
INSERT INTO Membro (Nome, Endereco, Email, Data_Associacao, Telefone)
VALUES ('Carlos Souza', 'Rua Nova, 987', 'carlos@email.com', '2024-06-07', '12345-6789');

-- Registrando um novo empréstimo
INSERT INTO Emprestimo (Livro_ID, Membro_ID, Data_Emprestimo, Data_Devolucao)
VALUES (1, 1, '2024-06-07', '2024-06-21');

UPDATE Livro SET Status = 'Emprestado' WHERE ID_livro = 1;

-- Registrando a devolução
UPDATE Emprestimo SET Data_Devolucao = '2024-06-21' WHERE ID_emprestimo = 1;
UPDATE Livro SET Status = 'Disponível' WHERE ID_livro = 1;

-- Verificando a disponibilidade por título
SELECT * FROM Livro WHERE Titulo = 'Dom Casmurro' AND Status = 'Disponível';

-- Verificando a disponibilidade por autor
SELECT Livro.* FROM Livro
JOIN Livro_Autor ON Livro.ID_livro = Livro_Autor.Livro_ID
JOIN Autor ON Livro_Autor.Autor_ID = Autor.ID_autor
WHERE Autor.Nome = 'Machado de Assis' AND Livro.Status = 'Disponível';

-- Visualizando o histórico de empréstimos do usuário
SELECT Emprestimo.*, Livro.Titulo FROM Emprestimo
JOIN Livro ON Emprestimo.Livro_ID = Livro.ID_livro
WHERE Emprestimo.Membro_ID = 1;