-- SISTEMA DE GERENCIAMENTO ESCOLAR


-- TABELA ALUNO
CREATE TABLE aluno(
    matricula INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(100)
);

-- TABELA RESPONSAVEL
CREATE TABLE responsavel(
    id_responsavel INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(11),
    endereco VARCHAR(100),
    matricula INT, 
    FOREIGN KEY (matricula) REFERENCES aluno(matricula)
);

-- TABELA PROFESSOR
CREATE TABLE professor(
    matricula_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    disciplina_lecionada VARCHAR(50),
    telefone VARCHAR(11),
    email VARCHAR(50)
);


-- TABELA DISCIPLINA
CREATE TABLE disciplina(
    cod_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    carga_horaria INT,
    matricula_professor INT,
    FOREIGN KEY(matricula_professor) REFERENCES professor(matricula_professor)
);


-- TABELA MATRICULA
CREATE TABLE matricula(
    matricula INT,
    cod_disciplina INT,
    FOREIGN KEY(matricula) REFERENCES aluno(matricula),
    FOREIGN KEY(cod_disciplina) REFERENCES disciplina(cod_disciplina)
);


-- TABELA NOTA
CREATE TABLE nota(
    valor_nota DECIMAL (5,2),
    data_avaliacao DATE,
    matricula INT,
    cod_disciplina INT,
    FOREIGN KEY (matricula) REFERENCES aluno(matricula),
    FOREIGN KEY(cod_disciplina) REFERENCES disciplina(cod_disciplina)
);

-- TABELA FREQUENCIA
CREATE TABLE frequencia(
    registro_presenca VARCHAR(10),
    data_frequencia DATE,
    matricula INT,
    cod_disciplina INT,
    FOREIGN KEY (matricula) REFERENCES aluno(matricula),
    FOREIGN KEY(cod_disciplina) REFERENCES disciplina(cod_disciplina)
);

-- TABELA ATIVIDADE
CREATE TABLE atividade(
    atividade_extra INT PRIMARY KEY AUTO_INCREMENT,
    nome_discipina_extra VARCHAR(50),
    descricao VARCHAR(200),
    data_atividade DATE  
);

-- TABELA participação
CREATE TABLE participacao(
    participacao_aluno VARCHAR(20),
    matricula INT,
    FOREIGN KEY (matricula) REFERENCES aluno(matricula)
);


-- INSERIR DADOS NA TABELA
-- Inserindo dados na tabela ALUNO
INSERT INTO aluno (nome, data_nascimento, endereco) VALUES
('João Silva', '2005-03-15', 'Rua das Flores, 123'),
('Maria Oliveira', '2006-07-22', 'Avenida Central, 456'),
('Pedro Santos', '2004-12-10', 'Rua dos Girassóis, 789');

-- Inserindo dados na tabela RESPONSAVEL
INSERT INTO responsavel (nome, telefone, endereco, matricula) VALUES
('Ana Silva', '987654321', 'Rua das Flores, 123', 1),
('Carlos Oliveira', '987654322', 'Avenida Central, 456', 2),
('Marta Santos', '987654323', 'Rua dos Girassóis, 789', 3);

-- Inserindo dados na tabela PROFESSOR
INSERT INTO professor (nome, disciplina_lecionada, telefone, email) VALUES
('Ana Souza', 'Matemática', '999888777', 'ana.souza@example.com'),
('Paulo Lima', 'História', '999888776', 'paulo.lima@example.com'),
('Mariana Oliveira', 'Português', '999888775', 'mariana.oliveira@example.com');

-- Inserindo dados na tabela DISCIPLINA
INSERT INTO disciplina (nome, carga_horaria, matricula_professor) VALUES
('Matemática', 80, 1),
('História', 60, 2),
('Português', 70, 3);

-- Inserindo dados na tabela MATRICULA
INSERT INTO matricula (matricula, cod_disciplina) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserindo dados na tabela NOTA
INSERT INTO nota (valor_nota, data_avaliacao, matricula, cod_disciplina) VALUES
(8.5, '2024-05-20', 1, 1),
(7.0, '2024-05-22', 2, 2),
(9.2, '2024-05-25', 3, 3);

-- Inserindo dados na tabela FREQUENCIA
INSERT INTO frequencia (registro_presenca, data_frequencia, matricula, cod_disciplina) VALUES
('Presente', '2024-05-20', 1, 1),
('Presente', '2024-05-22', 2, 2),
('Presente', '2024-05-25', 3, 3);

-- Inserindo dados na tabela ATIVIDADE
INSERT INTO atividade (nome_discipina_extra, descricao, data_atividade) VALUES
('Matemática', 'Atividade de casa sobre equações', '2024-05-21'),
('História', 'Apresentação sobre a Segunda Guerra Mundial', '2024-05-23'),
('Português', 'Redação sobre Machado de Assis', '2024-05-26');

-- Inserindo dados na tabela PARTICIPACAO
INSERT INTO participacao (participacao_aluno, matricula) VALUES
('Ativo', 1),
('Participativo', 2),
('Engajado', 3);

-- SELECT  -----------------------------
-- Listar todos os alunos e seus responsáveis:
SELECT a.nome AS aluno, r.nome AS responsavel
FROM aluno a INNER JOIN responsavel r ON a.matricula = r.matricula;

-- Mostre o nome do professor e a disciplina que ele leciona:
SELECT nome AS professor, disciplina_lecionada AS disciplina
FROM professor;

-- Verifique as notas dos alunos em uma determinada disciplina:
SELECT a.nome AS aluno, d.nome AS disciplina, n.valor_nota
FROM nota n
INNER JOIN aluno a ON n.matricula = a.matricula
INNER JOIN disciplina d ON n.cod_disciplina = d.cod_disciplina;

-- UPDATE, INSERT ----------------------

-- Atualizar o nome de um aluno:
UPDATE aluno SET nome = 'José Silva' WHERE matricula = 1;


-- Atualizar o número de telefone de um responsável:
UPDATE responsavel
SET telefone = '999777888'
WHERE id_responsavel = 2;


-- Atualizar a disciplina lecionada por um professor:
UPDATE professor
SET disciplina_lecionada = 'Geografia'
WHERE matricula_professor = 2;


-- Atualizar a carga horária de uma disciplina:
UPDATE disciplina
SET carga_horaria = 90
WHERE cod_disciplina = 3;

-- Atualizar a nota de um aluno em uma disciplina: 
UPDATE nota
SET valor_nota = 9.0
WHERE matricula = 1 AND cod_disciplina = 1;

-- NOVOS SELECTS ---------------------

-- Mostrar todas as disciplinas, incluindo a nova disciplina interna:
SELECT nome, carga_horaria, matricula_professor
FROM disciplina;

-- Listar todos os alunos e seus responsáveis, incluindo o novo aluno inserido:
SELECT a.nome AS aluno, r.nome AS responsavel
FROM aluno a
LEFT JOIN responsavel r ON a.matricula = r.matricula;